/*
 
****************************************
Report : area
Design : CC
Version: R-2020.09
Date   : Fri Feb 24 04:28:34 2023
****************************************

Library(s) Used:

    slow (File: /RAID2/COURSE/iclab/iclabta01/umc018/Synthesis/slow.db)

Number of ports:                           60
Number of nets:                          1857
Number of cells:                         1666
Number of combinational cells:           1666
Number of sequential cells:                 0
Number of macros/black boxes:               0
Number of buf/inv:                        309
Number of references:                      40

Combinational area:              31690.613414
Buf/Inv area:                     3086.899312
Noncombinational area:               0.000000
Macro/Black Box area:                0.000000
Net Interconnect area:      undefined  (No wire load specified)

Total cell area:                 31690.613414
Total area:                 undefined
1
*/
module CC(
  in_s0,
  in_s1,
  in_s2,
  in_s3,
  in_s4,
  in_s5,
  in_s6,
  opt,
  a,
  b,
  s_id0,
  s_id1,
  s_id2,
  s_id3,
  s_id4,
  s_id5,
  s_id6,
  out

);
input [3:0]in_s0;
input [3:0]in_s1;
input [3:0]in_s2;
input [3:0]in_s3;
input [3:0]in_s4;
input [3:0]in_s5;
input [3:0]in_s6;
input [2:0]opt;
input [1:0]a;
input [2:0]b;
output [2:0] s_id0;
output [2:0] s_id1;
output [2:0] s_id2;
output [2:0] s_id3;
output [2:0] s_id4;
output [2:0] s_id5;
output [2:0] s_id6;
output [2:0] out; 
//==================================================================
// reg & wire
//==================================================================
wire signed [4+3:0] in_t0, in_t1, in_t2, in_t3, in_t4, in_t5, in_t6;
wire signed [7:0] temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,temp_7,temp_8,temp_9,temp_10,
                  temp_11,temp_12,temp_13,temp_14,temp_15,temp_16,temp_17,temp_18,temp_19,temp_20,
                  temp_21,temp_22,temp_23,temp_24,temp_25,temp_26,temp_27,temp_28,temp_29,temp_30,
                  temp_31,temp_32,temp_33,temp_34,temp_35,temp_36; 
reg signed [8:0] sum;
reg signed [4:0] qutio;
wire signed [2:0] alpha;
wire signed [3:0] alpha_p;
reg signed [4:0] pass_score;

reg signed [8:0] new_score[6:0];
wire signed [3:0] beta;
reg [2:0] accum;
reg pass_num [6:0];
//==================================================================
// design
//==================================================================
assign  in_t0 = {3'd0,(opt[0]&in_s0[3]),in_s0};
assign  in_t1 = {3'd1,(opt[0]&in_s1[3]),in_s1};
assign  in_t2 = {3'd2,(opt[0]&in_s2[3]),in_s2};
assign  in_t3 = {3'd3,(opt[0]&in_s3[3]),in_s3};
assign  in_t4 = {3'd4,(opt[0]&in_s4[3]),in_s4};
assign  in_t5 = {3'd5,(opt[0]&in_s5[3]),in_s5};
assign  in_t6 = {3'd6,(opt[0]&in_s6[3]),in_s6};
assign alpha = {1'b0,a};
assign alpha_p = {2'b00,a}+1;
assign beta = {1'b0,b};
assign out = pass_num[0] + pass_num[1] + pass_num[2] + pass_num[3] +pass_num[4] + pass_num[5] + pass_num[6];
assign  s_id0 = temp_19[7:5];
assign  s_id1 = temp_31[7:5];
assign  s_id2 = temp_35[7:5];
assign  s_id3 = temp_36[7:5];
assign  s_id4 = temp_34[7:5];
assign  s_id5 = temp_30[7:5];
assign  s_id6 = temp_22[7:5];


compare M1(.input_1(in_t0),.input_2(in_t1),.opt(opt[1]),.output_1(temp_1),.output_2(temp_2));
compare M2(.input_1(in_t2),.input_2(in_t3),.opt(opt[1]),.output_1(temp_3),.output_2(temp_4));
compare M3(.input_1(in_t4),.input_2(in_t5),.opt(opt[1]),.output_1(temp_5),.output_2(temp_6));
compare M4(.input_1(temp_2),.input_2(temp_3),.opt(opt[1]),.output_1(temp_7),.output_2(temp_8));
compare M5(.input_1(temp_6),.input_2(in_t6),.opt(opt[1]),.output_1(temp_9),.output_2(temp_10));
compare M6(.input_1(temp_1),.input_2(temp_7),.opt(opt[1]),.output_1(temp_11),.output_2(temp_12));
compare M7(.input_1(temp_8),.input_2(temp_4),.opt(opt[1]),.output_1(temp_13),.output_2(temp_14));
compare M8(.input_1(temp_5),.input_2(temp_9),.opt(opt[1]),.output_1(temp_15),.output_2(temp_16));
compare M9(.input_1(temp_12),.input_2(temp_13),.opt(opt[1]),.output_1(temp_17),.output_2(temp_18));
//

compare M10(.input_1(temp_11),.input_2(temp_15),.opt(opt[1]),.output_1(temp_19),.output_2(temp_20));
compare M11(.input_1(temp_14),.input_2(temp_10),.opt(opt[1]),.output_1(temp_21),.output_2(temp_22));
compare_2 M12(.input_1(temp_20),.input_2(temp_17),.opt(opt[1]),.output_1(temp_23),.output_2(temp_24));
compare_2 M13(.input_1(temp_16),.input_2(temp_21),.opt(opt[1]),.output_1(temp_25),.output_2(temp_26));
compare_2 M14(.input_1(temp_24),.input_2(temp_25),.opt(opt[1]),.output_1(temp_27),.output_2(temp_28));
compare_2 M15(.input_1(temp_18),.input_2(temp_26),.opt(opt[1]),.output_1(temp_29),.output_2(temp_30));
compare_2 M16(.input_1(temp_23),.input_2(temp_27),.opt(opt[1]),.output_1(temp_31),.output_2(temp_32));
compare_2 M17(.input_1(temp_28),.input_2(temp_29),.opt(opt[1]),.output_1(temp_33),.output_2(temp_34));
compare_2 M18(.input_1(temp_32),.input_2(temp_33),.opt(opt[1]),.output_1(temp_35),.output_2(temp_36));



always @*begin
  if (new_score[0]<pass_score)begin
    pass_num[0] = 1'b0^opt[2];
  end
  else begin
    pass_num[0] = 1'b1^opt[2];
  end
  if (new_score[1]<pass_score)begin
    pass_num[1] = 1'b0^opt[2];
  end
  else begin
    pass_num[1] = 1'b1^opt[2];
  end
  if (new_score[2]<pass_score)begin
    pass_num[2] = 1'b0^opt[2];
  end
  else begin
    pass_num[2] = 1'b1^opt[2];
  end
  if (new_score[3]<pass_score)begin
    pass_num[3] = 1'b0^opt[2];
  end
  else begin
    pass_num[3] = 1'b1^opt[2];
  end
  if (new_score[4]<pass_score)begin
    pass_num[4] = 1'b0^opt[2];
  end
  else begin
    pass_num[4] = 1'b1^opt[2];
  end
  if (new_score[5]<pass_score)begin
    pass_num[5] = 1'b0^opt[2];
  end
  else begin
    pass_num[5] = 1'b1^opt[2];
  end
  if (new_score[6]<pass_score)begin
    pass_num[6] = 1'b0^opt[2];
  end
  else begin
    pass_num[6] = 1'b1^opt[2];
  end
  end



always @* begin

  sum = $signed(in_t0[4:0]) + $signed(in_t1[4:0]) + $signed(in_t2[4:0]) +$signed(in_t3[4:0]) + $signed(in_t4[4:0]) + $signed(in_t5[4:0]) +$signed(in_t6[4:0]);
  qutio = sum / $signed(4'd7);
  pass_score = qutio-alpha;

  if(in_t0[4])begin
    new_score[0] = ($signed(in_t0[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[0] = (in_t0[4:0]*alpha_p) + beta;
  end
  if(in_t1[4])begin
    new_score[1] = ($signed(in_t1[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[1] = (in_t1[4:0]*alpha_p) + beta;
  end
  if(in_t2[4])begin
    new_score[2] = ($signed(in_t2[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[2] = (in_t2[4:0]*alpha_p) + beta;
  end

  if(in_t3[4])begin
    new_score[3] = ($signed(in_t3[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[3] = (in_t3[4:0]*alpha_p) + beta;
  end
  if(in_t4[4])begin
    new_score[4] = ($signed(in_t4[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[4] = (in_t4[4:0]*alpha_p) + beta;
  end
  if(in_t5[4])begin
    new_score[5] = ($signed(in_t5[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[5] = (in_t5[4:0]*alpha_p) + beta;
  end
  if(in_t6[4])begin
    new_score[6] = ($signed(in_t6[4:0])/alpha_p) + beta;
  end
  else begin
    new_score[6] = (in_t6[4:0]*alpha_p) + beta;
  end






  /*
  if(opt[1])begin
    temp_1 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_2 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_3 = (in_t0[4:0]<=in_t1[4:0])?in_t2:in_t3;
    temp_4 = (in_t0[4:0]<=in_t1[4:0])?in_t3:in_t2;
    temp_5 = (in_t0[4:0]<=in_t1[4:0])?in_t4:in_t5;
    temp_6 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_7 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_8 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_9 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_10 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_11 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_12 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;

    temp_13 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_14 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_15 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_16 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_17 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_18 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_19 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_20 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_21 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_22 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_23 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_24 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;

    temp_25 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_26 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_27 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_28 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_29 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_30 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_31 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_32 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_33 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_34 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_35 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_36 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;


  end
  else begin
    temp_1 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_2 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_3 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_4 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_5 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_6 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_7 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_8 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_9 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_10 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_11 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_12 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;

    temp_13 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_14 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_15 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_16 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_17 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_18 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_19 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_20 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_21 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_22 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_23 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_24 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;

    temp_25 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_26 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_27 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_28 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_29 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_30 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_31 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_32 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_33 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_34 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;
    temp_35 = (in_t0[4:0]<=in_t1[4:0])?in_t0:in_t1;
    temp_36 = (in_t0[4:0]<=in_t1[4:0])?in_t1:in_t0;

  end
    */
end


endmodule


module compare(input_1,input_2,opt,output_1,output_2);
input [7:0] input_1, input_2;
input opt;
output reg [7:0] output_1, output_2;
wire signed [4:0] num_1, num_2;
//wire [7:0] tem_1, tem_2;
wire [2:0] op;
wire small_fg, large_fg;
assign num_1 = input_1[4:0];
assign num_2 = input_2[4:0];
assign small_fg = num_1<num_2;
assign large_fg = num_1>num_2;
assign op ={opt,small_fg,large_fg};
always @* begin
  case(op)
    3'b110,3'b001:begin
      output_1 = input_2;
      output_2 = input_1;
    end
    default:begin
      output_1 = input_1;
      output_2 = input_2;
    end
  endcase


end


/*

always @* begin
  if(opt)begin
    output_1 = (num_1<num_2)?input_2:input_1;
    output_2 = (num_1<num_2)?input_1:input_2;
  end
  else begin
    output_1 = (num_1>num_2)?input_2:input_1;
    output_2 = (num_1>num_2)?input_1:input_2;
  end
end
*/


endmodule

module compare_2(input_1,input_2,opt,output_1,output_2);
input [7:0] input_1, input_2;
input opt;
output reg [7:0] output_1, output_2;
wire signed [4:0] num_1, num_2;
wire swap_flag;
wire equal_swap_flag, small_fg, large_fg;
wire [3:0] op;

assign num_1 = input_1[4:0];
assign num_2 = input_2[4:0];
assign small_fg = num_1<num_2;
assign large_fg = num_1>num_2;
//assign equal_flag = (num_1==num_2); 
//assign equal_swap_flag = (input_1[7:5]<input_2[7:5])&equal_flag;
assign equal_swap_flag = (input_1[7:5]<input_2[7:5])&(~small_fg&~large_fg);
assign op = {opt,small_fg,large_fg,equal_swap_flag};
always@ * begin
  case(op)
  4'b1010,4'b1001,4'b0100,4'b0001:begin
      output_1 = input_1;
      output_2 = input_2;
  end

  default:begin
      output_1 = input_2;
      output_2 = input_1;
  end
endcase


end

/*


always @* begin
  if(opt)begin
    output_1 = ((num_1>num_2)|equal_swap_flag)?input_1:input_2;
    output_2 = ((num_1>num_2)|equal_swap_flag)?input_2:input_1;
  end
  else begin
    output_1 = ((num_1<num_2)|equal_swap_flag)?input_1:input_2;
    output_2 = ((num_1<num_2)|equal_swap_flag)?input_2:input_1;
  end
end

*/

endmodule