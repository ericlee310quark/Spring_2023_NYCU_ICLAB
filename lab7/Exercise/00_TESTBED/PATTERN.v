`ifdef RTL
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk1 15.5
	`define CYCLE_TIME_clk2 18.3
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk1 15.5
	`define CYCLE_TIME_clk2 18.3
`endif


module PATTERN #(parameter DSIZE = 8,
			   parameter ASIZE = 4)(
	//Output Port
	rst_n,
	clk1,
    clk2,
	in_valid,
	
	doraemon_id,
	size,
	iq_score,
	eq_score,
	size_weight,
	iq_weight,
	eq_weight,

    //Input Port
    ready,
	out_valid,
	out,
	
); 
//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg	rst_n, clk1, clk2, in_valid;
output reg [4:0]doraemon_id;
output reg [7:0]size;
output reg [7:0]iq_score;
output reg [7:0]eq_score;
output reg [2:0]size_weight,iq_weight,eq_weight;

input 	ready, out_valid;
input  [7:0] out;




endmodule 