#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================
set search_path {./../01_RTL \
                 ~iclabta01/umc018/Synthesis/
                 /usr/synthesis/libraries/syn/}

set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db}  
set target_library {slow.db}
#======================================================
#  Global Parameters
#======================================================
set DESIGN "INV_IP_demo"
set MAX_Delay 11.7
#======================================================
#  Read RTL Code
#======================================================
analyze -f verilog $DESIGN\.v
analyze -f verilog INV_IP.v
elaborate $DESIGN 
#-parameter "IP_WIDTH=5"
#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top
#======================================================
#  Set Design Constraints
#======================================================
set_max_delay $MAX_Delay -from [all_inputs] -to [all_outputs]
set_load 0.05 [all_outputs]
#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra
#======================================================
#  Output Reports
#======================================================
check_design > Report/$DESIGN\.check
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

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6

#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing
exit
