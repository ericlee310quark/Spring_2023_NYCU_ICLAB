//=====================================================
//	v6
//=====================================================

// synopsys translate_off
`ifdef RTL
	`include "GATED_OR.v"
`else
	`include "Netlist/GATED_OR_SYN.v"
`endif
// synopsys translate_on

//copy

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
/*
parameter S_IDLE = 'd0,
		  S_INPUT_1 = 'd1,
		  S_INPUT_2 = 'd2,
		  S_CNN_2 = 'd3,
		  //S_NN_1 = 'd4,
		  S_NN_2 = 'd5,
		  //S_L1_ACT = 'd6,
		  S_OUT    = 'd7;
*/
parameter S_IDLE = 'd0,
		  S_INPUT_1 = 'd1,
		  S_INPUT_2 = 'd3,
		  S_CNN_2 = 'd2,
		  //S_NN_1 = 'd4,
		  S_NN_2 = 'd6,
		  //S_L1_ACT = 'd6,
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
reg [7:0] max_map_new[1:0];

//wire [11:0] divisor;
wire [7:0] ratio_result_cnn, ratio_result_vec;
wire [11:0] ratio_b;
wire [19:0] ratio_a;

reg [7:0] nn_1[3:0], nn_2[3:0];

wire [15:0] mult_comb_result[8:0];
//wire [7:0] mult_a[3:0], mult_b[3:0];




wire [16:0] add_2_result[3:0];
wire [19:0] add_9_result;

wire [7:0] sort_a[1:0], sort_b[1:0], sort_result[1:0];

wire signed [8:0] sub_comb_result[3:0];
wire [7:0] sub_comb_result_in[3:0];
wire [7:0] L1_partial_comb [3:0];
wire [9:0] L1_comb_result; //9:0
wire [9:0] out_result;//9:0


reg [5:0] cnt, cnt_comb;


wire section_en[3:0];

wire[16:0] nn_comb;
wire[7:0] weight_sel[1:0];
wire[16:0] ratio_c;


reg [8:0] filter_sub_comb_a[3:0], filter_sub_comb_b[3:0];
reg [7:0] mult_a[8:0], mult_b[8:0];
wire cnt_eq_2;
wire [7:0] nn_a,nn_b;
//==============================================//
//                 GATED_OR                     //
//==============================================//
reg ctrl_input;
reg ctrl_img0;
reg ctrl_cnnmap;
reg ctrl_maxmap0;
reg ctrl_maxmap1;
reg ctrl_nn1a;
reg ctrl_nn1b;
reg ctrl_nn2a;
reg ctrl_nn2b;
wire G_clock_input, G_clock_img0, G_clock_cnnmap, G_clock_maxmap0, G_clock_maxmap1, G_clock_nn1a, G_clock_nn1b, G_clock_nn2a, G_clock_nn2b;

wire G_sleep_input = ctrl_input&cg_en;
wire G_sleep_img0 = ctrl_img0&cg_en;
wire G_sleep_cnnmap = ctrl_cnnmap&cg_en;
wire G_sleep_maxmap0 = ctrl_maxmap0&cg_en;
wire G_sleep_maxmap1 = ctrl_maxmap1&cg_en;
wire G_sleep_nn1a = ctrl_nn1a&cg_en;
wire G_sleep_nn1b = ctrl_nn1b&cg_en;
wire G_sleep_nn2a = ctrl_nn2a&cg_en;
wire G_sleep_nn2b = ctrl_nn2b&cg_en;

GATED_OR GATED_input (.CLOCK(clk), .SLEEP_CTRL(G_sleep_input), .RST_N(rst_n),	.CLOCK_GATED(G_clock_input));
GATED_OR GATED_img0 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_img0), .RST_N(rst_n),	.CLOCK_GATED(G_clock_img0));
GATED_OR GATED_cnnmap (.CLOCK(clk), .SLEEP_CTRL(G_sleep_cnnmap), .RST_N(rst_n), .CLOCK_GATED(G_clock_cnnmap));
GATED_OR GATED_maxmap0 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_maxmap0), .RST_N(rst_n), .CLOCK_GATED(G_clock_maxmap0));
//GATED_OR GATED_maxmap1 (.CLOCK(clk), .SLEEP_CTRL(G_sleep_maxmap1), .RST_N(rst_n), .CLOCK_GATED(G_clock_maxmap1));
GATED_OR GATED_nn1a (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn1a), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn1a));
GATED_OR GATED_nn1b (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn1b), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn1b));

GATED_OR GATED_nn2a (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn2a), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn2a));
GATED_OR GATED_nn2b (.CLOCK(clk), .SLEEP_CTRL(G_sleep_nn2b), .RST_N(rst_n), .CLOCK_GATED(G_clock_nn2b));


genvar cnt_idx;
wire G_clock_input_[7:0];
generate
	for(cnt_idx=0;cnt_idx<8;cnt_idx=cnt_idx+1)begin:gated_input_array
	//
		GATED_OR GATED_input__(.CLOCK(clk), .SLEEP_CTRL(cg_en&(~((next_state==S_INPUT_1|next_state=='d5)&cnt==cnt_idx+1))), .RST_N(rst_n),	.CLOCK_GATED(G_clock_input_[cnt_idx]));
	end
endgenerate

genvar cnt_idx2;
wire G_clock_img_[14:0];
generate
	for(cnt_idx2=0;cnt_idx2<15;cnt_idx2=cnt_idx2+1)begin:gated_img_array
	//
		GATED_OR GATED_input__(.CLOCK(clk), .SLEEP_CTRL(cg_en&(~((next_state==S_INPUT_1|next_state==S_INPUT_2|next_state=='d5)&(cnt>13-cnt_idx2)))), .RST_N(rst_n),	.CLOCK_GATED(G_clock_img_[cnt_idx2]));
	end
endgenerate





always @(*) begin

	ctrl_input = !((current_state==S_IDLE|next_state==S_INPUT_1|next_state=='d5)&cnt<'d10);
	//ctrl_img0 = !(current_state==S_IDLE|next_state==S_INPUT_1|next_state==S_INPUT_2);
	ctrl_cnnmap = !((next_state==S_INPUT_1|next_state==S_INPUT_2|next_state==S_CNN_2|next_state=='d5)&(cnt>'d14|cnt<'d2));
	ctrl_maxmap0 = !((next_state==S_INPUT_1|current_state==S_INPUT_2|next_state=='d5)&(cnt<'d2|(cnt=='d25)));
	//ctrl_maxmap1 = 'b1;
	//ctrl_maxmap1 = !(next_state==S_INPUT_2|next_state==S_CNN_2|next_state==S_NN_1|next_state==S_NN_2|current_state==S_NN_2);
	ctrl_nn1a = !(next_state==S_INPUT_1|next_state=='d5&(cnt>'d25&cnt<'d28));
	//ctrl_nn1b = !(next_state==S_INPUT_2&(cnt>'d1&cnt<'d5));
	ctrl_nn1b = !(next_state==S_INPUT_2|next_state=='d5&(cnt>'d0&cnt<'d6));
	ctrl_nn2a = !(next_state==S_INPUT_2|next_state=='d5&(cnt>'d25&cnt<'d28));
	ctrl_nn2b = !(next_state==S_CNN_2|current_state==S_CNN_2|next_state=='d5);
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
				else if(cnt<'d36&(~in_valid))	next_state = 3'd5;
				else			next_state = S_INPUT_1;

	S_INPUT_2:  if(cnt=='b0)    next_state = S_CNN_2;
				else if(cnt<'d36&(~in_valid))	next_state = 3'd5;
				else			next_state = S_INPUT_2;

	S_CNN_2:	next_state = S_NN_2;
	3'd5:		next_state = S_IDLE;
	//S_NN_1:		if(cnt=='b0)	next_state = S_NN_2;
	//			else			next_state = S_NN_1;
	S_NN_2:		next_state = S_OUT;
				//if(cnt=='b0)	next_state = S_OUT;//S_L1_ACT;//S_L1_ACT;
				//else			next_state = S_NN_2;
	//S_L1_ACT:	next_state = S_OUT;


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
			always@(posedge G_clock_img_[img_idx] or negedge rst_n)begin
				if(~rst_n)							img0[img_idx] <= 'b0;
				else if(next_state == S_INPUT_1|next_state == S_INPUT_2)	
					img0[img_idx] <= img0[img_idx+1];
				else								img0[img_idx] <= img0[img_idx];
			end
		end
	end


endgenerate



/*
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
*/

always@(posedge G_clock_input or negedge rst_n)begin
	if(~rst_n)								weight_map[0][0] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d0)	weight_map[0][0] <= weight;
	else									weight_map[0][0] <= weight_map[0][0];
end
always@(posedge G_clock_input_[0] or negedge rst_n)begin
	if(~rst_n)								weight_map[1][0] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d1)	weight_map[1][0] <= weight;
	else									weight_map[1][0] <= weight_map[1][0];
end

always@(posedge G_clock_input_[1] or negedge rst_n)begin
	if(~rst_n)								weight_map[0][1] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d2)	weight_map[0][1] <= weight;
	else									weight_map[0][1] <= weight_map[0][1];
end
always@(posedge G_clock_input_[2] or negedge rst_n)begin
	if(~rst_n)								weight_map[1][1] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d3)	weight_map[1][1] <= weight;
	else									weight_map[1][1] <= weight_map[1][1];
end
/*
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
				always@(posedge clk or negedge rst_n)begin
					if(~rst_n)										kernel[ker_i][ker_j] <= 'b0;
					else if(next_state == S_INPUT_1 &(cnt<'d9))		kernel[ker_i][ker_j] <= kernel[ker_i + (ker_j == 2)][(ker_j + 1) % 3];
					else											kernel[ker_i][ker_j] <= kernel[ker_i][ker_j];
				end
			end
		end
	end
endgenerate
*/
always@(posedge G_clock_input or negedge rst_n)begin
	if(~rst_n) 			kernel[0][0] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d0)	kernel[0][0] <= ker;
	else				kernel[0][0] <= kernel[0][0];
end
always@(posedge G_clock_input_[0] or negedge rst_n)begin
	if(~rst_n) 			kernel[0][1] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d1)	kernel[0][1] <= ker;
	else				kernel[0][1] <= kernel[0][1];
end
always@(posedge G_clock_input_[1] or negedge rst_n)begin
	if(~rst_n) 			kernel[0][2] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d2)	kernel[0][2] <= ker;
	else				kernel[0][2] <= kernel[0][2];
end

always@(posedge G_clock_input_[2] or negedge rst_n)begin
	if(~rst_n) 			kernel[1][0] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d3)	kernel[1][0] <= ker;
	else				kernel[1][0] <= kernel[1][0];
end
always@(posedge G_clock_input_[3] or negedge rst_n)begin
	if(~rst_n) 			kernel[1][1] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d4)	kernel[1][1] <= ker;
	else				kernel[1][1] <= kernel[1][1];
end
always@(posedge G_clock_input_[4] or negedge rst_n)begin
	if(~rst_n) 			kernel[1][2] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d5)	kernel[1][2] <= ker;
	else				kernel[1][2] <= kernel[1][2];
end

always@(posedge G_clock_input_[5] or negedge rst_n)begin
	if(~rst_n) 			kernel[2][0] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d6)	kernel[2][0] <= ker;
	else				kernel[2][0] <= kernel[2][0];
end
always@(posedge G_clock_input_[6] or negedge rst_n)begin
	if(~rst_n) 			kernel[2][1] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d7)	kernel[2][1] <= ker;
	else				kernel[2][1] <= kernel[2][1];
end
always@(posedge G_clock_input_[7] or negedge rst_n)begin
	if(~rst_n) 			kernel[2][2] <= 'b0;
	else if(next_state==S_INPUT_1&cnt=='d8)	kernel[2][2] <= ker;
	else				kernel[2][2] <= kernel[2][2];
end


//------------------------------------------
// cnn_map
//------------------------------------------

assign section_en[0] = ((cnt>'d14)&(cnt<'d19))?'b1:'b0;	//15,16,17,18;
assign section_en[1] = ((cnt>'d20)&(cnt<'d25))?'b1:'b0;	//21,22,23,24;
assign section_en[2] = ((cnt>'d26)&(cnt<'d31))?'b1:'b0;	//27,28,29,30;
assign section_en[3] = ((cnt>'d32)|(cnt=='d0))?'b1:'b0;	//33,34,35,0;


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


always@(posedge G_clock_maxmap0 or negedge rst_n)begin
	if(~rst_n)begin
		max_map_new[0] <= 'b0; max_map_new[1] <= 'b0;
	end
	else begin
		//!if((next_state==S_INPUT_1&(cnt=='d25))|(current_state==S_INPUT_2&(cnt=='d1))|(next_state==S_INPUT_2&(cnt=='d25))|(current_state == S_CNN_2&(cnt=='d0)))begin
		if((next_state==S_INPUT_1&(cnt=='d25))|(current_state==S_INPUT_2&(cnt=='d1))|(next_state==S_INPUT_2&(cnt=='d25)))begin
		
			max_map_new[0] <= sort_result[0]; max_map_new[1] <= sort_result[1];
		end
		else begin
			max_map_new[0] <= max_map_new[0]; max_map_new[1] <= max_map_new[1];
		end
	end
end

//nn_1

always@(posedge G_clock_nn1a or negedge rst_n)begin
	if(~rst_n)begin
		nn_1[0] <= 'b0; nn_1[1] <= 'b0;
	end
	else if(current_state == S_INPUT_1&(cnt=='d26))begin
		nn_1[0] <= ratio_result_vec;
	end
	else if(current_state == S_INPUT_1&(cnt=='d27))begin
		nn_1[1] <= ratio_result_vec;
	end
	else begin
		nn_1[0] <= nn_1[0]; nn_1[1] <= nn_1[1];
	end
end


always@(posedge G_clock_nn1b or negedge rst_n)begin
	if(~rst_n)begin
		nn_1[2] <= 'b0; nn_1[3] <= 'b0;
	end
	else if(current_state == S_INPUT_2&(cnt=='d2))begin
		nn_1[3] <= ratio_result_vec;
	end
	else if(current_state == S_INPUT_2&(cnt=='d3))begin
		nn_1[2] <= ratio_result_vec;
	end
	else begin
		nn_1[2] <= nn_1[2]; nn_1[3] <= nn_1[3];
	end
end
//nn_2
always@(posedge G_clock_nn2a or negedge rst_n)begin
	if(~rst_n)begin
		nn_2[0] <= 'b0; nn_2[1] <= 'b0;
	end
	else if(current_state == S_INPUT_2&(cnt=='d26))begin
		nn_2[0] <= ratio_result_vec;
	end
	else if(current_state == S_INPUT_2&(cnt=='d27))begin
		nn_2[1] <= ratio_result_vec;
	end
	else begin
		nn_2[0] <= nn_2[0]; nn_2[1] <= nn_2[1];
	end
end

always@(posedge G_clock_nn2b or negedge rst_n)begin
	if(~rst_n)begin
		nn_2[2] <= 'b0; nn_2[3] <= 'b0;	
	end
	else if(current_state == S_CNN_2)begin
		nn_2[2] <= ratio_result_cnn; nn_2[3] <= ratio_result_vec;
	end
	else begin
		nn_2[2] <= nn_2[2]; nn_2[3] <= nn_2[3];
	end 
end

//-------------------------------------------
//	comb
//-------------------------------------------
//assign mult_a[0] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(current_state<'d4)?img0[0]:max_map_new[0]; //max_map1[1][0];
//assign mult_b[0] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(current_state<'d4)?kernel[0][0]:weight_map[0][0];
//assign mult_a[1] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(current_state<'d4)?img0[1]:max_map_new[1];//max_map1[1][1];
//assign mult_b[1] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(current_state<'d4)?kernel[0][1]:weight_map[0][1];

assign cnt_eq_2 = current_state == 'd2|current_state>'d4;

always@(*)begin
	mult_a[0] =  (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(cnt_eq_2)?sort_result[0]:img0[0]; //max_map1[1][0];
	mult_b[0] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(cnt_eq_2)?weight_map[0][0]:kernel[0][0];
	mult_a[1] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(cnt_eq_2)?sort_result[1]:img0[1];//max_map1[1][1];
	mult_b[1] = (cg_en&~(cnt<'d2|cnt>'d14))?'b0:(cnt_eq_2)?weight_map[0][1]:kernel[0][1];

	mult_a[2] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[2];
	mult_b[2] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[0][2];
	mult_a[3] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[6];
	mult_b[3] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[1][0];
	mult_a[4] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[7];
	mult_b[4] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[1][1];
	mult_a[5] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[8];
	mult_b[5] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[1][2];
	mult_a[6] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[12];
	mult_b[6] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[2][0];
	mult_a[7] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[13];
	mult_b[7] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[2][1];
	mult_a[8] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:img0[14];
	mult_b[8] = (cg_en&~((cnt<'d2|cnt>'d14)&!cnt_eq_2))?'b0:kernel[2][2];
	
end

genvar mult_indx;
generate
	for(mult_indx=0;mult_indx<9;mult_indx=mult_indx+1)begin
		assign mult_comb_result[mult_indx] = mult_a[mult_indx] * mult_b[mult_indx];
	end
endgenerate




/*
assign mult_comb_result[0] = mult_a[0] * mult_b[0];
assign mult_comb_result[1] = mult_a[1] * mult_b[1];

assign mult_comb_result[2] = img0[2] * kernel[0][2];
assign mult_comb_result[3] = img0[6] * kernel[1][0];

assign mult_comb_result[4] = img0[7] * kernel[1][1];
assign mult_comb_result[5] = img0[8] * kernel[1][2];
assign mult_comb_result[6] = img0[12] * kernel[2][0];
assign mult_comb_result[7] = img0[13] * kernel[2][1];
assign mult_comb_result[8] = img0[14] * kernel[2][2];
*/
assign add_2_result[0] = mult_comb_result[0] + mult_comb_result[1];
assign add_2_result[1] = mult_comb_result[2] + mult_comb_result[3];
assign add_2_result[2] = mult_comb_result[4] + mult_comb_result[5];
assign add_2_result[3] = mult_comb_result[6] + mult_comb_result[7];
assign add_9_result = add_2_result[0] + add_2_result[1] + add_2_result[2] + add_2_result[3] + mult_comb_result[8];

//nn1, 1st nn2
assign weight_sel[0] = (cnt<'d27&cnt>'d2)?weight_map[0][0]:weight_map[1][0];
assign weight_sel[1] = (cnt<'d27&cnt>'d2)?weight_map[0][1]:weight_map[1][1];



assign nn_a = (cnt_eq_2)?sort_result[0]:max_map_new[0];
assign nn_b = (cnt_eq_2)?sort_result[1]:max_map_new[1];

//assign nn_comb = max_map_new[0] * weight_sel[0] + max_map_new[1] * weight_sel[1];
assign nn_comb = nn_a * weight_sel[0] + nn_b * weight_sel[1];
//assign ratio_c = (current_state<'d4)?nn_comb:add_2_result[1];

//assign ratio_a = (current_state<'d4)?add_9_result:add_2_result[0];
//assign ratio_b = (current_state<'d4)?12'd2295:12'd510;
assign ratio_a = (cnt_eq_2)?add_2_result[0]:add_9_result;
assign ratio_b = (cnt_eq_2)?12'd510:12'd2295;
assign ratio_result_cnn = ratio_a/ratio_b;     //(12'd2295);
assign ratio_result_vec = nn_comb/9'd510;




assign sort_a[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[0]>cnn_map0[1])?cnn_map0[0]:cnn_map0[1];
assign sort_b[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[4]>cnn_map0[5])?cnn_map0[4]:cnn_map0[5];
assign sort_result[0] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(sort_a[0]>sort_b[0])?sort_a[0]:sort_b[0];

assign sort_a[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[2]>cnn_map0[3])?cnn_map0[2]:cnn_map0[3];
assign sort_b[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(cnn_map0[6]>cnn_map0[7])?cnn_map0[6]:cnn_map0[7];
assign sort_result[1] = (cg_en&(section_en[0]|section_en[1]|section_en[2]))?'b0:(sort_a[1]>sort_b[1])?sort_a[1]:sort_b[1];




always@(*)begin
	filter_sub_comb_a[0] = (cg_en&~(current_state>'d4))?'b0:nn_1[0];
	filter_sub_comb_a[1] = (cg_en&~(current_state>'d4))?'b0:nn_1[1];
	filter_sub_comb_a[2] = (cg_en&~(current_state>'d4))?'b0:nn_1[2];
	filter_sub_comb_a[3] = (cg_en&~(current_state>'d4))?'b0:nn_1[3];
	filter_sub_comb_b[0] = (cg_en&~(current_state>'d4))?'b0:nn_2[0];
	filter_sub_comb_b[1] = (cg_en&~(current_state>'d4))?'b0:nn_2[1];
	filter_sub_comb_b[2] = (cg_en&~(current_state>'d4))?'b0:nn_2[2];
	filter_sub_comb_b[3] = (cg_en&~(current_state>'d4))?'b0:nn_2[3];
end


assign sub_comb_result[0] = filter_sub_comb_a[0] - filter_sub_comb_b[0];//nn_1[0] - nn_2[0];
assign sub_comb_result[1] = filter_sub_comb_a[1] - filter_sub_comb_b[1];//nn_1[1] - nn_2[1];
assign sub_comb_result[2] = filter_sub_comb_a[2] - filter_sub_comb_b[2];//nn_1[2] - nn_2[2];
assign sub_comb_result[3] = filter_sub_comb_a[3] - filter_sub_comb_b[3];//nn_1[3] - nn_2[3];

assign sub_comb_result_in[0] = filter_sub_comb_b[0] - filter_sub_comb_a[0];//nn_1[0] - nn_2[0];
assign sub_comb_result_in[1] = filter_sub_comb_b[1] - filter_sub_comb_a[1];//nn_1[1] - nn_2[1];
assign sub_comb_result_in[2] = filter_sub_comb_b[2] - filter_sub_comb_a[2];//nn_1[2] - nn_2[2];
assign sub_comb_result_in[3] = filter_sub_comb_b[3] - filter_sub_comb_a[3];//nn_1[3] - nn_2[3];





assign L1_partial_comb[0] = (sub_comb_result[0][8])?sub_comb_result_in[0]:sub_comb_result[0];
assign L1_partial_comb[1] = (sub_comb_result[1][8])?sub_comb_result_in[1]:sub_comb_result[1];
assign L1_partial_comb[2] = (sub_comb_result[2][8])?sub_comb_result_in[2]:sub_comb_result[2];
assign L1_partial_comb[3] = (sub_comb_result[3][8])?sub_comb_result_in[3]:sub_comb_result[3];

assign L1_comb_result = L1_partial_comb[0] + L1_partial_comb[1] + L1_partial_comb[2] + L1_partial_comb[3];

endmodule