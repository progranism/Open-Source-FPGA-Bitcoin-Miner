#ifndef SOCKET_H_
#define SOCKET_H_

#include <stdint.h>
#include "w5100.h"

#define SOCK_CLOSED 0x00
#define SOCK_INIT 0x13
#define SOCK_LISTEN 0x14
#define SOCK_ESTABLISHED 0x17
#define SOCK_CLOSE_WAIT 0x1C
#define SOCK_UDP 0x22
#define SOCK_IPRAW 0x32
#define SOCK_MACRAW 0x42
#define SOCK_PPPOE 0x5F
#define SOCK_SYNSENT 0x15
#define SOCK_SYNRECV 0x16
#define SOCK_FIN_WAIT 0x18
#define SOCK_CLOSING 0x1A
#define SOCK_TIME_WAIT 0x1B
#define SOCK_LAST_ACK 0x1D

#define Sn_MR 0x00
#define Sn_CR 0x01
#define Sn_IR 0x02
#define Sn_SR 0x03
#define Sn_PORT 0x04
#define Sn_DHAR 0x06
#define Sn_DIPR 0x0C
#define Sn_DPORT 0x10
#define Sn_TX_FSR 0x20
#define Sn_TX_WR 0x24
#define Sn_RX_RSR 0x26
#define Sn_RX_RD 0x28

#define OPEN 0x01
#define LISTEN 0x02
#define CONNECT 0x04
#define DISCON 0x08
#define CLOSE 0x10
#define SEND 0x20
#define SEND_MAC 0x21
#define SEND_KEEP 0x22
#define RECV 0x40

uint8_t socket(SOCKET s, uint16_t port);
void close(SOCKET s);
//uint8_t listen(SOCKET s);
uint8_t connect(SOCKET s, uint8_t addr0, uint8_t addr1, uint8_t addr2, uint8_t addr3, uint16_t port);
void disconnect(SOCKET s);
uint16_t send(SOCKET s, const uint8_t *buf, uint16_t len);
uint16_t recv(SOCKET s, uint8_t *buf, uint16_t maxlen);
uint8_t established(SOCKET s);
uint8_t socket_status(SOCKET s);

uint8_t read_sock_reg(SOCKET s, uint8_t reg);
bool write_sock_reg(SOCKET s, uint8_t reg, uint8_t data);

#endif /*SOCKET_H_*/
