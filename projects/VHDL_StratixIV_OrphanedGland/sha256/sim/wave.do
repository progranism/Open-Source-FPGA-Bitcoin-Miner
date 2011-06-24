onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sha256_tb/clk
add wave -noupdate /sha256_tb/reset
add wave -noupdate -radix hexadecimal /sha256_tb/msg_in
add wave -noupdate -radix hexadecimal /sha256_tb/digest
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {638717 ps} 0}
configure wave -namecolwidth 169
configure wave -valuecolwidth 901
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
WaveRestoreZoom {569476 ps} {666500 ps}
