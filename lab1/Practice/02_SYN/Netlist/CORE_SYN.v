/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09
// Date      : Thu Feb 23 05:56:33 2023
/////////////////////////////////////////////////////////////


module CORE ( in_n0, in_n1, opt, out_n );
  input [2:0] in_n0;
  input [2:0] in_n1;
  output [3:0] out_n;
  input opt;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19;

  INVXL U14 ( .A(opt), .Y(n16) );
  MXI2XL U15 ( .A(n16), .B(opt), .S0(in_n1[1]), .Y(n11) );
  AOI2BB1XL U16 ( .A0N(in_n1[0]), .A1N(opt), .B0(n17), .Y(n12) );
  MXI2XL U17 ( .A(n16), .B(opt), .S0(in_n1[2]), .Y(n14) );
  NOR2XL U18 ( .A(in_n0[0]), .B(n19), .Y(n17) );
  INVXL U19 ( .A(in_n1[0]), .Y(n19) );
  ADDFXL U20 ( .A(in_n0[1]), .B(n12), .CI(n11), .CO(n13), .S(out_n[1]) );
  ADDFXL U21 ( .A(in_n0[2]), .B(n14), .CI(n13), .CO(n15), .S(out_n[2]) );
  MXI2XL U22 ( .A(n16), .B(opt), .S0(n15), .Y(out_n[3]) );
  INVXL U23 ( .A(n17), .Y(n18) );
  OAI2BB1XL U24 ( .A0N(in_n0[0]), .A1N(n19), .B0(n18), .Y(out_n[0]) );
endmodule

