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
integer i;
parameter Left = 2'b10,
        Right = 2'b01,
        Forward = 2'b00,
        Jump = 2'b11;

//==============================================//
//           reg & wire declaration             //
//==============================================//
wire [1:0] in_put [3:0];
wire [7:0] train_track_filter;
reg [6:0] cnt;
wire [6:0] cnt_comb;
reg [1:0] ans [63:0];

reg track_use;
reg mid_track;
wire [1:0] track_l_comb, track_r_comb;
reg [1:0] next_move;

reg [1:0] part_dst;
reg [1:0] temp_6col [3:0];
reg [1:0] next_move_6to9 [3:0];
//==============================================//
//                  design                      //
//==============================================//

//OUTPUT CTR
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              out_valid <= 'b0;
    else if(cnt[6]=='b1)    out_valid <= 'b1;
    else                    out_valid <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              out <= 'b0;
    else if(cnt[6]=='b1)    out <= ans[1];
    else                    out <= 'b0;
end
assign  cnt_comb = cnt + 'd1;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              cnt <= 'b0;
    else
        case({in_valid, out_valid})
            2'b00:  cnt <= 'b0;
            2'b01:  cnt <= cnt_comb;
            2'b10:  cnt <= cnt_comb;
            2'b11:  cnt <= cnt;     //???       cnt <= 'b0;
            default:    cnt <= cnt;
        endcase
end

assign track_l_comb = track -'d1;
assign track_r_comb = track +'d1;


always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  track_use <= 'b0;
    else if((cnt=='b0)&in_valid)   track_use<=init;
    else begin 
        case(next_move)
            2'd1:       track_use <= track_l_comb;
            2'd2:       track_use <= track_r_comb;
            2'd0, 2'd3: track_use <= track;
            default:    track_use <= track;
        endcase
    end
end


assign in_put[0] = in0;
assign in_put[1] = in1;
assign in_put[2] = in2;
assign in_put[3] = in3;


assign train_track_filter = {in0, in1, in2, in3};

always@(*)begin

    casex({in1[1],in2[1],in0[1],in3[1]})
                4'b00xx:    if(track_use[1])    part_dst = 'd2;
                            else                part_dst = 'd1;
                4'b01xx:    part_dst = 'd1;
                4'b10xx:    part_dst = 'd2;
                4'b1100:    if(track_use[1])    part_dst = 'd3;
                            else                part_dst = 'd0;
                4'b1101:    part_dst = 'd0;
                4'b1110:    part_dst = 'd3;
                4'b1111:
                        casex({in1[0],in2[0],in0[0],in3[0]})
                        4'b00xx:    if(track_use[1])    part_dst = 'd2;
                                    else                part_dst = 'd1;
                        4'b01xx:    part_dst = 'd1;
                        4'b10xx:    part_dst = 'd2;
                        4'b1100:    if(track_use[1])    part_dst = 'd3;
                                    else                part_dst = 'd0;
                        4'b1101:    part_dst = 'd0;
                        4'b1110:    part_dst = 'd3;

                        default:    part_dst = 'd0;
                        endcase
                default:    part_dst = 'd0;
        endcase
end

always@(*)begin

    if(track_use[1])begin
        //! for track 2         
        //TODO
        case(part_dst)
        2'd0: begin
                if(~(|(temp_6col[0])))begin
                    next_move_6to9[3] = Left;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Left;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] = Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Left;
                    next_move_6to9[0] = Forward;
                end

        end
        2'd1:begin       
                if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] = Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
        end
        2'd2: begin
                if(temp_6col[2]=='b0)begin
                    next_move_6to9[3] = Right;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[0]=='b0) begin
                    next_move_6to9[3] = Left;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    if(temp_6col[1][1]) next_move_6to9[3] = Jump;
                    else                next_move_6to9[3] =Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Left;
                    next_move_6to9[0] = Forward;
                end
        end

        2'd3:begin
            if(temp_6col[2]=='b0)begin
                    next_move_6to9[3] = Right;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] =Forward;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
        end
        endcase



    end
    else    begin
        //! for track 1
        case(part_dst)
        2'd0: begin
                if(~(|(temp_6col[0])))begin
                    next_move_6to9[3] = Left;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Left;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] = Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Left;
                    next_move_6to9[0] = Forward;
                end

        end
        2'd1:begin       
                if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] = Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;
                end
        end
        2'd2: begin
                if(temp_6col[2]=='b0)begin
                    next_move_6to9[3] = Right;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[0]=='b0) begin
                    next_move_6to9[3] = Left;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    if(temp_6col[1][1]) next_move_6to9[3] = Jump;
                    else                next_move_6to9[3] =Forward;
                    next_move_6to9[2] = Forward;
                    next_move_6to9[1] = Left;
                    next_move_6to9[0] = Forward;
                end
        end

        2'd3:begin
            if(temp_6col[2]=='b0)begin
                    next_move_6to9[3] = Right;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Forward;
                    next_move_6to9[0] = Forward;

                end
                else if (temp_6col[1][1]) begin
                    next_move_6to9[3] = Jump;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
                else begin
                    next_move_6to9[3] =Forward;
                    next_move_6to9[2] = Right;
                    next_move_6to9[1] = Right;
                    next_move_6to9[0] = Forward;
                end
        end
        endcase
    end


end

















always@(*)begin
case(cnt)
7'd1,7'd2: next_move = 'd0;
7'd3:   if(in_put[track]>'d0)    next_move = 'd3;
        else                     next_move = 'd0;
7'd4:   next_move = 'd0;
7'd5:   if(in_put[track]>'d0)    next_move = 'd3;
        else                     next_move = 'd0;
7'd6:   case(in_put[track])
        2'b00:      next_move = 2'd1;
        2'b01:      next_move = 2'd0;
        2'b10:      next_move = 2'd0;
        2'b11:      next_move = 2'd2;
        default:    next_move = 2'd0;
        endcase

7'd11:
    begin
    
    
    
    
    
    
    end


endcase
end





always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        for(i = 0;i<'d64;i=i+'d1)
            ans[i] = 'b0;
        temp_6col[0] <= 'd0, temp_6col[1] = 'd0, temp_6col[2] <= 'd0, temp_6col[3] <= 'd0;
    end 
    else begin
        case(cnt)
            7'd1:       //inputstart from 1 to 64        //output from 65 to 127 
            7'd3:   if()
            7'd6:   begin
                    temp_6col[0] <= in0, temp_6col[1] <= in1, temp_6col[2] <= in2, temp_6col[3] <= in3;
                    end



        endcase



    end

end














endmodule

