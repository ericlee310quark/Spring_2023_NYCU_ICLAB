//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      (C) Copyright NCTU OASIS Lab      
//            All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2022 ICLAB fall Course
//   Lab05			: SRAM, Matrix Multiplication with Systolic Array
//   Author         : Jia Fu-Tsao (jiafutsao.ee10g@nctu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`ifdef RTL
	`timescale 1ns/10ps
	`include "MMT.v"
	`define CYCLE_TIME 20.0
`endif
`ifdef GATE
	`timescale 1ns/10ps
	`include "MMT_SYN.v"
	`define CYCLE_TIME 20.0
`endif

module PATTERN(
// output signals
    clk,
    rst_n,
    in_valid,
	in_valid2,
    matrix,
	matrix_size,
    matrix_idx,
    mode,
// input signals
    out_valid,
    out_value
);
//================================================================
//   parameters & integers
//================================================================

//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg 		  clk, rst_n, in_valid, in_valid2;
output reg [7:0] matrix;
output reg [1:0]  matrix_size,mode;
output reg [4:0]  matrix_idx;

input 				out_valid;
input signed [49:0] out_value;
//================================================================
//    wires % registers
//================================================================

//================================================================
//    clock
//================================================================

//================================================================
//    initial
//================================================================

endmodule