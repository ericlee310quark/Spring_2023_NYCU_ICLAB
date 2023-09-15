/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Mon May  1 08:41:26 2023
/////////////////////////////////////////////////////////////


module bridge ( clk, inf_rst_n, inf_C_addr, inf_C_data_w, inf_C_in_valid, 
        inf_C_r_wb, inf_AR_READY, inf_R_VALID, inf_R_RESP, inf_R_DATA, 
        inf_AW_READY, inf_W_READY, inf_B_VALID, inf_B_RESP, inf_C_out_valid, 
        inf_C_data_r, inf_AR_VALID, inf_AR_ADDR, inf_R_READY, inf_AW_VALID, 
        inf_AW_ADDR, inf_W_VALID, inf_W_DATA, inf_B_READY );
  input [7:0] inf_C_addr;
  input [63:0] inf_C_data_w;
  input [1:0] inf_R_RESP;
  input [63:0] inf_R_DATA;
  input [1:0] inf_B_RESP;
  output [63:0] inf_C_data_r;
  output [16:0] inf_AR_ADDR;
  output [16:0] inf_AW_ADDR;
  output [63:0] inf_W_DATA;
  input clk, inf_rst_n, inf_C_in_valid, inf_C_r_wb, inf_AR_READY, inf_R_VALID,
         inf_AW_READY, inf_W_READY, inf_B_VALID;
  output inf_C_out_valid, inf_AR_VALID, inf_R_READY, inf_AW_VALID, inf_W_VALID,
         inf_B_READY;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52,
         N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66,
         N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80,
         N81, N82, N83, N84, N85, N86, N87, N88, N181, n92, n94, n96, n98,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n310;
  wire   [1:0] curr_state;
  wire   [1:0] next_state;

  DFFRHQXL curr_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(inf_rst_n), 
        .Q(curr_state[0]) );
  DFFRHQXL curr_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(inf_rst_n), 
        .Q(curr_state[1]) );
  DFFRHQXL inf_W_DATA_reg_62_ ( .D(n163), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[62]) );
  DFFRHQXL inf_W_DATA_reg_61_ ( .D(n162), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[61]) );
  DFFRHQXL inf_W_DATA_reg_60_ ( .D(n161), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[60]) );
  DFFRHQXL inf_W_DATA_reg_59_ ( .D(n160), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[59]) );
  DFFRHQXL inf_W_DATA_reg_58_ ( .D(n159), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[58]) );
  DFFRHQXL inf_W_DATA_reg_57_ ( .D(n158), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[57]) );
  DFFRHQXL inf_W_DATA_reg_56_ ( .D(n157), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[56]) );
  DFFRHQXL inf_W_DATA_reg_55_ ( .D(n156), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[55]) );
  DFFRHQXL inf_W_DATA_reg_54_ ( .D(n155), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[54]) );
  DFFRHQXL inf_W_DATA_reg_53_ ( .D(n154), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[53]) );
  DFFRHQXL inf_W_DATA_reg_52_ ( .D(n153), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[52]) );
  DFFRHQXL inf_W_DATA_reg_51_ ( .D(n152), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[51]) );
  DFFRHQXL inf_W_DATA_reg_50_ ( .D(n151), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[50]) );
  DFFRHQXL inf_W_DATA_reg_49_ ( .D(n150), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[49]) );
  DFFRHQXL inf_W_DATA_reg_48_ ( .D(n149), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[48]) );
  DFFRHQXL inf_W_DATA_reg_47_ ( .D(n148), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[47]) );
  DFFRHQXL inf_W_DATA_reg_46_ ( .D(n147), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[46]) );
  DFFRHQXL inf_W_DATA_reg_45_ ( .D(n146), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[45]) );
  DFFRHQXL inf_W_DATA_reg_44_ ( .D(n145), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[44]) );
  DFFRHQXL inf_W_DATA_reg_43_ ( .D(n144), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[43]) );
  DFFRHQXL inf_W_DATA_reg_42_ ( .D(n143), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[42]) );
  DFFRHQXL inf_W_DATA_reg_41_ ( .D(n142), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[41]) );
  DFFRHQXL inf_W_DATA_reg_40_ ( .D(n141), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[40]) );
  DFFRHQXL inf_W_DATA_reg_39_ ( .D(n140), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[39]) );
  DFFRHQXL inf_W_DATA_reg_38_ ( .D(n139), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[38]) );
  DFFRHQXL inf_W_DATA_reg_37_ ( .D(n138), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[37]) );
  DFFRHQXL inf_W_DATA_reg_36_ ( .D(n137), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[36]) );
  DFFRHQXL inf_W_DATA_reg_35_ ( .D(n136), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[35]) );
  DFFRHQXL inf_W_DATA_reg_34_ ( .D(n135), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[34]) );
  DFFRHQXL inf_W_DATA_reg_33_ ( .D(n134), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[33]) );
  DFFRHQXL inf_W_DATA_reg_32_ ( .D(n133), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[32]) );
  DFFRHQXL inf_W_DATA_reg_31_ ( .D(n132), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[31]) );
  DFFRHQXL inf_W_DATA_reg_30_ ( .D(n131), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[30]) );
  DFFRHQXL inf_W_DATA_reg_29_ ( .D(n130), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[29]) );
  DFFRHQXL inf_W_DATA_reg_28_ ( .D(n129), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[28]) );
  DFFRHQXL inf_W_DATA_reg_27_ ( .D(n128), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[27]) );
  DFFRHQXL inf_W_DATA_reg_26_ ( .D(n127), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[26]) );
  DFFRHQXL inf_W_DATA_reg_25_ ( .D(n126), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[25]) );
  DFFRHQXL inf_W_DATA_reg_24_ ( .D(n125), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[24]) );
  DFFRHQXL inf_W_DATA_reg_23_ ( .D(n124), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[23]) );
  DFFRHQXL inf_W_DATA_reg_22_ ( .D(n123), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[22]) );
  DFFRHQXL inf_W_DATA_reg_21_ ( .D(n122), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[21]) );
  DFFRHQXL inf_W_DATA_reg_20_ ( .D(n121), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[20]) );
  DFFRHQXL inf_W_DATA_reg_19_ ( .D(n120), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[19]) );
  DFFRHQXL inf_W_DATA_reg_18_ ( .D(n119), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[18]) );
  DFFRHQXL inf_W_DATA_reg_17_ ( .D(n118), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[17]) );
  DFFRHQXL inf_W_DATA_reg_16_ ( .D(n117), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[16]) );
  DFFRHQXL inf_W_DATA_reg_15_ ( .D(n116), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[15]) );
  DFFRHQXL inf_W_DATA_reg_14_ ( .D(n115), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[14]) );
  DFFRHQXL inf_W_DATA_reg_13_ ( .D(n114), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[13]) );
  DFFRHQXL inf_W_DATA_reg_12_ ( .D(n113), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[12]) );
  DFFRHQXL inf_W_DATA_reg_11_ ( .D(n112), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[11]) );
  DFFRHQXL inf_W_DATA_reg_10_ ( .D(n111), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[10]) );
  DFFRHQXL inf_W_DATA_reg_9_ ( .D(n110), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[9]) );
  DFFRHQXL inf_W_DATA_reg_8_ ( .D(n109), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[8]) );
  DFFRHQXL inf_W_DATA_reg_7_ ( .D(n108), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[7]) );
  DFFRHQXL inf_W_DATA_reg_6_ ( .D(n107), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[6]) );
  DFFRHQXL inf_W_DATA_reg_5_ ( .D(n106), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[5]) );
  DFFRHQXL inf_W_DATA_reg_4_ ( .D(n105), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[4]) );
  DFFRHQXL inf_W_DATA_reg_3_ ( .D(n104), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[3]) );
  DFFRHQXL inf_W_DATA_reg_2_ ( .D(n103), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[2]) );
  DFFRHQXL inf_W_DATA_reg_1_ ( .D(n102), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[1]) );
  DFFRHQXL inf_W_DATA_reg_0_ ( .D(n101), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[0]) );
  DFFRHQXL inf_W_DATA_reg_63_ ( .D(n164), .CK(clk), .RN(inf_rst_n), .Q(
        inf_W_DATA[63]) );
  DFFRX1 inf_W_VALID_reg ( .D(n94), .CK(clk), .RN(inf_rst_n), .Q(inf_W_VALID), 
        .QN(n310) );
  DFFRHQXL inf_C_data_r_reg_52_ ( .D(N77), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[52]) );
  DFFRHQXL inf_C_data_r_reg_37_ ( .D(N62), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[37]) );
  DFFRHQXL inf_C_data_r_reg_22_ ( .D(N47), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[22]) );
  DFFRHQXL inf_C_data_r_reg_7_ ( .D(N32), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[7]) );
  DFFRHQXL inf_AR_ADDR_reg_3_ ( .D(n173), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[3]) );
  DFFRHQXL inf_AW_ADDR_reg_3_ ( .D(n165), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[3]) );
  DFFRHQXL inf_AR_ADDR_reg_16_ ( .D(n100), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_VALID) );
  DFFRHQXL inf_C_out_valid_reg ( .D(N181), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_out_valid) );
  DFFRHQXL inf_C_data_r_reg_63_ ( .D(N88), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[63]) );
  DFFRHQXL inf_C_data_r_reg_62_ ( .D(N87), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[62]) );
  DFFRHQXL inf_C_data_r_reg_61_ ( .D(N86), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[61]) );
  DFFRHQXL inf_C_data_r_reg_60_ ( .D(N85), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[60]) );
  DFFRHQXL inf_C_data_r_reg_59_ ( .D(N84), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[59]) );
  DFFRHQXL inf_C_data_r_reg_58_ ( .D(N83), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[58]) );
  DFFRHQXL inf_C_data_r_reg_57_ ( .D(N82), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[57]) );
  DFFRHQXL inf_C_data_r_reg_56_ ( .D(N81), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[56]) );
  DFFRHQXL inf_C_data_r_reg_55_ ( .D(N80), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[55]) );
  DFFRHQXL inf_C_data_r_reg_54_ ( .D(N79), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[54]) );
  DFFRHQXL inf_C_data_r_reg_53_ ( .D(N78), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[53]) );
  DFFRHQXL inf_C_data_r_reg_51_ ( .D(N76), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[51]) );
  DFFRHQXL inf_C_data_r_reg_50_ ( .D(N75), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[50]) );
  DFFRHQXL inf_C_data_r_reg_49_ ( .D(N74), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[49]) );
  DFFRHQXL inf_C_data_r_reg_48_ ( .D(N73), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[48]) );
  DFFRHQXL inf_C_data_r_reg_47_ ( .D(N72), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[47]) );
  DFFRHQXL inf_C_data_r_reg_46_ ( .D(N71), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[46]) );
  DFFRHQXL inf_C_data_r_reg_45_ ( .D(N70), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[45]) );
  DFFRHQXL inf_C_data_r_reg_44_ ( .D(N69), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[44]) );
  DFFRHQXL inf_C_data_r_reg_43_ ( .D(N68), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[43]) );
  DFFRHQXL inf_C_data_r_reg_42_ ( .D(N67), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[42]) );
  DFFRHQXL inf_C_data_r_reg_41_ ( .D(N66), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[41]) );
  DFFRHQXL inf_C_data_r_reg_40_ ( .D(N65), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[40]) );
  DFFRHQXL inf_C_data_r_reg_39_ ( .D(N64), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[39]) );
  DFFRHQXL inf_C_data_r_reg_38_ ( .D(N63), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[38]) );
  DFFRHQXL inf_C_data_r_reg_36_ ( .D(N61), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[36]) );
  DFFRHQXL inf_C_data_r_reg_35_ ( .D(N60), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[35]) );
  DFFRHQXL inf_C_data_r_reg_34_ ( .D(N59), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[34]) );
  DFFRHQXL inf_C_data_r_reg_33_ ( .D(N58), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[33]) );
  DFFRHQXL inf_C_data_r_reg_32_ ( .D(N57), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[32]) );
  DFFRHQXL inf_C_data_r_reg_31_ ( .D(N56), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[31]) );
  DFFRHQXL inf_C_data_r_reg_30_ ( .D(N55), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[30]) );
  DFFRHQXL inf_C_data_r_reg_29_ ( .D(N54), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[29]) );
  DFFRHQXL inf_C_data_r_reg_28_ ( .D(N53), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[28]) );
  DFFRHQXL inf_C_data_r_reg_27_ ( .D(N52), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[27]) );
  DFFRHQXL inf_C_data_r_reg_26_ ( .D(N51), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[26]) );
  DFFRHQXL inf_C_data_r_reg_25_ ( .D(N50), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[25]) );
  DFFRHQXL inf_C_data_r_reg_24_ ( .D(N49), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[24]) );
  DFFRHQXL inf_C_data_r_reg_23_ ( .D(N48), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[23]) );
  DFFRHQXL inf_C_data_r_reg_21_ ( .D(N46), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[21]) );
  DFFRHQXL inf_C_data_r_reg_20_ ( .D(N45), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[20]) );
  DFFRHQXL inf_C_data_r_reg_19_ ( .D(N44), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[19]) );
  DFFRHQXL inf_C_data_r_reg_18_ ( .D(N43), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[18]) );
  DFFRHQXL inf_C_data_r_reg_17_ ( .D(N42), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[17]) );
  DFFRHQXL inf_C_data_r_reg_16_ ( .D(N41), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[16]) );
  DFFRHQXL inf_C_data_r_reg_15_ ( .D(N40), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[15]) );
  DFFRHQXL inf_C_data_r_reg_14_ ( .D(N39), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[14]) );
  DFFRHQXL inf_C_data_r_reg_13_ ( .D(N38), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[13]) );
  DFFRHQXL inf_C_data_r_reg_12_ ( .D(N37), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[12]) );
  DFFRHQXL inf_C_data_r_reg_11_ ( .D(N36), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[11]) );
  DFFRHQXL inf_C_data_r_reg_10_ ( .D(N35), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[10]) );
  DFFRHQXL inf_C_data_r_reg_9_ ( .D(N34), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[9]) );
  DFFRHQXL inf_C_data_r_reg_8_ ( .D(N33), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[8]) );
  DFFRHQXL inf_C_data_r_reg_6_ ( .D(N31), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[6]) );
  DFFRHQXL inf_C_data_r_reg_5_ ( .D(N30), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[5]) );
  DFFRHQXL inf_C_data_r_reg_4_ ( .D(N29), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[4]) );
  DFFRHQXL inf_C_data_r_reg_3_ ( .D(N28), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[3]) );
  DFFRHQXL inf_C_data_r_reg_2_ ( .D(N27), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[2]) );
  DFFRHQXL inf_C_data_r_reg_1_ ( .D(N26), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[1]) );
  DFFRHQXL inf_C_data_r_reg_0_ ( .D(N25), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[0]) );
  DFFRHQXL inf_AR_ADDR_reg_10_ ( .D(n180), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[10]) );
  DFFRHQXL inf_AR_ADDR_reg_9_ ( .D(n179), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[9]) );
  DFFRHQXL inf_AR_ADDR_reg_8_ ( .D(n178), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[8]) );
  DFFRHQXL inf_AR_ADDR_reg_7_ ( .D(n177), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[7]) );
  DFFRHQXL inf_AR_ADDR_reg_6_ ( .D(n176), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[6]) );
  DFFRHQXL inf_AR_ADDR_reg_5_ ( .D(n175), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[5]) );
  DFFRHQXL inf_AR_ADDR_reg_4_ ( .D(n174), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AR_ADDR[4]) );
  DFFRHQXL inf_AW_ADDR_reg_10_ ( .D(n172), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[10]) );
  DFFRHQXL inf_AW_ADDR_reg_9_ ( .D(n171), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[9]) );
  DFFRHQXL inf_AW_ADDR_reg_8_ ( .D(n170), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[8]) );
  DFFRHQXL inf_AW_ADDR_reg_7_ ( .D(n169), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[7]) );
  DFFRHQXL inf_AW_ADDR_reg_6_ ( .D(n168), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[6]) );
  DFFRHQXL inf_AW_ADDR_reg_5_ ( .D(n167), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[5]) );
  DFFRHQXL inf_AW_ADDR_reg_4_ ( .D(n166), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_ADDR[4]) );
  DFFRHQXL inf_B_READY_reg ( .D(n92), .CK(clk), .RN(inf_rst_n), .Q(inf_B_READY) );
  DFFRHQXL inf_R_READY_reg ( .D(n98), .CK(clk), .RN(inf_rst_n), .Q(inf_R_READY) );
  DFFRHQXL inf_AW_ADDR_reg_16_ ( .D(n96), .CK(clk), .RN(inf_rst_n), .Q(
        inf_AW_VALID) );
  NOR2XL U254 ( .A(n305), .B(inf_AW_READY), .Y(n240) );
  AND2XL U255 ( .A(next_state[0]), .B(next_state[1]), .Y(N181) );
  NOR2X1 U256 ( .A(n229), .B(inf_AR_READY), .Y(n231) );
  OR2XL U257 ( .A(curr_state[0]), .B(n219), .Y(n213) );
  NOR2X1 U258 ( .A(curr_state[0]), .B(curr_state[1]), .Y(n214) );
  NAND2X1 U259 ( .A(inf_C_r_wb), .B(inf_C_in_valid), .Y(n221) );
  INVXL U260 ( .A(1'b1), .Y(inf_AW_ADDR[0]) );
  INVXL U262 ( .A(1'b1), .Y(inf_AW_ADDR[1]) );
  INVXL U264 ( .A(1'b1), .Y(inf_AW_ADDR[2]) );
  INVXL U266 ( .A(1'b1), .Y(inf_AW_ADDR[11]) );
  INVXL U268 ( .A(1'b1), .Y(inf_AW_ADDR[12]) );
  INVXL U270 ( .A(1'b1), .Y(inf_AW_ADDR[13]) );
  INVXL U272 ( .A(1'b1), .Y(inf_AW_ADDR[14]) );
  INVXL U274 ( .A(1'b1), .Y(inf_AW_ADDR[15]) );
  INVXL U276 ( .A(1'b1), .Y(inf_AR_ADDR[0]) );
  INVXL U278 ( .A(1'b1), .Y(inf_AR_ADDR[1]) );
  INVXL U280 ( .A(1'b1), .Y(inf_AR_ADDR[2]) );
  INVXL U282 ( .A(1'b1), .Y(inf_AR_ADDR[11]) );
  INVXL U284 ( .A(1'b1), .Y(inf_AR_ADDR[12]) );
  INVXL U286 ( .A(1'b1), .Y(inf_AR_ADDR[13]) );
  INVXL U288 ( .A(1'b1), .Y(inf_AR_ADDR[14]) );
  INVXL U290 ( .A(1'b1), .Y(inf_AR_ADDR[15]) );
  NOR2BX2 U292 ( .AN(n241), .B(inf_W_READY), .Y(n307) );
  AND2X2 U293 ( .A(inf_R_VALID), .B(N181), .Y(n220) );
  INVXL U294 ( .A(inf_AR_READY), .Y(n216) );
  INVXL U295 ( .A(inf_AW_READY), .Y(n218) );
  INVX2 U296 ( .A(n241), .Y(n305) );
  NAND2BXL U297 ( .AN(inf_C_r_wb), .B(inf_C_in_valid), .Y(n241) );
  INVXL U298 ( .A(inf_R_VALID), .Y(n217) );
  INVXL U299 ( .A(inf_B_VALID), .Y(n219) );
  OAI2BB1XL U300 ( .A0N(n216), .A1N(inf_AR_VALID), .B0(n221), .Y(n100) );
  OAI2BB1XL U301 ( .A0N(n240), .A1N(inf_AW_ADDR[3]), .B0(n239), .Y(n165) );
  NAND2XL U302 ( .A(inf_C_addr[0]), .B(n305), .Y(n239) );
  OAI2BB1XL U303 ( .A0N(n231), .A1N(inf_AR_ADDR[3]), .B0(n230), .Y(n173) );
  AND2XL U304 ( .A(n220), .B(inf_R_DATA[31]), .Y(N32) );
  AND2XL U305 ( .A(n220), .B(inf_R_DATA[14]), .Y(N47) );
  AND2XL U306 ( .A(n220), .B(inf_R_DATA[61]), .Y(N62) );
  AND2XL U307 ( .A(n220), .B(inf_R_DATA[44]), .Y(N77) );
  OAI21XL U308 ( .A0(inf_W_READY), .A1(n310), .B0(n218), .Y(n94) );
  OAI2BB1XL U309 ( .A0N(inf_AW_VALID), .A1N(n218), .B0(n241), .Y(n96) );
  OAI2BB1XL U310 ( .A0N(n305), .A1N(inf_C_data_w[39]), .B0(n242), .Y(n164) );
  OAI2BB1XL U311 ( .A0N(inf_R_READY), .A1N(n217), .B0(n216), .Y(n98) );
  OAI2BB1XL U312 ( .A0N(n219), .A1N(inf_B_READY), .B0(n218), .Y(n92) );
  OAI2BB1XL U313 ( .A0N(n307), .A1N(inf_W_DATA[0]), .B0(n306), .Y(n101) );
  NAND2XL U314 ( .A(inf_C_data_w[24]), .B(n305), .Y(n306) );
  OAI2BB1XL U315 ( .A0N(n307), .A1N(inf_W_DATA[1]), .B0(n304), .Y(n102) );
  NAND2XL U316 ( .A(inf_C_data_w[25]), .B(n305), .Y(n304) );
  OAI2BB1XL U317 ( .A0N(n307), .A1N(inf_W_DATA[2]), .B0(n303), .Y(n103) );
  NAND2XL U318 ( .A(inf_C_data_w[26]), .B(n305), .Y(n303) );
  OAI2BB1XL U319 ( .A0N(n307), .A1N(inf_W_DATA[3]), .B0(n302), .Y(n104) );
  NAND2XL U320 ( .A(inf_C_data_w[27]), .B(n305), .Y(n302) );
  OAI2BB1XL U321 ( .A0N(n307), .A1N(inf_W_DATA[4]), .B0(n301), .Y(n105) );
  NAND2XL U322 ( .A(inf_C_data_w[28]), .B(n305), .Y(n301) );
  OAI2BB1XL U323 ( .A0N(n307), .A1N(inf_W_DATA[5]), .B0(n300), .Y(n106) );
  NAND2XL U324 ( .A(inf_C_data_w[29]), .B(n305), .Y(n300) );
  OAI2BB1XL U325 ( .A0N(n307), .A1N(inf_W_DATA[6]), .B0(n299), .Y(n107) );
  NAND2XL U326 ( .A(inf_C_data_w[30]), .B(n305), .Y(n299) );
  OAI2BB1XL U327 ( .A0N(n307), .A1N(inf_W_DATA[7]), .B0(n298), .Y(n108) );
  NAND2XL U328 ( .A(inf_C_data_w[31]), .B(n305), .Y(n298) );
  OAI2BB1XL U329 ( .A0N(n307), .A1N(inf_W_DATA[8]), .B0(n297), .Y(n109) );
  NAND2XL U330 ( .A(inf_C_data_w[16]), .B(n305), .Y(n297) );
  OAI2BB1XL U331 ( .A0N(n307), .A1N(inf_W_DATA[9]), .B0(n296), .Y(n110) );
  NAND2XL U332 ( .A(inf_C_data_w[17]), .B(n305), .Y(n296) );
  OAI2BB1XL U333 ( .A0N(n307), .A1N(inf_W_DATA[10]), .B0(n295), .Y(n111) );
  NAND2XL U334 ( .A(inf_C_data_w[18]), .B(n305), .Y(n295) );
  OAI2BB1XL U335 ( .A0N(n307), .A1N(inf_W_DATA[11]), .B0(n294), .Y(n112) );
  NAND2XL U336 ( .A(inf_C_data_w[19]), .B(n305), .Y(n294) );
  OAI2BB1XL U337 ( .A0N(n307), .A1N(inf_W_DATA[12]), .B0(n293), .Y(n113) );
  NAND2XL U338 ( .A(inf_C_data_w[20]), .B(n305), .Y(n293) );
  OAI2BB1XL U339 ( .A0N(n307), .A1N(inf_W_DATA[13]), .B0(n292), .Y(n114) );
  NAND2XL U340 ( .A(inf_C_data_w[21]), .B(n305), .Y(n292) );
  OAI2BB1XL U341 ( .A0N(n307), .A1N(inf_W_DATA[14]), .B0(n291), .Y(n115) );
  NAND2XL U342 ( .A(inf_C_data_w[22]), .B(n305), .Y(n291) );
  OAI2BB1XL U343 ( .A0N(n307), .A1N(inf_W_DATA[15]), .B0(n290), .Y(n116) );
  NAND2XL U344 ( .A(inf_C_data_w[23]), .B(n305), .Y(n290) );
  OAI2BB1XL U345 ( .A0N(n307), .A1N(inf_W_DATA[16]), .B0(n289), .Y(n117) );
  NAND2XL U346 ( .A(inf_C_data_w[8]), .B(n305), .Y(n289) );
  OAI2BB1XL U347 ( .A0N(n307), .A1N(inf_W_DATA[17]), .B0(n288), .Y(n118) );
  NAND2XL U348 ( .A(inf_C_data_w[9]), .B(n305), .Y(n288) );
  OAI2BB1XL U349 ( .A0N(n307), .A1N(inf_W_DATA[18]), .B0(n287), .Y(n119) );
  NAND2XL U350 ( .A(inf_C_data_w[10]), .B(n305), .Y(n287) );
  OAI2BB1XL U351 ( .A0N(n307), .A1N(inf_W_DATA[19]), .B0(n286), .Y(n120) );
  NAND2XL U352 ( .A(inf_C_data_w[11]), .B(n305), .Y(n286) );
  OAI2BB1XL U353 ( .A0N(n307), .A1N(inf_W_DATA[20]), .B0(n285), .Y(n121) );
  NAND2XL U354 ( .A(inf_C_data_w[12]), .B(n305), .Y(n285) );
  OAI2BB1XL U355 ( .A0N(n307), .A1N(inf_W_DATA[21]), .B0(n284), .Y(n122) );
  NAND2XL U356 ( .A(inf_C_data_w[13]), .B(n305), .Y(n284) );
  OAI2BB1XL U357 ( .A0N(n307), .A1N(inf_W_DATA[22]), .B0(n283), .Y(n123) );
  NAND2XL U358 ( .A(inf_C_data_w[14]), .B(n305), .Y(n283) );
  OAI2BB1XL U359 ( .A0N(n307), .A1N(inf_W_DATA[23]), .B0(n282), .Y(n124) );
  NAND2XL U360 ( .A(inf_C_data_w[15]), .B(n305), .Y(n282) );
  OAI2BB1XL U361 ( .A0N(n307), .A1N(inf_W_DATA[24]), .B0(n281), .Y(n125) );
  NAND2XL U362 ( .A(inf_C_data_w[0]), .B(n305), .Y(n281) );
  OAI2BB1XL U363 ( .A0N(n307), .A1N(inf_W_DATA[25]), .B0(n280), .Y(n126) );
  NAND2XL U364 ( .A(inf_C_data_w[1]), .B(n305), .Y(n280) );
  OAI2BB1XL U365 ( .A0N(n307), .A1N(inf_W_DATA[26]), .B0(n279), .Y(n127) );
  NAND2XL U366 ( .A(inf_C_data_w[2]), .B(n305), .Y(n279) );
  OAI2BB1XL U367 ( .A0N(n307), .A1N(inf_W_DATA[27]), .B0(n278), .Y(n128) );
  NAND2XL U368 ( .A(inf_C_data_w[3]), .B(n305), .Y(n278) );
  OAI2BB1XL U369 ( .A0N(n307), .A1N(inf_W_DATA[28]), .B0(n277), .Y(n129) );
  NAND2XL U370 ( .A(inf_C_data_w[4]), .B(n305), .Y(n277) );
  OAI2BB1XL U371 ( .A0N(n307), .A1N(inf_W_DATA[29]), .B0(n276), .Y(n130) );
  NAND2XL U372 ( .A(inf_C_data_w[5]), .B(n305), .Y(n276) );
  OAI2BB1XL U373 ( .A0N(n307), .A1N(inf_W_DATA[30]), .B0(n275), .Y(n131) );
  NAND2XL U374 ( .A(inf_C_data_w[6]), .B(n305), .Y(n275) );
  OAI2BB1XL U375 ( .A0N(n307), .A1N(inf_W_DATA[31]), .B0(n274), .Y(n132) );
  NAND2XL U376 ( .A(inf_C_data_w[7]), .B(n305), .Y(n274) );
  OAI2BB1XL U377 ( .A0N(n307), .A1N(inf_W_DATA[32]), .B0(n273), .Y(n133) );
  NAND2XL U378 ( .A(inf_C_data_w[56]), .B(n305), .Y(n273) );
  OAI2BB1XL U379 ( .A0N(n307), .A1N(inf_W_DATA[33]), .B0(n272), .Y(n134) );
  NAND2XL U380 ( .A(inf_C_data_w[57]), .B(n305), .Y(n272) );
  OAI2BB1XL U381 ( .A0N(n307), .A1N(inf_W_DATA[34]), .B0(n271), .Y(n135) );
  NAND2XL U382 ( .A(inf_C_data_w[58]), .B(n305), .Y(n271) );
  OAI2BB1XL U383 ( .A0N(n307), .A1N(inf_W_DATA[35]), .B0(n270), .Y(n136) );
  NAND2XL U384 ( .A(inf_C_data_w[59]), .B(n305), .Y(n270) );
  OAI2BB1XL U385 ( .A0N(n307), .A1N(inf_W_DATA[36]), .B0(n269), .Y(n137) );
  NAND2XL U386 ( .A(inf_C_data_w[60]), .B(n305), .Y(n269) );
  OAI2BB1XL U387 ( .A0N(n307), .A1N(inf_W_DATA[37]), .B0(n268), .Y(n138) );
  NAND2XL U388 ( .A(inf_C_data_w[61]), .B(n305), .Y(n268) );
  OAI2BB1XL U389 ( .A0N(n307), .A1N(inf_W_DATA[38]), .B0(n267), .Y(n139) );
  NAND2XL U390 ( .A(inf_C_data_w[62]), .B(n305), .Y(n267) );
  OAI2BB1XL U391 ( .A0N(n307), .A1N(inf_W_DATA[39]), .B0(n266), .Y(n140) );
  NAND2XL U392 ( .A(inf_C_data_w[63]), .B(n305), .Y(n266) );
  OAI2BB1XL U393 ( .A0N(n307), .A1N(inf_W_DATA[40]), .B0(n265), .Y(n141) );
  NAND2XL U394 ( .A(inf_C_data_w[48]), .B(n305), .Y(n265) );
  OAI2BB1XL U395 ( .A0N(n307), .A1N(inf_W_DATA[41]), .B0(n264), .Y(n142) );
  NAND2XL U396 ( .A(inf_C_data_w[49]), .B(n305), .Y(n264) );
  OAI2BB1XL U397 ( .A0N(n307), .A1N(inf_W_DATA[42]), .B0(n263), .Y(n143) );
  NAND2XL U398 ( .A(inf_C_data_w[50]), .B(n305), .Y(n263) );
  OAI2BB1XL U399 ( .A0N(n307), .A1N(inf_W_DATA[43]), .B0(n262), .Y(n144) );
  NAND2XL U400 ( .A(inf_C_data_w[51]), .B(n305), .Y(n262) );
  OAI2BB1XL U401 ( .A0N(n307), .A1N(inf_W_DATA[44]), .B0(n261), .Y(n145) );
  NAND2XL U402 ( .A(inf_C_data_w[52]), .B(n305), .Y(n261) );
  OAI2BB1XL U403 ( .A0N(n307), .A1N(inf_W_DATA[45]), .B0(n260), .Y(n146) );
  NAND2XL U404 ( .A(inf_C_data_w[53]), .B(n305), .Y(n260) );
  OAI2BB1XL U405 ( .A0N(n307), .A1N(inf_W_DATA[46]), .B0(n259), .Y(n147) );
  NAND2XL U406 ( .A(inf_C_data_w[54]), .B(n305), .Y(n259) );
  OAI2BB1XL U407 ( .A0N(n307), .A1N(inf_W_DATA[47]), .B0(n258), .Y(n148) );
  NAND2XL U408 ( .A(inf_C_data_w[55]), .B(n305), .Y(n258) );
  OAI2BB1XL U409 ( .A0N(n307), .A1N(inf_W_DATA[48]), .B0(n257), .Y(n149) );
  NAND2XL U410 ( .A(inf_C_data_w[40]), .B(n305), .Y(n257) );
  OAI2BB1XL U411 ( .A0N(n307), .A1N(inf_W_DATA[49]), .B0(n256), .Y(n150) );
  NAND2XL U412 ( .A(inf_C_data_w[41]), .B(n305), .Y(n256) );
  OAI2BB1XL U413 ( .A0N(n307), .A1N(inf_W_DATA[50]), .B0(n255), .Y(n151) );
  NAND2XL U414 ( .A(inf_C_data_w[42]), .B(n305), .Y(n255) );
  OAI2BB1XL U415 ( .A0N(n307), .A1N(inf_W_DATA[51]), .B0(n254), .Y(n152) );
  NAND2XL U416 ( .A(inf_C_data_w[43]), .B(n305), .Y(n254) );
  OAI2BB1XL U417 ( .A0N(n307), .A1N(inf_W_DATA[52]), .B0(n253), .Y(n153) );
  NAND2XL U418 ( .A(inf_C_data_w[44]), .B(n305), .Y(n253) );
  OAI2BB1XL U419 ( .A0N(n307), .A1N(inf_W_DATA[53]), .B0(n252), .Y(n154) );
  NAND2XL U420 ( .A(inf_C_data_w[45]), .B(n305), .Y(n252) );
  OAI2BB1XL U421 ( .A0N(n307), .A1N(inf_W_DATA[54]), .B0(n251), .Y(n155) );
  NAND2XL U422 ( .A(inf_C_data_w[46]), .B(n305), .Y(n251) );
  OAI2BB1XL U423 ( .A0N(n307), .A1N(inf_W_DATA[55]), .B0(n250), .Y(n156) );
  NAND2XL U424 ( .A(inf_C_data_w[47]), .B(n305), .Y(n250) );
  OAI2BB1XL U425 ( .A0N(n307), .A1N(inf_W_DATA[56]), .B0(n249), .Y(n157) );
  NAND2XL U426 ( .A(inf_C_data_w[32]), .B(n305), .Y(n249) );
  OAI2BB1XL U427 ( .A0N(n307), .A1N(inf_W_DATA[57]), .B0(n248), .Y(n158) );
  NAND2XL U428 ( .A(inf_C_data_w[33]), .B(n305), .Y(n248) );
  OAI2BB1XL U429 ( .A0N(n307), .A1N(inf_W_DATA[58]), .B0(n247), .Y(n159) );
  NAND2XL U430 ( .A(inf_C_data_w[34]), .B(n305), .Y(n247) );
  OAI2BB1XL U431 ( .A0N(n307), .A1N(inf_W_DATA[59]), .B0(n246), .Y(n160) );
  NAND2XL U432 ( .A(inf_C_data_w[35]), .B(n305), .Y(n246) );
  OAI2BB1XL U433 ( .A0N(n307), .A1N(inf_W_DATA[60]), .B0(n245), .Y(n161) );
  NAND2XL U434 ( .A(inf_C_data_w[36]), .B(n305), .Y(n245) );
  OAI2BB1XL U435 ( .A0N(n307), .A1N(inf_W_DATA[61]), .B0(n244), .Y(n162) );
  NAND2XL U436 ( .A(inf_C_data_w[37]), .B(n305), .Y(n244) );
  OAI2BB1XL U437 ( .A0N(n307), .A1N(inf_W_DATA[62]), .B0(n243), .Y(n163) );
  NAND2XL U438 ( .A(inf_C_data_w[38]), .B(n305), .Y(n243) );
  OAI2BB1XL U439 ( .A0N(n240), .A1N(inf_AW_ADDR[4]), .B0(n238), .Y(n166) );
  NAND2XL U440 ( .A(inf_C_addr[1]), .B(n305), .Y(n238) );
  OAI2BB1XL U441 ( .A0N(n240), .A1N(inf_AW_ADDR[5]), .B0(n237), .Y(n167) );
  NAND2XL U442 ( .A(inf_C_addr[2]), .B(n305), .Y(n237) );
  OAI2BB1XL U443 ( .A0N(n240), .A1N(inf_AW_ADDR[6]), .B0(n236), .Y(n168) );
  NAND2XL U444 ( .A(inf_C_addr[3]), .B(n305), .Y(n236) );
  OAI2BB1XL U445 ( .A0N(n240), .A1N(inf_AW_ADDR[7]), .B0(n235), .Y(n169) );
  NAND2XL U446 ( .A(inf_C_addr[4]), .B(n305), .Y(n235) );
  OAI2BB1XL U447 ( .A0N(n240), .A1N(inf_AW_ADDR[8]), .B0(n234), .Y(n170) );
  NAND2XL U448 ( .A(inf_C_addr[5]), .B(n305), .Y(n234) );
  OAI2BB1XL U449 ( .A0N(n240), .A1N(inf_AW_ADDR[9]), .B0(n233), .Y(n171) );
  NAND2XL U450 ( .A(inf_C_addr[6]), .B(n305), .Y(n233) );
  OAI2BB1XL U451 ( .A0N(n240), .A1N(inf_AW_ADDR[10]), .B0(n232), .Y(n172) );
  NAND2XL U452 ( .A(inf_C_addr[7]), .B(n305), .Y(n232) );
  OAI2BB1XL U453 ( .A0N(n231), .A1N(inf_AR_ADDR[4]), .B0(n228), .Y(n174) );
  OAI2BB1XL U454 ( .A0N(n231), .A1N(inf_AR_ADDR[5]), .B0(n227), .Y(n175) );
  OAI2BB1XL U455 ( .A0N(n231), .A1N(inf_AR_ADDR[6]), .B0(n226), .Y(n176) );
  OAI2BB1XL U456 ( .A0N(n231), .A1N(inf_AR_ADDR[7]), .B0(n225), .Y(n177) );
  OAI2BB1XL U457 ( .A0N(n231), .A1N(inf_AR_ADDR[8]), .B0(n224), .Y(n178) );
  OAI2BB1XL U458 ( .A0N(n231), .A1N(inf_AR_ADDR[9]), .B0(n223), .Y(n179) );
  OAI2BB1XL U459 ( .A0N(n231), .A1N(inf_AR_ADDR[10]), .B0(n222), .Y(n180) );
  AND2XL U460 ( .A(n220), .B(inf_R_DATA[24]), .Y(N25) );
  AND2XL U461 ( .A(n220), .B(inf_R_DATA[25]), .Y(N26) );
  AND2XL U462 ( .A(n220), .B(inf_R_DATA[26]), .Y(N27) );
  AND2XL U463 ( .A(n220), .B(inf_R_DATA[27]), .Y(N28) );
  AND2XL U464 ( .A(n220), .B(inf_R_DATA[28]), .Y(N29) );
  AND2XL U465 ( .A(n220), .B(inf_R_DATA[29]), .Y(N30) );
  AND2XL U466 ( .A(n220), .B(inf_R_DATA[30]), .Y(N31) );
  AND2XL U467 ( .A(n220), .B(inf_R_DATA[16]), .Y(N33) );
  AND2XL U468 ( .A(n220), .B(inf_R_DATA[17]), .Y(N34) );
  AND2XL U469 ( .A(n220), .B(inf_R_DATA[18]), .Y(N35) );
  AND2XL U470 ( .A(n220), .B(inf_R_DATA[19]), .Y(N36) );
  AND2XL U471 ( .A(n220), .B(inf_R_DATA[20]), .Y(N37) );
  AND2XL U472 ( .A(n220), .B(inf_R_DATA[21]), .Y(N38) );
  AND2XL U473 ( .A(n220), .B(inf_R_DATA[22]), .Y(N39) );
  AND2XL U474 ( .A(n220), .B(inf_R_DATA[23]), .Y(N40) );
  AND2XL U475 ( .A(n220), .B(inf_R_DATA[8]), .Y(N41) );
  AND2XL U476 ( .A(n220), .B(inf_R_DATA[9]), .Y(N42) );
  AND2XL U477 ( .A(n220), .B(inf_R_DATA[10]), .Y(N43) );
  AND2XL U478 ( .A(n220), .B(inf_R_DATA[11]), .Y(N44) );
  AND2XL U479 ( .A(n220), .B(inf_R_DATA[12]), .Y(N45) );
  AND2XL U480 ( .A(n220), .B(inf_R_DATA[13]), .Y(N46) );
  AND2XL U481 ( .A(n220), .B(inf_R_DATA[15]), .Y(N48) );
  AND2XL U482 ( .A(n220), .B(inf_R_DATA[0]), .Y(N49) );
  AND2XL U483 ( .A(n220), .B(inf_R_DATA[1]), .Y(N50) );
  AND2XL U484 ( .A(n220), .B(inf_R_DATA[2]), .Y(N51) );
  AND2XL U485 ( .A(n220), .B(inf_R_DATA[3]), .Y(N52) );
  AND2XL U486 ( .A(n220), .B(inf_R_DATA[4]), .Y(N53) );
  AND2XL U487 ( .A(n220), .B(inf_R_DATA[5]), .Y(N54) );
  AND2XL U488 ( .A(n220), .B(inf_R_DATA[6]), .Y(N55) );
  AND2XL U489 ( .A(n220), .B(inf_R_DATA[7]), .Y(N56) );
  AND2XL U490 ( .A(n220), .B(inf_R_DATA[56]), .Y(N57) );
  AND2XL U491 ( .A(n220), .B(inf_R_DATA[57]), .Y(N58) );
  AND2XL U492 ( .A(n220), .B(inf_R_DATA[58]), .Y(N59) );
  AND2XL U493 ( .A(n220), .B(inf_R_DATA[59]), .Y(N60) );
  AND2XL U494 ( .A(n220), .B(inf_R_DATA[60]), .Y(N61) );
  AND2XL U495 ( .A(n220), .B(inf_R_DATA[62]), .Y(N63) );
  AND2XL U496 ( .A(n220), .B(inf_R_DATA[63]), .Y(N64) );
  AND2XL U497 ( .A(n220), .B(inf_R_DATA[48]), .Y(N65) );
  AND2XL U498 ( .A(n220), .B(inf_R_DATA[49]), .Y(N66) );
  AND2XL U499 ( .A(n220), .B(inf_R_DATA[50]), .Y(N67) );
  AND2XL U500 ( .A(n220), .B(inf_R_DATA[51]), .Y(N68) );
  AND2XL U501 ( .A(n220), .B(inf_R_DATA[52]), .Y(N69) );
  AND2XL U502 ( .A(n220), .B(inf_R_DATA[53]), .Y(N70) );
  AND2XL U503 ( .A(n220), .B(inf_R_DATA[54]), .Y(N71) );
  AND2XL U504 ( .A(n220), .B(inf_R_DATA[55]), .Y(N72) );
  AND2XL U505 ( .A(n220), .B(inf_R_DATA[40]), .Y(N73) );
  AND2XL U506 ( .A(n220), .B(inf_R_DATA[41]), .Y(N74) );
  AND2XL U507 ( .A(n220), .B(inf_R_DATA[42]), .Y(N75) );
  AND2XL U508 ( .A(n220), .B(inf_R_DATA[43]), .Y(N76) );
  AND2XL U509 ( .A(n220), .B(inf_R_DATA[45]), .Y(N78) );
  AND2XL U510 ( .A(n220), .B(inf_R_DATA[46]), .Y(N79) );
  AND2XL U511 ( .A(n220), .B(inf_R_DATA[47]), .Y(N80) );
  AND2XL U512 ( .A(n220), .B(inf_R_DATA[32]), .Y(N81) );
  AND2XL U513 ( .A(n220), .B(inf_R_DATA[33]), .Y(N82) );
  AND2XL U514 ( .A(n220), .B(inf_R_DATA[34]), .Y(N83) );
  AND2XL U515 ( .A(n220), .B(inf_R_DATA[35]), .Y(N84) );
  AND2XL U516 ( .A(n220), .B(inf_R_DATA[36]), .Y(N85) );
  AND2XL U517 ( .A(n220), .B(inf_R_DATA[37]), .Y(N86) );
  AND2XL U518 ( .A(n220), .B(inf_R_DATA[38]), .Y(N87) );
  AND2XL U519 ( .A(n220), .B(inf_R_DATA[39]), .Y(N88) );
  AOI22XL U520 ( .A0(curr_state[0]), .A1(n215), .B0(n214), .B1(n241), .Y(
        next_state[1]) );
  OR2XL U521 ( .A(n217), .B(curr_state[1]), .Y(n215) );
  AOI22XL U522 ( .A0(n214), .A1(n221), .B0(curr_state[1]), .B1(n213), .Y(
        next_state[0]) );
  INVXL U523 ( .A(n221), .Y(n229) );
  BUFXL U524 ( .A(inf_AW_VALID), .Y(inf_AW_ADDR[16]) );
  BUFXL U525 ( .A(inf_AR_VALID), .Y(inf_AR_ADDR[16]) );
  NAND2XL U526 ( .A(inf_C_addr[7]), .B(n229), .Y(n222) );
  NAND2XL U527 ( .A(inf_C_addr[6]), .B(n229), .Y(n223) );
  NAND2XL U528 ( .A(inf_C_addr[5]), .B(n229), .Y(n224) );
  NAND2XL U529 ( .A(inf_C_addr[4]), .B(n229), .Y(n225) );
  NAND2XL U530 ( .A(inf_C_addr[3]), .B(n229), .Y(n226) );
  NAND2XL U531 ( .A(inf_C_addr[2]), .B(n229), .Y(n227) );
  NAND2XL U532 ( .A(inf_C_addr[1]), .B(n229), .Y(n228) );
  NAND2XL U533 ( .A(inf_C_addr[0]), .B(n229), .Y(n230) );
  NAND2XL U534 ( .A(n307), .B(inf_W_DATA[63]), .Y(n242) );
endmodule

