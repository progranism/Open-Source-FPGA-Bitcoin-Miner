create_clock -name sys_clk -period 5 [get_ports sys_clk_p]

# Crossings from comm clock domain to hashing domain(s) is managed manually
set_false_path -from [get_clocks tx_comm_clk_hashing_clock_multiplier] -to [get_clocks tx_hash_clk_hashing_clock_multiplier]
