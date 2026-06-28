iverilog -o sim\alu_tb.out rtl\alu.v tb\alu_tb.v
vvp sim\alu_tb.out
gtkwave waveforms\alu.vcd