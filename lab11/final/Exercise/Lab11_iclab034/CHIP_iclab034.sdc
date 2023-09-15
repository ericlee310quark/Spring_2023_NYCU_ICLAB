###################################################################
set sdc_version 2.0

#define your sdc here


###################################################################

# Created by write_sdc on Mon Dec 19 23:28:32 2022

###################################################################
#set sdc_version 2.1
#13
set CLK_PRE 13.4
#19.5
set CLK_PRE_H [expr 0.5*$CLK_PRE]

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V -current mA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports out_value]
create_clock [get_ports clk]  -period $CLK_PRE  -waveform {0 6.7}
set_input_delay -clock clk  0 [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports in_valid]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports in_valid2]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports matrix]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports {matrix_size[1]}]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports {matrix_size[0]}]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports i_mat_idx]
set_input_delay -clock clk  $CLK_PRE_H  [get_ports w_mat_idx]

set_output_delay -clock clk $CLK_PRE_H  [get_ports out_valid]
set_output_delay -clock clk $CLK_PRE_H  [get_ports out_value]

#//This is example !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!