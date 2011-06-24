onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb_qp/osc_clk
add wave -noupdate /top_tb_qp/clk
add wave -noupdate /top_tb_qp/reset
add wave -noupdate -radix hexadecimal /top_tb_qp/data_1
add wave -noupdate -radix hexadecimal /top_tb_qp/digest_1
add wave -noupdate -radix hexadecimal /top_tb_qp/data_2
add wave -noupdate -radix hexadecimal /top_tb_qp/digest_2
add wave -noupdate -radix hexadecimal /top_tb_qp/data_in
add wave -noupdate -radix hexadecimal /top_tb_qp/h_in
add wave -noupdate -radix hexadecimal /top_tb_qp/q_data_in
add wave -noupdate -radix hexadecimal /top_tb_qp/q_h_in
add wave -noupdate -radix hexadecimal /top_tb_qp/q_nonce
add wave -noupdate -radix hexadecimal /top_tb_qp/q_golden_nonce
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 246
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2267136 ps}
