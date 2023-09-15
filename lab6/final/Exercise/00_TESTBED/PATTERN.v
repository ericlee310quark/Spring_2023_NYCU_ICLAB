//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : PATTERN.v
//   	Module Name : PATTERN
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`ifdef RTL_TOP
    `define CYCLE_TIME 60.0
`endif

`ifdef GATE_TOP
    `define CYCLE_TIME 60.0
`endif

module PATTERN (
    // Output signals
    clk, rst_n, in_valid,
    in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a,
    // Input signals
    out_valid, out_Rx, out_Ry
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
output clk, rst_n, in_valid;
output [5:0] in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a;
input out_valid;
input [5:0] out_Rx, out_Ry;

endmodule