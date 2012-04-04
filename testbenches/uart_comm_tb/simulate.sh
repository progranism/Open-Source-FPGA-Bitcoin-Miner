iverilog -o uart_comm_tb.vpp uart_comm_tb.v ../../src/uart_rx.v ../../src/uart_tx.v ../../src/uart_comm.v ../../src/uart_tx_fifo.v ../../cores/crc/crc32.v
vvp uart_comm_tb.vpp
