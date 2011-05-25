#ifndef W5100_H_
#define W5100_H_

#include "stdint.h"
#include <stdbool.h>

typedef uint8_t SOCKET;

#define TXBUF_BASE 0x4000
#define RXBUF_BASE 0x6000

void spi_cs_assert(void);
void spi_cs_deassert(void);
uint8_t spi_write(uint8_t c);
bool eth_write(uint16_t address, uint8_t data);
bool eth_read(uint16_t address, uint8_t *data);
bool eth_write_mem(const uint8_t *src, uint16_t dst, uint16_t len); 
bool eth_read_mem(uint8_t *dst, uint16_t src, uint16_t len);

bool eth_init();

void Sn_CR(SOCKET s, uint8_t cmd);

#endif /*W5100_H_*/
