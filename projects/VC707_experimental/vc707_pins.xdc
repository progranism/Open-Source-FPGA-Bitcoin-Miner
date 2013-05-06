set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_p}]
set_property LOC E19 [get_ports {sys_clk_p}]

set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_n}]
set_property LOC E18 [get_ports {sys_clk_n}]

set_property IOSTANDARD LVCMOS18 [get_ports {uart_rx}]
set_property LOC AU33 [get_ports {uart_rx}]
set_property IOSTANDARD LVCMOS18 [get_ports {uart_tx}]
set_property LOC AU36 [get_ports {uart_tx}]
