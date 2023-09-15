`include "AFIFO.v"

module CDC #(parameter DSIZE = 8,
			   parameter ASIZE = 4)(
	//Input Port
	rst_n,
	clk1,
    clk2,
	in_valid,
    doraemon_id,
    size,
    iq_score,
    eq_score,
    size_weight,
    iq_weight,
    eq_weight,
    //Output Port
	ready,
    out_valid,
	out,
    
); 
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
output reg  [7:0] out;
output reg	out_valid,ready;

input rst_n, clk1, clk2, in_valid;
input  [4:0]doraemon_id;
input  [7:0]size;
input  [7:0]iq_score;
input  [7:0]eq_score;
input [2:0]size_weight,iq_weight,eq_weight;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
parameter FILL = 'd0,
          FETCH = 'd1,
          CLEAR = 'd2,
          FINISH = 'd3;


reg [1:0] current_state, next_state;
reg [12:0] cnt_global, cnt_global_comb;
reg [1:0]  cnt_clear;
reg [3:0] cnt_first;

//layer0
reg [7:0] info_0[4:0][2:0];
reg [4:0] id_0[4:0];
reg [2:0] weights [2:0];
reg in_valid_d0;
//layer1
wire [10:0] size_mult_comb, eq_mult_comb, iq_mult_comb;

reg [10:0] mult_regs[2:0];
reg in_valid_d1;
//layer2
wire [12:0] add_comb;
reg [12:0] performance_regs[4:0];
reg [7:0] comp_top_regs, comp_top_regs_copy;
wire [7:0] wdata_in;
reg in_valid_d2;
//layer3

//reg in_valid_d3;

reg [2:0] door_regs;
//cmp
wire [20:0] cmp0, cmp1, cmp2, cmp3;





//FIFO
wire fifo_full, fifo_empty;
reg rinc_regs;
reg winc_regs;
wire [7:0] data_out;




//-------------------------------------
//  OUTPUT ctr
//-------------------------------------
/*
always@(*)begin
    if(fifo_full)    ready_comb = 'b0;
    else             ready_comb = 'b1;
end
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  ready <= 'b0;
    else        ready <= ready_comb;
end
*/
always@(*)begin
    ready = ((~rst_n|cnt_global>'d6000|(current_state==FILL&(cnt_global[2:0]>='d5))))?'b0:(~fifo_full);
end
always@(posedge clk2 or negedge rst_n)begin
    if(~rst_n)  out_valid <= 'b0;
    else if(~fifo_empty)    out_valid <= 'b1;
    else                    out_valid <= 'b0;
end
always@(posedge clk2 or negedge rst_n)begin
    if(~rst_n)  out <= 'b0;
    else if(~fifo_empty)    out <= data_out;//fifo_out;
    else                    out <= 'b0;
end
//-----------------------------------------------
//  FSM
//-----------------------------------------------
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)   current_state <= FILL;
    else         current_state <= next_state;
end
always@(*)begin
    case(current_state)
        FILL:   if(|(performance_regs[1]))  next_state = FETCH;
                else                        next_state = FILL;
        FETCH:  if(fifo_full)               next_state = CLEAR;
                else                        next_state  = FETCH;
        CLEAR:                  next_state = FINISH;
        //CLEAR:  if()                        next_state = FETCH;
        //        else if (condition)         next_state = FINISH;
        //        else                        next_state = CLEAR;
        FINISH:                             next_state = FINISH;
        default:    next_state = FILL;
    endcase
end
//----------------------------------------------
//  cnt
//----------------------------------------------
always@(*)begin
    if(in_valid)   cnt_global_comb = cnt_global + 'd1;
    else           cnt_global_comb = cnt_global;
end
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  cnt_global <= 'b0;
    else        cnt_global <= cnt_global_comb;
end



//-----------------------------------------------
//  in_valid_delay
//-----------------------------------------------
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  in_valid_d0 <= 'b0;
    else        in_valid_d0 <= in_valid;
end
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  in_valid_d1 <= 'b0;
    else if(current_state==FILL&fifo_full)  in_valid_d1 <= in_valid_d1;
    else        in_valid_d1 <= in_valid_d0;
end
always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)          in_valid_d2 <= 'b0;
    else if(current_state==FILL)
        if(|(performance_regs[1]))
            in_valid_d2 <= 'b1;
        else in_valid_d2 <= 'b0;
    else if(fifo_full)  in_valid_d2 <= in_valid_d2;
    else                in_valid_d2 <= in_valid_d1;
end

//----------------------------------------------
//  info regs
//----------------------------------------------

genvar info_idx;
generate
    for(info_idx=0;info_idx<5;info_idx=info_idx+1)begin:info_outer
        if(info_idx==4)begin:info_4
            always@(posedge clk1 or negedge rst_n)begin
                if(~rst_n)begin  
                    info_0[4][0] <= 'b0;
                    info_0[4][1] <= 'b0;
                    info_0[4][2] <= 'b0;
                    id_0[4]      <= 'b0;
                end
                else if(in_valid)begin
                    info_0[4][0] <= size;
                    info_0[4][1] <= iq_score;
                    info_0[4][2] <= eq_score;
                    id_0[4]      <= doraemon_id;
                end
                else begin
                    info_0[4][0] <= info_0[4][0];
                    info_0[4][1] <= info_0[4][1];
                    info_0[4][2] <= info_0[4][2];
                    id_0[4]      <= id_0[4];
                end
            end

        end
        else if(info_idx<4&info_idx>0)begin:info_123
            always@(posedge clk1 or negedge rst_n)begin
                if(~rst_n)begin  
                    info_0[info_idx][0] <= 'b0;
                    info_0[info_idx][1] <= 'b0;
                    info_0[info_idx][2] <= 'b0;
                    id_0[info_idx]      <= 'b0;
                end
                else if((current_state==FILL&in_valid)|(current_state==FILL&cnt_global=='d5))begin
                    info_0[info_idx][0] <= info_0[info_idx+1][0];
                    info_0[info_idx][1] <= info_0[info_idx+1][1];
                    info_0[info_idx][2] <= info_0[info_idx+1][2];
                    id_0[info_idx]      <= id_0[info_idx+1];
                end
                else begin
                    info_0[info_idx][0] <= info_0[info_idx][0];
                    info_0[info_idx][1] <= info_0[info_idx][1];
                    info_0[info_idx][2] <= info_0[info_idx][2];
                    id_0[info_idx]      <= id_0[info_idx]; 
                end
            end
        end
        else if(info_idx==0)begin: info_0cr
            always@(posedge clk1 or negedge rst_n)begin
                if(~rst_n)begin  
                    info_0[info_idx][0] <= 'b0;
                    info_0[info_idx][1] <= 'b0;
                    info_0[info_idx][2] <= 'b0;
                    id_0[info_idx]      <= 'b0;
                end
                else if((current_state==FILL&in_valid)|(current_state==FILL&cnt_global=='d5))begin
                    info_0[info_idx][0] <= info_0[info_idx+1][0];
                    info_0[info_idx][1] <= info_0[info_idx+1][1];
                    info_0[info_idx][2] <= info_0[info_idx+1][2];
                    id_0[info_idx]      <= id_0[info_idx+1];
                end
                else if(current_state==FETCH&in_valid)begin
                    info_0[0][0] <= size;
                    info_0[0][1] <= iq_score;
                    info_0[0][2] <= eq_score;
                    id_0[0]      <= doraemon_id;
                end
                else begin
                    info_0[info_idx][0] <= info_0[info_idx][0];
                    info_0[info_idx][1] <= info_0[info_idx][1];
                    info_0[info_idx][2] <= info_0[info_idx][2];
                    id_0[info_idx]      <= id_0[info_idx]; 
                end
            end

        end
    end

endgenerate


always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)begin
        weights[0] <= 'b0;
        weights[1] <= 'b0;
        weights[2] <= 'b0;
    end
    else if(in_valid&(|(info_0[1][0])))begin
        weights[0] <= size_weight;
        weights[1] <= iq_weight;
        weights[2] <= eq_weight;
    end
    else begin
        weights[0] <= weights[0];
        weights[1] <= weights[1];
        weights[2] <= weights[2];
    end
end








//--------------------------------------
//  MULT
//---------------------------------------
assign size_mult_comb =  info_0[0][0] * weights[0]; 
assign eq_mult_comb   =  info_0[0][1] * weights[1];
assign iq_mult_comb   =  info_0[0][2] * weights[2];

always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)begin
        mult_regs[0] <= 'b0;
        mult_regs[1] <= 'b0;
        mult_regs[2] <= 'b0;
    end
    else if(fifo_full) begin
        mult_regs[0] <= mult_regs[0];
        mult_regs[1] <= mult_regs[1];
        mult_regs[2] <= mult_regs[2];
    end
    else begin
        mult_regs[0] <= size_mult_comb;
        mult_regs[1] <= eq_mult_comb;
        mult_regs[2] <= iq_mult_comb;
    end
end 
//--------------------------------------
//  ADD
//---------------------------------------
assign add_comb = mult_regs[0] + mult_regs[1] + mult_regs[2];
genvar add_idx;
generate
    for(add_idx=0;add_idx<5;add_idx=add_idx+1)begin
        if(add_idx==4)begin
            always@(posedge clk1 or negedge rst_n)begin
                if(~rst_n)  performance_regs[4] <= 'b0;
                else if(fifo_full)
                    performance_regs[4] <= performance_regs[4];
                else if((~(|(performance_regs[0])))|door_regs=='d4)
                    performance_regs[4] <= add_comb;
                else        performance_regs[4] <= performance_regs[4];
            end
        end
        else if(add_idx<4)begin
            always@(posedge clk1 or negedge rst_n)begin
                if(~rst_n)  performance_regs[add_idx] <= 'b0;
                else if(fifo_full)
                    performance_regs[add_idx] <= performance_regs[add_idx];
                else if((~(|(performance_regs[0]))))
                    performance_regs[add_idx] <= performance_regs[add_idx+1];
                else if(door_regs==add_idx)
                    performance_regs[add_idx] <=  add_comb;
                else        performance_regs[add_idx] <= performance_regs[add_idx];
            end

        end
    end
endgenerate

always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)          door_regs <= 'b0;
    else if(fifo_full)  door_regs <= door_regs;
    else                door_regs <= cmp3[20:18];

end




//------------------------------
//  CMP
//-----------------------------
assign cmp0 = (performance_regs[1]>performance_regs[0])?{3'd1,id_0[1],performance_regs[1]}:{3'd0,id_0[0],performance_regs[0]};
assign cmp1 = (performance_regs[3]>performance_regs[2])?{3'd3,id_0[3],performance_regs[3]}:{3'd2,id_0[2],performance_regs[2]};
assign cmp2 = (performance_regs[4]>cmp1[12:0])?{3'd4,id_0[4],performance_regs[3]}:cmp1;
assign cmp3 = (cmp2[12:0]>cmp0[12:0])?cmp2:cmp0;


always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  comp_top_regs <= 'b0;
    else if(fifo_full)  comp_top_regs <= comp_top_regs;
    else                comp_top_regs <= cmp3[20:13];
end

always@(posedge clk1 or negedge rst_n)begin
    if(~rst_n)  comp_top_regs <= 'b0;
    else if(fifo_full)  comp_top_regs_copy <= comp_top_regs_copy;
    else                comp_top_regs_copy <= comp_top_regs;
end




//------------------------------
//  read
//-----------------------------
always@(posedge clk2 or negedge rst_n)begin
    if(~rst_n)  rinc_regs <= 'b0;
    else        rinc_regs <= out_valid;
end






AFIFO afifo_u0(
	//Input Port
	.rst_n(rst_n),
    //Input Port (read)
    .rclk(clk2),
    .rinc(~fifo_empty),//rinc_regs),
	//Input Port (write)
    .wclk(clk1),
    .winc(in_valid_d2),
	.wdata(cmp3[20:13]),

    //Output Port (read)
    .rempty(fifo_empty),
	.rdata(data_out),
    //Output Port (write)
    .wfull(fifo_full)
); 
endmodule