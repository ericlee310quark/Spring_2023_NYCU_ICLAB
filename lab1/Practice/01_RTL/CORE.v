module CORE (
    in_n0,
    in_n1,
    opt,
    out_n
);
//--------------------------------------------------------------
//Input, Output Declaration
//--------------------------------------------------------------
input [2:0] in_n0, in_n1;
input opt;
output reg [3:0] out_n;

//-----write your code here-----
wire [3:0] temp_in1;
wire [3:0] sums;
wire cin1,cin2,cin3,cin4;
wire sumss;
xor (temp_in1[2],opt,in_n1[2]);
xor (temp_in1[1],opt,in_n1[1]);
xor (temp_in1[0],opt,in_n1[0]);


FA M0(.a(in_n0[0]),.b(temp_in1[0]),.c_in(opt),.sum(sums[0]),.c_out(cin1));
FA M1(.a(in_n0[1]),.b(temp_in1[1]),.c_in(cin1),.sum(sums[1]),.c_out(cin2));
FA M2(.a(in_n0[2]),.b(temp_in1[2]),.c_in(cin2),.sum(sums[2]),.c_out(cin3));
FA M3(.a(1'b0),.b(opt),.c_in(cin3),.sum(sums[3]),.c_out(cin4));



always@ * begin
 
  out_n[3:0] = sums[3:0];
 

end
//-----write your code here-----


endmodule 
//--------------------------------------------------------------
//Module Half Adder & Full Adder provided by TA
//--------------------------------------------------------------
module HA(
		a, 
		b, 
		sum, 
		c_out
);
  input wire a, b;
  output wire sum, c_out;
  xor (sum, a, b);
  and (c_out, a, b);
endmodule


module FA(
		a, 
		b, 
		c_in, 
		sum, 
		c_out
);
  input   a, b, c_in;
  output  sum, c_out;
  wire   w1, w2, w3;
  HA M1(.a(a), .b(b), .sum(w1), .c_out(w2));
  HA M2(.a(w1), .b(c_in), .sum(sum), .c_out(w3));
  or (c_out, w2, w3);
endmodule