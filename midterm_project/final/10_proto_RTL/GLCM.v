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
//   File Name   : GLCM.v 2222
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
          TRANSFER = 'd4,
          OUTPUT = 'd6;

reg [79:0] image [15:0];
reg [3:0] image_row_comb;
reg [3:0] image_row_reg;

reg [7:0] GLCM [32:0][31:0];  //!

wire sram_data_valid;
reg [2:0] current_state, next_state;

reg [11:0] in_addr_M_reg; //i.g. 0x1000~0x1fff
reg [11:0] in_addr_G_reg; //i.g. 0x2000~0x2fff
reg [1:0] in_dir_reg;
reg [3:0] in_dis_reg;

reg [11:0] read_addr_reg;

//!wire [79:0] sram_read_out;
wire [19:0] sram_read_out;
wire data_valid;
wire sram_ready;
wire last_data;
reg ask_sram;

reg [79:0] target_col;
reg [3:0] target_row_reg, target_row_comb;



reg signed [15:0] target_row_filter;


wire [3:0] dis_dif;



//! GLCM x16
wire [4:0] ref_single_x16[15:0], target_single_x16[15:0];
//TODO pipeline

reg [4:0] ref_single_x16_regs[15:0], target_single_x16_regs[15:0];
reg [15:0] target_row_filter_regs;
reg delay_out_transfer;
//TODO pipeline
wire [9:0] pair_x16 [15:0]; 

wire equal_x16 [119:0];


wire [119:0] comp_ref;
wire [119:0] comp_target; 
wire equal_add_x16 [119:0];
wire close_adder_x16 [14:0];
wire [4:0] GLCM_part_sum_x16 [15:0];

wire [4:0] GLCM_part_sum_x16_0;
wire [3:0] GLCM_part_sum_x16_1, GLCM_part_sum_x16_2, GLCM_part_sum_x16_3,
           GLCM_part_sum_x16_4, GLCM_part_sum_x16_5, GLCM_part_sum_x16_6,
           GLCM_part_sum_x16_7, GLCM_part_sum_x16_8;
wire [2:0] GLCM_part_sum_x16_9, GLCM_part_sum_x16_10, GLCM_part_sum_x16_11,
           GLCM_part_sum_x16_12; 
wire [1:0] GLCM_part_sum_x16_13, GLCM_part_sum_x16_14;
wire GLCM_part_sum_x16_15;


//wire [5:0] GLCM_row_x16 [15:0];
//wire [4:0] GLCM_col_x16 [14:0];
wire [7:0] GLCM_result_x16 [15:0];

// transfer
wire finish_write;
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
              //if(delay_out_transfer)
              if(((image_row_reg==dis_dif&&in_dir_reg[0]))||(image_row_reg=='d15&&(~in_dir_reg[0])))
                  next_state = TRANSFER;
              else  next_state = COMPUTE;
    TRANSFER: if(finish_write) next_state = OUTPUT;
              else             next_state = TRANSFER;
    OUTPUT:   next_state = IDLE;
    default:  next_state = IDLE;  
  endcase
end




always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  delay_out_transfer <= 'b0;
  else delay_out_transfer <= (((image_row_reg==dis_dif&&in_dir_reg[0]))||(image_row_reg=='d15&&(~in_dir_reg[0])));
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
integer image_ii, image_jj;


always@(posedge clk)begin
  if(current_state==IDLE)begin
      image[0] <= 'b0; image[1] <= 'b0; image[2] <= 'b0; image[3] <= 'b0;
      image[4] <= 'b0; image[5] <= 'b0; image[6] <= 'b0; image[7] <= 'b0;
      image[8] <= 'b0; image[9] <= 'b0; image[10] <= 'b0; image[11] <= 'b0;
      image[12] <= 'b0; image[13] <= 'b0; image[14] <= 'b0; image[15] <= 'b0;
  end
  else begin
      if(current_state==FILL_ALL &&data_valid)begin
        //image[image_row_reg] <= sram_read_out;
        image[15][79:60] <= sram_read_out;
        for(image_ii=0;image_ii<16;image_ii=image_ii+1)begin
            image[image_ii][19:0]  <= image[image_ii][39:20];
            image[image_ii][39:20] <= image[image_ii][59:40];
            image[image_ii][59:40] <= image[image_ii][79:60];
        end
        for(image_ii=0;image_ii<15;image_ii=image_ii+1)begin
            image[image_ii][79:60]  <= image[image_ii+1][19:0];
        end
        
      end
      else begin
        image[0] <= image[0]; image[1] <= image[1]; image[2] <= image[2]; image[3] <= image[3];
        image[4] <= image[4]; image[5] <= image[5]; image[6] <= image[6]; image[7] <= image[7];
        image[8] <= image[8]; image[9] <= image[9]; image[10] <= image[10]; image[11] <= image[11];
        image[12] <= image[12]; image[13] <= image[13]; image[14] <= image[14]; image[15] <= image[15];

      end
  end
end


always@(*)begin
  if(in_dir_reg[1])    target_col = image[target_row_reg]>>(in_dis_reg* 'd5);
  else                 target_col = image[target_row_reg];
end

always@(*)begin
  if(in_dir_reg[1])    target_row_filter = (16'hffff)>>in_dis_reg;
  else                 target_row_filter = 16'hffff;
end

assign dis_dif = 4'd15 - in_dis_reg;
//image_row
always@(*)begin
  case(current_state)
    FILL_ALL: if(data_valid)  image_row_comb = image_row_reg + 'b1;  
              else            image_row_comb = image_row_reg;
    COMPUTE:  
              if(in_dir_reg[0]) image_row_comb = (image_row_reg<dis_dif)?image_row_reg+'b1:'b0;
              else              image_row_comb = (image_row_reg<'d15)?image_row_reg+'b1:'b0;
    default:  image_row_comb = 'b0;
  endcase
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  image_row_reg <= 'b0;
  else        image_row_reg <= image_row_comb;
end
//target_row_reg
always@(*)begin
  if(in_dir_reg[0]) target_row_comb = image_row_reg + in_dis_reg;
  else              target_row_comb = image_row_reg;
end
always@(*)begin
  if(~rst_n)  target_row_reg <= 'b0;
  else        target_row_reg <= target_row_comb;
end




//!=================================================
//! GLCM compute x16
//!=================================================
/*
assign ref_single_x16[0] = {image[image_row_reg][4],
                            image[image_row_reg][3],
                            image[image_row_reg][2],
                            image[image_row_reg][1],
                            image[image_row_reg][0]};
assign target_single_x16[0] = {target_col[4],
                               target_col[3],
                               target_col[2],
                               target_col[1],
                               target_col[0]};
assign ref_single_x16[1] = {image[image_row_reg][9],
                            image[image_row_reg][8],
                            image[image_row_reg][7],
                            image[image_row_reg][6],
                            image[image_row_reg][5]};
assign target_single_x16[1] = {target_col[9],
                               target_col[8],
                               target_col[7],
                               target_col[6],
                               target_col[5]};
assign ref_single_x16[2] = {image[image_row_reg][14],
                            image[image_row_reg][13],
                            image[image_row_reg][12],
                            image[image_row_reg][11],
                            image[image_row_reg][10]};
assign target_single_x16[2] = {target_col[14],
                               target_col[13],
                               target_col[12],
                               target_col[11],
                               target_col[10]};

assign ref_single_x16[3] = {image[image_row_reg][19],
                            image[image_row_reg][18],
                            image[image_row_reg][17],
                            image[image_row_reg][16],
                            image[image_row_reg][15]};
assign target_single_x16[3] = {target_col[19],
                               target_col[18],
                               target_col[17],
                               target_col[16],
                               target_col[15]};
//---------------------------------------------------------
assign ref_single_x16[4] = {image[image_row_reg][24],
                            image[image_row_reg][23],
                            image[image_row_reg][22],
                            image[image_row_reg][21],
                            image[image_row_reg][20]};
assign target_single_x16[4] = {target_col[24],
                               target_col[23],
                               target_col[22],
                               target_col[21],
                               target_col[20]};
assign ref_single_x16[5] = {image[image_row_reg][29],
                            image[image_row_reg][28],
                            image[image_row_reg][27],
                            image[image_row_reg][26],
                            image[image_row_reg][25]};
assign target_single_x16[5] = {target_col[29],
                               target_col[28],
                               target_col[27],
                               target_col[26],
                               target_col[25]};
assign ref_single_x16[6] = {image[image_row_reg][34],
                            image[image_row_reg][33],
                            image[image_row_reg][32],
                            image[image_row_reg][31],
                            image[image_row_reg][30]};
assign target_single_x16[6] = {target_col[34],
                               target_col[33],
                               target_col[32],
                               target_col[31],
                               target_col[30]};
assign ref_single_x16[7] = {image[image_row_reg][39],
                            image[image_row_reg][38],
                            image[image_row_reg][37],
                            image[image_row_reg][36],
                            image[image_row_reg][35]};
assign target_single_x16[7] = {target_col[39],
                               target_col[38],
                               target_col[37],
                               target_col[36],
                               target_col[35]};
//---------------------------------------------------------
assign ref_single_x16[8] = {image[image_row_reg][44],
                            image[image_row_reg][43],
                            image[image_row_reg][42],
                            image[image_row_reg][41],
                            image[image_row_reg][40]};
assign target_single_x16[8] = {target_col[44],
                               target_col[43],
                               target_col[42],
                               target_col[41],
                               target_col[40]};
assign ref_single_x16[9] = {image[image_row_reg][49],
                            image[image_row_reg][48],
                            image[image_row_reg][47],
                            image[image_row_reg][46],
                            image[image_row_reg][45]};
assign target_single_x16[9] = {target_col[49],
                               target_col[48],
                               target_col[47],
                               target_col[46],
                               target_col[45]};
assign ref_single_x16[10] = {image[image_row_reg][54],
                            image[image_row_reg][53],
                            image[image_row_reg][52],
                            image[image_row_reg][51],
                            image[image_row_reg][50]};
assign target_single_x16[10] = {target_col[54],
                               target_col[53],
                               target_col[52],
                               target_col[51],
                               target_col[50]};

assign ref_single_x16[11] = {image[image_row_reg][59],
                            image[image_row_reg][58],
                            image[image_row_reg][57],
                            image[image_row_reg][56],
                            image[image_row_reg][55]};
assign target_single_x16[11] = {target_col[59],
                               target_col[58],
                               target_col[57],
                               target_col[56],
                               target_col[55]};
//---------------------------------------------------------
assign ref_single_x16[12] = {image[image_row_reg][64],
                            image[image_row_reg][63],
                            image[image_row_reg][62],
                            image[image_row_reg][61],
                            image[image_row_reg][60]};
assign target_single_x16[12] = {target_col[64],
                               target_col[63],
                               target_col[62],
                               target_col[61],
                               target_col[60]};
assign ref_single_x16[13] = {image[image_row_reg][69],
                            image[image_row_reg][68],
                            image[image_row_reg][67],
                            image[image_row_reg][66],
                            image[image_row_reg][65]};
assign target_single_x16[13] = {target_col[69],
                               target_col[68],
                               target_col[67],
                               target_col[66],
                               target_col[65]};
assign ref_single_x16[14] = {image[image_row_reg][74],
                            image[image_row_reg][73],
                            image[image_row_reg][72],
                            image[image_row_reg][71],
                            image[image_row_reg][70]};
assign target_single_x16[14] = {target_col[74],
                               target_col[73],
                               target_col[72],
                               target_col[71],
                               target_col[70]};

assign ref_single_x16[15] = {image[image_row_reg][79],
                            image[image_row_reg][78],
                            image[image_row_reg][77],
                            image[image_row_reg][76],
                            image[image_row_reg][75]};
assign target_single_x16[15] = {target_col[79],
                               target_col[78],
                               target_col[77],
                               target_col[76],
                               target_col[75]};

*/


genvar ref_index;
generate
for(ref_index = 0; ref_index < 'd16; ref_index = ref_index +'d1)begin
  assign ref_single_x16[ref_index] = {image[image_row_reg][ref_index*'d5+'d4],
                                      image[image_row_reg][ref_index*'d5+'d3],
                                      image[image_row_reg][ref_index*'d5+'d2],
                                      image[image_row_reg][ref_index*'d5+'d1],
                                      image[image_row_reg][ref_index*'d5+'d0]};

  assign target_single_x16[ref_index] = {target_col[ref_index*'d5+'d4],
                                        target_col[ref_index*'d5+'d3],
                                        target_col[ref_index*'d5+'d2],
                                        target_col[ref_index*'d5+'d1],
                                        target_col[ref_index*'d5+'d0]};

  assign pair_x16[ref_index] = {ref_single_x16[ref_index], target_single_x16[ref_index]};
end
endgenerate




//==========================================
/*
integer x16_i;
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)begin
      for(x16_i=0;x16_i<16;x16_i=x16_i+1)begin
        ref_single_x16_regs[x16_i] <= 'b0;
        target_single_x16_regs[x16_i] <= 'b0;
      end
  end
  else begin
      for(x16_i=0;x16_i<16;x16_i=x16_i+1)begin
        ref_single_x16_regs[x16_i] <=  ref_single_x16[x16_i];
        target_single_x16_regs[x16_i] <= target_single_x16[x16_i];
       
      end
  end
end

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)begin
        target_row_filter_regs <= 'b0;
   end
  else begin
             target_row_filter_regs <=  target_row_filter;
  end
end
*/
//==========================================
//==========================================
//==========================================
//==========================================
genvar eq_tar0;
generate
  for(eq_tar0=1;eq_tar0<16;eq_tar0=eq_tar0+1)begin:eq_0
    assign equal_x16[eq_tar0-1] =     (pair_x16[0] == pair_x16[eq_tar0]);
    assign equal_add_x16[eq_tar0-1] = equal_x16[eq_tar0-1]&(target_row_filter[eq_tar0]);
  end
endgenerate

genvar eq_tar1;
generate
  for(eq_tar1=2;eq_tar1<16;eq_tar1=eq_tar1+1)begin:eq_1
    assign equal_x16[eq_tar1+13] =     (pair_x16[1] == pair_x16[eq_tar1]);
    assign equal_add_x16[eq_tar1+13] = equal_x16[eq_tar1+13]&(target_row_filter[eq_tar1]);
  end
endgenerate

genvar eq_tar2;
generate
  for(eq_tar2=3;eq_tar2<16;eq_tar2=eq_tar2+1)begin:eq_2
    assign equal_x16[eq_tar2+26] =     (pair_x16[2] == pair_x16[eq_tar2]);
    assign equal_add_x16[eq_tar2+26] = equal_x16[eq_tar2+26]&(target_row_filter[eq_tar2]);
  end
endgenerate

genvar eq_tar3;
generate
  for(eq_tar3=4;eq_tar3<16;eq_tar3=eq_tar3+1)begin:eq_3
    assign equal_x16[eq_tar3+38] =     (pair_x16[3] == pair_x16[eq_tar3]);
    assign equal_add_x16[eq_tar3+38] = equal_x16[eq_tar3+38]&(target_row_filter[eq_tar3]);
  end
endgenerate
//-----------------------------------------------------
genvar eq_tar4;
generate
  for(eq_tar4=5;eq_tar4<16;eq_tar4=eq_tar4+1)begin:eq_4
    assign equal_x16[eq_tar4+49] =     (pair_x16[4] == pair_x16[eq_tar4]);
    assign equal_add_x16[eq_tar4+49] = equal_x16[eq_tar4+49]&(target_row_filter[eq_tar4]);
  end
endgenerate

genvar eq_tar5;
generate
  for(eq_tar5=6;eq_tar5<16;eq_tar5=eq_tar5+1)begin:eq_5
    assign equal_x16[eq_tar5+59] =     (pair_x16[5] == pair_x16[eq_tar5]);
    assign equal_add_x16[eq_tar5+59] = equal_x16[eq_tar5+59]&(target_row_filter[eq_tar5]);
  end
endgenerate

genvar eq_tar6;
generate
  for(eq_tar6=7;eq_tar6<16;eq_tar6=eq_tar6+1)begin:eq_6
    assign equal_x16[eq_tar6+68] =     (pair_x16[6] == pair_x16[eq_tar6]);
    assign equal_add_x16[eq_tar6+68] = equal_x16[eq_tar6+68]&(target_row_filter[eq_tar6]);
  end
endgenerate

genvar eq_tar7;
generate
  for(eq_tar7=8;eq_tar7<16;eq_tar7=eq_tar7+1)begin:eq_7
    assign equal_x16[eq_tar7+76] =     (pair_x16[7] == pair_x16[eq_tar7]);
    assign equal_add_x16[eq_tar7+76] = equal_x16[eq_tar7+76]&(target_row_filter[eq_tar7]);
  end
endgenerate
//--------------------------------------------------
genvar eq_tar8;
generate
  for(eq_tar8=9;eq_tar8<16;eq_tar8=eq_tar8+1)begin:eq_8
    assign equal_x16[eq_tar8+83] =     (pair_x16[8] == pair_x16[eq_tar8]);
    assign equal_add_x16[eq_tar8+83] = equal_x16[eq_tar8+83]&(target_row_filter[eq_tar8]);
  end
endgenerate

genvar eq_tar9;
generate
  for(eq_tar9=10;eq_tar9<16;eq_tar9=eq_tar9+1)begin:eq_9
    assign equal_x16[eq_tar9+89] =     (pair_x16[9] == pair_x16[eq_tar9]);
    assign equal_add_x16[eq_tar9+89] = equal_x16[eq_tar9+89]&(target_row_filter[eq_tar9]);
  end
endgenerate

genvar eq_tar10;
generate
  for(eq_tar10=11;eq_tar10<16;eq_tar10=eq_tar10+1)begin:eq_10
    assign equal_x16[eq_tar10+94] =     (pair_x16[10] == pair_x16[eq_tar10]);
    assign equal_add_x16[eq_tar10+94] = equal_x16[eq_tar10+94]&(target_row_filter[eq_tar10]);
  end
endgenerate

genvar eq_tar11;
generate
  for(eq_tar11=12;eq_tar11<16;eq_tar11=eq_tar11+1)begin:eq_11
    assign equal_x16[eq_tar11+98] =     (pair_x16[11] == pair_x16[eq_tar11]);
    assign equal_add_x16[eq_tar11+98] = equal_x16[eq_tar11+98]&(target_row_filter[eq_tar11]);
  end
endgenerate
//----------------------------------------------------
genvar eq_tar12;
generate
  for(eq_tar12=13;eq_tar12<16;eq_tar12=eq_tar12+1)begin:eq_12
    assign equal_x16[eq_tar12+101] =     (pair_x16[12] == pair_x16[eq_tar12]);
    assign equal_add_x16[eq_tar12+101] = equal_x16[eq_tar12+101]&(target_row_filter[eq_tar12]);
  end
endgenerate

genvar eq_tar13;
generate
  for(eq_tar13=14;eq_tar13<16;eq_tar13=eq_tar13+1)begin:eq_13
    assign equal_x16[eq_tar13+103] =     (pair_x16[13] == pair_x16[eq_tar13]);
    assign equal_add_x16[eq_tar13+103] = equal_x16[eq_tar13+103]&(target_row_filter[eq_tar13]);
  end
endgenerate




assign equal_x16[119] =     (pair_x16[14] == pair_x16[15]);
assign equal_add_x16[119] = equal_x16[119]&(target_row_filter[15]);



//16
assign GLCM_part_sum_x16_0 = (1'b1 + 
                              equal_add_x16[0] + equal_add_x16[1] + equal_add_x16[2] + 
                              equal_add_x16[3] + equal_add_x16[4] + equal_add_x16[5] + 
                              equal_add_x16[6] + equal_add_x16[7] + equal_add_x16[8] + 
                              equal_add_x16[9] + equal_add_x16[10] + equal_add_x16[11] +
                              equal_add_x16[12] + equal_add_x16[13] + equal_add_x16[14]);
//15
assign GLCM_part_sum_x16_1 = (1'b1 + 
                              equal_add_x16[15] + equal_add_x16[16] + equal_add_x16[17] +
                              equal_add_x16[18] + equal_add_x16[19] + equal_add_x16[20] +
                              equal_add_x16[21] + equal_add_x16[22] + equal_add_x16[23] +
                              equal_add_x16[24] + equal_add_x16[25] + equal_add_x16[26] + 
                              equal_add_x16[27] + equal_add_x16[28]);
//14
assign GLCM_part_sum_x16_2 = (1'b1 +
                              equal_add_x16[29] + equal_add_x16[30] + equal_add_x16[31] +
                              equal_add_x16[32] + equal_add_x16[33] + equal_add_x16[34] + 
                              equal_add_x16[35] + equal_add_x16[36] + equal_add_x16[37] +
                              equal_add_x16[38] + equal_add_x16[39] + equal_add_x16[40] + 
                              equal_add_x16[41]);
//13
assign GLCM_part_sum_x16_3 = (1'b1 +
                              equal_add_x16[42] + equal_add_x16[43] + equal_add_x16[44] +
                              equal_add_x16[45] + equal_add_x16[46] + equal_add_x16[47] +
                              equal_add_x16[48] + equal_add_x16[49] + equal_add_x16[50] +
                              equal_add_x16[51] + equal_add_x16[52] + equal_add_x16[53]);
//12
assign GLCM_part_sum_x16_4 = (1'b1 +
                              equal_add_x16[54] + equal_add_x16[55] + equal_add_x16[56] +
                              equal_add_x16[57] + equal_add_x16[58] + equal_add_x16[59] +
                              equal_add_x16[60] + equal_add_x16[61] + equal_add_x16[62] +
                              equal_add_x16[63] + equal_add_x16[64]);
//11
assign GLCM_part_sum_x16_5 = (1'b1 +
                              equal_add_x16[65] + equal_add_x16[66] + equal_add_x16[67] +
                              equal_add_x16[68] + equal_add_x16[69] + equal_add_x16[70] +
                              equal_add_x16[71] + equal_add_x16[72] + equal_add_x16[73] +
                              equal_add_x16[74]);
//10
assign GLCM_part_sum_x16_6 = (1'b1 +
                              equal_add_x16[75] + equal_add_x16[76] + equal_add_x16[77] +
                              equal_add_x16[78] + equal_add_x16[79] + equal_add_x16[80] +
                              equal_add_x16[81] + equal_add_x16[82] + equal_add_x16[83]);
//9
assign GLCM_part_sum_x16_7 = (1'b1 +
                              equal_add_x16[84] + equal_add_x16[85] + equal_add_x16[86] +
                              equal_add_x16[87] + equal_add_x16[88] + equal_add_x16[89] +
                              equal_add_x16[90] + equal_add_x16[91]);
//8
assign GLCM_part_sum_x16_8 = (1'b1 +
                              equal_add_x16[92] + equal_add_x16[93] + equal_add_x16[94] +
                              equal_add_x16[95] + equal_add_x16[96] + equal_add_x16[97] +
                              equal_add_x16[98]);
//7
assign GLCM_part_sum_x16_9 = (1'b1 +
                              equal_add_x16[99] + equal_add_x16[100] + equal_add_x16[101] +
                              equal_add_x16[102] + equal_add_x16[103] + equal_add_x16[104]);
//6
assign GLCM_part_sum_x16_10 = (1'b1 +
                              equal_add_x16[105] + equal_add_x16[106] + equal_add_x16[107] +
                              equal_add_x16[108] + equal_add_x16[109]);
//5
assign GLCM_part_sum_x16_11 = (1'b1 +
                              equal_add_x16[110] + equal_add_x16[111] + equal_add_x16[112] +
                              equal_add_x16[113]);
//4
assign GLCM_part_sum_x16_12 = (1'b1 +
                              equal_add_x16[114] + equal_add_x16[115] + equal_add_x16[116]);
//3
assign GLCM_part_sum_x16_13 = (1'b1 + equal_add_x16[117] + equal_add_x16[118]);
//2
assign GLCM_part_sum_x16_14 = (1'b1 + equal_add_x16[119]);
//1
assign GLCM_part_sum_x16_15 = (1'b1);

assign close_adder_x16[0] = ~target_row_filter[1]|equal_x16[0]; //to 1
assign close_adder_x16[1] = ~target_row_filter[2]|equal_x16[1]|equal_x16[15];  //to 2
assign close_adder_x16[2] = ~target_row_filter[3]|equal_x16[2]|equal_x16[16]|equal_x16[29]; //to 3
assign close_adder_x16[3] = ~target_row_filter[4]|equal_x16[3]|equal_x16[17]|equal_x16[30]|equal_x16[42]; //to 4

assign close_adder_x16[4] = ~target_row_filter[5]|equal_x16[4]|equal_x16[18]|equal_x16[31]|equal_x16[43]|equal_x16[54];
assign close_adder_x16[5] = ~target_row_filter[6]|equal_x16[5]|equal_x16[19]|equal_x16[32]|equal_x16[44]|equal_x16[55]|equal_x16[65];
assign close_adder_x16[6] = ~target_row_filter[7]|equal_x16[6]|equal_x16[20]|equal_x16[33]|equal_x16[45]|equal_x16[56]|equal_x16[66]|equal_x16[75];
assign close_adder_x16[7] = ~target_row_filter[8]|equal_x16[7]|equal_x16[21]|equal_x16[34]|equal_x16[46]|equal_x16[57]|equal_x16[67]|equal_x16[76]|equal_x16[84];

assign close_adder_x16[8] = ~target_row_filter[9]|equal_x16[8]|equal_x16[22]|equal_x16[35]|equal_x16[47]|equal_x16[58]|equal_x16[68]|equal_x16[77]|equal_x16[85]|equal_x16[92];
assign close_adder_x16[9] = ~target_row_filter[10]|equal_x16[9]|equal_x16[23]|equal_x16[36]|equal_x16[48]|equal_x16[59]|equal_x16[69]|equal_x16[78]|equal_x16[86]|equal_x16[93]|equal_x16[99];
assign close_adder_x16[10] = ~target_row_filter[11]|equal_x16[10]|equal_x16[24]|equal_x16[37]|equal_x16[49]|equal_x16[60]|equal_x16[70]|equal_x16[79]|equal_x16[87]|equal_x16[94]|equal_x16[100]|equal_x16[105];
assign close_adder_x16[11] = ~target_row_filter[12]|equal_x16[11]|equal_x16[25]|equal_x16[38]|equal_x16[50]|equal_x16[61]|equal_x16[71]|equal_x16[80]|equal_x16[88]|equal_x16[95]|equal_x16[101]|equal_x16[106]|equal_x16[110];

assign close_adder_x16[12] = ~target_row_filter[13]|equal_x16[12]|equal_x16[26]|equal_x16[39]|equal_x16[51]|equal_x16[62]|equal_x16[72]|equal_x16[81]|equal_x16[89]|equal_x16[96]|equal_x16[102]|equal_x16[107]|equal_x16[111]|equal_x16[114];
assign close_adder_x16[13] = ~target_row_filter[14]|equal_x16[13]|equal_x16[27]|equal_x16[40]|equal_x16[52]|equal_x16[63]|equal_x16[73]|equal_x16[82]|equal_x16[90]|equal_x16[97]|equal_x16[103]|equal_x16[108]|equal_x16[112]|equal_x16[115]|equal_x16[117];
assign close_adder_x16[14] = ~target_row_filter[15]|equal_x16[14]|equal_x16[28]|equal_x16[41]|equal_x16[53]|equal_x16[64]|equal_x16[74]|equal_x16[83]|equal_x16[91]|equal_x16[98]|equal_x16[104]|equal_x16[109]|equal_x16[113]|equal_x16[116]|equal_x16[118]|equal_x16[119];


assign GLCM_result_x16[0] = GLCM[ref_single_x16[0]][target_single_x16[0]] + GLCM_part_sum_x16_0;
assign GLCM_result_x16[1] = GLCM[ref_single_x16[1]][target_single_x16[1]] + GLCM_part_sum_x16_1;
assign GLCM_result_x16[2] = GLCM[ref_single_x16[2]][target_single_x16[2]] + GLCM_part_sum_x16_2;
assign GLCM_result_x16[3] = GLCM[ref_single_x16[3]][target_single_x16[3]] + GLCM_part_sum_x16_3;

assign GLCM_result_x16[4] = GLCM[ref_single_x16[4]][target_single_x16[4]] + GLCM_part_sum_x16_4;
assign GLCM_result_x16[5] = GLCM[ref_single_x16[5]][target_single_x16[5]] + GLCM_part_sum_x16_5;
assign GLCM_result_x16[6] = GLCM[ref_single_x16[6]][target_single_x16[6]] + GLCM_part_sum_x16_6;
assign GLCM_result_x16[7] = GLCM[ref_single_x16[7]][target_single_x16[7]] + GLCM_part_sum_x16_7;

assign GLCM_result_x16[8] = GLCM[ref_single_x16[8]][target_single_x16[8]] + GLCM_part_sum_x16_8;
assign GLCM_result_x16[9] = GLCM[ref_single_x16[9]][target_single_x16[9]] + GLCM_part_sum_x16_9;
assign GLCM_result_x16[10] = GLCM[ref_single_x16[10]][target_single_x16[10]] + GLCM_part_sum_x16_10;
assign GLCM_result_x16[11] = GLCM[ref_single_x16[11]][target_single_x16[11]] + GLCM_part_sum_x16_11;

assign GLCM_result_x16[12] = GLCM[ref_single_x16[12]][target_single_x16[12]] + GLCM_part_sum_x16_12;
assign GLCM_result_x16[13] = GLCM[ref_single_x16[13]][target_single_x16[13]] + GLCM_part_sum_x16_13;
assign GLCM_result_x16[14] = GLCM[ref_single_x16[14]][target_single_x16[14]] + GLCM_part_sum_x16_14;
assign GLCM_result_x16[15] = GLCM[ref_single_x16[15]][target_single_x16[15]] + GLCM_part_sum_x16_15;
/*
assign GLCM_result_x16[0] = GLCM[ref_single_x16[0]][target_single_x16[0]] + GLCM_part_sum_x16_0;
assign GLCM_result_x16[1] = GLCM[GLCM_row_x16[0]][GLCM_col_x16[0]] + GLCM_part_sum_x16_1;
assign GLCM_result_x16[2] = GLCM[GLCM_row_x16[1]][GLCM_col_x16[1]] + GLCM_part_sum_x16_2;
assign GLCM_result_x16[3] = GLCM[GLCM_row_x16[2]][GLCM_col_x16[2]] + GLCM_part_sum_x16_3;

assign GLCM_result_x16[4] = GLCM[GLCM_row_x16[3]][GLCM_col_x16[3]] + GLCM_part_sum_x16_4;
assign GLCM_result_x16[5] = GLCM[GLCM_row_x16[4]][GLCM_col_x16[4]] + GLCM_part_sum_x16_5;
assign GLCM_result_x16[6] = GLCM[GLCM_row_x16[5]][GLCM_col_x16[5]] + GLCM_part_sum_x16_6;
assign GLCM_result_x16[7] = GLCM[GLCM_row_x16[6]][GLCM_col_x16[6]] + GLCM_part_sum_x16_7;

assign GLCM_result_x16[8] = GLCM[GLCM_row_x16[7]][GLCM_col_x16[7]] + GLCM_part_sum_x16_8;
assign GLCM_result_x16[9] = GLCM[GLCM_row_x16[8]][GLCM_col_x16[8]] + GLCM_part_sum_x16_9;
assign GLCM_result_x16[10] = GLCM[GLCM_row_x16[9]][GLCM_col_x16[9]] + GLCM_part_sum_x16_10;
assign GLCM_result_x16[11] = GLCM[GLCM_row_x16[10]][GLCM_col_x16[10]] + GLCM_part_sum_x16_11;

assign GLCM_result_x16[12] = GLCM[GLCM_row_x16[11]][GLCM_col_x16[11]] + GLCM_part_sum_x16_12;
assign GLCM_result_x16[13] = GLCM[GLCM_row_x16[12]][GLCM_col_x16[12]] + GLCM_part_sum_x16_13;
assign GLCM_result_x16[14] = GLCM[GLCM_row_x16[13]][GLCM_col_x16[13]] + GLCM_part_sum_x16_14;
assign GLCM_result_x16[15] = GLCM[GLCM_row_x16[14]][GLCM_col_x16[14]] + GLCM_part_sum_x16_15;
*/

integer glcm_ii, glcm_jj;

always@(posedge clk)begin
  if(current_state==IDLE)begin
      for(glcm_ii = 0; glcm_ii<33; glcm_ii = glcm_ii +1)
        for(glcm_jj = 0; glcm_jj<32; glcm_jj= glcm_jj +1)
          GLCM[glcm_ii][glcm_jj] <= 'b0;
  end
  else if(current_state == COMPUTE)begin
    GLCM[ref_single_x16[0]][target_single_x16[0]] <= GLCM_result_x16[0];
    
    if(~close_adder_x16[0])
      GLCM[ref_single_x16[1]][target_single_x16[1]] <= GLCM_result_x16[1];
    else
      GLCM[32][0] <= GLCM[32][0];
    if(~close_adder_x16[1])
      GLCM[ref_single_x16[2]][target_single_x16[2]] <= GLCM_result_x16[2];    
    else
      GLCM[32][1] <= GLCM[32][1];
    if(~close_adder_x16[2])
      GLCM[ref_single_x16[3]][target_single_x16[3]] <= GLCM_result_x16[3];
    else
      GLCM[32][2] <= GLCM[32][2];
    if(~close_adder_x16[3])
      GLCM[ref_single_x16[4]][target_single_x16[4]] <= GLCM_result_x16[4];
    else
      GLCM[32][3] <= GLCM[32][3];
    if(~close_adder_x16[4])
      GLCM[ref_single_x16[5]][target_single_x16[5]] <= GLCM_result_x16[5];
    else
      GLCM[32][4] <= GLCM[32][4];
    if(~close_adder_x16[5])
      GLCM[ref_single_x16[6]][target_single_x16[6]] <= GLCM_result_x16[6];
    else
      GLCM[32][5] <= GLCM[32][5];
    if(~close_adder_x16[6])
      GLCM[ref_single_x16[7]][target_single_x16[7]] <= GLCM_result_x16[7];
    else
      GLCM[32][6] <= GLCM[32][6];
    if(~close_adder_x16[7])
      GLCM[ref_single_x16[8]][target_single_x16[8]] <= GLCM_result_x16[8];
    else
      GLCM[32][7] <= GLCM[32][7];
    if(~close_adder_x16[8])
      GLCM[ref_single_x16[9]][target_single_x16[9]] <= GLCM_result_x16[9];
    else
      GLCM[32][8] <= GLCM[32][8];
    if(~close_adder_x16[9])
      GLCM[ref_single_x16[10]][target_single_x16[10]] <= GLCM_result_x16[10];
    else
      GLCM[32][9] <= GLCM[32][9];
    if(~close_adder_x16[10])
      GLCM[ref_single_x16[11]][target_single_x16[11]] <= GLCM_result_x16[11];
    else
      GLCM[32][10] <= GLCM[32][10];
    if(~close_adder_x16[11])
      GLCM[ref_single_x16[12]][target_single_x16[12]] <= GLCM_result_x16[12];
    else
        GLCM[32][11] <= GLCM[32][11];
    if(~close_adder_x16[12])
      GLCM[ref_single_x16[13]][target_single_x16[13]] <= GLCM_result_x16[13];
    else
      GLCM[32][12] <= GLCM[32][12];
    if(~close_adder_x16[13])
      GLCM[ref_single_x16[14]][target_single_x16[14]] <= GLCM_result_x16[14];
    else
      GLCM[32][13] <= GLCM[32][13];
    if(~close_adder_x16[14])
      GLCM[ref_single_x16[15]][target_single_x16[15]] <= GLCM_result_x16[15];
    else  
      GLCM[32][14] <= GLCM[32][14];
  end
  else if(current_state == TRANSFER&&(wready_m_inf))begin
    GLCM[31][31]  <= 'b0;
    GLCM[31][30]  <= 'b0;
    GLCM[31][29]  <= 'b0;
    GLCM[31][28]  <= 'b0;
    
    
    for(glcm_ii = 0; glcm_ii<31; glcm_ii = glcm_ii +1)begin
      for(glcm_jj = 0; glcm_jj<4; glcm_jj= glcm_jj +1)begin
        GLCM[glcm_ii][glcm_jj+28] <= GLCM[glcm_ii+1][glcm_jj];
      end
    end

    for(glcm_ii = 0; glcm_ii<32; glcm_ii = glcm_ii +1)begin
      for(glcm_jj = 0; glcm_jj<28; glcm_jj= glcm_jj +1)begin
        GLCM[glcm_ii][glcm_jj] <= GLCM[glcm_ii][glcm_jj+4];
      end
    end

    end
  else  for(glcm_ii = 0; glcm_ii<33; glcm_ii = glcm_ii +1)
        for(glcm_jj = 0; glcm_jj<32; glcm_jj= glcm_jj +1)
          GLCM[glcm_ii][glcm_jj] <= GLCM[glcm_ii][glcm_jj];


end


//-------------------------------------------
//  Transfer
//-------------------------------------------


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
//GLCM_group[image_row_reg][glcm_col_reg]
AXI4_WRITE_CTR writer_ctr(.clk(clk), .rst_n(rst_n), .start_addr(in_addr_G_reg), .data_store({GLCM[0][3],GLCM[0][2],GLCM[0][1],GLCM[0][0]}), .start_write(current_state==TRANSFER), .finish(finish_write),
                          .awaddr_inf(awaddr_m_inf), .awlen_inf(awlen_m_inf), .awvalid_inf(awvalid_m_inf), .awready_inf(awready_m_inf),
                          .wdata_inf(wdata_m_inf), .wlast_inf(wlast_m_inf), .wvalid_inf(wvalid_m_inf), .wready_inf(wready_m_inf),
                          .bid_inf(bid_m_inf), .bvalid_inf(bvalid_m_inf), .bready_inf(bready_m_inf));





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
//!output reg [79:0] sram_read_out;      //!
output reg [19:0] sram_read_out;      //!

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
//!reg [79:0] temp_reg1, temp_comb1;
reg [19:0] temp_reg1, temp_comb1;


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
    STALL:      read_unit_state_n = FINISH;
                //if(dram_addr_reg>'d0) read_unit_state_n = FINISH;
                //else                  read_unit_state_n = STALL;

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
  
    2'b00:  temp_comb1 = {sram_data_out};
    2'b01:  temp_comb1 = {sram_data_out[4:0], temp_reg0[19:5]};
    2'b10:  temp_comb1 = {sram_data_out[9:0], temp_reg0[19:10]};
    2'b11:  temp_comb1 = {sram_data_out[14:0], temp_reg0[19:15]};
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
      if(dram_addr_reg>'d0)
        data_valid <= 'b1;
      else  data_valid <= 'b0;
  else if(read_unit_state_c==STALL)
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
                      start_addr, data_store, start_write, finish,//fetch_next, //this can use wready
                      awaddr_inf, awlen_inf, awvalid_inf, awready_inf,
                      wdata_inf, wlast_inf, wvalid_inf, wready_inf,
                      bid_inf, bvalid_inf, bready_inf);
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 32;
input clk;
input rst_n;
input [11:0] start_addr;
input [31:0] data_store;
input start_write;
output wire finish;
//output fetch_next;
// axi write address channel 
output  wire [ADDR_WIDTH-1:0]    awaddr_inf;
output  wire [3:0]             awlen_inf;
output  reg                  awvalid_inf;
input   wire                 awready_inf;
// axi write data channel 
output  wire [ DATA_WIDTH-1:0]     wdata_inf;
output  reg                   wlast_inf;
output  reg                  wvalid_inf;
input   wire                  wready_inf;
// axi write response channel
input   wire [ID_WIDTH-1:0]         bid_inf;
input   wire              	   bvalid_inf;
output  reg                  bready_inf;

parameter IDLE = 'd0,
          ADDR_CONN = 'd1,
          WRITE      = 'd2,
          BRES       = 'd3;
//--------------------------------------
//  Global write setting
//--------------------------------------
assign awlen_inf = 4'hf;
//--------------------------------------
//  reg, wires
//--------------------------------------
reg [1:0] write_unit_c, write_unit_n;

reg [3:0] write_cnt_reg, write_cnt_comb;

reg [3:0] write_inner_cnt_reg, write_inner_cnt_comb;

reg wlast_pre;

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  write_unit_c <= IDLE;
  else        write_unit_c <= write_unit_n;
end
always@(*)begin
  case(write_unit_c)
    IDLE:       if(start_write) write_unit_n = ADDR_CONN;
                else            write_unit_n = IDLE;
    ADDR_CONN:  if(awready_inf) write_unit_n = WRITE;
                else            write_unit_n = ADDR_CONN;
    WRITE:      if(wlast_inf)   write_unit_n = BRES;
                else            write_unit_n = WRITE;
    BRES:       if(write_cnt_reg=='b0&&bvalid_inf)  write_unit_n = IDLE;
                else if(bvalid_inf)                 write_unit_n = ADDR_CONN;
                else                                write_unit_n = BRES;
  endcase
end

assign finish = write_cnt_reg=='b0&&bvalid_inf;

always@(*)begin
  if(wready_inf) write_inner_cnt_comb = write_inner_cnt_reg + 'd1;
  else            write_inner_cnt_comb = write_inner_cnt_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  write_inner_cnt_reg <= 'b0;
  else        write_inner_cnt_reg <= write_inner_cnt_comb;
end

always@(*)begin
  if(wlast_inf) write_cnt_comb = write_cnt_reg + 'd1;
  else          write_cnt_comb = write_cnt_reg;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  write_cnt_reg <= 'b0;
  else        write_cnt_reg <= write_cnt_comb;
end
assign awaddr_inf = {18'b00_0000_0000_0000_0000,2'b10,(start_addr[11:6] + write_cnt_reg),start_addr[5:0]};
assign wdata_inf = data_store;
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                           awvalid_inf <= 'b0;
  else  if(write_unit_n== ADDR_CONN)   awvalid_inf <= 'b1;
  else                                 awvalid_inf <= 'b0;
end

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                                         wlast_inf <= 'b0;
  else  if(write_inner_cnt_comb=='hf)                wlast_inf <= 'b1;
  else                                               wlast_inf <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                           wvalid_inf <= 'b0;
  else  if(write_unit_n == WRITE)   wvalid_inf <= 'b1;
  else                                 wvalid_inf <= 'b0;
end

always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                           bready_inf <= 'b0;
  else  if(write_unit_n == BRES)    bready_inf <= 'b1;
  else                                 bready_inf <= 'b0;
end


endmodule