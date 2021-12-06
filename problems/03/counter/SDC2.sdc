set_time_format -unit ns -decimal_places 3
create_clock -name {CLK} -period 20.800 -waveform { 0.000 10.400 } [get_ports {CLK}]
# doesn't work
create_generated_clock -divide_by 2097152 -source [get_ports CLK] -name {clk_cnt_reg[21]} [get_registers clk_cnt_reg[21]]
#
create_generated_clock -divide_by 4096 -source [get_ports CLK] -name {clk_seg_reg[12]} [get_registers clk_seg_reg[12]]


set_clock_uncertainty -rise_from [get_ports {CLK}] -rise_to [get_ports {CLK}] 0.020
set_clock_uncertainty -rise_from [get_ports {CLK}] -fall_to [get_ports {CLK}] 0.020
set_clock_uncertainty -fall_from [get_ports {CLK}] -rise_to [get_ports {CLK}] 0.020
set_clock_uncertainty -fall_from [get_ports {CLK}] -fall_to [get_ports {CLK}] 0.020

set_false_path -to [get_ports {DS_A DS_B DS_C DS_D DS_E DS_F DS_G DS_EN1 DS_EN2 DS_EN3 DS_EN4}]

# I DO HAVE NO IDEA WHY
set_output_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo] 
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi] 
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms] 