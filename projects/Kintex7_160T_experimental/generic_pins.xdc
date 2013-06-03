set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_p}]
set_property LOC Y8 [get_ports {sys_clk_p}]

set_property VCCAUX_IO DONTCARE [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_n}]
set_property LOC Y7 [get_ports {sys_clk_n}]

set_property IOSTANDARD LVCMOS25 [get_ports {uart_rx}]
set_property LOC D12 [get_ports {uart_rx}]
set_property IOSTANDARD LVCMOS25 [get_ports {uart_tx}]
set_property LOC F16 [get_ports {uart_tx}]
