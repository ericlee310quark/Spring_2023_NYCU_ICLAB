

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



initial begin
     forever @(negedge clk) rst_n_task_bridge;
end


task rst_n_task_bridge; begin
    //OUTPUT from bridge.sv

	if((~inf.rst_n)&((inf.C_out_valid!=='b0)|(inf.C_data_r!=='b0)|
        (inf.AR_VALID!=='b0)|(inf.AR_ADDR!=='b0)|(inf.R_READY!=='b0)|
        (inf.AW_VALID!=='b0)|(inf.AW_ADDR!=='b0)|(inf.W_VALID!=='b0)|(inf.W_DATA!=='b0)|
        (inf.B_READY!=='b0))) begin
        // Spec. 3
        // Using  asynchronous  reset  active  low  architecture. All  outputs  should  be zero after reset. 
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("%0s                                                                SPEC 3 FAIL: Bridge.sv                                                      %0s",bg_red_s,rst_color);
        $display ("                                   All output signals should be reset after the reset signal is asserted.                                   ");
        
        $display ("C_out_valid:\t%64d|golden C_out_valid:\t%64d",inf.C_out_valid,0);
        $display ("C_data_r:\t%64d|golden C_data_r:\t\t%64d",inf.C_data_r,0);
        $display ("AR_VALID:\t%64d|golden AR_VALID:\t%64d",inf.AR_VALID,0);
        $display ("AR_ADDR:\t%64d|golden AR_ADDR:\t%64d",inf.AR_ADDR,0);
        $display ("R_READY:\t%64d|golden R_READY:\t%64d",inf.R_READY,0);
        $display ("AW_AVALID:\t%64d|golden AW_AVALID:\t%64d",inf.AW_VALID,0);
        $display ("AW_ADDR:\t%64d|golden AW_ADDR:\t%64d",inf.AW_ADDR,0);
        $display ("W_VALID:\t%64d|golden W_VALID:\t%64d",inf.W_VALID,0);
        $display ("W_DATA:\t%64d|golden W_DATA:\t%64d",inf.W_DATA,0);
        $display ("B_READY:\t%64d|golden B_READY:\t%64d",inf.B_READY,0);
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $finish;
	end
end
endtask


endprogram