#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "w5100.h"
#include "socket.h"

void read_getwork(SOCKET s);

int main()
{
    const char *httprequest = "POST / HTTP/1.1\r\nContent-Length: 49\r\nAuthorization: Basic \r\n\r\n{\"params\": [], \"method\": \"getwork\", \"id\": \"json\"}";
    
    printf("Hello from Nios II!\n");
    
    if(!eth_init()) {
        fprintf(stderr, "Ethernet initialization failed.\n");
        return -1;
    }
    
    SOCKET sock = 0;
    
    if (socket(sock, 1234)) {
        fprintf(stderr, "Failed to create a socket for outbound connections.\n");
        return -1;
    }
    
    if (connect(sock, 74, 95, 106, 214, 8332)) {
        fprintf(stderr, "Failed to connect to Mining Pool.\n");
        return -1;
    }
    
    
    //uint16_t buf_len = 0;
    uint8_t conn_state = 0;
  
    while(1)
    {
        if(established(sock) == 1) {
            if(conn_state == 0) {
                send(sock, (const uint8_t *)httprequest, strlen(httprequest));
                conn_state = 1;
                read_getwork(sock);
            }
            
            //buf_len = recv(sock, buf, 32);
            
            /*if(buf_len > 0) {
                send(sock, buf, buf_len);
            }*/
            //send(sock, "Hello World", 12);
            //disconnect(sock); 
        }
    }
    

    return 0;
}

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

void read_getwork(SOCKET s)
{
    uint16_t size, offset, start_address;
    uint16_t state = 0;
    uint8_t a = 0, b = 0, c = 0, d = 0, e = 0;
    uint8_t *write_ptr;
    uint16_t write_len = 0;
    
    while(1)
    {
        size = (read_sock_reg(s, Sn_RX_RSR) << 8) | read_sock_reg(s, Sn_RX_RSR+1);
    
        if (size == 0) {
            if (established(s) == 1)
                continue;
            break;
        }
    
        offset = (read_sock_reg(s, Sn_RX_RD) << 8) | read_sock_reg(s, Sn_RX_RD+1);
        offset &= 0x7FF;
    
        // TODO: RXBUF_BASE + s << 8???
        start_address = RXBUF_BASE + offset;
        
        a = b;
        b = c;
        c = d;
        d = e;
        eth_read(start_address, &e);
        
        printf("%c", e);
        
        offset = (read_sock_reg(s, Sn_RX_RD) << 8) | read_sock_reg(s, Sn_RX_RD+1);
        offset += 1;
    
        write_sock_reg(s, Sn_RX_RD, offset >> 8);
        write_sock_reg(s, Sn_RX_RD+1, offset & 0xFF);
        
        write_sock_reg(s, Sn_CR, RECV);
        
        /*if (write_len > 0 && ((e >= '0' && e <= '9') || (e >= 'a' && e <= 'f') || (e >= 'A' && e <= 'F')) ) {
            if (write_len & 1) {
                *write_ptr = (hex_to_nibble(d) << 4) | hex_to_nibble(e);
                write_ptr++;
            }
            write_len--;
            state++;
        }
        
        if(state == 152+64)
            break;
        
        if(a == 'a' && b == 't' && c == 'e' && d == '"' && e == ':') {
            write_ptr = midstate;
            write_len = 64;
        }*/
        
        /*if(a == 'a' && b == 't' && c == 'a' && d == '"' && e == ':') {
            write_ptr = hdata;
            write_len = 152;
        }*/
    }
    
    printf("\n\n");
    //send(s, midstate, 32);
    //send(s, hdata, 76);
}

