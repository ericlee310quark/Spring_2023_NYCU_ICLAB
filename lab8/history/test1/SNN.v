// synopsys translate_off
`ifdef RTL
	`include "GATED_OR.v"
`else
	`include "Netlist/GATED_OR_SYN.v"
`endif
// synopsys translate_on

module SNN(
	// Input signals
	clk,
	rst_n,
	cg_en,
	in_valid,
	img,
	ker,
	weight,

	// Output signals
	out_valid,
	out_data
);

input clk;
input rst_n;
input in_valid;
input cg_en;
input [7:0] img;
input [7:0] ker;
input [7:0] weight;

output reg out_valid;
output reg [9:0] out_data;

//==============================================//
//       parameter & integer declaration        //
//==============================================//

parameter S_IDLE = 'd0,
		  S_INPUT_1 = 'd1,
		  S_INPUT_2 = 'd2,
		  S_CNN_2 = 'd3,
		  S_NN_1 = 'd4,
		  S_NN_2 = 'd5,
		  S_L1_ACT = 'd6,
		  S_OUT    = 'd7;

//==============================================//
//           reg & wire declaration             //
//==============================================//

reg [2:0] current_state, next_state;



reg [7:0] weight_map[1:0][1:0];
reg [7:0] kernel[2:0][2:0];
reg [7:0] img0 [14:0];//, img1 [5:0][5:0];

//reg [7:0] cnn_map [3:0][3:0];

reg [7:0] cnn_map0[7:0];
reg [7:0] max_map0[1:0][1:0], max_map1[1:0][1:0];


//wire [11:0] divisor;
wire [7:0] ratio_result_cnn, ratio_result_vec;
wire [11:0] ratio_b;
wire [19:0] ratio_a;

reg [7:0] nn_1[3:0], nn_2[3:0];

wire [15:0] mult_comb_result[8:0];
wire [7:0] mult_a[3:0], mult_b[3:0];




wire [16:0] add_2_result[3:0];
wire [19:0] add_9_result;

wire [7:0] sort_a[3:0], sort_b[3:0], sort_result[3:0];

wire signed [8:0] sub_comb_result[3:0];
wire [7:0] L1_partial_comb [3:0];
wire [9:0] L1_comb_result; //9:0
wire [9:0] out_result;//9:0


reg [5:0] cnt, cnt_comb;


wire section_en[3:0];


//==============================================//
//                 GATED_OR                     //
//==============================================//
reg ctrl_input;
reg ctrl_img0;
reg ctrl_cnnmap;
reg ctrl_maxmap0;
reg ctrl_maxmap1;
reg ctrl_nn1;
reg ctrl_nn2;
wire G_clock_input, G_clock_img0, G_clock_cnnmap, G_clock_maxmap0, G_clock_maxmap1, G_clock_nn1, G_clock_nn2;

wire G_sleep_input = ctrl_input&cg_en;
wire G_sleep_img0 = ctrl_img0&cg_en;
wire G_sleep_cnnmap = ctrl_cnnmap&cg_en;
wire G_sleep_maxmap0 = ctrl_maxmap0&cg_en;
wire G_sleep_maxmap1 = ctrl_maxmap1&cg_en;
wire G_sleep_nn1 = ctrl_nn1&cg_en;
wire G_sleep_nn2 = ctrl_nn2&cg_en;

GATED_OR GATED_input (.CLOCK(clk), .SLEEP_CTRL(G_sleep_input), .RST_N(rst_n),	.CLOCK_GATED(G_clock_input));
GATED_OR GATED_img0 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_img0), .RST_N(rst_n),	.CLOCK_GATED(G_clock_img0));
GATED_OR GATED_cnnmap (.CLOCK(clk), .SLEEP_CTRL(G_sleep_cnnmap), .RST_N(rst_n), .CLOCK_GATED(G_clock_cnnmap));
GATED_OR GATED_maxmap0 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_maxmap0), .RST_N(rst_n), .CLOCK_GATED(G_clock_maxmap0));
GATED_OR GATED_maxmap1 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_maxmap1), .RST_N(rst_n), .CLOCK_GATED(G_clock_maxmap1));
GATED_OR GATED_nn1 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn1), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn1));
GATED_OR GATED_nn2 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn2), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn2));



always @(*) begin
	ctrl_input = !(current_state==S_IDLE|next_state==S_INPUT_1);
	ctrl_img0 = !(current_state==S_IDLE|next_state==S_INPUT_1|next_state==S_INPUT_2);
	ctrl_cnnmap = !((next_state==S_INPUT_1|next_state==S_INPUT_2|next_state==S_CNN_2)&(cnt>'d14|cnt<'d2));
	ctrl_maxmap0 =  !(next_state==S_INPUT_1|current_state==S_INPUT_2|next_state==S_NN_1|current_state==S_NN_2);
	//ctrl_maxmap1 = 'b1;
	ctrl_maxmap1 = !(next_state==S_INPUT_2|next_state==S_CNN_2|next_state==S_NN_1|next_state==S_NN_2|current_state==S_NN_2);
	ctrl_nn1 = !(next_state==S_NN_1|current_state==S_NN_1);
	ctrl_nn2 = !(next_state==S_NN_2|current_state==S_NN_2);

end

//==============================================//
//                  design                      //
//==============================================//

//-------------------------------------------
//	OUTPUT ctr
//-------------------------------------------

assign out_result = (L1_comb_result[9:4]<'b1)?'b0:L1_comb_result;
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)					out_valid <= 'b0;
	else if(next_state==S_OUT)	out_valid <= 'b1;
	else						out_valid <= 'b0;
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)					out_data <= 'b0;
	else if(next_state==S_OUT)	out_data <=  out_result;
	else						out_data <= 'b0;
end

//-------------------------------------------
//	FSM ctr
//-------------------------------------------
always@(posedge clk or negedge rst_n)begin
	if(~rst_n)	current_state <= S_IDLE;
	else		current_state <= next_state;
end
always@(*)begin
	case(current_state)
	S_IDLE:		if(in_valid)	next_state = S_INPUT_1;
				else			next_state = S_IDLE;
	S_INPUT_1:	if(cnt=='b0)	next_state = S_INPUT_2;
				else			next_state = S_INPUT_1;

	S_INPUT_2:  if(cnt=='b0)    next_state = S_CNN_2;
				else			next_state = S_INPUT_2;

	S_CNN_2:	next_state = S_NN_1;
	S_NN_1:		if(cnt=='b0)	next_state = S_NN_2;
				else			next_state = S_NN_1;
	S_NN_2:		if(cnt=='b0)	next_state = S_L1_ACT;//S_L1_ACT;
				else			next_state = S_NN_2;
	S_L1_ACT:	next_state = S_OUT;


	default:	next_state = S_IDLE;
	endcase

end
//-------------------------------------------
//	cnt ctr
//-------------------------------------------
always@(*)begin
	case(next_state)
		S_IDLE:		cnt_comb = 'b0;
		S_INPUT_1:	cnt_comb = (cnt=='d35)?'b0: cnt + 'b1;
		S_INPUT_2:	cnt_comb = (cnt=='d35)?'b0: cnt + 'b1;
		S_CNN_2:	cnt_comb = 'b0;
		S_NN_1:		cnt_comb = (cnt=='d1)?'b0: cnt + 'b1;
		S_NN_2:		cnt_comb = (cnt=='d1)?'b0: cnt + 'b1;

	default:	cnt_comb = 'b0;
	endcase
end



always@(posedge clk or negedge rst_n)begin
	if(~rst_n)	cnt <= 'b0;
	else		cnt <= cnt_comb;
end
//-------------------------------------------
//	INPUT ctr
//-------------------------------------------
genvar img_idx;
generate
	for(img_idx=0;img_idx<15;img_idx=img_idx+1)begin
		if(img_idx==14)begin
			always@(posedge G_clock_img0 or negedge rst_n)begin
				if(~rst_n)							img0[14] <= 'b0;
				else if(next_state == S_INPUT_1|next_state == S_INPUT_2)	
					img0[14] <= img;
				else								img0[14] <= img0[14];
			end
		end
		else begin
			always@(posedge G_clock_img0 or negedge rst_n)begin
				if(~rst_n)							img0[img_idx] <= 'b0;
				else if(next_state == S_INPUT_1|next_state == S_INPUT_2)	
					img0[img_idx] <= img0[img_idx+1];
				else								img0[img_idx] <= img0[img_idx];
			end
		end
	end


endgenerate
always@(posedge G_clock_input or negedge rst_n)begin
	if(~rst_n)begin
		weight_map[0][0] <= 'b0; weight_map[0][1] <= 'b0;
		weight_map[1][0] <= 'b0; weight_map[1][1] <= 'b0;
	end
	else if(next_state == S_INPUT_1&(cnt<'d4))begin
		weight_map[0][0] <= weight_map[1][0]; weight_map[1][0] <= weight_map[0][1];
		weight_map[0][1] <= weight_map[1][1]; weight_map[1][1] <= weight;
	end
	else begin
		weight_map[0][0] <= weight_map[0][0]; weight_map[0][1] <= weight_map[0][1];
		weight_map[1][0] <= weight_map[1][0]; weight_map[1][1] <= weight_map[1][1];
	end
end



genvar ker_i, ker_j;
generate
	for(ker_i=0;ker_i<3;ker_i=ker_i+1)begin
		for(ker_j=0;ker_j<3;ker_j=ker_j+1)begin
			if((ker_i==2)&(ker_j==2))begin
				always@(posedge G_clock_input or negedge rst_n)begin
					if(~rst_n)										kernel[2][2] <= 'b0;
					else if(next_state == S_INPUT_1 &(cnt<'d9))		kernel[2][2] <= ker;
					else											kernel[2][2] <= kernel[2][2];
				end
			end
			else begin
				always@(posedge G_clock_input or negedge rst_n)begin
					if(~rst_n)										kernel[ker_i][ker_j] <= 'b0;
					else if(next_state == S_INPUT_1 &(cnt<'d9))		kernel[ker_i][ker_j] <= kernel[ker_i + (ker_j == 2)][(ker_j + 1) % 3];
					else											kernel[ker_i][ker_j] <= kernel[ker_i][ker_j];
				end
			end
		end
	end
endgenerate


//------------------------------------------
// cnn_map
//------------------------------------------

assign section_en[0] = ((cnt>'d14)&(cnt<'d19))?'b1:'b0;	//15,16,17,18;
assign section_en[1] = ((cnt>'d20)&(cnt<'d25))?'b1:'b0;	//21,22,23,24;
assign section_en[2] = ((cnt>'d26)&(cnt<'d31))?'b1:'b0;	//27,28,29,30;
assign section_en[3] = ((cnt>'d32)|(cnt=='d0))?'b1:'b0;	//33,34,35,0;

/*
genvar cnn_i, cnn_j;
generate
	for(cnn_i=0;cnn_i<4;cnn_i=cnn_i+1)begin
		for(cnn_j=0;cnn_j<4;cnn_j=cnn_j+1)begin
			if((cnn_i==3)&(cnn_j==3))begin
				always@(posedge clk or negedge rst_n)begin
					if(~rst_n)	cnn_map[3][3] <= 'b0;
					else if(section_en[0]|section_en[1]|section_en[2]|section_en[3])begin
						cnn_map[3][3] <= ratio_result_cnn;
					end
					else begin
						cnn_map[3][3] <= cnn_map[3][3];
					end

				end
			end
			else begin



			end
		end
	end
endgenerate
*/

genvar cnn_map_idx;
generate
	for(cnn_map_idx=0;cnn_map_idx<8;cnn_map_idx=cnn_map_idx+1)begin
		if(cnn_map_idx==7)begin
			always@(posedge G_clock_cnnmap or negedge rst_n)begin
				if(~rst_n)	cnn_map0[7] <= 'b0;
				else if(section_en[0]|section_en[1]|section_en[2]|section_en[3])
					cnn_map0[7] <= ratio_result_cnn;
				else cnn_map0[7] <= cnn_map0[7];
			end
		end
		else begin
			always@(posedge G_clock_cnnmap or negedge rst_n)begin
				if(~rst_n)	cnn_map0[cnn_map_idx] <= 'b0;
				else if(section_en[0]|section_en[1]|section_en[2]|section_en[3])
					cnn_map0[cnn_map_idx] <= cnn_map0[cnn_map_idx+1];
				else	cnn_map0[cnn_map_idx] <= cnn_map0[cnn_map_idx];
			end
		end
	end
endgenerate


//max_map0
always@(posedge G_clock_maxmap0 or negedge rst_n)begin
	if(~rst_n)begin
		max_map0[0][0] <= 'b0; max_map0[0][1] <= 'b0;	
	end
	else if(next_state == S_INPUT_1&(cnt=='d25))begin
		max_map0[0][0] <= sort_result[0]; max_map0[0][1] <= sort_result[1];
	end
	else if(next_state == S_NN_1&(cnt=='d1))begin
		max_map0[0][0] <= max_map0[1][0]; max_map0[0][1] <= max_map0[1][1];
	end
	else begin
		max_map0[0][0] <= max_map0[0][0]; max_map0[0][1] <= max_map0[0][1];
	end 
end
always@(posedge G_clock_maxmap0 or negedge rst_n)begin
	if(~rst_n)begin
		max_map0[1][0] <= 'b0; max_map0[1][1] <= 'b0;
	end
	else if(current_state == S_INPUT_2&(cnt=='d1))begin
		max_map0[1][0] <= sort_result[0]; max_map0[1][1] <= sort_result[1];
	end
	else if(next_state == S_NN_1&(cnt=='d1))begin
		max_map0[1][0] <= max_map0[0][0]; max_map0[1][1] <= max_map0[0][1];
	end
	else begin
		max_map0[1][0] <= max_map0[1][0]; max_map0[1][1] <= max_map0[1][1];
	end 
end

//max_map1
always@(posedge G_clock_maxmap1 or negedge rst_n)begin
	if(~rst_n)begin
		max_map1[0][0] <= 'b0; max_map1[0][1] <= 'b0;	
	end
	else if(next_state == S_INPUT_2&(cnt=='d25))begin
		max_map1[0][0] <= sort_result[0]; max_map1[0][1] <= sort_result[1];
	end
	else if(next_state == S_NN_2&(cnt=='d1))begin
		max_map1[0][0] <= max_map1[1][0]; max_map1[0][1] <= max_map1[1][1];
	end
	else begin
		max_map1[0][0] <= max_map1[0][0]; max_map1[0][1] <= max_map1[0][1];
	end 
end
always@(posedge G_clock_maxmap1 or negedge rst_n)begin
	if(~rst_n)begin
		max_map1[1][0] <= 'b0; max_map1[1][1] <= 'b0;
	end
	else if(current_state == S_CNN_2&(cnt=='d0))begin
		max_map1[1][0] <= sort_result[0]; max_map1[1][1] <= sort_result[1];
	end
	else if(current_state == S_NN_2&(cnt=='d1))begin
		max_map1[1][0] <= max_map1[0][0]; max_map1[1][1] <= max_map1[0][1];
	end
	else begin
		max_map1[1][0] <= max_map1[1][0]; max_map1[1][1] <= max_map1[1][1];
	end 
end
//nn_1
always@(posedge G_clock_nn1 or negedge rst_n)begin
	if(~rst_n)begin
		nn_1[0] <= 'b0; nn_1[3] <= 'b0;	
	end
	else if(current_state == S_NN_1&(cnt=='d1))begin
		nn_1[0] <= ratio_result_cnn; nn_1[3] <= ratio_result_vec;
	end
	else begin
		nn_1[0] <= nn_1[0]; nn_1[3] <= nn_1[3];
	end 
end
always@(posedge G_clock_nn1 or negedge rst_n)begin
	if(~rst_n)begin
		nn_1[2] <= 'b0; nn_1[1] <= 'b0;	
	end
	else if(current_state == S_NN_1&(cnt=='d0))begin
		nn_1[2] <= ratio_result_cnn; nn_1[1] <= ratio_result_vec;
	end
	else begin
		nn_1[2] <= nn_1[2]; nn_1[1] <= nn_1[1];
	end 
end
//nn_2
always@(posedge G_clock_nn2 or negedge rst_n)begin
	if(~rst_n)begin
		nn_2[0] <= 'b0; nn_2[3] <= 'b0;	
	end
	else if(current_state == S_NN_2&(cnt=='d1))begin
		nn_2[0] <= ratio_result_cnn; nn_2[3] <= ratio_result_vec;
	end
	else begin
		nn_2[0] <= nn_2[0]; nn_2[3] <= nn_2[3];
	end 
end
always@(posedge G_clock_nn2 or negedge rst_n)begin
	if(~rst_n)begin
		nn_2[2] <= 'b0; nn_2[1] <= 'b0;	
	end
	else if(current_state == S_NN_2&(cnt=='d0))begin
		nn_2[2] <= ratio_result_cnn; nn_2[1] <= ratio_result_vec;
	end
	else begin
		nn_2[2] <= nn_2[2]; nn_2[1] <= nn_2[1];
	end 
end





//-------------------------------------------
//	comb
//-------------------------------------------
assign mult_a[0] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?img0[0]:(current_state==S_NN_1)?max_map0[0][0]:max_map1[0][0];
assign mult_b[0] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?kernel[0][0]:weight_map[0][0];
assign mult_a[1] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?img0[1]:(current_state==S_NN_1)?max_map0[0][1]:max_map1[0][1];
assign mult_b[1] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?kernel[0][1]:weight_map[0][1];


assign mult_a[2] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?img0[2]:(current_state==S_NN_1)?max_map0[1][0]:max_map1[1][0];
assign mult_b[2] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?kernel[0][2]:weight_map[1][0];
assign mult_a[3] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?img0[6]:(current_state==S_NN_1)?max_map0[1][1]:max_map1[1][1];
assign mult_b[3] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?kernel[1][0]:weight_map[1][1];



//assign mult_comb_result[0] = img0[0] * kernel[0][0];
//assign mult_comb_result[1] = img0[1] * kernel[0][1];
//assign mult_comb_result[2] = img0[2] * kernel[0][2];
//assign mult_comb_result[3] = img0[6] * kernel[1][0];
assign mult_comb_result[0] = mult_a[0] * mult_b[0];
assign mult_comb_result[1] = mult_a[1] * mult_b[1];
assign mult_comb_result[2] = mult_a[2] * mult_b[2];
assign mult_comb_result[3] = mult_a[3] * mult_b[3];

assign mult_comb_result[4] = (cg_en&~((cnt<'d2|cnt>'d14)))?'d0:img0[7] * kernel[1][1];
assign mult_comb_result[5] = (cg_en&~((cnt<'d2|cnt>'d14)))?'d0:img0[8] * kernel[1][2];
assign mult_comb_result[6] = (cg_en&~((cnt<'d2|cnt>'d14)))?'d0:img0[12] * kernel[2][0];
assign mult_comb_result[7] = (cg_en&~((cnt<'d2|cnt>'d14)))?'d0:img0[13] * kernel[2][1];
assign mult_comb_result[8] = (cg_en&~((cnt<'d2|cnt>'d14)))?'d0:img0[14] * kernel[2][2];

assign add_2_result[0] =(cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:mult_comb_result[0] + mult_comb_result[1];
assign add_2_result[1] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:mult_comb_result[2] + mult_comb_result[3];
assign add_2_result[2] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:mult_comb_result[4] + mult_comb_result[5];
assign add_2_result[3] = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:mult_comb_result[6] + mult_comb_result[7];
assign add_9_result =(cg_en&~((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2)))?'d0: add_2_result[0] + add_2_result[1] + add_2_result[2] + add_2_result[3] + mult_comb_result[8];

assign ratio_a = (cg_en&~(((cnt<'d2|cnt>'d14)&(current_state==S_INPUT_1|current_state==S_INPUT_2))|(current_state==S_NN_1)|(current_state==S_NN_2)))?'d0:(current_state<'d4)?add_9_result:add_2_result[0];
assign ratio_b = (current_state<'d4)?12'd2295:12'd510;
assign ratio_result_cnn = ratio_a/ratio_b;     //(12'd2295);
assign ratio_result_vec =(cg_en&~(current_state==S_NN_1|current_state==S_NN_2)) ?'d0:add_2_result[1]/9'd510;

assign sort_a[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[0]>cnn_map0[1])?cnn_map0[0]:cnn_map0[1];
assign sort_b[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[4]>cnn_map0[5])?cnn_map0[4]:cnn_map0[5];
assign sort_result[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(sort_a[0]>sort_b[0])?sort_a[0]:sort_b[0];

assign sort_a[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[2]>cnn_map0[3])?cnn_map0[2]:cnn_map0[3];
assign sort_b[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[6]>cnn_map0[7])?cnn_map0[6]:cnn_map0[7];
assign sort_result[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(sort_a[1]>sort_b[1])?sort_a[1]:sort_b[1];



assign sub_comb_result[0] = nn_1[0] - nn_2[0];
assign sub_comb_result[1] = nn_1[1] - nn_2[1];
assign sub_comb_result[2] = nn_1[2] - nn_2[2];
assign sub_comb_result[3] = nn_1[3] - nn_2[3];

assign L1_partial_comb[0] = (sub_comb_result[0][8])?sub_comb_result[0]*-1:sub_comb_result[0];
assign L1_partial_comb[1] = (sub_comb_result[1][8])?sub_comb_result[1]*-1:sub_comb_result[1];
assign L1_partial_comb[2] = (sub_comb_result[2][8])?sub_comb_result[2]*-1:sub_comb_result[2];
assign L1_partial_comb[3] = (sub_comb_result[3][8])?sub_comb_result[3]*-1:sub_comb_result[3];

assign L1_comb_result = L1_partial_comb[0] + L1_partial_comb[1] + L1_partial_comb[2] + L1_partial_comb[3];
//assign out_result = (L1_comb_result<'d16)?'d0:L1_comb_result[9:0];



endmodule