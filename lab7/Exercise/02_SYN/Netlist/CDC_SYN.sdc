###################################################################

# Created by write_sdc on Mon Apr 17 02:39:16 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_wire_load_mode top
set_load -pin_load 0.05 [get_ports ready]
set_load -pin_load 20 [get_ports out_valid]
set_load -pin_load 20 [get_ports {out[7]}]
set_load -pin_load 20 [get_ports {out[6]}]
set_load -pin_load 20 [get_ports {out[5]}]
set_load -pin_load 20 [get_ports {out[4]}]
set_load -pin_load 20 [get_ports {out[3]}]
set_load -pin_load 20 [get_ports {out[2]}]
set_load -pin_load 20 [get_ports {out[1]}]
set_load -pin_load 20 [get_ports {out[0]}]
set_ideal_network [get_ports clk1]
set_ideal_network [get_ports clk2]
create_clock [get_ports clk1]  -period 8.6  -waveform {0 4.3}
create_clock [get_ports clk2]  -period 13.6  -waveform {0 6.8}
set_multicycle_path 2 -setup -from [get_clocks clk1] -to [get_clocks clk2]
set_multicycle_path 1 -hold -end -from [get_clocks clk1] -to [get_clocks clk2]
set_false_path   -from [get_clocks clk1]  -to [get_clocks clk2]
set_multicycle_path 2 -setup -from [get_clocks clk2] -to [get_clocks clk1]
set_multicycle_path 1 -hold -end -from [get_clocks clk2] -to [get_clocks clk1]
set_input_delay -clock clk1  0  [get_ports clk1]
set_input_delay -clock clk2  0  [get_ports clk2]
set_input_delay -clock clk2  0  [get_ports rst_n]
set_input_delay -clock clk1  4.3  [get_ports in_valid]
set_input_delay -clock clk1  4.3  [get_ports {doraemon_id[4]}]
set_input_delay -clock clk1  4.3  [get_ports {doraemon_id[3]}]
set_input_delay -clock clk1  4.3  [get_ports {doraemon_id[2]}]
set_input_delay -clock clk1  4.3  [get_ports {doraemon_id[1]}]
set_input_delay -clock clk1  4.3  [get_ports {doraemon_id[0]}]
set_input_delay -clock clk1  4.3  [get_ports {size[7]}]
set_input_delay -clock clk1  4.3  [get_ports {size[6]}]
set_input_delay -clock clk1  4.3  [get_ports {size[5]}]
set_input_delay -clock clk1  4.3  [get_ports {size[4]}]
set_input_delay -clock clk1  4.3  [get_ports {size[3]}]
set_input_delay -clock clk1  4.3  [get_ports {size[2]}]
set_input_delay -clock clk1  4.3  [get_ports {size[1]}]
set_input_delay -clock clk1  4.3  [get_ports {size[0]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[7]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[6]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[5]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[4]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[3]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[2]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[1]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_score[0]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[7]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[6]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[5]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[4]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[3]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[2]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[1]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_score[0]}]
set_input_delay -clock clk1  4.3  [get_ports {size_weight[2]}]
set_input_delay -clock clk1  4.3  [get_ports {size_weight[1]}]
set_input_delay -clock clk1  4.3  [get_ports {size_weight[0]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_weight[2]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_weight[1]}]
set_input_delay -clock clk1  4.3  [get_ports {iq_weight[0]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_weight[2]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_weight[1]}]
set_input_delay -clock clk1  4.3  [get_ports {eq_weight[0]}]
set_input_delay -clock clk1  4.3  [get_ports Port53]
set_output_delay -clock clk1  4.3  [get_ports ready]
set_output_delay -clock clk2  6.8  [get_ports {out[7]}]
set_output_delay -clock clk2  6.8  [get_ports {out[6]}]
set_output_delay -clock clk2  6.8  [get_ports {out[5]}]
set_output_delay -clock clk2  6.8  [get_ports {out[4]}]
set_output_delay -clock clk2  6.8  [get_ports {out[3]}]
set_output_delay -clock clk2  6.8  [get_ports {out[2]}]
set_output_delay -clock clk2  6.8  [get_ports {out[1]}]
set_output_delay -clock clk2  6.8  [get_ports {out[0]}]
set_output_delay -clock clk2  6.8  [get_ports out_valid]
