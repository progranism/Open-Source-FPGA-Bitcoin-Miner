KC705\_experimental

This project tests a fully pipelined DSP48E1 based mining core, on the KC705 development kit. It has been successfully routed at 400MHz, or 400MH/s.

The DSP48E1 design uses DSP48E1 slices to perform almost all of the additions. DSP48E1 slices are rated up to ~500MHz at -3 speed grade. Logic slices are used to perform the non-linear math, and store pipeline registers.

This project uses a UART communication module. The KC705, conveniently, has a USB-UART bridge on-board.

If using the getwork protocol, new work should be sent as follows (Python pseudo-code):
    uart_write (data[128:128+24] + midstate + '\n')

For example:
    1571d1be4de695931a26942190f741afb3ab06f1a582c5c85ee7a561912b25a7cd09c060a89b3c2a73a48e22
followed by a newline. After which, after a bit of time, the device should return `0E33337A` and two other results. It will then stop until new work is given to it.

Golden nonces are written to UART by the Virtex when found (newline separated). The Virtex will also report its on-die temperature every 4 seconds, again over UART. To differentiate between a golden nonce and a temperature reading, just look at the length of the number returned (which is hex encoded). A nonce will be 8 characters, followed by a newline. A temperature reading will be 4 characters, followed by a newline.

The temperature readings are interpreted like so:

Temp (C) = reading * 503.975 / 65536 - 273.15

The operating range is 0C to 85C. Never exceed 125C! There are no automatic fail-safes currently enabled (yet).

There is no mining script (yet).
