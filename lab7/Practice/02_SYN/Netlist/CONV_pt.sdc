###################################################################

# Created by write_sdc on Fri Apr 14 14:47:06 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_wire_load_mode top
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {out_data[7]}]
set_load -pin_load 0.05 [get_ports {out_data[6]}]
set_load -pin_load 0.05 [get_ports {out_data[5]}]
set_load -pin_load 0.05 [get_ports {out_data[4]}]
set_load -pin_load 0.05 [get_ports {out_data[3]}]
set_load -pin_load 0.05 [get_ports {out_data[2]}]
set_load -pin_load 0.05 [get_ports {out_data[1]}]
set_load -pin_load 0.05 [get_ports {out_data[0]}]
create_clock [get_ports clk_1]  -period 10.1  -waveform {0 5.05}
create_clock [get_ports clk_2]  -period 11.1  -waveform {0 5.55}
set_multicycle_path 2 -setup -from [get_clocks clk_1] -to [get_clocks clk_2]
set_multicycle_path 1 -hold -end -from [get_clocks clk_1] -to [get_clocks clk_2]
set_false_path   -from [get_clocks clk_1]  -to [get_clocks clk_2]
set_multicycle_path 2 -setup -from [get_clocks clk_2] -to [get_clocks clk_1]
set_multicycle_path 1 -hold -end -from [get_clocks clk_2] -to [get_clocks clk_1]
set_input_delay -clock clk_1  0  [get_ports clk_1]
set_input_delay -clock clk_2  0  [get_ports clk_2]
set_input_delay -clock clk_1  0  [get_ports rst_n]
set_input_delay -clock clk_1  5.05  [get_ports in_valid]
set_input_delay -clock clk_1  5.05  [get_ports {in_data1[2]}]
set_input_delay -clock clk_1  5.05  [get_ports {in_data1[1]}]
set_input_delay -clock clk_1  5.05  [get_ports {in_data1[0]}]
set_input_delay -clock clk_1  5.05  [get_ports {in_data2[2]}]
set_input_delay -clock clk_1  5.05  [get_ports {in_data2[1]}]
set_input_delay -clock clk_1  5.05  [get_ports {in_data2[0]}]
set_output_delay -clock clk_2  5.55  [get_ports out_valid]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[7]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[6]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[5]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[4]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[3]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[2]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[1]}]
set_output_delay -clock clk_2  5.55  [get_ports {out_data[0]}]
