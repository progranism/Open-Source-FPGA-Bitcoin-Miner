#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>
#include "w5100.h"
#include "socket.h"
#include <system.h>
#include <io.h>
#include <sys/alt_timestamp.h>

void read_getwork(SOCKET s);
void begin_getwork();
void check_for_nonce();


struct GETWORK_STATE {
	SOCKET sock;
	uint8_t state;
	uint8_t buffer[2048];
	int content_length, buffer_length;
	bool reading_headers;
} getwork_state;

uint8_t gw_midstate[32];
uint8_t gw_data[128];
unsigned int old_golden_nonce = 0;
int submitwork_state = 0;
char submitwork_request[1024];


int main()
{
    alt_u32 old_ticks = 0;
    alt_u32 ticks_per_getwork;
	const char *getworkrequest = "POST / HTTP/1.1\r\nContent-Length: 49\r\nAuthorization: Basic \r\n\r\n{\"params\": [], \"method\": \"getwork\", \"id\": \"json\"}";

	printf("--- Bitcoin Miner Controller Starting Up ---\n");
    
    if (alt_timestamp_start() < 0) {
        printf("ERROR: No timestamp device found. Unable to function.\n");
        while(1);
    }

	// Initialize the Ethernet Chip
	if(!eth_init()) {
		printf("ERROR: Ethernet initialization failed.\n");
		while(1);
	}
    
    old_golden_nonce = IORD(PIO_NONCE_BASE, 0);
    
    begin_getwork();
    
    ticks_per_getwork = alt_timestamp_freq() * 20;
    old_ticks = alt_timestamp();


	while(1)
	{
        //uint8_t sta = socket_status(1);
        uint8_t sta2 = socket_status(0);
        
        if (getwork_state.state == 1 && sta2 == SOCK_CLOSED) {
            printf("ERROR: Unable to connect to mining pool. Connection closed.\n");
            getwork_state.state = 0;
        }
        
        /*if (submitwork_state == 1 && sta == SOCK_CLOSED) {
            submitwork_state = 0;
            printf("ERROR: Unable to submit work to mining pool. Connection closed.\n");
        }*/
        
		if (getwork_state.state == 1 && established(getwork_state.sock) == 1) {
			send(getwork_state.sock, (const uint8_t *)getworkrequest, strlen(getworkrequest));
			getwork_state.state = 2;
		}

		if (getwork_state.state == 2) {
			read_getwork(getwork_state.sock);
		}
        
        if (submitwork_state == 1 && established(1) == 1) {
            //send(1, (const uint8_t *)submitwork_request, strlen(submitwork_request));
            printf("Share submitted.\n");
            submitwork_state = 0;
        }
        
        //check_for_nonce();
        
        alt_u32 current_time = alt_timestamp();
        alt_u32 time_diff = current_time - old_ticks;
        
        if (time_diff >= ticks_per_getwork) {
            begin_getwork();
            old_ticks = alt_timestamp();
        } 
	}


	return 0;
}

// Start a new getwork request
// Just start up the connection; processing data will be handled by read_getwork
// later once the connection is established.
void begin_getwork()
{
    printf("Begin Getwork\n");
    getwork_state.sock = 0;
	getwork_state.state = 0;
	getwork_state.content_length = 0;
	getwork_state.buffer_length = 0;
	getwork_state.reading_headers = true;

	if (socket(getwork_state.sock, 1234)) {
		printf("ERROR: Failed to create a socket for outbound getwork connection.\n");
		return;
	}

	if (connect(getwork_state.sock, 74, 95, 106, 214, 8332)) {
		printf("ERROR: Failed to connect to Mining Pool.\n");
		return;
	}

	getwork_state.state = 1;
}

// Convert a single ASCII character, representing half of a hex code,
// to a 4-bit nibble.
inline uint8_t hex_to_nibble(uint8_t a)
{
	uint8_t val = 0;

	if(a <= '9')
		val = a - 48;
	else if(a <=  'F')
		val = a - 55;
	else
		val = a - 87;

	return val;
}

// Convert a string to lowercase
void str_to_lower(uint8_t *str)
{
	int i;

	for(i = 0; str[i]; ++i)
		str[i] = tolower(str[i]);
}

bool parse_json(char *json, const char *field, char *out, unsigned int maxlen)
{
    char *ch = strstr(json, field);
    
    if (ch == NULL)
        return false;
       
    ch += strlen(field);
    
    for(; *ch; ++ch) {
        if (*ch == '"')
            break;
    }
    
    if (*ch == 0)
        return false;
    
    ch++;
    
    for(; maxlen > 0; --maxlen) {
        if (*ch == '"' || *ch == 0)
            break;
        
        *out = *ch;
        ++out;
        ++ch;
    }
    
    *out = 0;
    
    return true;
}

bool hexstring_to_binary(const char *str, uint8_t *buf)
{
    char c;
    int i = 0;
    
    while(true)
    {
        if (*str == 0)
            break;
        
        c = *str;
        ++str;
        
        if ( (c >= '0' && c <= '9') || (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') ) {
            *buf = (*buf << 4) | hex_to_nibble(c);
            
            if (i == 1) {
                i = 0;
                ++buf;
            }
            else
                i = 1;
        }
        else
            return false;
        
    }
    
    return true;
}

char nibble_to_hex(uint8_t nibble)
{
    if ((nibble & 0xF) > 9)
        return (nibble & 0xF) - 10 + 'a';
    return (nibble & 0xF) + '0';
}

// Convert a binary array to a hexstring
void binary_to_hexstring(uint8_t *bin, char *dst, unsigned int len)
{
    for(; len > 0; --len) {
        *dst = nibble_to_hex(*bin >> 4);
        ++dst;
        *dst = nibble_to_hex(*bin);
        ++dst;
        
        ++bin;
    }
    
    *dst = 0;
}


// Process a getwork response.
// Will close the connection when all data has been received.
// Will return after all data received so far has been read (so
// this function is async).
void read_getwork(SOCKET s)
{
	uint16_t size;
    char tempstr[257];

	if (getwork_state.buffer_length >= 2047) {
        printf("ERROR: getwork response was larger than 2047 bytes. Could not handle.\n");
		close(s);
		getwork_state.state = 0;
		return;
	}
    
    uint8_t sock_status = socket_status(s);

	size = recv(s, getwork_state.buffer + getwork_state.buffer_length, 2047 - getwork_state.buffer_length);

	if (size == 0) {
		if (sock_status == SOCK_CLOSED) {
            printf("ERROR: getwork response was incomplete and the connection was lost.\n");
			close(getwork_state.sock);
			getwork_state.state = 0;
		}
		return;
	}

	getwork_state.buffer_length += size;
	getwork_state.buffer[getwork_state.buffer_length] = 0;

	while (getwork_state.reading_headers) {
		uint8_t *ch = strstr(getwork_state.buffer, "\r\n");

		if (ch == NULL)
			return;

		*ch = 0;
		size = (ch - getwork_state.buffer) + 2;

		if (ch == getwork_state.buffer) {
			getwork_state.reading_headers = false;
		}
		else {
            printf("HEADER: %s\n", getwork_state.buffer);
			str_to_lower(getwork_state.buffer);
            if (strstr(getwork_state.buffer, "content-length: ") == getwork_state.buffer) {
                getwork_state.content_length = atoi(getwork_state.buffer + 16);
                if (getwork_state.content_length < 0)
                    getwork_state.content_length = 0;
                
                printf("Read content length as %d\n", getwork_state.content_length);
            }
		}

		getwork_state.buffer_length -= size;
		memmove(getwork_state.buffer, ch + 2, getwork_state.buffer_length + 1);

		if (!getwork_state.reading_headers)
			break;
	}

    // Wait until we've gotten the entire response.
	if (getwork_state.buffer_length < getwork_state.content_length)
		return;
    
    printf("GETWORK RESPONSE:\n%s\n--------------\n", getwork_state.buffer);
    
    close(s);
    getwork_state.state = 0;
    
    if (!parse_json(getwork_state.buffer, "\"midstate\":", tempstr, 256)) {
        printf("ERROR: getwork response, midstate, was not found.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    if (strlen(tempstr) != 64) {
        printf("ERROR: getwork response, midstate was not 32 bytes.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    if (!hexstring_to_binary(tempstr, gw_midstate)) {
        printf("ERROR: getwork response, midstate was not a valid hexstring.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    if (!parse_json(getwork_state.buffer, "\"data\":", tempstr, 256)) {
        printf("ERROR: getwork response, data, was not found.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    if (strlen(tempstr) != 256) {
        printf("ERROR: getwork response, data was not 128 bytes.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    if (!hexstring_to_binary(tempstr, gw_data)) {
        printf("ERROR: getwork response, data was not a valid hexstring.\n");
        close(s);
        getwork_state.state = 0;
        return;
    }
    
    // Give the work to the FPGA
    
    IOWR(PIO_MIDSTATE_0_BASE, 0, (gw_midstate[3] << 24) | (gw_midstate[2] << 16) | (gw_midstate[1] << 8) | gw_midstate[0]);
    IOWR(PIO_MIDSTATE_1_BASE, 0, (gw_midstate[7] << 24) | (gw_midstate[6] << 16) | (gw_midstate[5] << 8) | gw_midstate[4]);
    IOWR(PIO_MIDSTATE_2_BASE, 0, (gw_midstate[11] << 24) | (gw_midstate[10] << 16) | (gw_midstate[9] << 8) | gw_midstate[8]);
    IOWR(PIO_MIDSTATE_3_BASE, 0, (gw_midstate[15] << 24) | (gw_midstate[14] << 16) | (gw_midstate[13] << 8) | gw_midstate[12]);
    IOWR(PIO_MIDSTATE_4_BASE, 0, (gw_midstate[19] << 24) | (gw_midstate[18] << 16) | (gw_midstate[17] << 8) | gw_midstate[16]);
    IOWR(PIO_MIDSTATE_5_BASE, 0, (gw_midstate[23] << 24) | (gw_midstate[22] << 16) | (gw_midstate[21] << 8) | gw_midstate[20]);
    IOWR(PIO_MIDSTATE_6_BASE, 0, (gw_midstate[27] << 24) | (gw_midstate[26] << 16) | (gw_midstate[25] << 8) | gw_midstate[24]);
    IOWR(PIO_MIDSTATE_7_BASE, 0, (gw_midstate[31] << 24) | (gw_midstate[30] << 16) | (gw_midstate[29] << 8) | gw_midstate[28]);
    
    IOWR(PIO_DATA_0_BASE, 0, (gw_data[3+64] << 24) | (gw_data[2+64] << 16) | (gw_data[1+64] << 8) | gw_data[0+64]);
    IOWR(PIO_DATA_1_BASE, 0, (gw_data[7+64] << 24) | (gw_data[6+64] << 16) | (gw_data[5+64] << 8) | gw_data[4+64]);
    IOWR(PIO_DATA_2_BASE, 0, (gw_data[11+64] << 24) | (gw_data[10+64] << 16) | (gw_data[9+64] << 8) | gw_data[8+64]);
}

void check_for_nonce()
{
    unsigned int golden_nonce = IORD(PIO_NONCE_BASE, 0);
    //char httprequest[1024];
    char datastr[257];
    
    if (golden_nonce == old_golden_nonce)
        return;
    
    old_golden_nonce = golden_nonce;
    
    printf("#############################################################\n");
    printf("A new Golden Nonce has been calculated! Submitting ...\n");
    
    gw_data[12+64] = golden_nonce & 0xFF;
    gw_data[13+64] = (golden_nonce >> 8) & 0xFF;
    gw_data[14+64] = (golden_nonce >> 16) & 0xFF;
    gw_data[15+64] = (golden_nonce >> 24) & 0xFF;
    
    binary_to_hexstring(gw_data, datastr, 128);
    
    sprintf(submitwork_request, "POST / HTTP/1.1\r\nContent-Length: %d\r\nAuthorization: Basic \r\n\r\n{\"method\": \"getwork\", \"id\": \"json\", \"params\": [\"%s\"]}", 51 + strlen(datastr), datastr);
    
     if (socket(1, 1235)) {
        printf("ERROR: Failed to create a socket for outbound submit work connection.\n");
        return;
    }

    if (connect(1, 74, 95, 106, 214, 8332)) {
        printf("ERROR: Failed to connect to Mining Pool.\n");
        return;
    }
    
    uint8_t sat = socket_status(1);
    
    submitwork_state = 1;
}


