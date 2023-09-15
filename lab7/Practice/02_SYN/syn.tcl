#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path {./../01_RTL \
                 ./ \
                   ~iclabta01/umc018/Synthesis/ \
                   /usr/synthesis/libraries/syn/ \
                   /usr/synthesis/dw/ }

set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db}
set target_library {slow.db}

#report_lib slow
#======================================================
#  Global Parameters
#======================================================
set DESIGN "CONV"

set CYCLE1 10.1
set CYCLE2 11.1





#======================================================
#  Read RTL Code
#======================================================
set hdlin_auto_save_templates TRUE
read_sverilog  $DESIGN\.v
current_design $DESIGN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top
set synchronizer_module_name "synchronizer"
set synchronizer_XOR_module_name "syn_XOR"
#======================================================
#  Set Design Constraints
#======================================================
set_dont_use slow/JKFF*
create_clock -name "clk_1" -period $CYCLE1 clk_1 
create_clock -name "clk_2" -period $CYCLE2 clk_2 


read_sdc $DESIGN\.sdc
  
set_output_delay [ expr $CYCLE2*0.5] -clock clk_2 [all_outputs]  
set_input_delay  [ expr $CYCLE1*0.5] -clock clk_1 [all_inputs]
set_input_delay 0 -clock clk_1 clk_1
set_input_delay 0 -clock clk_2 clk_2
set_input_delay 0 -clock clk_1 rst_n      
set_load 0.05 [all_outputs]


#set_multicycle_path 2 -form [get_cells h_reg_2__0_] -to [h_exe_reg_2__0_]

#set_multicycle_path 3 -start -from clk_1 -to clk_2
#set_multicycle_path 2 -hold -start -from clk_1 -to clk_2
#======================================================
#  Optimization
#======================================================
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants


read_sverilog $synchronizer_module_name\.v
#current_design $synchronizer_module_name
compile
set_dont_touch $synchronizer_module_name

read_sverilog $synchronizer_XOR_module_name\.v
#current_design $synchronizer_XOR_module_name
compile
set_dont_touch $synchronizer_XOR_module_name

current_design $DESIGN
compile_ultra  

#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_area >  Report/$DESIGN\.area
report_resource >  Report/$DESIGN\.resource

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true 

write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy

write_sdc Netlist/$DESIGN\_pt.sdc

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6

#====================================================== 
#  Finish and Quit 
#======================================================
report_timing -delay min
report_timing -delay max
report_timing_requirements

report_area -hierarchy
report_cell

exit  
