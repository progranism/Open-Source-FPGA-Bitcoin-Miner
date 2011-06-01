#include <stdint.h>
#include <stdbool.h>

#include "socket.h"
#include "w5100.h"






bool write_sock_reg(SOCKET s, uint8_t reg, uint8_t data)
{
    return eth_write(0x0400 + (s << 8) + reg, data);
}

uint8_t read_sock_reg(SOCKET s, uint8_t reg)
{
    uint8_t c = 0;
    if (!eth_read(0x0400 + (s << 8) + reg, &c))
        printf("FATAL ERROR: an eth_read failed. SPI communication error.\n");
    return c;
}


// Initialize a TCP socket
uint8_t socket(SOCKET s, uint16_t port)
{
    close(s);
    
    write_sock_reg(s, Sn_MR, 0x01);
    write_sock_reg(s, Sn_PORT, port >> 8);
    write_sock_reg(s, Sn_PORT+1, port & 0xFF);
    write_sock_reg(s, Sn_CR, OPEN);
    
    if (read_sock_reg(s, Sn_SR) != SOCK_INIT) {
        close(s);
        return 1;
    }
    
    return 0;
}

void close(SOCKET s)
{
    if (!write_sock_reg(s, Sn_CR, CLOSE))
        printf("FATAL ERROR: Closing socket failed!\n");
}

uint8_t socket_status(SOCKET s)
{
    return read_sock_reg(s, Sn_SR);
}

/*uint8_t listen(SOCKET s)
{
    write_sock_reg(s, Sn_CR, LISTEN);
    if (read_sock_reg(s, Sn_SR) != SOCK_LISTEN) {
        close(s);
        return 1;
    }
    
    return 0;
}*/

uint8_t connect(SOCKET s, uint8_t addr0, uint8_t addr1, uint8_t addr2, uint8_t addr3, uint16_t port)
{
    write_sock_reg(s, Sn_DIPR, addr0);
    write_sock_reg(s, Sn_DIPR+1, addr1);
    write_sock_reg(s, Sn_DIPR+2, addr2);
    write_sock_reg(s, Sn_DIPR+3, addr3);
    
    write_sock_reg(s, Sn_DPORT, port >> 8);
    write_sock_reg(s, Sn_DPORT+1, port & 0xFF);
    
    write_sock_reg(s, Sn_CR, CONNECT);
    
    return 0;
}

uint8_t established(SOCKET s)
{
    uint8_t c = read_sock_reg(s, Sn_SR);
    
    if (c == SOCK_ESTABLISHED)
        return 1;
    else if (c == SOCK_LISTEN)
        return 0;
    else
        return 2;
}

uint16_t send(SOCKET s, const uint8_t *buf, uint16_t len)
{
    uint16_t free_size, offset, start_address, upper_size, left_size;
    uint16_t base = TXBUF_BASE + (s << 11);
    
    while(true)
    {
        free_size = (read_sock_reg(s, Sn_TX_FSR) << 8) | read_sock_reg(s, Sn_TX_FSR+1);
        
        if (free_size >= len)
            break;
    }
    
    offset = (read_sock_reg(s, Sn_TX_WR) << 8) | read_sock_reg(s, Sn_TX_WR+1);
    offset &= 0x7FF;
    
    start_address = base + offset;
    
    if ( (offset + len) > 2048)
    {
        upper_size = 2048 - offset;
        if(!eth_write_mem(buf, start_address, upper_size))
            return 1;
        buf += upper_size;
        left_size = len - upper_size;
        if(!eth_write_mem(buf, base, left_size))
            return 1;   
    }
    else
    {
        if(!eth_write_mem(buf, start_address, len))
            return 1;
    }
    
    offset = (read_sock_reg(s, Sn_TX_WR) << 8) | read_sock_reg(s, Sn_TX_WR+1);
    offset += len;
    
    write_sock_reg(s, Sn_TX_WR, offset >> 8);
    write_sock_reg(s, Sn_TX_WR+1, offset & 0xFF);
    
    write_sock_reg(s, Sn_CR, SEND);
    
    return 0;
}

uint16_t recv(SOCKET s, uint8_t *buf, uint16_t maxlen)
{
    uint16_t size, offset, start_address, upper_size, left_size;
    uint16_t base = RXBUF_BASE + (s << 11);
    
    size = (read_sock_reg(s, Sn_RX_RSR) << 8) | read_sock_reg(s, Sn_RX_RSR+1);
    
    if (size == 0)
        return 0; 
    
    if (size > maxlen)
        size = maxlen;
    
    offset = (read_sock_reg(s, Sn_RX_RD) << 8) | read_sock_reg(s, Sn_RX_RD+1);
    offset &= 0x7FF;
    
    // TODO: RXBUF_BASE + s << 8???
    start_address = base + offset;
    
    if ( (offset + size) > 2048 )
    {
        upper_size = 2048 - offset;
        
        if(!eth_read_mem(buf, start_address, upper_size))
            return 0;
        
        buf += upper_size;
        left_size = size - upper_size;
        if (!eth_read_mem(buf, base, left_size))
            return 0;
    }
    else
    {
        if (!eth_read_mem(buf, start_address, size))
            return 0;
    }
    
    offset = (read_sock_reg(s, Sn_RX_RD) << 8) | read_sock_reg(s, Sn_RX_RD+1);
    offset += size;
    
    write_sock_reg(s, Sn_RX_RD, offset >> 8);
    write_sock_reg(s, Sn_RX_RD+1, offset & 0xFF);
    
    write_sock_reg(s, Sn_CR, RECV);
    
    return size;
}

void disconnect(SOCKET s)
{
    write_sock_reg(s, Sn_CR, DISCON);
}

