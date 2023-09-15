module PATTERN(
	// Output signals
	clk,
	rst_n,
	in_valid,
	img,
	ker,
	weight,

	// Input signals
	out_valid,
	out_data
);

output reg clk;
output reg rst_n;
output reg in_valid;
output reg [7:0] img;
output reg [7:0] ker;
output reg [7:0] weight;

input out_valid;
input  [9:0] out_data;

//================================================================
// Clock
//================================================================



//================================================================
// parameters & integer
//================================================================



//================================================================
// Wire & Reg Declaration
//================================================================



endmodule