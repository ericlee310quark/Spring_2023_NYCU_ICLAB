//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : EC_TOP.v
//   	Module Name : EC_TOP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

//synopsys translate_off
`include "INV_IP.v"
//synopsys translate_on

module EC_TOP(
    // Input signals
    clk, rst_n, in_valid,
    in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a,
    // Output signals
    out_valid, out_Rx, out_Ry
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
input clk, rst_n, in_valid;
input [6-1:0] in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a;
output reg out_valid;
output reg [6-1:0] out_Rx, out_Ry;
// ===============================================================
// Parameters
// ===============================================================
parameter IDLE = 'd0,
          ADD = 'd1,
          DOUBLE = 'd2,
          FIND_XR = 'd3,
          OUTPUT = 'd4;
// ===============================================================
// Wires & Regs
// ===============================================================
wire [18:0] mult1_comb;
reg [18:0] mu1a, mu1b;

reg [18:0] mod_1;
wire [5:0] mod_comb;
reg [5:0] mod_2;

wire  [6:0]  add_comb1;
reg [6:0] add_1a, add_1b;
wire [6:0]  sub_comb1;
reg [6:0] sub_1a, sub_1b;
//wire signed [7:0]  sub_comb2, sub_2a, sub_2b;

wire [5:0] add_x_diff, add_y_diff;
wire [5:0] sel_xp_xq;
wire [5:0] sel_4;
wire [5:0] sel_xr;
wire [5:0] sel_y;

wire [5:0] IP_prime, IP_out;
reg [5:0] IP_input;
reg [5:0] a_comb;
reg [5:0] x_p, x_q, y_p, y_q,  prime_reg;
reg [5:0] a_reg;
reg [18:0] temp0;
reg [18:0] temp0_comb;
reg [6:0] temp1;//, temp2;
reg [6:0] temp1_comb;//, temp2_comb;


reg [2:0] cnt_comb;
reg [2:0] cnt;

reg [2:0] current_state, next_state;
wire process_type;

//================================
//  OUTPUT CTR
//================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                  out_valid <= 'b0;
    else if(next_state==OUTPUT) out_valid <= 'd1;
    else                        out_valid <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                  out_Rx <= 'b0;
    else if(next_state==OUTPUT) out_Rx <= temp1;
    else                        out_Rx <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                  out_Ry <= 'b0;
    else if(next_state==OUTPUT) out_Ry <= sel_y;//mod_comb[5:0];
    else                        out_Ry <= 'b0;
end
//================================
//  FSM
//================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  current_state <= IDLE;
    else        current_state <= next_state;
end

assign process_type = (in_Px==in_Qx)&&(in_Py==in_Qy);
always@(*)begin
    case(current_state)
        IDLE:   if(~in_valid)           next_state = IDLE;
                else if(process_type)   next_state = DOUBLE;
                else                    next_state = ADD;
        DOUBLE: if(cnt>'d4)             next_state = FIND_XR;
                else                    next_state = DOUBLE;
        ADD:    if(cnt>'d2)             next_state = FIND_XR;
                else                    next_state = ADD;
        FIND_XR: if(cnt>'d4)            next_state = OUTPUT;
                else                    next_state = FIND_XR;
        //FIND_YR:    next_state = OUTPUT;
        OUTPUT:     next_state = IDLE;
        default:    next_state = IDLE;
    endcase
end
//================================
//  Counter
//================================
always@(*)begin
    case(current_state)
        IDLE:       cnt_comb = 'd0;
        ADD:        cnt_comb = (cnt>'d2)?'d0:cnt+'d1;
        DOUBLE:     cnt_comb = (cnt>'d4)?'d0:cnt+'d1;
        FIND_XR: cnt_comb = (cnt>'d4)?'d0:cnt+'d1;
        OUTPUT:     cnt_comb ='d0;
        default:    cnt_comb = 'd0;
    endcase
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  cnt <= 'b0;
    else        cnt <= cnt_comb;
end
//================================
//  INPUT REGs
//================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          x_p <= 'b0;
    else if(in_valid)   x_p <= in_Px;
    else                x_p <= x_p;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          x_q <= 'b0;
    else if(in_valid)   x_q <= in_Qx;
    else                x_q <= x_q;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          y_p <= 'b0;
    else if(in_valid)   y_p <= in_Py;
    else                y_p <= y_p;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          y_q <= 'b0;
    else if(in_valid)   y_q <= in_Qy;
    else                y_q <= y_q;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          prime_reg <= 'b0;
    else if(in_valid)   prime_reg <= in_prime;
    else                prime_reg <= prime_reg;
end
//a_ctr
always@(*)begin
    if(in_valid)                                    a_comb = in_a;
    else if((current_state==DOUBLE))
        if(cnt=='d2)    a_comb = IP_out;
        else if(cnt=='d5)   a_comb = mod_comb;
        else        a_comb = a_reg;
    else if((current_state==ADD)&&(cnt>'d2))        a_comb = mod_comb;
    else                                            a_comb = a_reg;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)          a_reg <= 'b0;
    else                a_reg <= a_comb;
end
//================================
//  REGs
//================================
//temp0
always@(*)begin
    if(current_state==DOUBLE)begin
        if(cnt=='d2) temp0_comb = add_comb1;
        else        temp0_comb = mult1_comb;
    end
    else if(current_state==ADD)begin
        case(cnt)
            3'd0:   temp0_comb = add_x_diff;
            3'd1:   temp0_comb = add_y_diff;
            3'd2:   temp0_comb = mult1_comb;
            default:    temp0_comb = 'b0;
        endcase
    end
    else if(current_state==FIND_XR)begin
        case(cnt)
            3'd0:   temp0_comb = mult1_comb;
            3'd1:   temp0_comb = mod_comb;
            3'd2:   temp0_comb = add_comb1;
            3'd3:   temp0_comb = sel_4;
            3'd4:   temp0_comb = mult1_comb;
            default:    temp0_comb = temp0;
        endcase
    end
    else temp0_comb = 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)      temp0 <= 'b0;
    else            temp0 <= temp0_comb;
end
//temp1
always@(*)begin
    if(current_state==DOUBLE)begin
       if(cnt=='d3) temp1_comb = IP_out;
       else if(cnt=='d5)    temp1_comb = sel_xp_xq;
       else         temp1_comb = temp1;
    end
    else if(current_state==ADD)begin
        case(cnt)
            //2'd0:   temp1_comb = sub_comb2;
            3'd1:   temp1_comb = IP_out;
            3'd3:   temp1_comb = sel_xp_xq;
            default:    temp1_comb = 'b0;
        endcase

    end
    else if(current_state==FIND_XR)begin
        if(cnt=='d3)    temp1_comb = mod_comb;
        else            temp1_comb  = temp1;
    end
    else temp1_comb = 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)      temp1 <= 'b0;
    else            temp1 <= temp1_comb;
end

assign add_x_diff = (x_q>=x_p)?sub_comb1:add_comb1;
assign add_y_diff = (y_q>=y_p)?sub_comb1:add_comb1;
assign sel_xp_xq = (add_comb1>=prime_reg)?sub_comb1:add_comb1;
assign sel_4 = (x_p>=mod_comb)?sub_comb1:add_comb1;
//assign sel_xr = (temp0>=temp1)?sub_comb1:add_comb1;
assign sel_y = (mod_comb>=y_p)?sub_comb1:add_comb1;
//================================
//  OP regs CTR
//================================
//mu1a
always@(*)begin
    if(current_state==DOUBLE)begin
        if(cnt=='d0)    mu1a = 'd3;
        else            mu1a = temp0;//temp0[5:0];
    end
    else if((current_state==ADD)&&(cnt>'d1))begin
        mu1a = temp0;
    end
    else if(current_state==FIND_XR)begin
        mu1a = a_reg;
    end
    else mu1a = 'b0;
end
//mu1b
always@(*)begin
    if(current_state==DOUBLE)begin
        case(cnt)
            3'd0, 3'd1: mu1b = x_p;
            3'd3:       mu1b = a_reg;
            3'd4:       mu1b = temp1;
            default:    mu1b = 'd0;
        endcase
    end
    else if((current_state==ADD)&&(cnt>'d1))begin
        mu1b = temp1;
    end
    else if(current_state==FIND_XR)begin
        if(cnt=='d0)    mu1b = a_reg;
        else            mu1b = temp0;
    end
    else mu1b = 'b0;
end
//mod_1
always@(*)begin
    mod_1 = temp0;
    /*
    if(current_state==DOUBLE)begin
        //if(cnt=='d1)    mod_1 = add_comb1;
        //else            mod_1 = mult1_comb;
        mod_1 = temp0;
    end
    else if((current_state==ADD)&&(cnt>'d1))begin
        mod_1 = mult1_comb;
    end
    else if(current_state==FIND_XR)begin
        if(cnt=='d0)  mod_1 = mult1_comb;
        else if(cnt=='d1)       mod_1 = sel_xr;
        else                    mod_1 = temp0;
    end
    else mod_1 = sub_comb1;
    */
end
//add_1a
always@(*)begin
    if(current_state==DOUBLE)begin
        if(cnt=='d2)    add_1a = mod_comb;
        else            add_1a = x_p;
    end
    else if(current_state==ADD)begin
        if(cnt[1])  add_1a = x_p;
        else        add_1a = sub_comb1;  
    end
    else if(current_state==FIND_XR)begin
        add_1a = sub_comb1;
    end
    else add_1a = 'b0;
end
//add_1b
always@(*)begin
    if(current_state==DOUBLE)begin
        if(cnt=='d2)  add_1b = a_reg ;
        else          add_1b = x_q;
    end
    else if(current_state==ADD)begin
        if(cnt=='d3)  add_1b = x_q;
        else        add_1b = prime_reg;
    end
    else if(current_state==FIND_XR)begin
        add_1b = prime_reg;
    end
    else add_1b = 'b0;
end
//sub_1a
always@(*)begin
    if(current_state==DOUBLE)begin
        sub_1a = add_comb1;
    end
    else if(current_state==ADD)begin
        case(cnt)
            3'd0:   sub_1a = x_q;
            3'd1:   sub_1a = y_q;
            3'd3:   sub_1a = add_comb1;
            default sub_1a = 'd0;
        endcase
    end
    else if(current_state==FIND_XR)begin
        if(cnt=='d2)  sub_1a = temp0;
        else if(cnt=='d3)        sub_1a = x_p;//{2'b0,temp0[5:0]};
        else    sub_1a = mod_comb;
    end
    else sub_1a = temp0;
end
//sub_1b
always@(*)begin
    if(current_state==DOUBLE)begin
        sub_1b = prime_reg;
    end
    else if(current_state==ADD)begin
        case(cnt)
            3'd0:   sub_1b = x_p;
            3'd1:   sub_1b = y_p;
            3'd3:   sub_1b = prime_reg;
            default sub_1b = 'd0;
        endcase
    end
    else if(current_state==FIND_XR)begin
        if(cnt=='d2)        sub_1b = temp1;
        else if(cnt == 'd3) sub_1b = mod_comb;
        else                sub_1b = y_p;
    end
    else sub_1b = y_p;
end
//IP_prime
assign IP_prime = prime_reg;
//IP_input
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)   IP_input <= 'b0;
    else if(in_valid)   IP_input <= in_Py;
    else if(cnt == 'b0) IP_input <= add_x_diff;
    else if(cnt == 'b1) IP_input <= y_p;
    else if(cnt =='d2) IP_input <= 'd2;
    else        IP_input <= IP_input;
end

assign mult1_comb = mu1a * mu1b;

assign mod_comb = mod_1 % prime_reg;//mod_2;

assign add_comb1 = add_1a + add_1b;
assign sub_comb1 = sub_1a - sub_1b;



INV_IP #(.IP_WIDTH(6)) I_INV_IP ( .IN_1(IP_prime), .IN_2(IP_input), .OUT_INV(IP_out));

endmodule

