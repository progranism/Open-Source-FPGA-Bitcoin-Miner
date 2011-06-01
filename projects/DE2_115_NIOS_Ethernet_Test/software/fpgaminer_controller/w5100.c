#include <system.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdio.h>
#include <io.h>
#include <sys/alt_timestamp.h>

#include "w5100.h"

#define TX_RX_MAX_BUF_SIZE 2048
#define TX_BUF 0x1100
#define RX_BUF (TX_BUF + TX_RX_MAX_BUF_SIZE)

#define SOCKETS 4
#define SSIZE 2048
#define RSIZE 2048
//uint16_t SBASE[SOCKETS];
//uint16_t RBASE[SOCKETS];

#define CS (1<<4)
#define SCLK (1<<5)
#define SDI (1<<7)
#define SDO (1<<6)

void my_sleep(alt_u32 usec)
{
    alt_u32 span = (alt_timestamp_freq() / 1000000) * usec;
    alt_u32 end = alt_timestamp() + span;
    
    while(alt_timestamp() < end);
}

void spi_cs_assert(void)
{
    // assert CS
    IOWR(ETH_NSCS_BASE, 0, 0);
    my_sleep(1);
    //P1OUT &= ~CS;
}

void spi_cs_deassert(void)
{
    // deassert CS
    //P1OUT |= CS;
    IOWR(ETH_NSCS_BASE, 0, 1);
    my_sleep(1);
}

bool eth_init()
{
    IOWR(MOSI_BASE, 0, 0);
    IOWR(SCLK_BASE, 0, 0);
    
    //P1DIR |= SCLK | SDO | CS | 2;
    //P1DIR &= ~SDI;
    //P1OUT &= ~SCLK;
    //P1OUT &= ~2;
    
    spi_cs_deassert();
    
    // Reset WizNet chip
    // Hold /RESET low for 2us
    IOWR(ETH_NRESET_BASE, 0, 0);
    //P1OUT &= ~2;
    // delay 2us
    //_delay_cycles(2000 + 10000); // extra wait, just for good measure
    my_sleep(4);
    IOWR(ETH_NRESET_BASE, 0, 1);
    //P1OUT |= 2;
    
    my_sleep(20*1000);
    
    // SW Reset
    if(!eth_write(0, 1<<7))
        return false;
    
    // Set Gateway Address
    if(!eth_write(0x0001, 192) || !eth_write(0x0002, 168) || !eth_write(0x0003, 10) || !eth_write(0x0004, 1))
        return false;
    
    // Set MAC
    if(!eth_write(0x0009, 0x00) || !eth_write(0x000A, 0x08) || !eth_write(0x000B, 0xDC) || !eth_write(0x000C, 0x01) || !eth_write(0x000D, 0x02) || !eth_write(0x000E, 0x03))
        return false;
    
    // Set our IP address
    if(!eth_write(0x000F, 192) || !eth_write(0x0010, 168) || !eth_write(0x0011, 10) || !eth_write(0x0012, 172))
        return false;
    
    // Set Subnet Mask
    if(!eth_write(0x0005, 255) || !eth_write(0x0006, 255) || !eth_write(0x0007, 255) || !eth_write(0x0008, 0))
        return false;
        
    if(!eth_write(0x001B, 0x55))
        return false;
    
    if(!eth_write(0x001A, 0x55))
        return false;
    
    /*for(i = 0; i < SOCKETS; ++i) {
        SBASE[i] = TXBUF_BASE + SSIZE * i;
        RBASE[i] = RXBUF_BASE + RSIZE * i;
    }*/
    
    return true;
}

// Write 8-bits of data to the specified address on
// the ethernet chip.
// Uses SPI 
bool eth_write(uint16_t address, uint8_t data)
{
    spi_cs_assert();
    
    if(spi_write(0xF0) != 0x00 || spi_write(address >> 8) != 0x01 || spi_write(address & 0xFF) != 0x02 || spi_write(data) != 0x03) {
        printf("ERROR: (eth_write) failure. Problems with SPI communication.\n");
        spi_cs_deassert();
        return false;
    }
    
    spi_cs_deassert();
    
    return true;
}

bool eth_read(uint16_t address, uint8_t *data)
{
    spi_cs_assert();
    
    if(spi_write(0x0F) != 0x00 || spi_write(address >> 8) != 0x01 || spi_write(address & 0xFF) != 0x02) {
        printf("ERROR: (eth_read) failure. Problems with SPI communication.\n");
        spi_cs_deassert();
        return false;
    }
    
    *data = spi_write(0x00);
    
    spi_cs_deassert();
    
    return true;
}

bool eth_write_mem(const uint8_t *src, uint16_t dst, uint16_t len)
{
    while(len > 0)
    {
        if(!eth_write(dst, *src))
            return false;
        src++;
        dst++;
        len--;
    }
    
    return true;
}

bool eth_read_mem(uint8_t *dst, uint16_t src, uint16_t len)
{
    while(len > 0)
    {
        if(!eth_read(src, dst))
            return false;
        dst++;
        src++;
        len--;
    }
    
    return true;
}

// Send one byte over SPI and return the response.
uint8_t spi_write(uint8_t c)
{
    uint8_t i;
    
    for(i = 0; i < 8; ++i)
    {
        IOWR(MOSI_BASE, 0, (c >> 7) & 1);
        my_sleep(1);
        //P1OUT = (P1OUT & ~SDO) | ((c >> 1) & SDO);
        c <<= 1;
        IOWR(SCLK_BASE, 0, 1);
        my_sleep(1);
        //P1OUT |= SCLK;
        c |= IORD(MISO_BASE, 0) & 1;
        //c |= (P1IN >> 7) & 1;
        //P1OUT &= ~SCLK;
        IOWR(SCLK_BASE, 0, 0);
        my_sleep(1);
    }
    
    return c;
}

/*void Sn_CR(SOCKET s, uint8_t cmd)
{
    eth_write(0x0401 + (s << 8), cmd);
}*/

