set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_p}]
set_property LOC AD12 [get_ports {sys_clk_p}]

set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_n}]
set_property LOC AD11 [get_ports {sys_clk_n}]

set_property IOSTANDARD LVCMOS25 [get_ports {uart_rx}]
set_property LOC M19 [get_ports {uart_rx}]
set_property IOSTANDARD LVCMOS25 [get_ports {uart_tx}]
set_property LOC K24 [get_ports {uart_tx}]
