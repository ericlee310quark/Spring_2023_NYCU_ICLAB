/*
 
****************************************
Report : area
Design : NN
Version: R-2020.09
Date   : Mon Mar 20 04:18:29 2023
****************************************

Library(s) Used:

    slow (File: /RAID2/COURSE/iclab/iclabta01/umc018/Synthesis/slow.db)

Number of ports:                          196
Number of nets:                         55632
Number of cells:                        52832
Number of combinational cells:          50845
Number of sequential cells:              1985
Number of macros/black boxes:               0
Number of buf/inv:                       8467
Number of references:                     162

Combinational area:            1048867.153093
Buf/Inv area:                    98221.941875
Noncombinational area:          129044.362988
Macro/Black Box area:                0.000000
Net Interconnect area:      undefined  (No wire load specified)

Total cell area:               1177911.516081
Total area:                 undefined
1
*/







//synopsys translate_off
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_add.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mult.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mac.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_recip.v"
//synopsys translate_on




module NN(
	// Input signals
	clk,
	rst_n,
	in_valid,
	weight_u,
	weight_w,
	weight_v,
	data_x,
	data_h,
	// Output signals
	out_valid,
	out
);

//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------
parameter IDLE = 1'b0;
parameter INPUT = 1'b1;

parameter POINT_ONE = 32'b0011_1101_1100_1100_1100_1100_1100_1101;
parameter ONE = 32'b0011_1111_1000_0000_0000_0000_0000_0000;
// IEEE floating point paramenters
parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;
parameter inst_faithful_round = 0;
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input  clk, rst_n, in_valid;
input [inst_sig_width+inst_exp_width:0] weight_u, weight_w, weight_v;
input [inst_sig_width+inst_exp_width:0] data_x,data_h;
output reg	out_valid;
output reg [inst_sig_width+inst_exp_width:0] out;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------

reg [inst_sig_width+inst_exp_width:0] w_u [8:0], w_w [8:0], w_v [8:0];
reg [inst_sig_width+inst_exp_width:0] d_x [8:0];
reg [inst_sig_width+inst_exp_width:0] d_h [2:0];

reg [inst_sig_width+inst_exp_width:0] h_result [2:0];

reg [inst_sig_width+inst_exp_width:0] x_mac_result_L00, x_mac_result_L10;
reg [inst_sig_width+inst_exp_width:0] x_mac_result_L01, x_mac_result_L11, x_mac_result_L21;
reg [inst_sig_width+inst_exp_width:0] x_mac_result_L02, x_mac_result_L12, x_mac_result_L22;
//reg [inst_sig_width+inst_exp_width:0] x_mac_result_L00, x_mac_result_L01, x_mac_result_L02;
//reg [inst_sig_width+inst_exp_width:0] x_mac_result_L10, x_mac_result_L11, x_mac_result_L12;
//reg [inst_sig_width+inst_exp_width:0] x_mac_result_L20, x_mac_result_L21, x_mac_result_L22;

reg [inst_sig_width+inst_exp_width:0] h_mac_result_L00, h_mac_result_L10;
reg [inst_sig_width+inst_exp_width:0] h_mac_result_L01, h_mac_result_L11, h_mac_result_L21;
//reg [inst_sig_width+inst_exp_width:0] h_mac_result_L02, h_mac_result_L12, h_mac_result_L22;

//reg [inst_sig_width+inst_exp_width:0] h_mac_result_L00, h_mac_result_L01, h_mac_result_L02;
//reg [inst_sig_width+inst_exp_width:0] h_mac_result_L10, h_mac_result_L11, h_mac_result_L12;
//reg [inst_sig_width+inst_exp_width:0] h_mac_result_L20, h_mac_result_L21, h_mac_result_L22;

reg [inst_sig_width+inst_exp_width:0] v_mac_result_L00, v_mac_result_L10, v_mac_result_L20;
//reg [inst_sig_width+inst_exp_width:0] v_mac_result_L00, v_mac_result_L01, v_mac_result_L02;
//reg [inst_sig_width+inst_exp_width:0] v_mac_result_L10, v_mac_result_L11, v_mac_result_L12;
//reg [inst_sig_width+inst_exp_width:0] v_mac_result_L20, v_mac_result_L21, v_mac_result_L22;

//reg [inst_sig_width+inst_exp_width:0] leaky_result;
reg [inst_sig_width+inst_exp_width:0] exp_reg;
//reg [inst_sig_width+inst_exp_width:0] add_exp_reg;


reg [inst_sig_width+inst_exp_width:0] ans[1:0];

reg [5:0] cnt;
wire [5:0] cnt_comb;
reg current_stage, next_stage;

reg [inst_sig_width+inst_exp_width:0] m0_a, m0_b;//, m0_z;
wire [inst_sig_width+inst_exp_width:0] m0_z;
reg [inst_sig_width+inst_exp_width:0] a0_a, a0_b;//, a0_z;
wire [inst_sig_width+inst_exp_width:0] a0_z;
reg [inst_sig_width+inst_exp_width:0] a1_a, a1_b;//, a1_z;
wire [inst_sig_width+inst_exp_width:0] a1_z;

reg [inst_sig_width+inst_exp_width:0] mac1_a, mac1_b, mac1_c;
wire [inst_sig_width+inst_exp_width:0] mac1_z;
reg [inst_sig_width+inst_exp_width:0] mac2_a, mac2_b, mac2_c;//, mac2_z;
wire [inst_sig_width+inst_exp_width:0] mac2_z;
reg [inst_sig_width+inst_exp_width:0] mac3_a, mac3_b, mac3_c;//, mac3_z;
wire [inst_sig_width+inst_exp_width:0] mac3_z;
reg [inst_sig_width+inst_exp_width:0] mac4_a, mac4_b, mac4_c;//, mac4_z;
wire [inst_sig_width+inst_exp_width:0] mac4_z;
reg [inst_sig_width+inst_exp_width:0] mac5_a, mac5_b, mac5_c;//, mac5_z;
wire [inst_sig_width+inst_exp_width:0] mac5_z;

//reg [inst_sig_width+inst_exp_width:0] rec0_a;//, rec0_z;
wire [inst_sig_width+inst_exp_width:0] rec0_z;
reg [inst_sig_width+inst_exp_width:0] exp0_a;//, exp0_z;
wire [inst_sig_width+inst_exp_width:0] exp0_z;
wire [inst_sig_width+inst_exp_width:0] output_data;


wire[inst_sig_width+inst_exp_width:0] m1_z, m2_z, m3_z, m4_z, m5_z;

//---------------------------------------------------------------------
//   DesignWare
//---------------------------------------------------------------------
DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M0 (.a(m0_a), .b(m0_b), .rnd(3'b000), .z(m0_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A0 (.a(a0_a), .b(a0_b), .rnd(3'b000), .z(a0_z));
//DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M1 (.a(mult_a), .b(mult_b), .rnd(3'b000), .z(mult_out));
//DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A1 (.a(add_a), .b(add_b), .rnd(3'b000), .z(add_out));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A6 (.a(a1_a), .b(a1_b), .rnd(3'b000), .z(a1_z));

DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M1 (.a(mac1_a), .b(mac1_b), .rnd(3'b000), .z(m1_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A1 (.a(m1_z), .b(mac1_c), .rnd(3'b000), .z(mac1_z));

DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M2 (.a(mac2_a), .b(mac2_b), .rnd(3'b000), .z(m2_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A2 (.a(m2_z), .b(mac2_c), .rnd(3'b000), .z(mac2_z));

DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M3 (.a(mac3_a), .b(mac3_b), .rnd(3'b000), .z(m3_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A3 (.a(m3_z), .b(mac3_c), .rnd(3'b000), .z(mac3_z));

DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M4 (.a(mac4_a), .b(mac4_b), .rnd(3'b000), .z(m4_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A4 (.a(m4_z), .b(mac4_c), .rnd(3'b000), .z(mac4_z));

DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M5 (.a(mac5_a), .b(mac5_b), .rnd(3'b000), .z(m5_z));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A5 (.a(m5_z), .b(mac5_c), .rnd(3'b000), .z(mac5_z));

/*
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MAC_1 (.a(mac1_a), .b(mac1_b), .c(mac1_c), .rnd(3'b000), .z(mac1_z));
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MAC_2 (.a(mac2_a), .b(mac2_b), .c(mac2_c), .rnd(3'b000), .z(mac2_z));
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MAC_3 (.a(mac3_a), .b(mac3_b), .c(mac3_c), .rnd(3'b000), .z(mac3_z));
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MAC_4 (.a(mac4_a), .b(mac4_b), .c(mac4_c), .rnd(3'b000), .z(mac4_z));
DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MAC_5 (.a(mac5_a), .b(mac5_b), .c(mac5_c), .rnd(3'b000), .z(mac5_z));
*/
DW_fp_recip #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_faithful_round) REC_0 (.a(a1_z), .rnd(3'b000), .z(rec0_z));
//DW_fp_recip #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_faithful_round) REC_0 (.a(rec0_a), .rnd(3'b000), .z(rec0_z));
DW_fp_exp #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch) EXP_0 (.a(exp0_a), .z(exp0_z) );

//---------------------------------------------------------------------
//   ALGORITHM
//---------------------------------------------------------------------
//=================================
//		OUTPUT CTR
//================================
assign output_data = (cnt>'d20)?rec0_z:ans[0];


always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)	out_valid <= 'b0;
	else if(cnt>'d23)	out_valid <= 'b0;
	else if(cnt>'d14)	out_valid <= 'b1;
end
always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)	out <= 'b0;
	else if(cnt>'d23)	out <= 'b0;
	else if(cnt>'d14)	out <= output_data;
end
//=================================
//		FSM CTR
//================================
always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)	current_stage <= IDLE;
	else current_stage <= next_stage;
end

always@(*)begin
	case(current_stage)
	IDLE: 	if(in_valid) 	next_stage = INPUT;
			else			next_stage = IDLE;
	INPUT: 	if(cnt=='d24)		next_stage =IDLE;
			else			next_stage = INPUT;
	default:				next_stage = IDLE;
	endcase
end


//=================================
//		Counter CTR
//================================
assign cnt_comb = cnt + 'd1;
always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)	cnt <= 'b0;
	else if((current_stage==INPUT)||(next_stage == INPUT))	cnt <= cnt_comb;
	else if(current_stage==IDLE)							cnt <= 'd0;
	else cnt <= cnt;
end

integer i;
always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)begin
		for(i=0;i<'d9;i=i+'d1)begin
			w_u[i] <= 'd0;
			w_v[i] <= 'd0;
			w_w[i] <= 'd0;
			d_x[i] <= 'd0;
		end

	end
	else if ((in_valid)&&(cnt<'d9)) begin
		w_u[cnt] <= weight_u;
		w_v[cnt] <= weight_v;
		w_w[cnt] <= weight_w;
		d_x[cnt] <= data_x;
	end
	else begin
		w_u[0] <= w_u[0];
		w_v[0] <= w_v[0];
		w_w[0] <= w_w[0];
		d_x[0] <= d_x[0];
	end
end

always@(posedge clk or  negedge rst_n)begin
	if(~rst_n)begin
		d_h[0] <= 'd0;	d_h[1] <= 'd0;	d_h[2] <= 'd0;
	end
	else if ((in_valid)&&(cnt<'d3)) begin
		d_h[cnt] <= data_h;
	end
	else begin
		d_h[0] <= d_h[0];
	end
end


always@(*)begin
	case(cnt)
	5'd0:begin
		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a  = 'b0;
	end
	5'd1: begin
		mac1_a = w_u[0];	mac1_b = d_x[0];	mac1_c = 'b0;
		mac2_a = w_w[0];	mac2_b = d_h[0];	mac2_c = 'b0;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a  = 'b0;
	end
	5'd2:begin
		mac1_a = w_u[1];	mac1_b = d_x[1];	mac1_c = x_mac_result_L00;
		mac2_a = w_w[1];	mac2_b = d_h[1];	mac2_c = h_mac_result_L00;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd3:begin
		mac1_a = w_u[2];	mac1_b = d_x[2];	mac1_c = x_mac_result_L00;
		mac2_a = w_w[2];	mac2_b = d_h[2];	mac2_c = h_mac_result_L00;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd4:begin
		mac1_a = w_u[3];	mac1_b = d_x[0];	mac1_c = 'b0;
		mac2_a = w_w[3];	mac2_b = d_h[0];	mac2_c = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = w_u[0];	mac4_b = d_x[3]; 	mac4_c = 'b0;
		mac5_a = w_u[3];	mac5_b = d_x[3]; 	mac5_c = 'b0;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L00;		a0_b   = h_mac_result_L00;
		
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd5:begin
		mac1_a = w_u[4];	mac1_b = d_x[1];				mac1_c = x_mac_result_L10;
		mac2_a = w_w[4];	mac2_b = d_h[1];				mac2_c = h_mac_result_L10;
		mac3_a = w_w[0];	mac3_b = h_result[0];	 		mac3_c = 'b0;
		mac4_a = w_u[1];	mac4_b = d_x[4]; 				mac4_c = x_mac_result_L01;
		mac5_a = w_u[4];	mac5_b = d_x[4]; 				mac5_c = x_mac_result_L11;
		m0_a   = w_v[0];	m0_b   = h_result[0];	
		
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd6:begin
		mac1_a = w_u[5];	mac1_b = d_x[2];				mac1_c = x_mac_result_L10;
		mac2_a = w_w[5];	mac2_b = d_h[2];				mac2_c = h_mac_result_L10;
		mac3_a = w_w[3];	mac3_b = h_result[0];	 		mac3_c = 'b0;
		mac4_a = w_u[2];	mac4_b = d_x[5]; 				mac4_c = x_mac_result_L01;
		mac5_a = w_u[5];	mac5_b = d_x[5]; 				mac5_c = x_mac_result_L11;
		m0_a   = w_v[3];	m0_b   = h_result[0];

		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd7:begin
		mac1_a = w_u[6];	mac1_b = d_x[0];				mac1_c = 'b0;
		mac2_a = w_w[6];	mac2_b = d_h[0];				mac2_c = 'b0;
		mac3_a = w_w[6];	mac3_b = h_result[0];	 		mac3_c = 'b0;
		mac4_a = w_u[6];	mac4_b = d_x[3]; 				mac4_c = 'b0;
		mac5_a = w_u[0];	mac5_b = d_x[6]; 				mac5_c = 'b0;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L10;		a0_b   = h_mac_result_L10;

		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd8:begin
		mac1_a = w_u[7];	mac1_b = d_x[1];				mac1_c = x_mac_result_L00;
		mac2_a = w_w[7];	mac2_b = d_h[1];				mac2_c = h_mac_result_L00;
		mac3_a = w_w[1];	mac3_b = h_result[1]; 			mac3_c = h_mac_result_L01;
		mac4_a = w_u[7];	mac4_b = d_x[4]; 				mac4_c = x_mac_result_L21;
		mac5_a = w_u[3];	mac5_b = d_x[6]; 				mac5_c = 'b0;
		m0_a   = w_v[6];	m0_b   = h_result[0];

		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd9:begin
		mac1_a = w_u[8];	mac1_b = d_x[2];				mac1_c = x_mac_result_L00;
		mac2_a = w_w[8];	mac2_b = d_h[2];				mac2_c = h_mac_result_L00;
		mac3_a = w_w[4];	mac3_b = h_result[1]; 			mac3_c = h_mac_result_L11;
		mac4_a = w_u[8];	mac4_b = d_x[5]; 				mac4_c = x_mac_result_L21;
		mac5_a = w_u[1];	mac5_b = d_x[7]; 				mac5_c = x_mac_result_L02;//x_mac_result_L02;
		m0_a   = w_u[6];	m0_b   = d_x[6];

		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd10:begin
		mac1_a = w_u[2];	mac1_b = d_x[8];				mac1_c = x_mac_result_L02;//x_mac_result_L02;
		mac2_a = w_v[1];	mac2_b = h_result[1];			mac2_c = v_mac_result_L00;
		mac3_a = w_w[7];	mac3_b = h_result[1]; 			mac3_c = h_mac_result_L21;
		mac4_a = w_u[4];	mac4_b = d_x[7]; 				mac4_c = x_mac_result_L12;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L00;		a0_b   = h_mac_result_L00;

		mac5_a = 'b0;		mac5_b = 'b0;	 				mac5_c = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd11:begin
		mac1_a = w_u[5];	mac1_b = d_x[8];				mac1_c = x_mac_result_L12;
		mac2_a = w_v[2];	mac2_b = h_result[2];			mac2_c = v_mac_result_L00;
		mac3_a = w_v[4];	mac3_b = h_result[1]; 			mac3_c = v_mac_result_L10;
		mac4_a = w_u[7];	mac4_b = d_x[7]; 				mac4_c = x_mac_result_L22;
		mac5_a = w_w[2];	mac5_b = h_result[2];	 		mac5_c = h_mac_result_L01;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	5'd12:begin
		mac1_a = w_u[8];	mac1_b = d_x[8];				mac1_c = x_mac_result_L22;
		mac2_a = w_v[5];	mac2_b = h_result[2];			mac2_c = v_mac_result_L10;
		mac3_a = w_v[7];	mac3_b = h_result[1]; 			mac3_c = v_mac_result_L20;
		mac5_a = w_w[5];	mac5_b = h_result[2];	 		mac5_c = h_mac_result_L11;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L01;		a0_b   = h_mac_result_L01;
		exp0_a  = v_mac_result_L00;//{(~v_mac_result_L00[31]),v_mac_result_L00[30:0]};

		mac4_a = 'b0;		mac4_b = 'b0; 					mac4_c = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		//rec0_a = 'b0;

	end
	5'd13:begin
		mac1_a = w_v[0];	mac1_b = h_result[0];			mac1_c = 'b0;
		mac2_a = w_v[8];	mac2_b = h_result[2];			mac2_c = v_mac_result_L20;
		mac4_a = w_w[0];	mac4_b = h_result[0];			mac4_c = 'b0;
		mac5_a = w_w[8];	mac5_b = h_result[2];	 		mac5_c = h_mac_result_L21;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L11;		a0_b   = h_mac_result_L11;
		exp0_a = v_mac_result_L10;//{(~v_mac_result_L10[31]),v_mac_result_L10[30:0]};
		a1_a   = exp_reg;		a1_b   = ONE;


		mac3_a = 'b0;	mac3_b = 'b0; 			mac3_c = 'b0;
		//rec0_a = 'b0;

	end
	5'd14:begin
		mac1_a = w_v[1];	mac1_b = h_result[1];			mac1_c = v_mac_result_L00;
		mac2_a = w_v[3];	mac2_b = h_result[0];			mac2_c = 'b0;
		mac4_a = w_w[1];	mac4_b = h_result[1];			mac4_c = h_mac_result_L01;
		mac5_a = w_w[3];	mac5_b = h_result[0];	 		mac5_c = 'b0;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L21;		a0_b   = h_mac_result_L21;
		exp0_a = v_mac_result_L20;//{(~v_mac_result_L20[31]),v_mac_result_L20[30:0]};//v_mac_result_L20;
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;
		

		mac3_a = 'b0;	mac3_b = 'b0; 			mac3_c = 'b0;
		
	end
	5'd15:begin
		mac1_a = w_v[2];	mac1_b = h_result[2];			mac1_c = v_mac_result_L00;
		mac2_a = w_v[4];	mac2_b = h_result[1];			mac2_c = v_mac_result_L10;
		mac3_a = w_v[6];	mac3_b = h_result[0]; 			mac3_c = 'b0;
		mac4_a = w_w[2];	mac4_b = h_result[2];			mac4_c = h_mac_result_L01;
		mac5_a = w_w[4];	mac5_b = h_result[1];	 		mac5_c = h_mac_result_L11;
		m0_a   = w_w[6];	m0_b   = h_result[0];
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;
		
		a0_a   = 'b0;		a0_b   = 'b0;
		exp0_a = 'b0;
	end
	5'd16:begin
		mac2_a = w_v[5];	mac2_b = h_result[2];			mac2_c = v_mac_result_L10;
		mac3_a = w_v[7];	mac3_b = h_result[1]; 			mac3_c = v_mac_result_L20;
		mac4_a = w_w[5];	mac4_b = h_result[2];			mac4_c = h_mac_result_L11;
		mac5_a = w_w[7];	mac5_b = h_result[1];	 		mac5_c = h_mac_result_L21;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L02 ;		a0_b   = h_mac_result_L01;	//x_mac_result_L02
		exp0_a = v_mac_result_L00;//{(~v_mac_result_L01[31]),v_mac_result_L01[30:0]};//v_mac_result_L01;
		//rec0_a = add_exp_reg;


		mac1_a = 'b0;		mac1_b = 'b0;		mac1_c = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
			
	end
	5'd17:begin
		mac1_a = w_v[0];	mac1_b = h_result[0];			mac1_c = 'b0;
		mac3_a = w_v[8];	mac3_b = h_result[2]; 			mac3_c = v_mac_result_L20;
		mac5_a = w_w[8];	mac5_b = h_result[2];	 		mac5_c = h_mac_result_L21;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L12;		a0_b   = h_mac_result_L11;
		exp0_a = v_mac_result_L10;//{(~v_mac_result_L11[31]),v_mac_result_L11[30:0]};//v_mac_result_L11;
		a1_a   = exp_reg;		a1_b   = ONE;

		mac2_a = 'b0;		mac2_b = 'b0;		mac2_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0;		mac4_c = 'b0;
		//rec0_a = 'b0;
	end
	5'd18:begin
		mac1_a = w_v[1];	mac1_b = h_result[1];			mac1_c = v_mac_result_L00;
		mac2_a = w_v[3];	mac2_b = h_result[0];			mac2_c = 'b0;
		m0_a   = a0_z;		m0_b   = POINT_ONE;
		a0_a   = x_mac_result_L22;		a0_b   = h_mac_result_L21;
		exp0_a = v_mac_result_L20;//{(~v_mac_result_L21[31]),v_mac_result_L21[30:0]};//v_mac_result_L21;
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;

		mac3_a = 'b0;	mac3_b = 'b0; 			mac3_c = 'b0;
		mac4_a = 'b0;	mac4_b = 'b0;			mac4_c = 'b0;
		mac5_a = 'b0;	mac5_b = 'b0;	 		mac5_c = 'b0;
	end
	5'd19:begin
		mac1_a = w_v[2];	mac1_b = h_result[2];			mac1_c = v_mac_result_L00;
		mac2_a = w_v[4];	mac2_b = h_result[1];			mac2_c = v_mac_result_L10;
		mac3_a = w_v[6];	mac3_b = h_result[0]; 		mac3_c = 'b0;
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;

		mac4_a = 'b0;		mac4_b = 'b0;		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0;	 	mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		exp0_a = 'b0;
	end
	5'd20:begin
		mac2_a = w_v[5];	mac2_b = h_result[2];			mac2_c = v_mac_result_L10;
		mac3_a = w_v[7];	mac3_b = h_result[1];			mac3_c = v_mac_result_L20;
		exp0_a = v_mac_result_L00;//{(~v_mac_result_L02[31]),v_mac_result_L02[30:0]};//v_mac_result_L02;
		//rec0_a = add_exp_reg;

		mac1_a = 'b0;		mac1_b = 'b0;		mac1_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0;		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0;	 	mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
	end
	5'd21:begin
		mac3_a = w_v[8];	mac3_b = h_result[2];			mac3_c = v_mac_result_L20;
		exp0_a = v_mac_result_L10;// {(~v_mac_result_L12[31]),v_mac_result_L12[30:0]};//v_mac_result_L12;
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;

		mac1_a = 'b0;		mac1_b = 'b0;		mac1_c = 'b0;
		mac2_a = 'b0;		mac2_b = 'b0;		mac2_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0;		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0;	 	mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
	end
	5'd22:begin
		exp0_a  = v_mac_result_L20;//{(~v_mac_result_L22[31]),v_mac_result_L22[30:0]};//v_mac_result_L22;
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;

		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
	end
	5'd23:begin
		a1_a   = exp_reg;		a1_b   = ONE;
		//rec0_a = add_exp_reg;

		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		exp0_a = 'b0;
	end
	/*
	5'd24:begin
		//rec0_a = add_exp_reg;

		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		//exp0_a = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
	end
	*/
	5'd24,5'd25, 5'd26, 5'd27, 5'd28, 5'd29, 5'd30, 5'd31:begin
		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;

	end
	default:begin
		mac1_a = 'b0;	mac1_b = 'b0;	mac1_c = 'b0;
		mac2_a = 'b0;	mac2_b = 'b0;	mac2_c = 'b0;

		m0_a   = 'b0;		m0_b   = 'b0;
		a0_a   = 'b0;		a0_b   = 'b0;
		a1_a   = 'b0;		a1_b   = 'b0;
		mac3_a = 'b0;		mac3_b = 'b0; 		mac3_c = 'b0;
		mac4_a = 'b0;		mac4_b = 'b0; 		mac4_c = 'b0;
		mac5_a = 'b0;		mac5_b = 'b0; 		mac5_c = 'b0;
		//rec0_a = 'b0;
		exp0_a = 'b0;
	end
	endcase
end


always@(posedge clk)begin
	if(cnt=='d0)begin
		x_mac_result_L00 <= 'b0; x_mac_result_L01 <= 'b0; x_mac_result_L02 <= 'b0;
		x_mac_result_L10 <= 'b0; x_mac_result_L11 <= 'b0; x_mac_result_L12 <= 'b0;
		x_mac_result_L21 <= 'b0; x_mac_result_L22 <= 'b0;
		
		h_mac_result_L00 <= 'b0; h_mac_result_L01 <= 'b0; //h_mac_result_L02 <= 'b0;
		h_mac_result_L10 <= 'b0; h_mac_result_L11 <= 'b0; h_mac_result_L11 <= 'b0;
		h_mac_result_L21 <= 'b0; //h_mac_result_L22 <= 'b0;
		
		v_mac_result_L00 <= 'b0; v_mac_result_L10 <= 'b0; v_mac_result_L20 <= 'b0;
		//v_mac_result_L00 <= 'b0; v_mac_result_L01 <= 'b0; v_mac_result_L02 <= 'b0;
		//v_mac_result_L10 <= 'b0; v_mac_result_L11 <= 'b0; v_mac_result_L12 <= 'b0;
		//v_mac_result_L20 <= 'b0; v_mac_result_L21 <= 'b0; v_mac_result_L22 <= 'b0;
		
		h_result[0] <= 'b0; h_result[1] <= 'b0; h_result[2] <= 'b0;
		//h_result[3] <= 'b0; h_result[4] <= 'b0; h_result[5] <= 'b0;
		//h_result[6] <= 'b0; h_result[7] <= 'b0; h_result[8] <= 'b0;

		exp_reg <= 'b0;
		//add_exp_reg <='b0;
		ans[0] <= 'b0; ans[1] <= 'b0; //ans[2] <='b0;
		//ans[3] <= 'b0; ans[4] <= 'b0; ans[5] <='b0;
		//ans[6] <= 'b0; ans[7] <= 'b0; ans[8] <='b0;
	end
	else begin

		case(cnt)
		5'd0: begin
			x_mac_result_L00 <= 'b0; x_mac_result_L01 <= 'b0; x_mac_result_L02 <= 'b0;
			x_mac_result_L10 <= 'b0; x_mac_result_L11 <= 'b0; x_mac_result_L12 <= 'b0;
			x_mac_result_L21 <= 'b0; x_mac_result_L22 <= 'b0;
			
			h_mac_result_L00 <= 'b0; h_mac_result_L01 <= 'b0; //h_mac_result_L02 <= 'b0;
			h_mac_result_L10 <= 'b0; h_mac_result_L11 <= 'b0; h_mac_result_L11 <= 'b0;
			h_mac_result_L21 <= 'b0; //h_mac_result_L22 <= 'b0;
			
			v_mac_result_L00 <= 'b0; v_mac_result_L10 <= 'b0; v_mac_result_L20 <= 'b0;
			//v_mac_result_L00 <= 'b0; v_mac_result_L01 <= 'b0; v_mac_result_L02 <= 'b0;
			//v_mac_result_L10 <= 'b0; v_mac_result_L11 <= 'b0; v_mac_result_L12 <= 'b0;
			//v_mac_result_L20 <= 'b0; v_mac_result_L21 <= 'b0; v_mac_result_L22 <= 'b0;
			
			h_result[0] <= 'b0; h_result[1] <= 'b0; h_result[2] <= 'b0;
			//h_result[3] <= 'b0; h_result[4] <= 'b0; h_result[5] <= 'b0;
			//h_result[6] <= 'b0; h_result[7] <= 'b0; h_result[8] <= 'b0;

			exp_reg <= 'b0;
			//add_exp_reg <='b0;
			ans[0] <= 'b0; ans[1] <= 'b0;
		end
		5'd1: begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
		end
		5'd2:begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
		end
		5'd3:begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
		end
		5'd4:begin
			x_mac_result_L10 <= mac1_z;
			h_mac_result_L10 <= mac2_z;
			x_mac_result_L01 <= mac4_z;
			x_mac_result_L11 <= mac5_z;
			if(a0_z[31])	h_result[0] <= m0_z;
			else			h_result[0] <= a0_z;
		end
		5'd5:begin
			x_mac_result_L10 <= mac1_z;
			h_mac_result_L10 <= mac2_z;
			h_mac_result_L01 <= mac3_z;
			x_mac_result_L01 <= mac4_z;
			x_mac_result_L11 <= mac5_z;
			v_mac_result_L00 <= m0_z;
		end
		5'd6:begin
			x_mac_result_L10 <= mac1_z;
			h_mac_result_L10 <= mac2_z;
			h_mac_result_L11 <= mac3_z;
			x_mac_result_L01 <= mac4_z;
			x_mac_result_L11 <= mac5_z;
			v_mac_result_L10 <= m0_z;
			x_mac_result_L00 <= 'd0;
		end
		5'd7:begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
			h_mac_result_L21 <= mac3_z;
			x_mac_result_L21 <= mac4_z;
			x_mac_result_L02 <= mac5_z;	//x_mac_result_L02
			if(a0_z[31])	h_result[1] <= m0_z;
			else			h_result[1] <= a0_z;
		end
		5'd8:begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
			h_mac_result_L01 <= mac3_z;
			x_mac_result_L21 <= mac4_z;
			x_mac_result_L12 <= mac5_z;
			v_mac_result_L20 <= m0_z;
		end
		5'd9:begin
			x_mac_result_L00 <= mac1_z;
			h_mac_result_L00 <= mac2_z;
			h_mac_result_L11 <= mac3_z;
			x_mac_result_L21 <= mac4_z;
			x_mac_result_L02 <= mac5_z; //x_mac_result_L02
			x_mac_result_L22 <= m0_z;
		end
		5'd10:begin
			x_mac_result_L02 <= mac1_z; //x_mac_result_L02
			v_mac_result_L00 <= mac2_z;
			h_mac_result_L21 <= mac3_z;
			x_mac_result_L12 <= mac4_z;
			if(a0_z[31])	h_result[2] <= m0_z;
			else			h_result[2] <= a0_z;
		end
		5'd11:begin
			x_mac_result_L12 <= mac1_z;
			v_mac_result_L00 <= {(~mac2_z[31]),mac2_z[30:0]};
			v_mac_result_L10 <= mac3_z;
			x_mac_result_L22 <= mac4_z;
			h_mac_result_L01 <= mac5_z;
		end
		5'd12:begin
			x_mac_result_L22 <= mac1_z;
			v_mac_result_L10 <= {(~mac2_z[31]),mac2_z[30:0]};//mac2_z;
			v_mac_result_L20 <= mac3_z;
			h_mac_result_L11 <= mac5_z;
			if(a0_z[31])	h_result[0] <= m0_z;
			else			h_result[0] <= a0_z;
			exp_reg <= exp0_z;
		end
		5'd13:begin
			v_mac_result_L00 <= mac1_z;
			v_mac_result_L20 <= {(~mac2_z[31]),mac2_z[30:0]};//mac2_z;
			h_mac_result_L01 <= mac4_z;
			h_mac_result_L21 <= mac5_z;
			if(a0_z[31])	h_result[1] <= m0_z;
			else			h_result[1] <= a0_z;
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
			//!
			ans[0] <= rec0_z;
		end
		5'd14:begin			////////////////////
			v_mac_result_L00 <= mac1_z;
			v_mac_result_L10 <= mac2_z;
			h_mac_result_L01 <= mac4_z;
			h_mac_result_L11 <= mac5_z;
			if(a0_z[31])	h_result[2] <= m0_z;
			else			h_result[2] <= a0_z;
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
			//ans[0] <= rec0_z;
			//!
			ans[1] <= rec0_z;
		end
		5'd15:begin			////////////////////
			v_mac_result_L00 <= {(~mac1_z[31]),mac1_z[30:0]};//mac1_z;
			v_mac_result_L10 <= mac2_z;
			v_mac_result_L20 <= mac3_z;
			h_mac_result_L01 <= mac4_z;
			h_mac_result_L11 <= mac5_z;
			h_mac_result_L21 <= m0_z;
			//add_exp_reg <= a1_z;
			//ans[1] <= rec0_z;
			//!
			ans[1] <= rec0_z;
			ans[0] <= ans[1];
		end
		5'd16:begin			////////////////////
			v_mac_result_L10 <= {(~mac2_z[31]),mac2_z[30:0]};//mac2_z;
			v_mac_result_L20 <= mac3_z;
			h_mac_result_L11 <= mac4_z;
			h_mac_result_L21 <= mac5_z;
			if(a0_z[31])	h_result[0] <= m0_z;
			else			h_result[0] <= a0_z;			
			exp_reg <= exp0_z;
			//ans[1] <= rec0_z;
			//ans[0] <= ans[1];
			//!
			ans[0] <= ans[1];
		end
		5'd17:begin			////////////////////
			v_mac_result_L00 <= mac1_z;
			v_mac_result_L20 <= {(~mac3_z[31]),mac3_z[30:0]};//mac3_z;
			h_mac_result_L21 <= mac5_z;
			if(a0_z[31])	h_result[1] <= m0_z;
			else			h_result[1] <= a0_z;			
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
			//ans[0] <= ans[1];
			//!
			ans[0] <= rec0_z;
		end
		5'd18:begin			////////////////////
			v_mac_result_L00 <= mac1_z;
			v_mac_result_L10 <= mac2_z;
			if(a0_z[31])	h_result[2] <= m0_z;
			else			h_result[2] <= a0_z;			
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
			//ans[3] <= rec0_z;

			//ans[0] <= rec0_z;
			//!
			ans[0] <= rec0_z;

		end
		5'd19:begin			////////////////////
			v_mac_result_L00 <= {(~mac1_z[31]),mac1_z[30:0]};//mac1_z;
			v_mac_result_L10 <= mac2_z;
			v_mac_result_L20 <= mac3_z;
			//add_exp_reg <= a1_z;
			//ans[4] <= rec0_z;
			//ans[0] <= rec0_z;

			//!
			ans[0] <= rec0_z;
		end
		5'd20:begin			////////////////////
			v_mac_result_L10 <= {(~mac2_z[31]),mac2_z[30:0]};//mac2_z;
			v_mac_result_L20 <= mac3_z;
			exp_reg <= exp0_z;
			//ans[5] <= rec0_z;
			//ans[0] <= rec0_z;
		end
		5'd21:begin			////////////////////
			v_mac_result_L20 <= {(~mac3_z[31]),mac3_z[30:0]};//mac3_z;
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
		end
		5'd22:begin			////////////////////		
			exp_reg <= exp0_z;
			//add_exp_reg <= a1_z;
			//ans[6] <= rec0_z;
		end
		//5'd23:begin			////////////////////		
			//add_exp_reg <= a1_z;
			//ans[7] <= rec0_z;
		//end
		5'd23,5'd24, 5'd25, 5'd26, 5'd27, 5'd28, 5'd29, 5'd30, 5'd31:begin			////////////////////		
			x_mac_result_L00 <= x_mac_result_L00; x_mac_result_L01 <= x_mac_result_L01; x_mac_result_L02 <= x_mac_result_L02;
			x_mac_result_L10 <= x_mac_result_L10; x_mac_result_L11 <= x_mac_result_L11; x_mac_result_L12 <= x_mac_result_L12;
			x_mac_result_L21 <= x_mac_result_L21; x_mac_result_L22 <= x_mac_result_L22;
			
			h_mac_result_L00 <= h_mac_result_L00; h_mac_result_L01 <= h_mac_result_L01; //h_mac_result_L02 <= h_mac_result_L02;
			h_mac_result_L10 <= h_mac_result_L10; h_mac_result_L11 <= h_mac_result_L11; //h_mac_result_L12 <= h_mac_result_L12;
			h_mac_result_L21 <= h_mac_result_L21; //h_mac_result_L22 <= h_mac_result_L22;
			
			v_mac_result_L00 <= v_mac_result_L00; v_mac_result_L10 <= v_mac_result_L10; v_mac_result_L20 <= v_mac_result_L20;
			//v_mac_result_L00 <= v_mac_result_L00; v_mac_result_L01 <= v_mac_result_L01; v_mac_result_L02 <= v_mac_result_L02;
			//v_mac_result_L10 <= v_mac_result_L10; v_mac_result_L11 <= v_mac_result_L11; v_mac_result_L12 <= v_mac_result_L12;
			//v_mac_result_L20 <= v_mac_result_L20; v_mac_result_L21 <= v_mac_result_L21; v_mac_result_L22 <= v_mac_result_L22;
			
			h_result[0] <= h_result[0]; h_result[1] <= h_result[1]; h_result[2] <= h_result[2];
			//h_result[3] <= h_result[3]; h_result[4] <= h_result[4]; h_result[5] <= h_result[5];
			//h_result[6] <= h_result[6]; h_result[7] <= h_result[7]; h_result[8] <= h_result[8];

			exp_reg <= exp_reg;
			//add_exp_reg <=add_exp_reg;
			ans[0] <= ans[0]; ans[1] <= ans[1]; //ans[2] <= 'b0;
			//ans[3] <= 'b0; ans[4] <= 'b0; ans[5] <='b0;
			//ans[6] <= 'b0; ans[7] <= 'b0; ans[8] <='b0;
		end
		default:begin



		end
		endcase
	end
end






endmodule
