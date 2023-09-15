//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : INV_IP.v
//   	Module Name : INV_IP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module INV_IP #(parameter IP_WIDTH = 6) (
    // Input signals
    IN_1, IN_2,
    // Output signals
    OUT_INV
);

// ===============================================================
// Declaration
// ===============================================================

input  [IP_WIDTH-1:0] IN_1, IN_2;
output [IP_WIDTH-1:0] OUT_INV;

parameter ARCH_TYPE = 0;    //0: 2to1MUX, 1: ORI
//5-bit
//5937
//32.33
//6-bit
//11492.712238  ||  
//51.71         ||  
//7-bit
//34122.211830
//59.99


//multi-bit MUX vs 2to1MUX
//5-bit in 30ns    
//7733          ||     7012.051324
//29.94         ||     29.99
//6-bit in 30ns
//17689.795506  ||   17417.030730
//29.92         ||      30


//2to1MUX
//6-bit in 25ns
//19452.787552
//25

//2to1MUX
//6-bit in 20ns
//22812.451621
//20

//2to1MUX
//6-bit in 20ns
//37328.861135
//11.7



//if 7bits--> 8 results     ||      6bits--> 6 results      ||      5bits--> 5 results
//  Q range                 ||                              ||
//  0:  6bit                ||              5bit            ||              4bit  
//  1:  7bit                ||              6bit            ||              5bit
//  2:  6bit                ||              5bit            ||              4bit
//  3:  6bit                ||              5bit            ||              4bit
//  4:  5bit                ||              5bit            ||              3bit
//  5:  4bit                ||              4bit            ||
//  6:  3bit
//  7:  3bit
//  R range------------------------------------------------------------------
//  0:  6bit                ||              5bit            ||              4bit
//  1:  6bit                ||              5bit            ||              4bit
//  2:  5bit                ||              4bit            ||              3bit
//  3:  4bit                ||              3bit            ||              2bit
//  4:  3bit                ||              2bit            ||
//  5:  3bit
//  6:  2bit
//  B_temp_result--------------------------------------------------------------
//  0:  7s                  ||              6s              ||              5s
//  1:  6b                  ||              5b              ||              4b
//  2:  7s                  ||              6s              ||              5s
//  3:  6b                  ||              5b              ||              4b
//  4:  7s                  ||              6s              ||              5s
//  5:  6b                  ||              5b              ||
//  6:  7s
//  7:  6b
//Area---------------------------------------------------------------------------
//
//Time---------------------------------------------------------------------------
//

// ===============================================================
// Design
// ===============================================================      

generate
if(IP_WIDTH==5)begin
    wire [3:0] B_q0, B_q2, B_q3;
    wire [4:0] B_q1;
    wire [2:0] B_q4;

    wire [3:0] B_r0, B_r1;
    wire [2:0] B_r2;
    wire [1:0] B_r3;
    wire [3:0] temp_ans [4:0];

    wire [4:0] B0, S0, B1;
    wire [3:0] S1,B2,S2,B3;
    wire [2:0] S3,B4;
    wire [1:0] S4;

    wire condition[4:0];
    wire [4:0] condition_v2;
    reg [3:0] pre_result;

    wire [4:0] sub_comb;

    //layer 0
    assign B0 = (IN_1>IN_2)? IN_1 : IN_2;
    assign S0 = (IN_1>IN_2)? IN_2 : IN_1;
    assign B_q0 = B0/S0;
    assign B_r0 = B0%S0;
    assign temp_ans[0] = B_q0;
    //layer 1
    assign B1 = S0;
    assign B_q1 = B1/S1;
    assign B_r1 = B1%S1;
    assign temp_ans[1] = temp_ans[0] * B_q1 + 'd1;
    //layer 2
    assign B2 = S1;
    assign B_q2 = B2/S2;
    assign B_r2 = B2%S2;
    assign temp_ans[2] = temp_ans[1]*B_q2 + temp_ans[0];
    //layer 3
    assign B3 = S2;
    assign B_q3 = B3/S3;
    assign B_r3 = B3%S3;
    assign temp_ans[3] = temp_ans[2]*B_q3 + temp_ans[1];
    //layer 4
    assign B4 = S3;
    assign B_q4 = B4/S4;
    assign temp_ans[4] = temp_ans[3]*B_q4 +temp_ans[2];

    assign condition[0] = (S0=='d1);
    assign condition[1] = (B_r0=='d1);
    assign condition[2] = (B_r1=='d1);
    assign condition[3] = (B_r2=='d1);
    assign condition[4] = (B_r3=='d1);
    assign condition_v2 = {condition[0],condition[1],condition[2],condition[3],condition[4]};

    assign sub_comb = B0 - pre_result;

    if(ARCH_TYPE)begin
        assign S1 = (B_r0==0)?'d1: B_r0;
        assign S2 = (B_r1==0)?'d1: B_r1;
        assign S3 = (B_r2==0)?'d1:B_r2;
        assign S4 = (B_r3==0)?'d1:B_r3;
        always@(*)begin
            /*
            casex(condition_v2)
            5'b1xxxx:   pre_result = 'd1;
            5'b01xxx:   pre_result = temp_ans[0];
            5'b001xx:   pre_result = temp_ans[1];
            5'b0001x:   pre_result = temp_ans[2];
            5'b00001:   pre_result = temp_ans[3];
            5'b00000:   pre_result = temp_ans[4];
            default:    pre_result = temp_ans[4];
            endcase
            */
            case(condition_v2)
                5'b10000:   pre_result = 'd1;
                5'b01000:   pre_result = temp_ans[0];
                5'b00100:   pre_result = temp_ans[1];
                5'b00010:   pre_result = temp_ans[2];
                5'b00001:   pre_result = temp_ans[3];
                5'b00000:   pre_result = temp_ans[4];
                default:    pre_result = temp_ans[4];
            endcase
        end
        assign OUT_INV = ((condition[1])|(condition[3])|(condition_v2=='d0))? sub_comb:pre_result;
    end
    else begin
        assign S1 = B_r0;//(B_r0==0)?'d1: B_r0;
        assign S2 = B_r1;//(B_r1==0)?'d1: B_r1;
        assign S3 = B_r2;//(B_r2==0)?'d1:B_r2;
        assign S4 = B_r3;//(B_r3==0)?'d1:B_r3;
        always@(*)begin
                if(condition[0]) pre_result = 'd1;
                else begin
                    if(condition[1]) pre_result = temp_ans[0];
                    else begin
                        if(condition[2]) pre_result = temp_ans[1];
                        else begin
                            if(condition[3]) pre_result = temp_ans[2];
                            else begin
                                if(condition[4]) pre_result = temp_ans[3];
                                else                pre_result = temp_ans[4];
                            end
                        end
                    end
                end
            end
        assign OUT_INV = (condition[0])? pre_result:(condition[1])?sub_comb:(condition[2])?pre_result:(condition[3])?sub_comb:(condition[4])?pre_result:sub_comb;
    end




    
end
else if(IP_WIDTH==7)begin

    wire [5:0] B_q0, B_q2, B_q3;
    wire [6:0] B_q1;
    wire [4:0] B_q4;
    wire [3:0] B_q5;
    wire [2:0] B_q6, B_q7;

    wire [5:0] B_r0, B_r1;
    wire [4:0] B_r2;
    wire [3:0] B_r3;
    wire [2:0] B_r4, B_r5;
    wire [1:0] B_r6;

    wire [5:0] temp_ans [7:0];

    wire [6:0] B0, S0, B1;
    wire [5:0] S1,B2,S2,B3;
    wire [4:0] S3,B4;
    wire [3:0] S4,B5;
    wire [2:0] S5,B6,S6,B7;
    wire [1:0] S7;

    wire condition[7:0];
    wire [7:0] condition_v2;
    reg [5:0] pre_result;

    wire [6:0] sub_comb;


    //layer 0
    assign B0 = (IN_1>IN_2)? IN_1 : IN_2;
    assign S0 = (IN_1>IN_2)? IN_2 : IN_1;
    assign B_q0 = B0/S0;
    assign B_r0 = B0%S0;
    assign temp_ans[0] = B_q0;
    //layer 1
    assign B1 = S0;
    assign S1 =(B_r0==0)?'d1: B_r0;
    assign B_q1 = B1/S1;
    assign B_r1 = B1%S1;
    assign temp_ans[1] = temp_ans[0] * B_q1 + 'd1;
    //layer 2
    assign B2 = S1;
    assign S2 = (B_r1=='d0)?'d1: B_r1;
    assign B_q2 = B2/S2;
    assign B_r2 = B2%S2;
    assign temp_ans[2] = temp_ans[1]*B_q2 + temp_ans[0];
    //layer 3
    assign B3 = S2;
    assign S3 = (B_r2=='d0)?'d1:B_r2;
    assign B_q3 = B3/S3;
    assign B_r3 = B3%S3;
    assign temp_ans[3] = temp_ans[2]*B_q3 + temp_ans[1];
    //layer 4
    assign B4 = S3;
    assign S4 = (B_r3=='d0)?'d1:B_r3;
    assign B_q4 = B4/S4;
    assign B_r4 = B4%S4;
    assign temp_ans[4] = temp_ans[3]*B_q4 +temp_ans[2];
    //layer 5
    assign B5 = S4;
    assign S5 = (B_r4=='d0)?'d1:B_r4;
    assign B_q5 = B5/S5;
    assign B_r5 = B5%S5;
    assign temp_ans[5] = temp_ans[4]*B_q5 +temp_ans[3];
    //layer 6
    assign B6 = S5;
    assign S6 = (B_r5=='d0)?'d1:B_r5;
    assign B_q6 = B6/S6;
    assign B_r6 = B6%S6;
    assign temp_ans[6] = temp_ans[5]*B_q6 +temp_ans[4];
    //layer 7
    assign B7 = S6;
    assign S7 = (B_r6=='d0)?'d1:B_r6;
    assign B_q7 = B7/S7;
    assign temp_ans[7] = temp_ans[6]*B_q7 +temp_ans[5];





    assign condition[0] = (S0=='d1);
    assign condition[1] = (B_r0=='d1);
    assign condition[2] = (B_r1=='d1);
    assign condition[3] = (B_r2=='d1);
    assign condition[4] = (B_r3=='d1);
    assign condition[5] = (B_r4=='d1);
    assign condition[6] = (B_r5=='d1);
    assign condition[7] = (B_r6=='d1);
    assign condition_v2 = {condition[0],condition[1],condition[2],condition[3],condition[4],condition[5],condition[6],condition[7]};
    always@(*)begin
        /*
        casex(condition_v2)
        5'b1xxxx:   pre_result = 'd1;
        5'b01xxx:   pre_result = temp_ans[0];
        5'b001xx:   pre_result = temp_ans[1];
        5'b0001x:   pre_result = temp_ans[2];
        5'b00001:   pre_result = temp_ans[3];
        5'b00000:   pre_result = temp_ans[4];
        default:    pre_result = temp_ans[4];
        endcase
        */
        case(condition_v2)
        8'b10000000:   pre_result = 'd1;
        8'b01000000:   pre_result = temp_ans[0];
        8'b00100000:   pre_result = temp_ans[1];
        8'b00010000:   pre_result = temp_ans[2];
        8'b00001000:   pre_result = temp_ans[3];
        8'b00000100:   pre_result = temp_ans[4];
        8'b00000010:   pre_result = temp_ans[5];
        8'b00000001:   pre_result = temp_ans[6];
        8'b00000000:   pre_result = temp_ans[7];
        
        default:    pre_result = temp_ans[7];
        endcase
        
    end

    assign sub_comb = B0 - pre_result;
    assign OUT_INV = ((condition[1])|(condition[3])|(condition[5])|(condition[7]))? sub_comb:pre_result;




end
else begin
// HERE is for 6-bit version
    wire [4:0] B_q0, B_q2, B_q3, B_q4;
    wire [5:0] B_q1;
    wire [3:0] B_q5;

    wire [4:0] B_r0, B_r1;
    wire [3:0] B_r2;
    wire [2:0] B_r3;
    wire [1:0] B_r4;
    wire [4:0] temp_ans [5:0];

    wire [5:0] B0, S0, B1;
    wire [4:0] S1,B2,S2,B3;
    wire [3:0] S3,B4;
    wire [2:0] S4,B5;
    wire [1:0] S5;

    wire condition[5:0];
    wire [5:0] condition_v2;
    reg [4:0] pre_result;

    wire [5:0] sub_comb;

    //layer 0
    assign B0 = (IN_1>IN_2)? IN_1 : IN_2;
    assign S0 = (IN_1>IN_2)? IN_2 : IN_1;
    assign B_q0 = B0/S0;
    assign B_r0 = B0%S0;
    assign temp_ans[0] = B_q0;
    //layer 1
    assign B1 = S0;
    
    assign B_q1 = B1/S1;
    assign B_r1 = B1%S1;
    assign temp_ans[1] = temp_ans[0] * B_q1 + 'd1;
    //layer 2
    assign B2 = S1;
    
    assign B_q2 = B2/S2;
    assign B_r2 = B2%S2;
    assign temp_ans[2] = temp_ans[1]*B_q2 + temp_ans[0];
    //layer 3
    assign B3 = S2;
    
    assign B_q3 = B3/S3;
    assign B_r3 = B3%S3;
    assign temp_ans[3] = temp_ans[2]*B_q3 + temp_ans[1];
    //layer 4
    assign B4 = S3;

    assign B_q4 = B4/S4;
    assign B_r4 = B4%S4;
    assign temp_ans[4] = temp_ans[3]*B_q4 +temp_ans[2];
    //layer 5
    assign B5 = S4;

    assign B_q5 = B5/S5;
    assign temp_ans[5] = temp_ans[4]*B_q5 +temp_ans[3];

    assign condition[0] = (S0=='d1);
    assign condition[1] = (B_r0=='d1);
    assign condition[2] = (B_r1=='d1);
    assign condition[3] = (B_r2=='d1);
    assign condition[4] = (B_r3=='d1);
    assign condition[5] = (B_r4=='d1);
    assign sub_comb = B0 - pre_result;
    if(ARCH_TYPE)begin
        assign S1 =(B_r0==0)?'d1: B_r0;
        assign S2 = (B_r1=='d0)?'d1: B_r1;
        assign S3 = (B_r2=='d0)?'d1:B_r2;
        assign S4 = (B_r3=='d0)?'d1:B_r3;
        assign S5 = (B_r4=='d0)?'d1:B_r4;
        assign condition_v2 = {condition[0],condition[1],condition[2],condition[3],condition[4],condition[5]};
        always@(*)begin
            /*
            casex(condition_v2)
            5'b1xxxx:   pre_result = 'd1;
            5'b01xxx:   pre_result = temp_ans[0];
            5'b001xx:   pre_result = temp_ans[1];
            5'b0001x:   pre_result = temp_ans[2];
            5'b00001:   pre_result = temp_ans[3];
            5'b00000:   pre_result = temp_ans[4];
            default:    pre_result = temp_ans[4];
            endcase
            */
            case(condition_v2)
                6'b100000:   pre_result = 'd1;
                6'b010000:   pre_result = temp_ans[0];
                6'b001000:   pre_result = temp_ans[1];
                6'b000100:   pre_result = temp_ans[2];
                6'b000010:   pre_result = temp_ans[3];
                6'b000001:   pre_result = temp_ans[4];
                6'b000000:   pre_result = temp_ans[5];
                default:    pre_result = temp_ans[5];
            endcase
        end

        assign OUT_INV = ((condition[1])|(condition[3])|(condition[5]))? sub_comb:pre_result;
    


    end
    else begin
        assign S1 = B_r0;
        assign S2 = B_r1;
        assign S3 = B_r2;
        assign S4 = B_r3;
        assign S5 = B_r4;
        always@(*)begin
                if(condition[0])    pre_result = 'd1;
                else begin
                    if(condition[1])    pre_result = temp_ans[0];
                    else begin
                        if(condition[2])    pre_result = temp_ans[1];
                        else begin
                            if(condition[3])    pre_result = temp_ans[2];
                            else begin
                                if(condition[4])    pre_result = temp_ans[3];
                                else begin
                                    if(condition[5])    pre_result = temp_ans[4];
                                    else                pre_result = temp_ans[5];
                                end
                            end
                        end
                    end
                end
            end
        assign OUT_INV = (condition[0])? pre_result:(condition[1])?sub_comb:(condition[2])?pre_result:(condition[3])?sub_comb:(condition[4])?pre_result:(condition[5])?sub_comb:pre_result;

    end




end
endgenerate



















/*
//Layer0
assign B_num[0] = (IN1>IN2)? IN1:IN2;
assign S_num[0] = (IN1>IN2)? IN2:IN1;

genvar i;
generate
for(i=0;i<CELL_NUM;i=i+1)begin:loop_1
    wire [IP_WIDHT-1:0] B_num, S_num;
    wire [IP_WIDHT-1:0] B_d;
    wire [IP_WIDHT-1:0] B_m;
    wire [IP_WIDHT-1:0] result;

    wire minus_flag;
    assign B_d = B_num/S_num;
    assign B_m = B_num%S_num;


    if(i==0)begin
        assign B_num = (IN1>IN2)? IN1:IN2;
        assign S_num = (IN1>IN2)? IN2:IN1;

        assign temp_result[0] = B_d;
        assign minus_flag = (B_m=='d1);
        assign result = {(IP_WIDHT-1){(S_num=='d1)}}&temp_result[0];
    end
    else if(i==1)begin
        assign B_num = loop_1[i-1].S_num;
        assign S_num = loop_1[i-1].B_m;

        assign temp_result[1] = 1 + temp_result[0]*B_d;
        assign result = {(IP_WIDHT-1){(S_num=='d1)}}&temp_result[1]|loop_1[0].result;
    end
    else if(i==CELL_NUM-1)begin
        assign B_num = loop_1[i-1].S_num;
        assign S_num = loop_1[i-1].B_m;
        assign temp_result[1] = 1 + temp_result[0]*B_d;
        assign result = {(IP_WIDHT-1){(S_num=='d1)}}&temp_result[1]|loop_1[0].result;

        
        assign OUT_INV = (loop_1[0].S_num=='d1)?'d1:loop_1[CELL_NUM-1].result;
    end
    else begin
        assign B_num = loop_1[i-1].S_num;
        assign S_num = loop_1[i-1].B_m;
        assign temp_result[i] = temp_result[i-2] + temp_result[i-1]*B_d;
        assign result = {(IP_WIDHT-1){(S_num=='d1)}}&temp_result[i]|loop_1[i-1].result;
    end 
    

    if(((i%2)==0)&&(i>0))begin
        assign minus_flag = (loop_1[i-2].minus_flag)|(B_m==1);
    end
    else begin
        assign minus_flag = 'd0;
    end


end    

endgenerate
*/


endmodule