

`include "Usertype_OS.sv"

program automatic PATTERN_bridge(input clk, INF.PATTERN_bridge inf);
import usertype::*;




reg[9*8:1]  rst_color  = "\033[1;0m";
reg[10*8:1] txt_black  = "\033[1;30m";
reg[10*8:1] txt_red    = "\033[1;31m";
reg[10*8:1] txt_green  = "\033[1;32m";
reg[10*8:1] txt_yellow = "\033[1;33m";
reg[10*8:1] txt_blue   = "\033[1;34m";

reg[10*8:1] bg_black  = "\033[40;1m";
reg[10*8:1] bg_red    = "\033[41;1m";
reg[10*8:1] bg_green  = "\033[42;1m";
reg[10*8:1] bg_yellow = "\033[43;1m";
reg[10*8:1] bg_blue   = "\033[0;30;46m";
reg[10*8:1] bg_white  = "\033[47;1m";



reg[10*8:1] bg_red_s = "\033[41;5m";



int flag_wait_out_valid = 0;

initial begin
     forever @(negedge clk) rst_n_task_OS;
end
initial begin
     forever @(negedge clk) one_input_only;
end
initial begin
     forever @(negedge clk) one_input_only;
end


task rst_n_task_OS; begin
	if((~inf.rst_n)&((inf.C_addr!=='b0)|(inf.C_data_w!=='b0)|
        (inf.C_in_valid!=='b0)|(inf.C_r_wb!=='b0))) begin
        // Spec. 3
        // Using  asynchronous  reset  active  low  architecture. All  outputs  should  be zero after reset. 
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("%0s                                                                SPEC 3 FAIL: OS.sv                                                      %0s",bg_red_s,rst_color);
        $display ("                                   All output signals should be reset after the reset signal is asserted.                                   ");
        $display ("C_addr:\t\t%64d|golden C_addr:\t\t%64d",inf.C_addr,0);
        $display ("C_data_w:\t%64d|golden C_data_w:\t%64d",inf.C_data_w,0);
        $display ("C_in_valid:\t%64d|golden C_in_valid:\t%64d",inf.C_in_valid,0);
        $display ("C_r_wb:\t\t%64d|golden C_r_wb:\t\t%64d",inf.C_r_wb,0);;
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $finish;
	end
end
endtask

task one_input_only; begin
    if(inf.C_in_valid==='b1)   flag_wait_out_valid = 1;
    if(inf.C_out_valid==='b1)  flag_wait_out_valid = 0;
end
endtask

task one_input_only_test; begin
    if((inf.C_in_valid==='b1)&(flag_wait_out_valid==1))begin
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("%0s                                                                SPEC 10 FAIL: OS.sv                                                      %0s",bg_red_s,rst_color);
        $display ("             C_in_valid can only be high for one cycle and cannot be pulled high again before C_out_valid                                   ");
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $finish;

    end
end
endtask





endprogram