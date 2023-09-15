//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Si2 LAB @NCTU ED415
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 spring
//   Midterm Proejct            : GLCM 
//   Author                     : Hsi-Hao Huang
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : GLCM.v
//   Module Name : GLCM
//   Release version : V1.0 (Release Date: 2023-04)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module GLCM(
				clk,	
			  rst_n,	
	
			in_addr_M,
			in_addr_G,
			in_dir,
			in_dis,
			in_valid,
			out_valid,
	

         awid_m_inf,
       awaddr_m_inf,
       awsize_m_inf,
      awburst_m_inf,
        awlen_m_inf,
      awvalid_m_inf,
      awready_m_inf,
                    
        wdata_m_inf,
        wlast_m_inf,
       wvalid_m_inf,
       wready_m_inf,
                    
          bid_m_inf,
        bresp_m_inf,
       bvalid_m_inf,
       bready_m_inf,
                    
         arid_m_inf,
       araddr_m_inf,
        arlen_m_inf,
       arsize_m_inf,
      arburst_m_inf,
      arvalid_m_inf,
                    
      arready_m_inf, 
          rid_m_inf,
        rdata_m_inf,
        rresp_m_inf,
        rlast_m_inf,
       rvalid_m_inf,
       rready_m_inf 
);
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 32;
input			  clk,rst_n;



// AXI Interface wire connecttion for pseudo DRAM read/write
/* Hint:
       your AXI-4 interface could be designed as convertor in submodule(which used reg for output signal),
	   therefore I declared output of AXI as wire in Poly_Ring
*/
   
// -----------------------------
// IO port
input [ADDR_WIDTH-1:0]      in_addr_M;
input [ADDR_WIDTH-1:0]      in_addr_G;
input [1:0]  	  		in_dir;
input [3:0]	    		in_dis;
input 			    	in_valid;
output reg 	              out_valid;
// -----------------------------


// axi write address channel 
output  wire [ID_WIDTH-1:0]        awid_m_inf;
output  wire [ADDR_WIDTH-1:0]    awaddr_m_inf;
output  wire [2:0]            awsize_m_inf;
output  wire [1:0]           awburst_m_inf;
output  wire [3:0]             awlen_m_inf;
output  wire                 awvalid_m_inf;
input   wire                 awready_m_inf;
// axi write data channel 
output  wire [ DATA_WIDTH-1:0]     wdata_m_inf;
output  wire                   wlast_m_inf;
output  wire                  wvalid_m_inf;
input   wire                  wready_m_inf;
// axi write response channel
input   wire [ID_WIDTH-1:0]         bid_m_inf;  
input   wire [1:0]             bresp_m_inf;   //! only get 2'b00: OKay
input   wire              	   bvalid_m_inf;
output  wire                  bready_m_inf;
// -----------------------------
// axi read address channel 
output  wire [ID_WIDTH-1:0]       arid_m_inf;
output  wire [ADDR_WIDTH-1:0]   araddr_m_inf;
output  wire [3:0]            arlen_m_inf;
output  wire [2:0]           arsize_m_inf;
output  wire [1:0]          arburst_m_inf;
output  wire                arvalid_m_inf;
input   wire               arready_m_inf;
// -----------------------------
// axi read data channel 
input   wire [ID_WIDTH-1:0]         rid_m_inf;
input   wire [DATA_WIDTH-1:0]     rdata_m_inf;
input   wire [1:0]             rresp_m_inf;
input   wire                   rlast_m_inf;
input   wire                  rvalid_m_inf;
output  wire                  rready_m_inf;
// -----------------------------
//  Parameters Declaration
//------------------------------
parameter IDLE = 'b0,
          INPUT = 'b1,
          FILL_ALL = 'd2,
          COMPUTE = 'd3,
//          COMPUTE_type0 = 'd3,
//          COMPUTE_type1 = 'd4,
//          COMPUTE_type2 = 'd5,
          TRANSFER = 'd4,
          OUTPUT = 'd6;




reg [79:0] image [15:0];
reg [3:0] image_row_comb;
reg [3:0] image_row_reg;

reg [7:0] GLCM [32:0][31:0];  //!
//reg [1023:0] sram_data_valid;
wire sram_data_valid;
reg [3:0] current_state, next_state;

reg [11:0] in_addr_M_reg; //i.g. 0x1000~0x1fff
reg [11:0] in_addr_G_reg; //i.g. 0x2000~0x2fff
reg [1:0] in_dir_reg;
reg [3:0] in_dis_reg;

reg [11:0] read_addr_reg;

wire [79:0] sram_read_out;
wire data_valid;
wire sram_ready;
wire last_data;
reg ask_sram;

wire [1:0] ref_col_limit;

reg [1:0] ref_col_reg;
wire [19:0] ref_col_section [3:0];
reg [79:0] target_col;
wire [19:0] target_col_section [3:0];
reg [3:0] target_row_reg, target_row_comb;


reg[6:0] target_col_shift_reg;

reg [15:0] target_row_filter;
wire [3:0] target_row_filter_section [3:0];

wire [9:0] pair [3:0];
wire [4:0] ref_single[3:0], target_single[3:0];
//compute
wire [1:0] GLCM_partial_sum [3:0];
wire equal_condition [5:0];
wire [7:0] GLCM_result[3:0];

wire close_adder [2:0];
wire [5:0] GLCM_row[2:0];
wire [4:0] GLCM_col[2:0];

wire [3:0] dis_dif;
//---------------------------------------
//  OUTPUT CTR
//---------------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  out_valid <= 'b0;
  //TODO
  //else if(sram_data_valid)  out_valid <= 'b1;
  else if(next_state == OUTPUT)   out_valid <= 'b1;
  else        out_valid <= 'b0;
end
//---------------------------------------
//  FSM
//---------------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  current_state <= IDLE;
  else        current_state <= next_state;
end
always@(*)begin
  case(current_state)
    IDLE: if(in_valid)  next_state = INPUT;
          else          next_state = IDLE;
    INPUT:  next_state = FILL_ALL;
    FILL_ALL: if(last_data) next_state = COMPUTE;
              else          next_state = FILL_ALL;
    COMPUTE:  //TODO
            if((ref_col_reg==ref_col_limit)&&(((image_row_reg==dis_dif&&in_dir_reg[0]))||(image_row_reg=='d15&&(~in_dir_reg[0]))))
                            next_state = TRANSFER;
              else  next_state = COMPUTE;
    TRANSFER: next_state = TRANSFER;
    

    default:  next_state = IDLE;  
  endcase
end
//---------------------------------------
//  STORE Inputs
//---------------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)          in_addr_M_reg <= 'b0;
  else if(in_valid)   in_addr_M_reg <= in_addr_M[11:0];
  else                in_addr_M_reg <= in_addr_M_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)          in_addr_G_reg <= 'b0;
  else if(in_valid)   in_addr_G_reg <= in_addr_G[11:0];
  else                in_addr_G_reg <= in_addr_G_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)          in_dir_reg <= 'b0;
  else if(in_valid)   in_dir_reg <= in_dir;
  else                in_dir_reg <= in_dir_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)          in_dis_reg <= 'b0;
  else if(in_valid)   in_dis_reg <= in_dis;
  else                in_dis_reg <= in_dis_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)          ask_sram <= 'b0;
  else if(in_valid)   ask_sram <= 'b1;
  else if(last_data)  ask_sram <= 'b0;
  else                ask_sram <= ask_sram;
end
//-------------------------------------------
//  Fetch IMGAG
//------------------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)begin
      image[0] <= 'b0; image[1] <= 'b0; image[2] <= 'b0; image[3] <= 'b0;
      image[4] <= 'b0; image[5] <= 'b0; image[6] <= 'b0; image[7] <= 'b0;
      image[8] <= 'b0; image[9] <= 'b0; image[10] <= 'b0; image[11] <= 'b0;
      image[12] <= 'b0; image[13] <= 'b0; image[14] <= 'b0; image[15] <= 'b0;
  end
  else begin
      if(data_valid) image[image_row_reg] <= sram_read_out;
      else begin
        image[0] <= image[0]; image[1] <= image[1]; image[2] <= image[2]; image[3] <= image[3];
        image[4] <= image[4]; image[5] <= image[5]; image[6] <= image[6]; image[7] <= image[7];
        image[8] <= image[8]; image[9] <= image[9]; image[10] <= image[10]; image[11] <= image[11];
        image[12] <= image[12]; image[13] <= image[13]; image[14] <= image[14]; image[15] <= image[15];

      end
  end
end

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)            target_col_shift_reg <= 'b0;
  else begin
    case(in_dir_reg)
      2'b01:  target_col_shift_reg <= 'b0;
      2'b10,2'b11:  target_col_shift_reg <= in_dis_reg * 3'd5;
      default: target_col_shift_reg <= 'b0;
    endcase
    
  end  

end

assign ref_col_section[0] = image[image_row_reg][19:0];
assign ref_col_section[1] = image[image_row_reg][39:20];
assign ref_col_section[2] = image[image_row_reg][59:40];
assign ref_col_section[3] = image[image_row_reg][79:60];

always@(*)begin
  if(in_dir_reg>'b01)begin
    case(in_dis_reg)
      4'd1: target_col = {5'b0,image[target_row_reg][79:5]};
      4'd2: target_col = {10'b0,image[target_row_reg][79:10]};
      4'd3: target_col = {15'b0,image[target_row_reg][79:15]};
      4'd4: target_col = {20'b0,image[target_row_reg][79:20]};
      4'd5: target_col = {25'b0,image[target_row_reg][79:25]};
      4'd6: target_col = {30'b0,image[target_row_reg][79:30]};
      4'd7: target_col = {35'b0,image[target_row_reg][79:35]};
      4'd8: target_col = {40'b0,image[target_row_reg][79:40]};
      4'd9: target_col = {45'b0,image[target_row_reg][79:45]};
      4'd10: target_col = {50'b0,image[target_row_reg][79:50]};
      4'd11: target_col = {55'b0,image[target_row_reg][79:55]};
      4'd12: target_col = {60'b0,image[target_row_reg][79:60]};
      4'd13: target_col = {65'b0,image[target_row_reg][79:65]};
      4'd14: target_col = {70'b0,image[target_row_reg][79:70]};
      4'd15: target_col = {75'b0,image[target_row_reg][79:75]};
      default: target_col = {5'b0,image[target_row_reg][79:5]};
    endcase
  end
  else  target_col = image[target_row_reg];
end
assign target_col_section[0] = target_col[19:0];
assign target_col_section[1] = target_col[39:20];
assign target_col_section[2] = target_col[59:40];
assign target_col_section[3] = target_col[79:60];


always@(*)begin
 if(in_dir_reg>'b01)begin
    case(in_dis_reg)
      4'd1: target_row_filter = 16'h8000;
      4'd2: target_row_filter = 16'hc000;
      4'd3: target_row_filter = 16'he000;
      4'd4: target_row_filter = 16'hf000;
      4'd5: target_row_filter = 16'hf800;
      4'd6: target_row_filter = 16'hfc00;
      4'd7: target_row_filter = 16'hfe00;
      4'd8: target_row_filter = 16'hff00;
      4'd9: target_row_filter = 16'hff80;
      4'd10: target_row_filter = 16'hffc0;
      4'd11: target_row_filter = 16'hffe0;
      4'd12: target_row_filter = 16'hfff0;
      4'd13: target_row_filter = 16'hfff8;
      4'd14: target_row_filter = 16'hfffc;
      4'd15: target_row_filter = 16'hfffe;
      default: target_row_filter = 16'h8000;
/*
      4'd1: target_row_filter = 16'b0111_1111_1111_1111;
      4'd2: target_row_filter = 16'b0011_1111_1111_1111;
      4'd3: target_row_filter = 16'b0001_1111_1111_1111;
      4'd4: target_row_filter = 16'b0000_1111_1111_1111;
      4'd5: target_row_filter = 16'b0000_0111_1111_1111;
      4'd6: target_row_filter = 16'b0000_0011_1111_1111;
      4'd7: target_row_filter = 16'b0000_0001_1111_1111;
      4'd8: target_row_filter = 16'b0000_0000_1111_1111;
      4'd9: target_row_filter = 16'b0000_0000_0111_1111;
      4'd10: target_row_filter = 16'b0000_0000_0011_1111;
      4'd11: target_row_filter = 16'b0000_0000_0001_1111;
      4'd12: target_row_filter = 16'b0000_0000_0000_1111;
      4'd13: target_row_filter = 16'b0000_0000_0000_0111;
      4'd14: target_row_filter = 16'b0000_0000_0000_0011;
      4'd15: target_row_filter = 16'b0000_0000_0000_0001;
      default: target_row_filter = 16'b0111_1111_1111_1111;
*/
    endcase
  end
  else  target_col = image[target_row_reg];
end
assign target_row_filter_section[0] = target_row_filter[3:0];
assign target_row_filter_section[1] = target_row_filter[7:4];
assign target_row_filter_section[2] = target_row_filter[11:8];
assign target_row_filter_section[3] = target_row_filter[15:12];



assign dis_dif = 4'd15 - in_dis_reg;
//image_row
always@(*)begin
  case(current_state)
    FILL_ALL: if(data_valid)  image_row_comb = image_row_reg + 'b1;  
              else            image_row_comb = image_row_reg;
    COMPUTE:  if(ref_col_reg==ref_col_limit) //TODO: if change row
                if(in_dir_reg[0]) image_row_comb = (image_row_reg<dis_dif)?image_row_reg+'b1:image_row_reg;
                else              image_row_comb = (image_row_reg<'d15)?image_row_reg+'b1:image_row_reg;
              else  image_row_comb = image_row_reg;
    default:  image_row_comb = 'b0;
  endcase
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  image_row_reg <= 'b0;
  else        image_row_reg <= image_row_comb;
end
//ref_col_reg
assign ref_col_limit = (in_dir_reg>'d1)?{dis_dif[3:2]}:2'b11;
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  ref_col_reg <= 'b0;
  else  if(current_state==COMPUTE)
      if(in_dir_reg>'d1) 
          ref_col_reg <= (ref_col_reg<ref_col_limit)?ref_col_reg+'b1:'b0;
      else
          ref_col_reg <= ref_col_reg + 'b1;
  else if(current_state==IDLE)  ref_col_reg <= 'b0;
  else      ref_col_reg <= ref_col_reg;
end
//target_row_reg
always@(*)begin
  case(current_state)
    COMPUTE:  if(in_dir_reg[0]) target_row_reg = image_row_reg + in_dis_reg;
              else              target_row_reg = image_row_reg;
    default:  target_row_reg = 'b0;
  endcase
end



//------------------------------------------
//   GLCM compute
//------------------------------------------
assign ref_single[0] = ref_col_section[ref_col_reg][4:0];
assign ref_single[1] = ref_col_section[ref_col_reg][9:5];
assign ref_single[2] = ref_col_section[ref_col_reg][14:10];
assign ref_single[3] = ref_col_section[ref_col_reg][19:15];

assign target_single[0] = target_col_section[ref_col_reg][4:0];
assign target_single[1] = target_col_section[ref_col_reg][9:5];
assign target_single[2] = target_col_section[ref_col_reg][14:10];
assign target_single[3] = target_col_section[ref_col_reg][19:15];

assign pair[0] = {ref_single[0],target_single[0]};
assign pair[1] = {ref_single[1],target_single[1]};
assign pair[2] = {ref_single[2],target_single[2]};
assign pair[3] = {ref_single[3],target_single[3]};

assign equal_condition[0] = pair[0] == pair[1];
assign equal_condition[1] = pair[0] == pair[2];
assign equal_condition[2] = pair[0] == pair[3];
assign equal_condition[3] = pair[1] == pair[2];
assign equal_condition[4] = pair[1] == pair[3];
assign equal_condition[5] = pair[2] == pair[3];

assign GLCM_partial_sum[0] = (equal_condition[0]&(~target_row_filter_section[ref_col_reg][1])) + (equal_condition[1]&(~target_row_filter_section[ref_col_reg][2])) + (equal_condition[2]&(~target_row_filter_section[ref_col_reg][3])) + 1'b1;
assign GLCM_partial_sum[1] = ((equal_condition[3]&(~target_row_filter_section[ref_col_reg][2])) + (equal_condition[4]&(~target_row_filter_section[ref_col_reg][3])) + 1'b1);
assign GLCM_partial_sum[2] = ((equal_condition[5]&(~target_row_filter_section[ref_col_reg][3])) + 1'b1);
assign GLCM_partial_sum[3] = 2'b01 ;

assign close_adder[0] = equal_condition[0]|target_row_filter_section[ref_col_reg][1];
assign close_adder[1] = equal_condition[1]|equal_condition[3]|target_row_filter_section[ref_col_reg][2];
assign close_adder[2] = equal_condition[2]|equal_condition[4]|equal_condition[5]|target_row_filter_section[ref_col_reg][3];


assign GLCM_row[0] = (close_adder[0])?'d32:ref_single[1];
assign GLCM_col[0] = (close_adder[0])?'d0:target_single[1];
assign GLCM_row[1] = (close_adder[1])?'d32:ref_single[2];
assign GLCM_col[1] = (close_adder[1])?'d0:target_single[2];
assign GLCM_row[2] = (close_adder[2])?'d32:ref_single[3];
assign GLCM_col[2] = (close_adder[2])?'d0:target_single[3];

assign GLCM_result[0] = GLCM[ref_single[0]][target_single[0]] + GLCM_partial_sum[0];
assign GLCM_result[1] = GLCM[GLCM_row[0]][GLCM_col[0]] + GLCM_partial_sum[1];
assign GLCM_result[2] = GLCM[GLCM_row[1]][GLCM_col[1]] + GLCM_partial_sum[2];
assign GLCM_result[3] = GLCM[GLCM_row[2]][GLCM_col[2]] + GLCM_partial_sum[3];

/*
integer k,h;
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)begin
    for(k=0;k<33;k=k+1)begin
      for(h=0;h<32;h=h+1)begin
        GLCM[k][h] <= 'b0;
      end
    end
  end
  else begin
        if(current_state==)begin
            GLCM[ref_single][target_single] <= GLCM_result[0];
            GLCM[GLCM_row[0]][GLCM_col[0]] <= GLCM_result[1];
            GLCM[GLCM_row[1]][GLCM_col[1]] <= GLCM_result[2];
            GLCM[GLCM_row[2]][GLCM_col[2]] <= GLCM_result[3];
        end
        else begin
          for(k=0;k<33;k=k+1)begin
            for(h=0;h<32;h=h+1)begin
              GLCM[k][h] <= GLCM[k][h];
            end
          end
        end
  end
end
*/
genvar k,h;
generate
  for(k='d0;k<'d33;k=k+'d1)begin
    for(h='d0;h<32;h=h+'d1)begin
      always@(posedge clk or negedge rst_n)begin
        if(~rst_n)  GLCM[k][h] <= 'b0;
        else begin
          //TODO
          if(current_state== COMPUTE)begin
            if((k==ref_single[0])&(h==target_single[0]))
              GLCM[k][h] <= GLCM_result[0];
            else if((k==GLCM_row[0])&(h==GLCM_col[0]))
              GLCM[k][h] <= GLCM_result[1];
            else if ((k==GLCM_row[1])&(h==GLCM_col[1]))
              GLCM[k][h] <= GLCM_result[2];
            else if ((k==GLCM_row[2])&(h==GLCM_col[2]))
              GLCM[k][h] <= GLCM_result[3];
            else  
              GLCM[k][h] <= GLCM[k][h];
          end
          else GLCM[k][h] <= GLCM[k][h];

        end
      end
    end
  end
endgenerate








//-------------------------------------------
//  Global AXI parameter setting
//------------------------------------------
assign awid_m_inf = 'b0;
assign awsize_m_inf = 3'b010;
assign awburst_m_inf = 2'b01;

assign arid_m_inf = 'b0;
assign arsize_m_inf = 3'b010;
assign arburst_m_inf = 2'b01;


AXI4_READ_CTR weight_sram(.clk(clk), .rst_n(rst_n), .sram_valid(sram_data_valid), .data_valid(data_valid), .data_require(ask_sram), .last_data(last_data),
                          .read_addr(in_addr_M_reg), .sram_read_out(sram_read_out), 
                          .araddr(araddr_m_inf), .arlen(arlen_m_inf),.arvalid(arvalid_m_inf), .arready(arready_m_inf),
                          .rdata(rdata_m_inf), .rresp(rresp_m_inf), .rlast(rlast_m_inf), .rvalid(rvalid_m_inf), .rready(rready_m_inf));
endmodule
//=================================================================================
//  AXI4_READ_CTR with SRAM
//=================================================================================
module AXI4_READ_CTR(clk, rst_n, sram_valid, data_valid, data_require, last_data,
                    read_addr, sram_read_out,
                    araddr, arlen, arvalid, arready,
                    rdata, rresp, rlast, rvalid, rready);
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 32;
input clk;
input rst_n;
output reg sram_valid;
output reg data_valid;
output reg last_data;
input data_require;
input [11:0] read_addr;
output reg [79:0] sram_read_out;      //!
output  wire [ADDR_WIDTH-1:0]   araddr;
output  wire [3:0]            arlen;
output  reg                arvalid;
input   wire               arready;
// -----------------------------
// axi read data channel 
//input   wire [ID_WIDTH-1:0]         rid;
input   wire [DATA_WIDTH-1:0]     rdata;
input   wire [1:0]             rresp;   //! no use?
input   wire                   rlast;   
input   wire                  rvalid;   
output  reg                  rready;
//-----------------------------------------
parameter ADDR_CONN = 'd0,
          WAIT = 'd1,
          CONN = 'd2,
          FINISH = 'd3,
          NON_ZERO = 'd4,
          PROCESS = 'd5,
          STALL = 'd6;

reg [2:0] read_unit_state_c, read_unit_state_n;


reg [5:0] dram_addr_comb;
reg [5:0] dram_addr_reg;

//sram ctr signal
reg [9:0] read_addr_temp;
wire [9:0] read_addr_comb;


reg [19:0] sram_data_in;
reg sram_state;
wire [9:0] sram_addr_all;
reg [3:0] sram_addr_partial;
wire [19:0] sram_data_out;
//temp reg
reg [19:0] temp_reg0;
reg [79:0] temp_reg1, temp_comb1;


//-------------------------------------
//  GLOBAL SETTING
//-------------------------------------
assign arlen = 4'b1111;
//--------------------------------
//    FSM
//--------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  read_unit_state_c <= ADDR_CONN;
  else        read_unit_state_c <= read_unit_state_n;
end
always@(*)begin
  case(read_unit_state_c)
    ADDR_CONN:  if(arready) read_unit_state_n = WAIT;
                else        read_unit_state_n = ADDR_CONN;
    WAIT:       if(rvalid)  read_unit_state_n = CONN;
                else        read_unit_state_n = WAIT;
    CONN:       if(~rlast)   read_unit_state_n = CONN;
                else if(dram_addr_reg=='d63)  read_unit_state_n = FINISH;
                else                          read_unit_state_n = ADDR_CONN;
    FINISH:     if(~data_require)             read_unit_state_n = FINISH;
                else if (read_addr[1:0]=='b0) read_unit_state_n = PROCESS;
                else                          read_unit_state_n = NON_ZERO;
    PROCESS:    if(&(dram_addr_reg))  read_unit_state_n = STALL;
                else read_unit_state_n = PROCESS;
    NON_ZERO:   read_unit_state_n = PROCESS;
    STALL:      if(dram_addr_reg>'d0) read_unit_state_n = FINISH;
                else                  read_unit_state_n = STALL;

    default:    read_unit_state_n = ADDR_CONN;
  endcase
end
//--------------------------------
//    arvalid
//--------------------------------
always@(*)begin
  if(read_unit_state_c==ADDR_CONN)  arvalid = 'b1;
  else                              arvalid = 'b0;
end
//--------------------------------
//    rready
//--------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  rready <= 'b0;
  else if(read_unit_state_n==WAIT) rready <= 'b1;
  else if(read_unit_state_n==ADDR_CONN || read_unit_state_n == FINISH)
    rready <= 'b0;
  else  rready <= rready;
end
//--------------------------------
//    sram_valid
//--------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                         sram_valid <= 'b0;
  else if(read_unit_state_c == FINISH)   sram_valid <= 'b1;
  else                               sram_valid <= sram_valid;
end


assign araddr = {19'b0,1'b1,dram_addr_reg,6'b00_0000};
always@(*)begin
  

  //  if(rlast) dram_addr_comb = dram_addr_reg +'b1;
  //  else      dram_addr_comb = dram_addr_reg;
  
    case(read_unit_state_c)
      CONN:     if(rlast) dram_addr_comb = dram_addr_reg + 'b1;
                else      dram_addr_comb = dram_addr_reg;
      PROCESS, STALL:     dram_addr_comb = dram_addr_reg + 'b1;
      ADDR_CONN, WAIT:               dram_addr_comb = dram_addr_reg;
      FINISH, NON_ZERO:  dram_addr_comb = 'b0;
      default:  dram_addr_comb = 'b0;
    endcase
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n) dram_addr_reg <= 'b0;
  else       dram_addr_reg <= dram_addr_comb;
end
//--------------------------------
//    sram addr ctr && data ctr
//--------------------------------
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                    read_addr_temp <= 'b0;
  else  if((read_unit_state_c==NON_ZERO)) read_addr_temp <= read_addr[11:2] + 'b1; 
  else  if((read_unit_state_c==FINISH))   read_addr_temp <= read_addr[11:2];  
  else                          read_addr_temp <= read_addr_temp;
end
assign read_addr_comb = read_addr_temp + dram_addr_reg;
//assign sram_addr_all = (read_unit_state_c==FINISH)?read_addr[11:2]:{dram_addr_reg,sram_addr_partial};
assign sram_addr_all = (read_unit_state_c>=FINISH)?read_addr_comb:{dram_addr_reg,sram_addr_partial};


always@(posedge clk or negedge rst_n)begin
  if(~rst_n)        sram_addr_partial <= 'b0;
  else if(rvalid)   sram_addr_partial <= sram_addr_partial +'b1;
  else              sram_addr_partial <= sram_addr_partial;
end
always@(*)begin
  if(read_unit_state_c>=FINISH) sram_state = 'b1;
  else                          sram_state = ~rvalid;
end
always@(*)begin
  sram_data_in = {rdata[28:24],rdata[20:16],rdata[12:8],rdata[4:0]};
end
//--------------------------------
//  reorder
//--------------------------------
always@(*)begin
  case(read_addr[1:0])
  /*
    2'b00:  temp_comb1 = {sram_read_out[59:0],temp_reg0};
    2'b01:  temp_comb1 = {sram_read_out[59:0],sram_data_out[4:0], temp_reg0[19:5]};
    2'b10:  temp_comb1 = {sram_read_out[59:0],sram_data_out[9:0], temp_reg0[19:10]};
    2'b11:  temp_comb1 = {sram_read_out[59:0],sram_data_out[14:0], temp_reg0[19:15]};
  */ 
    2'b00:  temp_comb1 = {temp_reg0, sram_read_out[79:20]};
    2'b01:  temp_comb1 = {sram_data_out[4:0], temp_reg0[19:5], sram_read_out[79:20]};
    2'b10:  temp_comb1 = {sram_data_out[9:0], temp_reg0[19:10], sram_read_out[79:20]};
    2'b11:  temp_comb1 = {sram_data_out[14:0], temp_reg0[19:15], sram_read_out[79:20]};
    default:  temp_comb1 = temp_reg0;
  endcase
end

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  temp_reg0 <= 'b0;
  else        temp_reg0 <= sram_data_out;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  sram_read_out <= 'b0;
  else        sram_read_out <= temp_comb1;    //! replace temp_reg
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  data_valid <= 'b0;
  else if(read_unit_state_c==PROCESS)
      if((dram_addr_reg[1:0]==2'b00)&&(dram_addr_reg>'d1))
        data_valid <= 'b1;
      else  data_valid <= 'b0;
  else if(read_unit_state_c==STALL&&dram_addr_reg[1:0]==2'b00)
        data_valid <= 'b1;
  else data_valid <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  last_data <= 'b0;
  else if(read_unit_state_c==STALL&&dram_addr_reg[1:0]==2'b00)
              last_data <= 'b1;
  else        last_data <= 'b0;

end
RA1SH_20b_1024w Weight_SRAM(.Q(sram_data_out), .CLK(clk), .CEN(1'b0), .WEN(sram_state), .A(sram_addr_all), .D(sram_data_in), .OEN(1'b0));

endmodule







module AXI4_WRITE_CTR(clk, rst_n, 
                      start_addr, data_store, fetch_next,
                      awaddr_inf, awlen_inf, awvalid_inf, awready_inf,
                      wdata_inf, wlast_inf, wvalid_inf, wready_inf,
                      bid_inf, bready_inf, bvalid_inf, bready_inf);
input clk;
input rst_n
input [9:0] start_addr;
input [31:0] data_store;

// axi write address channel 
output  wire [ADDR_WIDTH-1:0]    awaddr_inf;
output  wire [3:0]             awlen_inf;
output  reg                  awvalid_inf;
input   wire                 awready_inf;
// axi write data channel 
output  wire [ DATA_WIDTH-1:0]     wdata_inf;
output  wire                   wlast_inf;
output  wire                  wvalid_inf;
input   wire                  wready_inf;
// axi write response channel
input   wire [ID_WIDTH-1:0]         bid_inf;  
input   wire [1:0]             bresp_inf;   //! only get 2'b00: OKay
input   wire              	   bvalid_inf;
output  reg                  bready_inf;

parameter IDLE = 'd0,
          ADDR_CONN = 'd1,
          WRITE      = 'd2;
//--------------------------------------
//  Global write setting
//--------------------------------------
assign awlen_inf = 4'hf;
//--------------------------------------
//  reg, wires
//--------------------------------------
reg [1:0] write_unit_c, write_unit_n;


always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  write_unit_c <= IDLE;
  else        write_unit_c <= write_unit_n;
end
always@(*)begin
  case(write_unit_c)
    IDLE: if
  
  
  
  endcase
end






endmodule