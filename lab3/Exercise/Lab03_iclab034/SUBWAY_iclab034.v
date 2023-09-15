module SUBWAY(
    //Input Port
    clk,
    rst_n,
    in_valid,
    init,
    in0,
    in1,
    in2,
    in3,
    //Output Port
    out_valid,
    out
);


input clk, rst_n;
input in_valid;
input [1:0] init;
input [1:0] in0, in1, in2, in3; 
output reg       out_valid;
output reg [1:0] out;



//==============================================//
//       parameter & integer declaration        //
//==============================================//
integer i, j;
parameter Left = 2'b10,
        Right = 2'b01,
        Forward = 2'b00,
        Jump = 2'b11;

//==============================================//
//           reg & wire declaration             //
//==============================================//
wire [1:0] in_put [3:0];
reg input_valid_delay;

reg [1:0] input_state_reg [3:0];

reg [6:0] cnt;
wire [1:0] cnt_condition;
wire [6:0] cnt_comb;
reg [1:0] ans [61:0];

reg [1:0] track_use;
wire [1:0] track_l_comb, track_r_comb;
reg [1:0] next_move,  next_move_m;

wire [1:0] next_move_t, next_move_p;


reg [1:0] part_dst, part_dst_router;
wire [1:0] direction_0, direction_1;
wire [1:0]  point1to2, point2to1;//,point0to3, point3to0,;

reg [1:0] temp_6col [1:0];
reg [1:0] next_move_6to9 [2:0];
wire refresh_track_condition;

//==============================================//
//                  design                      //
//==============================================//

//----------------------------------------------//
//          Output ctr                          //
//----------------------------------------------//
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              out_valid <= 'b0;
    else if((&(cnt))) out_valid <= 'b0;
    else if(cnt[6]=='b1)    out_valid <= 'b1;
    else                    out_valid <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              out <= 'b0;
    else if((&(cnt))) out <= 'b0;
    else if(cnt[6]=='b1)    out <= ans[0];
    else                    out <= 'b0;
end
always@(posedge clk)begin
    if(cnt=='d0)  input_valid_delay <= 'd0;
    else        input_valid_delay <= in_valid;
end

//----------------------------------------------//
//          Counter ctr                         //
//----------------------------------------------//
assign cnt_condition ={(in_valid|input_valid_delay), out_valid};
assign  cnt_comb = cnt + 'd1;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              cnt <= 'b0;
    else
        if(cnt_condition[0]^cnt_condition[1])   cnt <= cnt_comb;
        else                                    cnt <= 'b0;
        /*
        case(cnt_condition)
            2'b00,:  cnt <= 'b0;
            2'b01,2'b10:  cnt <= cnt_comb;
            2'b11:  cnt <= cnt;             
            default:    cnt <= cnt;
        endcase
        */
end
//----------------------------------------------//
//          Track trace                         //
//----------------------------------------------//
assign track_l_comb = track_use -'d1;
assign track_r_comb = track_use +'d1;
assign refresh_track_condition =    (cnt=='d11)|(cnt=='d19)|(cnt=='d27)|(cnt=='d35)|(cnt=='d43)|(cnt=='d51)|(cnt=='d59);//(cnt[2:0]==3'b011)&(|(cnt[5:3]));//

always@(posedge clk)begin
if(cnt=='d0)   track_use <= init;
    else if(refresh_track_condition)   track_use <= part_dst;
    else
        case(next_move)
            2'd1:       track_use <= track_r_comb;
            2'd2:       track_use <= track_l_comb;
            2'd0, 2'd3: track_use <= track_use;
            default:    track_use <= track_use;
        endcase
end
//----------------------------------------------//
//          Input Wire                          //
//----------------------------------------------//
assign in_put[0] = in0;
assign in_put[1] = in1;
assign in_put[2] = in2;
assign in_put[3] = in3;
//----------------------------------------------//
//          Input Buffer                        //
//----------------------------------------------//

genvar k;
generate
    for(k=0;k<'d4;k=k+1)begin
        always@(posedge clk or negedge rst_n)begin
            if(~rst_n)  input_state_reg[k] <= 'b0;
            else if(in_valid)
                        input_state_reg[k] <= in_put[k];
            else        input_state_reg[k] <= 'b0;
        end
    end             
endgenerate



//----------------------------------------------//
//          Partial Dst Selection               //
//----------------------------------------------//
always@(*)begin
    casex({input_state_reg[1][0],input_state_reg[2][0],input_state_reg[0][0],input_state_reg[3][0]})
                4'b00xx:    /*if(track_use[1])    part_dst = 'd2;
                                    else                part_dst = 'd1;*/
                            part_dst = 'd1;
                4'b01xx:    part_dst = 'd1;
                4'b10xx:    part_dst = 'd2;
                4'b1100:    /*if(track_use[1])    part_dst = 'd3;
                                    else                part_dst = 'd0;*/
                            part_dst ='d0;
                4'b1101:    part_dst = 'd0;
                4'b1110:    part_dst = 'd3;
                4'b1111:
                        casex({input_state_reg[1][1],input_state_reg[2][1],input_state_reg[0][1],input_state_reg[3][1]})
                        4'b00xx:    /*if(track_use[1])    part_dst = 'd2;
                                    else                part_dst = 'd1;*/
                                    part_dst = 'd1;
                        4'b01xx:    part_dst = 'd1;
                        4'b10xx:    part_dst = 'd2;
                        4'b1100:    /*if(track_use[1])    part_dst = 'd3;
                                    else                part_dst = 'd0;*/
                                    part_dst ='d0;
                        4'b1101:    part_dst = 'd0;
                        4'b1110:    part_dst = 'd3;

                        default:    part_dst = 'd0;
                        endcase
                default:    part_dst = 'd0;
        endcase
end
//----------------------------------------------//
//          Next move for 6th to 9th col        //
//----------------------------------------------//
always@*begin
    case({track_use[1],part_dst})
    3'b000, 3'b111: part_dst_router = 2'd0;
    3'b001, 3'b110: part_dst_router = 2'd1;
    3'b010, 3'b101: part_dst_router = 2'd2;
    3'b011, 3'b100: part_dst_router = 2'd3;
    default: part_dst_router = 2'd0;
    endcase
end

assign direction_0 = (track_use[1])?Left:Right;
assign direction_1 = (track_use[1])?Right:Left;
assign point1to2 = (track_use[1])?temp_6col[0]:temp_6col[1];
assign point2to1 = (track_use[1])?temp_6col[1]:temp_6col[0];
//assign point1to2 = (track_use[1])?temp_6col[1]:temp_6col[2];
//assign point2to1 = (track_use[1])?temp_6col[2]:temp_6col[1];
//assign point3to0 = (track_use[1])?temp_6col[3]:temp_6col[0];
//assign point0to3 = (track_use[1])?temp_6col[0]:temp_6col[3];

always@*begin
    case(part_dst_router)
    2'd0:begin
        /*
        case({(~(|(point3to0))),point2to1[0]})

            2'b10,2'b11: begin
                next_move_6to9[2] = direction_1;
                next_move_6to9[1] = Forward;
                next_move_6to9[0] = Forward;
            end
            2'b01:begin
                next_move_6to9[2] = Jump;
                next_move_6to9[1] = direction_1;
                next_move_6to9[0] = Forward;
            end

            2'b00:begin
                next_move_6to9[2] = Forward;
                next_move_6to9[1] = Forward;
                next_move_6to9[0] = direction_1;
            end
            default:begin
                next_move_6to9[2] = Forward;
                next_move_6to9[1] = Forward;
                next_move_6to9[0] = direction_1;
            end
        endcase
*/

/*
        if(~(|(point3to0)))begin
            next_move_6to9[2] = direction_1;
            next_move_6to9[1] = Forward;
            next_move_6to9[0] = Forward;
        end
        else if (point2to1[0]) begin
            next_move_6to9[2] = Jump;
            next_move_6to9[1] = direction_1;
            next_move_6to9[0] = Forward;
        end
        else begin
            next_move_6to9[2] = Forward;
            next_move_6to9[1] = Forward;
            next_move_6to9[0] = direction_1;
        end
  */    
        next_move_6to9[1] = direction_1;
        next_move_6to9[0] = Forward;
        if (point2to1[0])   next_move_6to9[2] = Jump;
        else                next_move_6to9[2] = Forward;
    end
    2'd1:begin
            next_move_6to9[1] = Forward;
            next_move_6to9[0] = Forward;
        if (point2to1[0])   next_move_6to9[2] = Jump;
        else                next_move_6to9[2] = Forward;
    end
    2'd2:begin
        /*
        if(point1to2=='b0)begin
            next_move_6to9[2] = direction_0;
            next_move_6to9[1] = Forward;
            next_move_6to9[0] = Forward;
        end
        else if (point3to0=='b0) begin
            next_move_6to9[2] = direction_1;
            next_move_6to9[1] = direction_0;
            next_move_6to9[0] = direction_0;
        end
        else begin
            */
            if(point2to1[0]) next_move_6to9[2] = Jump;
            else             next_move_6to9[2] =Forward;
            next_move_6to9[1] = Forward;
            next_move_6to9[0] = direction_0;
        //end
    end
    2'd3:begin
        next_move_6to9[1] = direction_0;
        /*if(point1to2=='b0)begin
            next_move_6to9[2] = direction_0;
            next_move_6to9[0] = Forward;
        end
        else if (point2to1[0]) begin
            next_move_6to9[2] = Jump;
            next_move_6to9[0] = direction_0;
        end
        else begin
            next_move_6to9[2] = Forward;
            next_move_6to9[0] = direction_0;
        end*/
         next_move_6to9[0] = direction_0;
        if (point2to1[0])   next_move_6to9[2] = Jump;
        else                next_move_6to9[2] = Forward;
    end
    default:begin
        next_move_6to9[2] = Forward;
        next_move_6to9[1] = Forward;
        next_move_6to9[0] = Forward;
    end
    endcase
end

//----------------------------------------------//
//          Next move ctr                       //
//----------------------------------------------//
/*
always@(*)begin

if((cnt=='d3)|(cnt=='d63))begin
    if(input_state_reg[track_use][0])       next_move = 'd3;                      //2
    else                                    next_move = 'd0;
end
else if(cnt<'d62)begin
    case(cnt[2:0])
    3'b011:
        if(input_state_reg[part_dst][0])      next_move = 'd3;                      //2
        else                                  next_move = 'd0;
    3'b101:begin
        if(input_state_reg[track_use][0])     next_move = 'd3;                      //2
        else                                  next_move = 'd0;
    end
    3'b110:       
        case(track_use)
        2'b00:      next_move = 2'd1;
        2'b01:      next_move = 2'd0;
        2'b10:      next_move = 2'd0;
        2'b11:      next_move = 2'd2;
        default:    next_move = 2'd0;
        endcase
    3'b000, 3'b001, 3'b010, 3'b100, 3'b111:
        next_move = 2'd0;

    default: next_move = 2'd0;
    endcase
    end
else next_move = 2'd0;
end

*/

/*
always@(*)begin
case(cnt[5:0])
//6'd0, 6'd1, 6'd2, 6'd4, 6'd7, 6'd8, 6'd9, 6'd10, 6'd12, 6'd15, 6'd16, 6'd:
//    next_move = 2'd0;                                     
6'd3, 6'd5, 6'd13, 6'd21, 6'd29, 6'd37, 6'd45, 6'd53, 6'd61 , 6'd63:
        if(input_state_reg[track_use][0])     next_move = 'd3;                      //2
        else                                   next_move = 'd0;
6'd11, 6'd19, 6'd27, 6'd35, 6'd43, 6'd51, 6'd59:
        if(input_state_reg[part_dst][0])     next_move = 'd3;                      //2
        else                                   next_move = 'd0;

6'd6, 6'd14, 6'd22, 6'd30, 6'd38, 6'd46, 6'd54:
       case(track_use)
        2'b00:      next_move = 2'd1;
        2'b01:      next_move = 2'd0;
        2'b10:      next_move = 2'd0;
        2'b11:      next_move = 2'd2;
        default:    next_move = 2'd0;
        endcase

default: next_move = 2'd0;
endcase
end
*/
assign next_move_t = (input_state_reg[track_use][0])? 'd3:'d0;
assign next_move_p = (input_state_reg[part_dst][0])? 'd3:'d0;

always@*begin
    case(track_use)
        2'b00:      next_move_m = 2'd1;
        2'b01:      next_move_m = 2'd0;
        2'b10:      next_move_m = 2'd0;
        2'b11:      next_move_m = 2'd2;
        default:    next_move_m = 2'd0;
        endcase
end




//----------------------------------------------//
//          answer reg ctr                      //
//----------------------------------------------//
/*
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin



        temp_6col[0] <= 'd0;
        temp_6col[1] <= 'd0; 
        temp_6col[2] <= 'd0; 
        temp_6col[3] <= 'd0;
    end
    else begin
        if(cnt[2:0]=='d6)begin
            temp_6col[0] <= in0; 
            temp_6col[1] <= in1; 
            temp_6col[2] <= in2; 
            temp_6col[3] <= in3;
        end
        else begin
            temp_6col[0] <= temp_6col[0]; 
            temp_6col[1] <= temp_6col[1]; 
            temp_6col[2] <= temp_6col[2]; 
            temp_6col[3] <= temp_6col[3];
        end
    end
end
*/
always@(posedge clk)begin
    if(cnt=='d0)begin
        temp_6col[0] <= 'd0;
        temp_6col[1] <= 'd0; 
    end
    else begin
        if(cnt[2:0]=='d6)begin
            temp_6col[0] <= in1; 
            temp_6col[1] <= in2; 
        end
        else begin
            temp_6col[0] <= temp_6col[0]; 
            temp_6col[1] <= temp_6col[1]; 
        end
    end
end


/*
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        for(i = 0;i<'d62;i=i+'d1)
            ans[i] <= 'b0;
    end 
    else begin


        casex(cnt)
        //0
            7'd0:begin
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= 'b0;
            end
            7'd1:   ans[0] <= 'b0;    //inputstart from 1 to 64        //output from 65 to 127 //No use
            7'd2:   ans[0] <= 'b0;//next_move;//1     //0
            7'd3:   ans[1] <= next_move_t;    //2     //zj
            7'd4:   ans[2] <= 'b0;//next_move;//3     //0
            7'd5:   ans[3] <= next_move_t;    //4     //zj
            7'd6:   ans[4] <= next_move_m;    //5     //d
            7'd7,7'd8,7'd9,7'd10:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd11:  begin
                    ans[5] <= next_move_6to9[2]; //6
                    ans[6] <= next_move_6to9[1]; //7
                    ans[7] <= next_move_6to9[0]; //0
                    ans[8] <= 'b0;//next_move;//1
                    ans[9] <= next_move_p;         //2
            end
        //1
            7'd12:  ans[10] <= 'b0;//next_move;//3
            7'd13:  ans[11] <= next_move_t;        //4
            7'd14:  ans[12] <= next_move_m;        //5
            7'd15,7'd16,7'd17,7'd18:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd19:  begin
                    ans[13] <= next_move_6to9[2]; //6
                    ans[14] <= next_move_6to9[1]; //7
                    ans[15] <= next_move_6to9[0]; //0
                    ans[16] <= 'b0;//next_move;//1
                    ans[17] <= next_move_p;         //2
            end
        //2
            7'd20:  ans[18] <= 'b0;//next_move;//3
            7'd21:  ans[19] <= next_move_t;         //4
            7'd22:  ans[20] <= next_move_m;         //5
            7'd23,7'd24,7'd25,7'd26:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd27:  begin
                    ans[21] <= next_move_6to9[2]; //6
                    ans[22] <= next_move_6to9[1]; //7
                    ans[23] <= next_move_6to9[0]; //0
                    ans[24] <= 'b0;//next_move;//1
                    ans[25] <= next_move_p;         //2
            end
        //3
            7'd28:  ans[26] <= 'b0;//next_move;//3
            7'd29:  ans[27] <= next_move_t;         //4
            7'd30:  ans[28] <= next_move_m;         //5
            7'd31,7'd32,7'd33,7'd34:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd35:  begin
                    ans[29] <= next_move_6to9[2]; //6
                    ans[30] <= next_move_6to9[1]; //7
                    ans[31] <= next_move_6to9[0]; //0
                    ans[32] <= 'b0;//next_move;//1
                    ans[33] <= next_move_p;         //2
            end
        //4
            7'd36:  ans[34] <= 'b0;//next_move;//3
            7'd37:  ans[35] <= next_move_t;         //4
            7'd38:  ans[36] <= next_move_m;         //5
            7'd39,7'd40,7'd41,7'd42:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd43:  begin
                    ans[37] <= next_move_6to9[2]; //6
                    ans[38] <= next_move_6to9[1]; //7
                    ans[39] <= next_move_6to9[0]; //0
                    ans[40] <= 'b0;//next_move;//1
                    ans[41] <= next_move_p;         //2
            end
        //5
            7'd44:  ans[42] <= 'b0;//next_move;//3
            7'd45:  ans[43] <= next_move_t;         //4
            7'd46:  ans[44] <= next_move_m;         //5
            7'd47,7'd48,7'd49,7'd50:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd51:  begin
                    ans[45] <= next_move_6to9[2]; //6
                    ans[46] <= next_move_6to9[1]; //7
                    ans[47] <= next_move_6to9[0]; //0
                    ans[48] <= 'b0;//next_move;//1
                    ans[49] <= next_move_p;         //2
            end
        //6
            7'd52:  ans[50] <= 'b0;//next_move;//3
            7'd53:  ans[51] <= next_move_t;         //4
            7'd54:  ans[52] <= next_move_m;         //5
      
            7'd55,7'd56,7'd57,7'd58:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd59:  begin
                    ans[53] <= next_move_6to9[2]; //6
                    ans[54] <= next_move_6to9[1]; //7
                    ans[55] <= next_move_6to9[0]; //0
                    ans[56] <= 'b0;//next_move;//1
                    ans[57] <= next_move_p;         //2
            end
        //7
            7'd60:  ans[58] <= 'b0;//next_move;//3
            7'd61:  ans[59] <= next_move_t;         //4
            7'd62:  ans[60] <= 'b0;//next_move;//5
            7'd63:  ans[61] <= next_move_t; //6
            7'b1xx_xxxx:  begin
                    ans[61] <= 'd0; //7
                    for(j='d0;j<'d61;j=j+1)
                        ans[j]<=ans[j+'d1];
            end
            default: 
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
        endcase
    end
end
*/


always@(posedge clk)begin

        casex(cnt)
        //0
            7'd0:begin
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= 'b0;
            end
            7'd1:   ans[0] <= 'b0;    //inputstart from 1 to 64        //output from 65 to 127 //No use
            7'd2:   ans[0] <= 'b0;//next_move;//1     //0
            7'd3:   ans[1] <= next_move_t;    //2     //zj
            7'd4:   ans[2] <= 'b0;//next_move;//3     //0
            7'd5:   ans[3] <= next_move_t;    //4     //zj
            7'd6:   ans[4] <= next_move_m;    //5     //d
            7'd7,7'd8,7'd9,7'd10:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd11:  begin
                    ans[5] <= next_move_6to9[2]; //6
                    ans[6] <= next_move_6to9[1]; //7
                    ans[7] <= next_move_6to9[0]; //0
                    ans[8] <= 'b0;//next_move;//1
                    ans[9] <= next_move_p;         //2
            end
        //1
            7'd12:  ans[10] <= 'b0;//next_move;//3
            7'd13:  ans[11] <= next_move_t;        //4
            7'd14:  ans[12] <= next_move_m;        //5
            7'd15,7'd16,7'd17,7'd18:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd19:  begin
                    ans[13] <= next_move_6to9[2]; //6
                    ans[14] <= next_move_6to9[1]; //7
                    ans[15] <= next_move_6to9[0]; //0
                    ans[16] <= 'b0;//next_move;//1
                    ans[17] <= next_move_p;         //2
            end
        //2
            7'd20:  ans[18] <= 'b0;//next_move;//3
            7'd21:  ans[19] <= next_move_t;         //4
            7'd22:  ans[20] <= next_move_m;         //5
            7'd23,7'd24,7'd25,7'd26:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd27:  begin
                    ans[21] <= next_move_6to9[2]; //6
                    ans[22] <= next_move_6to9[1]; //7
                    ans[23] <= next_move_6to9[0]; //0
                    ans[24] <= 'b0;//next_move;//1
                    ans[25] <= next_move_p;         //2
            end
        //3
            7'd28:  ans[26] <= 'b0;//next_move;//3
            7'd29:  ans[27] <= next_move_t;         //4
            7'd30:  ans[28] <= next_move_m;         //5
            7'd31,7'd32,7'd33,7'd34:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd35:  begin
                    ans[29] <= next_move_6to9[2]; //6
                    ans[30] <= next_move_6to9[1]; //7
                    ans[31] <= next_move_6to9[0]; //0
                    ans[32] <= 'b0;//next_move;//1
                    ans[33] <= next_move_p;         //2
            end
        //4
            7'd36:  ans[34] <= 'b0;//next_move;//3
            7'd37:  ans[35] <= next_move_t;         //4
            7'd38:  ans[36] <= next_move_m;         //5
            7'd39,7'd40,7'd41,7'd42:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd43:  begin
                    ans[37] <= next_move_6to9[2]; //6
                    ans[38] <= next_move_6to9[1]; //7
                    ans[39] <= next_move_6to9[0]; //0
                    ans[40] <= 'b0;//next_move;//1
                    ans[41] <= next_move_p;         //2
            end
        //5
            7'd44:  ans[42] <= 'b0;//next_move;//3
            7'd45:  ans[43] <= next_move_t;         //4
            7'd46:  ans[44] <= next_move_m;         //5
            7'd47,7'd48,7'd49,7'd50:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd51:  begin
                    ans[45] <= next_move_6to9[2]; //6
                    ans[46] <= next_move_6to9[1]; //7
                    ans[47] <= next_move_6to9[0]; //0
                    ans[48] <= 'b0;//next_move;//1
                    ans[49] <= next_move_p;         //2
            end
        //6
            7'd52:  ans[50] <= 'b0;//next_move;//3
            7'd53:  ans[51] <= next_move_t;         //4
            7'd54:  ans[52] <= next_move_m;         //5
      
            7'd55,7'd56,7'd57,7'd58:   
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
            7'd59:  begin
                    ans[53] <= next_move_6to9[2]; //6
                    ans[54] <= next_move_6to9[1]; //7
                    ans[55] <= next_move_6to9[0]; //0
                    ans[56] <= 'b0;//next_move;//1
                    ans[57] <= next_move_p;         //2
            end
        //7
            7'd60:  ans[58] <= 'b0;//next_move;//3
            7'd61:  ans[59] <= next_move_t;         //4
            7'd62:  ans[60] <= 'b0;//next_move;//5
            7'd63:  ans[61] <= next_move_t; //6
            7'b1xx_xxxx:  begin
                    ans[61] <= 'd0; //7
                    for(j='d0;j<'d61;j=j+1)
                        ans[j]<=ans[j+'d1];
            end
            default: 
                for(i = 0;i<'d62;i=i+'d1)
                    ans[i] <= ans[i];
        endcase

end
endmodule

