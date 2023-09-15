//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Final Project: Customized ISA Processor 
//   Author              : Hsi-Hao Huang
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : CPU.v
//   Module Name : CPU.v
//   Release version : V1.0 (Release Date: 2023-May)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module CPU(

				clk,
			  rst_n,
  
		   IO_stall,

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
// Input port
input  wire clk, rst_n;
// Output port
output reg  IO_stall;

parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 16, DRAM_NUMBER=2, WRIT_NUMBER=1;

// AXI Interface wire connecttion for pseudo DRAM read/write
/* Hint:
  your AXI-4 interface could be designed as convertor in submodule(which used reg for output signal),
  therefore I declared output of AXI as wire in CPU
*/



// axi write address channel 
output  wire [WRIT_NUMBER * ID_WIDTH-1:0]        awid_m_inf;
output  wire [WRIT_NUMBER * ADDR_WIDTH-1:0]    awaddr_m_inf;
output  wire [WRIT_NUMBER * 3 -1:0]            awsize_m_inf;
output  wire [WRIT_NUMBER * 2 -1:0]           awburst_m_inf;
output  wire [WRIT_NUMBER * 7 -1:0]             awlen_m_inf;
output  wire [WRIT_NUMBER-1:0]                awvalid_m_inf;
input   wire [WRIT_NUMBER-1:0]                awready_m_inf;
// axi write data channel 
output  wire [WRIT_NUMBER * DATA_WIDTH-1:0]     wdata_m_inf;
output  wire [WRIT_NUMBER-1:0]                  wlast_m_inf;
output  wire [WRIT_NUMBER-1:0]                 wvalid_m_inf;
input   wire [WRIT_NUMBER-1:0]                 wready_m_inf;
// axi write response channel
input   wire [WRIT_NUMBER * ID_WIDTH-1:0]         bid_m_inf;
input   wire [WRIT_NUMBER * 2 -1:0]             bresp_m_inf;
input   wire [WRIT_NUMBER-1:0]             	   bvalid_m_inf;
output  wire [WRIT_NUMBER-1:0]                 bready_m_inf;
// -----------------------------
// axi read address channel 
output  wire [DRAM_NUMBER * ID_WIDTH-1:0]       arid_m_inf;
output  wire [DRAM_NUMBER * ADDR_WIDTH-1:0]   araddr_m_inf;
output  wire [DRAM_NUMBER * 7 -1:0]            arlen_m_inf;
output  wire [DRAM_NUMBER * 3 -1:0]           arsize_m_inf;
output  wire [DRAM_NUMBER * 2 -1:0]          arburst_m_inf;
output  wire [DRAM_NUMBER-1:0]               arvalid_m_inf;
input   wire [DRAM_NUMBER-1:0]               arready_m_inf;
// -----------------------------
// axi read data channel 
input   wire [DRAM_NUMBER * ID_WIDTH-1:0]         rid_m_inf;
input   wire [DRAM_NUMBER * DATA_WIDTH-1:0]     rdata_m_inf;
input   wire [DRAM_NUMBER * 2 -1:0]             rresp_m_inf;
input   wire [DRAM_NUMBER-1:0]                  rlast_m_inf;
input   wire [DRAM_NUMBER-1:0]                 rvalid_m_inf;
output  wire [DRAM_NUMBER-1:0]                 rready_m_inf;
// -----------------------------

//
//
// 
/* Register in each core:
  There are sixteen registers in your CPU. You should not change the name of those registers.
  TA will check the value in each register when your core is not busy.
  If you change the name of registers below, you must get the fail in this lab.
*/

reg signed [15:0] core_r0 , core_r1 , core_r2 , core_r3 ;
reg signed [15:0] core_r4 , core_r5 , core_r6 , core_r7 ;
reg signed [15:0] core_r8 , core_r9 , core_r10, core_r11;
reg signed [15:0] core_r12, core_r13, core_r14, core_r15;


//###########################################
//
// Wrtie down your design below
//
//###########################################

//####################################################
//               Parameters
//####################################################
parameter s_IDLE  = 'd0,
          s_FETCH = 'd1,
          s_DECODE= 'd2,
          s_LOAD  = 'd3,
          s_STORE = 'd4,
          s_EXE   = 'd5,
          s_WRITE = 'd6;


//####################################################
//               reg & wire
//####################################################
reg [2:0] curr_state, next_state;

//======================================================================
//            INSTRUCTION STRUCTURE
//-----------------------------------------------------------------------
//  R-TYPE  | opcode(3bit) | rs(4bit) | rt(4bit)| rd(4bit) | func(1bit) |
//  I-TYPE  | opcode(3bit) | rs(4bit) | rt(4bit)| immediate(5bit)       |
//  J-TYPE  | opcode(3bit) | Address(13bit)                             |
//-----------------------------------------------------------------------
reg [15:0] inst_fetched;
wire [2:0] opcode;
wire [3:0] rs_id, rt_id, rd_id;
wire [4:0] immediate;
wire func;
wire [10:0] j_addr_val_part;
//**********************************
reg signed [15:0] rs_value, rt_value;
wire updat_reg_condi;
//======================================================================
//PC:   Use 11bit
reg  [10:0] curr_pc, next_pc;
wire [10:0] next_pc_comb;
wire [12:0] pc_curr={1'b1,curr_pc,1'b0};
//======================================================================
//AXI_DATA_WRITE
//  INPUT:  data_addr[11:1], data_content[15:0], in_valid
//  OUTPUT: out_valid
//----------------------------------------------------------------------
//INPUT
reg [10:0] data_addr2Cache;
reg [15:0] data_2_Cache;
reg        write_req;
//OUTPUT
wire       w_dram_finish;
//****************************************
reg check_store_flag;
reg check_cache;
reg check_dram;
//======================================================================
//AXI_READ_INST
//  INPUT:  inst_addr[11:1],  search_flag 
//  OUTPUT: inst_2_cpu[15:0], inst_valid
//  SHARED: inst_addr[11:1](curr_pc[10:0])
//----------------------------------------------------------------------
//INPUT
reg         fetch_req;
//OUTPUT
wire [15:0] inst_comb;
wire        fetch_finish;
//======================================================================
//AXI_DATA_CACHE
//  INPUT:  in_valid, en_write, data_addr[10:0], in_data
//  OUTPUT: data_2_cpu[15:0], out_valid
//  SHARED: data_addr[10:0] (data_addr2Cache[10:0]), in_data (data_2_Cache[15:0])
//
//----------------------------------------------------------------------
//INPUT
reg data_req;
reg write_mod;
//OUTPUT
wire [15:0] data_comb;
wire        rw_sram_finish;
//####################################################
//               Compute wire
//####################################################
reg signed [15:0] alu_in0, alu_in1;

reg [15:0] alu_result;
wire signed [15:0] add_res;
wire signed [15:0] sub_res;
wire        slt_res;
wire signed [15:0] mult_res;

//####################################################
//               Output CTR
//####################################################
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)                                            IO_stall <= 'b1;
  else if(((curr_state!=s_IDLE)&(curr_state!=s_FETCH))&&(next_state==s_FETCH))  
                                                        IO_stall <= 'b0;
  else                                                  IO_stall <= 'b1;
end

//####################################################
//           FSM CTR
//---------------------------------------------------
//Function type:
//    ADD, SUB, Mult, SLT: 
//            FETCH -> DECODE -> EXE -> WRITE BACK -> (IDLE)
//    LOAD:   FETCH -> DECODE(LOAD) -> WRTIE BACK -> (IDLE)
//    STORE:  FETCH -> DECODE -> MEM -> (IDLE)
//    BEQ:    FETCH -> DECODE(WAIT to get new inst set) -> (IDLE)
//    Jr:     FETCH -> DECODE(WAIT to get new inst set) -> (IDLE)
//=================================================================
//Function type:  ver.2
//  ADD, SUB, MULT, SLT:
//          FETCH -> DECODE -> EXE -> WRITE BACK -> (NEXT FETCH)
//  LOAD:   FETCH -> DECODE -> EXE ->   LOAD     -> WRITE BACK  -> (NEXT FETCH)
//  STORE:  FETCH -> DECODE -> EXE -> STORE -> (NEXT FETCH)
//  BEQ:    FETCH -> DECODE -> EXE -> (NEXT FETCH)
//  Jr:     FETCH -> DECODE -> EXE -> (NEXT FETCH)
//=================================================================
//Function type:  ver.3
//  ADD, SUB, MULT, SLT:
//          FETCH -> DECODE -> EXE -> (NEXT FETCH)(WB)
//  LOAD:   FETCH -> DECODE -> EXE -> LOAD          -> (NEXT FETCH)(WB)
//  STORE:  FETCH -> DECODE -> EXE -> STORE         -> (NEXT FETCH)
//  BEQ:    FETCH -> DECODE -> EXE -> (NEXT FETCH)
//  Jr:     FETCH -> DECODE -> EXE -> (NEXT FETCH)
//####################################################
always@(posedge clk or negedge rst_n)begin
  if(~rst_n)  curr_state <= s_IDLE;
  else        curr_state <= next_state;
end
/*
always@(*)begin
  case(curr_state)
    s_IDLE:     next_state = s_FETCH;
    s_FETCH:    if(fetch_finish)  next_state = s_DECODE;
                else              next_state = curr_state;
    s_DECODE:   next_state = s_EXE;
    s_EXE:begin
          case({opcode, func})
            4'b0000, 4'b0001, 4'b0010, 4'b0011: next_state = s_WRITE;
            4'b0110, 4'b0111:                   next_state = s_LOAD;
            4'b0100, 4'b0101:                   next_state = s_STORE;
            4'b1010, 4'b1011, 4'b1000, 4'b1001: next_state = s_FETCH;
            default:                            next_state = s_FETCH;
          endcase
    end
    s_WRITE:    next_state = s_FETCH;
    s_LOAD:     if(rw_sram_finish)              next_state = s_WRITE;
                else                            next_state = s_LOAD;
    s_STORE:    if((check_store_flag)&((w_dram_finish)|((rw_sram_finish)&(write_mod))))
                                                next_state = s_FETCH;
                else                            next_state = s_STORE;
  endcase
end
*/
always@(*)begin
  case(curr_state)
    s_IDLE:     next_state = s_FETCH;
    s_FETCH:    if(fetch_finish)  next_state = s_DECODE;
                else              next_state = curr_state;
    s_DECODE:   next_state = s_EXE;
    s_EXE:begin
          case({opcode, func})
            4'b0000, 4'b0001, 4'b0010, 4'b0011: next_state = s_FETCH;
            4'b0110, 4'b0111:                   next_state = s_LOAD;
            4'b0100, 4'b0101:                   next_state = s_STORE;
            4'b1010, 4'b1011, 4'b1000, 4'b1001: next_state = s_FETCH;
            default:                            next_state = s_FETCH;
          endcase
    end
    //s_WRITE:    next_state = s_FETCH;
    s_LOAD:     if(rw_sram_finish)              next_state = s_FETCH;
                else                            next_state = s_LOAD;
    s_STORE:    if((check_cache&w_dram_finish)|(rw_sram_finish&write_mod&check_dram)|(rw_sram_finish&write_mod&w_dram_finish))
                  
                //if((check_store_flag)&((w_dram_finish)|((rw_sram_finish)&(write_mod))))
                                                next_state = s_FETCH;
                else                            next_state = s_STORE;
    default:    next_state = s_IDLE;
  endcase
end

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
//check_store_flag
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    check_store_flag <= 'b0;
  else if(curr_state==s_FETCH)  check_store_flag <= 'b0;
  else if((w_dram_finish)|((rw_sram_finish)&(write_mod)))
                                check_store_flag <= 'b1;
  else                          check_store_flag <= check_store_flag;
end
//####################################################
//               REGs
//####################################################
assign updat_reg_condi = (next_state==s_FETCH)&&((opcode<'d2)|(opcode=='d3));
//reg0~reg3
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  core_r0 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h0)&(opcode<'d2))|(rt_id==4'h0)&(opcode=='d3)))begin
      if(opcode[1]) core_r0 <= data_comb;
      else          core_r0 <= alu_result;
  end
  else            core_r0 <= core_r0;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r1 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h1)&(opcode<'d2))|(rt_id==4'h1)&(opcode=='d3)))begin
      if(opcode[1]) core_r1 <= data_comb;
      else          core_r1 <= alu_result;
  end
  else              core_r1 <= core_r1;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r2 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h2)&(opcode<'d2))|(rt_id==4'h2)&(opcode=='d3)))begin
      if(opcode[1]) core_r2 <= data_comb;
      else          core_r2 <= alu_result;
  end
  else              core_r2 <= core_r2;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r3 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h3)&(opcode<'d2))|(rt_id==4'h3)&(opcode=='d3)))begin
      if(opcode[1]) core_r3 <= data_comb;
      else          core_r3 <= alu_result;
  end
  else              core_r3 <= core_r3;
end
//reg4~reg7
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r4 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h4)&(opcode<'d2))|(rt_id==4'h4)&(opcode=='d3)))begin
      if(opcode[1]) core_r4 <= data_comb;
      else          core_r4 <= alu_result;
  end
  else              core_r4 <= core_r4;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r5 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h5)&(opcode<'d2))|(rt_id==4'h5)&(opcode=='d3)))begin
      if(opcode[1]) core_r5 <= data_comb;
      else          core_r5 <= alu_result;
  end
  else              core_r5 <= core_r5;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r6 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h6)&(opcode<'d2))|(rt_id==4'h6)&(opcode=='d3)))begin
      if(opcode[1]) core_r6 <= data_comb;
      else          core_r6 <= alu_result;
  end
  else              core_r6 <= core_r6;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r7 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h7)&(opcode<'d2))|(rt_id==4'h7)&(opcode=='d3)))begin
      if(opcode[1]) core_r7 <= data_comb;
      else          core_r7 <= alu_result;
  end
  else              core_r7 <= core_r7;
end
//reg8~reg11
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r8 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h8)&(opcode<'d2))|(rt_id==4'h8)&(opcode=='d3)))begin
      if(opcode[1]) core_r8 <= data_comb;
      else          core_r8 <= alu_result;
  end
  else              core_r8 <= core_r8;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r9 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'h9)&(opcode<'d2))|(rt_id==4'h9)&(opcode=='d3)))begin
      if(opcode[1]) core_r9 <= data_comb;
      else          core_r9 <= alu_result;
  end
  else              core_r9 <= core_r9;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r10 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'ha)&(opcode<'d2))|(rt_id==4'ha)&(opcode=='d3)))begin
      if(opcode[1]) core_r10 <= data_comb;
      else          core_r10 <= alu_result;
  end
  else              core_r10 <= core_r10;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r11 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'hb)&(opcode<'d2))|(rt_id==4'hb)&(opcode=='d3)))begin
      if(opcode[1]) core_r11 <= data_comb;
      else          core_r11 <= alu_result;
  end
  else              core_r11 <= core_r11;
end
//reg12~reg15
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r12 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'hc)&(opcode<'d2))|(rt_id==4'hc)&(opcode=='d3)))begin
      if(opcode[1]) core_r12 <= data_comb;
      else          core_r12 <= alu_result;
  end
  else            core_r12 <= core_r12;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r13 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'hd)&(opcode<'d2))|(rt_id==4'hd)&(opcode=='d3)))begin
      if(opcode[1]) core_r13 <= data_comb;
      else          core_r13 <= alu_result;
  end
  else              core_r13 <= core_r13;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r14 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'he)&(opcode<'d2))|(rt_id==4'he)&(opcode=='d3)))begin
      if(opcode[1]) core_r14 <= data_comb;
      else          core_r14 <= alu_result;
  end
  else              core_r14 <= core_r14;
end
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        core_r15 <= 'b0;
  else if((curr_state==s_EXE|curr_state==s_LOAD)&(next_state==s_FETCH)&(((rd_id==4'hf)&(opcode<'d2))|(rt_id==4'hf)&(opcode=='d3)))begin
      if(opcode[1]) core_r15 <= data_comb;
      else          core_r15 <= alu_result;
  end
  else              core_r15 <= core_r15;
end

//####################################################
//               PC CTR
//####################################################
//curr_pc
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    curr_pc <= 'b0;
  else if((curr_state>'d1)&(next_state==s_FETCH))  curr_pc <= next_pc;
  else                          curr_pc <= curr_pc;
end
assign next_pc_comb = curr_pc + 'b1;
always@(*)begin
  if(curr_state==s_IDLE)  next_pc = 'b0;
  else begin
      if(opcode[2])begin
        //TODO:
        if((opcode[0]))begin
            if((rt_value==rs_value))
              next_pc = alu_result[10:0];
            else
              next_pc = next_pc_comb;
        end            
        else              next_pc = j_addr_val_part;
      end
      else                next_pc = next_pc_comb;  
  end
end





//####################################################
//               ALU
//####################################################
always @(*) begin
  case({opcode,func})
    4'b0000: alu_result = sub_res;            //SUB
    4'b0010: alu_result = mult_res;           //MULT
    4'b0011: alu_result = slt_res;            //SLT
    4'b0001,//: alu_result = add_res;            //ADD
    4'b0110, 4'b0111,//: alu_result = add_res;   //LOAD
    4'b0100, 4'b0101,//: alu_result = add_res;   //STORE
    4'b1010, 4'b1011: alu_result = add_res;   //BEQ
    default:          alu_result = add_res;      
  endcase
end
assign add_res = alu_in0 + alu_in1;
assign sub_res = alu_in0 - alu_in1;
assign slt_res = (alu_in0 < alu_in1)?1'b1:1'b0;
assign mult_res = alu_in0 * alu_in1;




//rs -> alu_in0
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    alu_in0 <= 'b0;
  else if(curr_state==s_DECODE)begin
    if(~opcode[2])              alu_in0 <= rs_value;
    else                        alu_in0 <= next_pc_comb;
  end
  else                          alu_in0 <= alu_in0;
end
always @(*)begin
  case(rs_id)
    4'h0: rs_value = core_r0;
    4'h1: rs_value = core_r1;
    4'h2: rs_value = core_r2;
    4'h3: rs_value = core_r3;
    4'h4: rs_value = core_r4;
    4'h5: rs_value = core_r5;
    4'h6: rs_value = core_r6;
    4'h7: rs_value = core_r7;
    4'h8: rs_value = core_r8;
    4'h9: rs_value = core_r9;
    4'ha: rs_value = core_r10;
    4'hb: rs_value = core_r11;
    4'hc: rs_value = core_r12;
    4'hd: rs_value = core_r13;
    4'he: rs_value = core_r14;
    4'hf: rs_value = core_r15;
    default:  rs_value = 'b0;
  endcase
end
//rt -> alu_in1
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    alu_in1 <= 'b0;
  else if(curr_state==s_DECODE)begin
    if(opcode[2:1]==2'b00)      alu_in1 <= rt_value;
    else                        alu_in1 <= {{11{immediate[4]}},immediate};
  end
  else                          alu_in1 <= alu_in1;
end
always @(*)begin
  case(rt_id)
    4'h0: rt_value = core_r0;
    4'h1: rt_value = core_r1;
    4'h2: rt_value = core_r2;
    4'h3: rt_value = core_r3;
    4'h4: rt_value = core_r4;
    4'h5: rt_value = core_r5;
    4'h6: rt_value = core_r6;
    4'h7: rt_value = core_r7;
    4'h8: rt_value = core_r8;
    4'h9: rt_value = core_r9;
    4'ha: rt_value = core_r10;
    4'hb: rt_value = core_r11;
    4'hc: rt_value = core_r12;
    4'hd: rt_value = core_r13;
    4'he: rt_value = core_r14;
    4'hf: rt_value = core_r15;
    default:  rt_value = 'b0;
  endcase
end


//####################################################
//           AXI Global setting
//---------------------------------------------------
//  Allow to fix: 
//                awsize_m_inf, awburst_m_inf
//                arsize_m_inf, arburst_m_inf
//---------------------------------------------------
//  Can be set zero:
//                awid_m_inf, awlen_m_inf,
//                arid_m_inf
//
//####################################################
assign awid_m_inf     = 4'b0;
assign awsize_m_inf   = 3'b001;
assign awburst_m_inf  = 2'b01;
assign awlen_m_inf    = 7'b0;


assign arid_m_inf     = 8'b0;
//assign arlen_m_inf    = 14'b11_1111_1111_1111;
assign arsize_m_inf   = 6'b00_1001;
assign arburst_m_inf  = 4'b0101;
//####################################################################
//           AXI write/response: STORE submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                awready_m_inf,  
//                wready_m_inf,   
//                bid_m_inf[3:0],      bresp_m_inf[1:0],   bvalid_m_inf
//                data_addr[11:1],     data_content[15:0], in_valid
//    Output:     awaddr_m_inf[31:0],  awvalid_m_inf,  
//                wdata_m_inf[15:0],   wlast_m_inf,       wvalid_m_inf,
//                bready_m_inf
//                out_valid
// Global ports:  
//                awid_m_inf, awsize_m_inf, awburst_m_inf, awlen_m_inf
//####################################################################


always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  data_addr2Cache <= 'b0;
  else        data_addr2Cache <= alu_result[10:0];
end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  data_2_Cache <= 'b0;
  else        data_2_Cache <= rt_value;
end


always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  write_req <= 'b0;
  else if(w_dram_finish|check_dram)
              write_req <= 'b0;
  else if(next_state==s_STORE)
              write_req <= 'b1;
  else        write_req <= write_req;
end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n) check_dram <= 'b0;
  else if(next_state==s_DECODE) check_dram <= 'b0;
  else if(w_dram_finish)        check_dram <= 'b1;
  else                          check_dram <= check_dram;
end



AXI_DATA_WRITE AXI_DATA_WRITE_INS(
//inputs
      .clk(clk), .rst_n(rst_n),
      .awready_m(awready_m_inf),
      .wready_m(wready_m_inf),
      .bid_m(bid_m_inf),          .bresp_m(bresp_m_inf),     .bvalid_m(bvalid_m_inf),
//TODO:
      .data_addr(data_addr2Cache),.data_content(data_2_Cache),.in_valid(write_req),
//outputs
      .awaddr_m(awaddr_m_inf),    .awvalid_m(awvalid_m_inf),
      .wdata_m(wdata_m_inf),      .wlast_m(wlast_m_inf),      .wvalid_m(wvalid_m_inf),
      .bready_m(bready_m_inf),
//TODO:
      .out_valid(w_dram_finish)
);
//####################################################################
//           AXI read:  Inst. read submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                arready_m_inf[1]  
//                rid_m_inf[7:4],    rdata_m_inf[31:16],  rresp_m_inf[3:2], rlast_m_inf[1], rvalid_m_inf[1]
//                inst_addr[11:1],   search_flag
//        
//    Output:     arlen_m_inf[13:7], araddr_m_inf[63:32], arvalid_m_inf[1], rready_m_inf[1]
//                inst_2_cpu[15:0],        inst_valid
// Global ports:  
//                arid_m_inf[7:4],   arsize_m_inf[5:3],   arburst_m_inf[3:2]
//####################################################################
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)            inst_fetched <= 'b0;
  else if(fetch_finish) inst_fetched <= inst_comb;
  else                  inst_fetched <= inst_fetched;
end

assign opcode = inst_fetched[15:13];
assign rs_id =  inst_fetched[12:9];
assign rt_id =  inst_fetched[8:5];
assign rd_id =  inst_fetched[4:1];
assign func  =  inst_fetched[0];

assign immediate = inst_fetched[4:0];
assign j_addr_val_part = inst_fetched[11:1];




always @(posedge clk or negedge rst_n)begin
  if(~rst_n)  fetch_req <= 'b0;
  else if(fetch_finish)
              fetch_req <= 'b0;
  else if(next_state==s_FETCH)
              fetch_req <= 'b1;
  else        fetch_req <= fetch_req;
end

AXI_READ_INST AXI_READ_INST_INS(
//inputs
      .clk(clk), .rst_n(rst_n),
      .arready_m(arready_m_inf[1]),
      .rid_m(rid_m_inf[7:4]),       .rdata_m(rdata_m_inf[31:16]),     .rresp_m(rresp_m_inf[3:2]),
      .rlast_m(rlast_m_inf[1]),     .rvalid_m(rvalid_m_inf[1]),
//TODO:
      .inst_addr(curr_pc),          .search_flag(fetch_req),
//outputs
      .arlen_m(arlen_m_inf[13:7]),  .araddr_m(araddr_m_inf[63:32]),   .arvalid_m(arvalid_m_inf[1]),
      .rready_m(rready_m_inf[1]),
//TODO:
      .inst_2_cpu(inst_comb), .inst_valid(fetch_finish)
);




//####################################################################
//           AXI read:  Data read submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                arready_m_inf[0]  
//                rid_m_inf[3:0],   rdata_m_inf[15:0],  rresp_m_inf[1:0], rlast_m_inf[0], rvalid_m_inf[0]                
//                in_valid,          en_write,          data_addr[11:1],  in_data[15:0]  
//
//    Output:     arlen_m_inf[6:0], araddr_m_inf[31:0], arvalid_m_inf[0], rready_m_inf[0]
//                data_2_cpu[15:0],  out_valid
// Global ports:  
//                arid_m_inf[3:0], arsize_m_inf[2:0],   arburst_m_inf[1:0]
//####################################################################

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  data_req <= 'b0;
  else if(rw_sram_finish|check_cache)
              data_req <= 'b0;
  else if((next_state==s_LOAD)|(next_state==s_STORE))
              data_req <= 'b1;
  else        data_req <= data_req;
end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  write_mod <= 'b0;
  else if(rw_sram_finish|check_cache)
              write_mod <= 'b0;
  else if((next_state==s_STORE))
              write_mod <= 'b1;
  else        write_mod <= write_mod;
end


always @(posedge clk or negedge rst_n) begin
  if(~rst_n) check_cache <= 'b0;
  else if(next_state==s_DECODE)     check_cache <= 'b0;
  else if(rw_sram_finish&write_mod) check_cache <= 'b1;
  else                              check_cache <= check_cache;
end



AXI_DATA_CACHE AXI_DATA_CACHE_INS(
//inputs
      .clk(clk), .rst_n(rst_n),
      .arready_m(arready_m_inf[0]),
      .rid_m(rid_m_inf[3:0]),       .rdata_m(rdata_m_inf[15:0]),     .rresp_m(rresp_m_inf[1:0]),
      .rlast_m(rlast_m_inf[0]),     .rvalid_m(rvalid_m_inf[0]),
//TODO:
      .in_valid(data_req),          .en_write(write_mod),           .data_addr(data_addr2Cache),
      .in_data(data_2_Cache),
//outputs
      .arlen_m(arlen_m_inf[6:0]),   .araddr_m(araddr_m_inf[31:0]),   .arvalid_m(arvalid_m_inf[0]),
      .rready_m(rready_m_inf[0]),
//TODO:
      .data_2_cpu(data_comb),       .out_valid(rw_sram_finish)
);




endmodule




//####################################################################
//           AXI read:  Inst. read submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                arready_m_inf[1]  
//                rid_m_inf[7:4],    rdata_m_inf[31:16],  rresp_m_inf[3:2], rlast_m_inf[1], rvalid_m_inf[1]
//                inst_addr[11:1],   search_flag
//        
//    Output:     arlen_m_inf[13:7], araddr_m_inf[63:32], arvalid_m_inf[1], rready_m_inf[1]
//                inst_2_cpu[15:0],        inst_valid
// Global ports:  
//                arid_m_inf[7:4],   arsize_m_inf[5:3],   arburst_m_inf[3:2]
//####################################################################
module AXI_READ_INST(
//inputs
      clk, rst_n,
      arready_m,
      rid_m,      rdata_m,     rresp_m,   rlast_m, rvalid_m,
      inst_addr,  search_flag,
//outputs
      arlen_m,    araddr_m,    arvalid_m, rready_m,
      inst_2_cpu, inst_valid
);
// input port  
input wire clk, rst_n;
input wire arready_m;
input wire [3:0]  rid_m;
input wire [15:0] rdata_m;
input wire [1:0]  rresp_m;
input wire rlast_m;
input wire rvalid_m;
input wire [10:0] inst_addr;
input wire search_flag;
// output port
output reg [6:0]  arlen_m;
output reg [31:0] araddr_m;
output reg arvalid_m;
output reg rready_m;
output wire [15:0] inst_2_cpu;
output reg inst_valid;
//----------------------------------------
//  Parameter
//----------------------------------------
parameter i_IDLE =           'd0,
          i_FIND =           'd1,
          i_MISS =           'd2,
          i_UPDATE =         'd3,
          i_FIND_AF_MISS  =  'd4,
          i_OUT2CPU =        'd5;
//----------------------------------------
//  Regs and Wires
//----------------------------------------
reg [2:0] curr_state_ir, next_state_ir;
reg sram_avail;
reg [10:0] addr_center;

wire [2:0] inst_addr_pg;
wire       inst_addr_prefix;
wire [6:0] inst_addr_id;

reg [10:0] addr_lower;
reg [2:0] addr_upper;
wire [10:0] addr_lower_comp;
wire [10:0] addr_upper_comp;
reg [2:0] addr_lower_R, addr_upper_R;


reg [10:0] addr_target;
wire lower_check, upper_check;
//DRAM BUFFER------------------------------
reg [15:0] dram_buffer;
reg rlast_delay;
//SRAM CTR------------------------------
wire addr_prefix;
reg [7:0] sram_addr;
reg [7:0] sram_addr_filter;
reg  sram_wen;
//--------------------------------------

//----------------------------------------
//  GLOBAL WIRES
//----------------------------------------
//  INSTRUCTION ADDR 32bit {19'b0,1'b1,12'h000}~{19'b0,1'b1,12'hfff}
//  valid range:  
//      {19'b0,1'b1,{11'b000_0000_0000},1'b0}
//  ~   {19'b0,1'b1,{11'b111_1111_1111},1'b0}
//----------------------------------------

assign inst_addr_pg =     inst_addr[10:8];
assign inst_addr_prefix = inst_addr[7];
assign inst_addr_id =     inst_addr[6:0];


//----------------------------------------
//  OUTPUT CTR
//----------------------------------------
//arlen_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  arlen_m <= 'b0;
  else        arlen_m <= 'd127;
end
//araddr_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  araddr_m <= 'b0;
  else        araddr_m <= {19'b0,1'b1,{addr_lower},1'b0};
end
//arvalid_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      arvalid_m <= 'b0;
  else if(next_state_ir==i_MISS)  arvalid_m <= 'b1;
  else if(arready_m)              arvalid_m <= 'b0;
  else                            arvalid_m <= arvalid_m;
end
//rready_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)          rready_m <= 'b0;
  else if(arready_m)  rready_m <= 'b1;
  else if(rlast_m)    rready_m <= 'b0;
  else                rready_m <= rready_m;
end
//inst_valid
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                         inst_valid <= 'b0;
  //else if((curr_state_ir==i_FIND)&(next_state_ir==i_IDLE))
  else if((((next_state_ir==i_UPDATE)&((sram_addr==inst_addr_id)&rready_m&rvalid_m)))|((curr_state_ir==i_FIND)&(next_state_ir==i_IDLE)))
    
                                     inst_valid <= 'b1;
  else                               inst_valid <= 'b0;
end
//----------------------------------------
//  FSM CTR
//----------------------------------------

wire fix_flag;

assign fix_flag = ((addr_upper_R[0]!=addr_lower_R[0])&(((inst_addr_pg==addr_upper_R)&(inst_addr_prefix))|((inst_addr_pg==addr_lower_R)&(~inst_addr_prefix))));

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  curr_state_ir <= i_IDLE;
  else        curr_state_ir <= next_state_ir;
end
always @(*) begin
  case(curr_state_ir)
    i_IDLE:     if(search_flag)begin
                /*
                  if((~sram_avail)|((~lower_check)|(~upper_check))) 
                                    next_state_ir = i_MISS;
                  else              next_state_ir = i_FIND;
                */
                  next_state_ir = i_FIND;
                end
                else            next_state_ir = i_IDLE;
    i_FIND:     if((addr_prefix!=inst_addr_prefix)|(~sram_avail)|(~lower_check)|(~upper_check) |(fix_flag))
                     next_state_ir = i_MISS;
                else// if(addr_prefix==inst_addr[8])
    //                 next_state_ir = i_OUT2CPU;//TODO: HIT
                     next_state_ir = i_IDLE;//TODO: HIT
    i_MISS:     if(arvalid_m&arready_m)  next_state_ir = i_UPDATE;
                else                    next_state_ir = i_MISS;
    i_UPDATE:   if(rlast_m)             next_state_ir = i_FIND_AF_MISS;
                else                    next_state_ir = i_UPDATE;
    /*
    i_FIND_AF_MISS:                     next_state_ir = i_OUT2CPU;
    i_OUT2CPU:                          next_state_ir = i_IDLE;
    */
    i_FIND_AF_MISS:                     next_state_ir = i_IDLE;//next_state_ir = i_FIND;
    default:                            next_state_ir = i_IDLE;
  endcase
end

//----------------------------------------
//  addr bound
//----------------------------------------

/*
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)            addr_target <= 'b0;
  else if(search_flag)  addr_target <= inst_addr;
  else                  addr_target <= addr_target;
end
*/

always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_center <= 'b0;
  else if((search_flag)&(curr_state_ir==i_IDLE))
                                  addr_center <= inst_addr;
  else                            addr_center <= addr_center;
end

assign addr_lower_comp = addr_center -'d63;
always @(*) begin
  if(addr_center<='d63)     addr_lower = 'd0;
  else begin
    if(addr_center>11'd1983)  addr_lower = 11'd1920;
    else                    addr_lower = addr_lower_comp;
  end
end

always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_lower_R <= 'b0;
  else if(next_state_ir==i_MISS)  addr_lower_R <= addr_lower[10:8];
  else                            addr_lower_R <= addr_lower_R;
end

assign addr_upper_comp = addr_center + 'd64;
always @(*) begin
  if(addr_center<='d63)     addr_upper = 3'd0;
  else begin
    if(addr_center>11'd1983)  addr_upper = 3'd7;
    else                    addr_upper = addr_upper_comp[10:8];
  end
end
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_upper_R <= 'b0;
  else if(next_state_ir==i_MISS)  addr_upper_R <= addr_upper;
  else                            addr_upper_R <= addr_upper_R;
end



assign lower_check = (inst_addr_pg>=addr_lower_R);
assign upper_check = (inst_addr_pg<=addr_upper_R);
//----------------------------------------
//  Dram buffer
//----------------------------------------
/*
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)        dram_buffer <= 'b0;
  else if(rvalid_m) dram_buffer <= rdata_m;
  else              dram_buffer <= dram_buffer;
end
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)        rlast_delay <= 'b0;
  else              rlast_delay <= rlast_m;
end
*/
//----------------------------------------
//  SRAM MACRO
//----------------------------------------
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    sram_avail <= 'b0;
  else if(curr_state_ir==i_UPDATE) sram_avail <= 'b1;
  else                          sram_avail <= sram_avail;
end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  sram_addr <= 'b0;
/*  else if (next_state_ir==i_FIND)begin
              sram_addr <= {inst_addr[7:1]};
  end
*/
  else if(next_state_ir==i_MISS)begin
              sram_addr <= addr_lower[7:0];
  end
  else if(((rvalid_m)&(rready_m)))begin
              sram_addr <= sram_addr + 'b1;
  end
  else        sram_addr <= sram_addr;

end
always @(*) begin
  if(curr_state_ir==i_UPDATE)  sram_addr_filter = sram_addr[7:0];
  else                         sram_addr_filter = {inst_addr[7:0]};
end

always @(*) begin
  sram_wen = ~((rvalid_m)&(rready_m));
end

RA1SH_17b_128w Weight_SRAM(.Q({addr_prefix, inst_2_cpu}), .CLK(clk), .CEN(1'b0), .WEN(sram_wen), .A(sram_addr_filter[6:0]), .D({sram_addr_filter[7],rdata_m}), .OEN(1'b0));

endmodule







//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//####################################################################
//           AXI read:  Data read submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                arready_m_inf[0]  
//                rid_m_inf[3:0],   rdata_m_inf[15:0],  rresp_m_inf[1:0], rlast_m_inf[0], rvalid_m_inf[0]                
//                in_valid,          en_write,          data_addr[11:1],  in_data[15:0]  
//
//    Output:     arlen_m_inf[6:0], araddr_m_inf[31:0], arvalid_m_inf[0], rready_m_inf[0]
//                data_2_cpu[15:0],  out_valid
// Global ports:  
//                arid_m_inf[3:0], arsize_m_inf[2:0],   arburst_m_inf[1:0]
//####################################################################
module AXI_DATA_CACHE(
//inputs
      clk, rst_n,
      arready_m,
      rid_m,      rdata_m,     rresp_m,   rlast_m, rvalid_m,
      in_valid,   en_write,    data_addr, in_data,
//outputs
      arlen_m,    araddr_m,    arvalid_m, rready_m,
      data_2_cpu, out_valid
);
// input port  
input  wire clk, rst_n;
input wire arready_m;
input wire [3:0]  rid_m;
input wire [15:0] rdata_m;
input wire [1:0]  rresp_m;
input wire rlast_m;
input wire rvalid_m;

input wire in_valid;
input wire en_write;
input wire [10:0] data_addr;
input wire [15:0] in_data;
// output port
output reg [6:0]  arlen_m;
output reg [31:0] araddr_m;
output reg arvalid_m;
output reg rready_m;
output wire [15:0] data_2_cpu;
output reg out_valid;
//----------------------------------------
//  Parameter
//----------------------------------------
parameter d_IDLE =           'd0,
          d_FIND =           'd1,
          d_MISS =           'd2,
          d_UPDATE =         'd3,
          d_FIND_AF_MISS =   'd4,
          d_WRITE =          'd5,
          d_OUT2CPU =        'd6;
//----------------------------------------
//  Regs and Wires
//----------------------------------------
reg [2:0] curr_state_dr, next_state_dr;
reg sram_avail;
reg [10:0] addr_center;

wire [2:0] data_addr_pg;
wire       data_addr_prefix;
wire [6:0] data_addr_id;

reg [10:0] addr_lower;
reg [2:0]  addr_upper;
wire [10:0] addr_lower_comp;
wire [10:0] addr_upper_comp;
reg [2:0] addr_lower_R, addr_upper_R;


reg [10:0] addr_target;
wire lower_check, upper_check;
//DRAM BUFFER------------------------------
reg [15:0] dram_buffer;
reg rlast_delay;
//SRAM CTR------------------------------
wire addr_prefix;
reg [7:0] sram_addr;
reg [7:0] sram_addr_filter;
reg  sram_wen;

reg [15:0] data_filter;


wire prefix_fix;
//--------------------------------------

//----------------------------------------
//  GLOBAL WIRES
//----------------------------------------
assign data_addr_pg =     data_addr[10:8];
assign data_addr_prefix = data_addr[7];
assign data_addr_id =     data_addr[6:0];


//----------------------------------------
//  OUTPUT CTR
//----------------------------------------
//arlen_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  arlen_m <= 'b0;
  else        arlen_m <= 'd127;
end
//araddr_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  araddr_m <= 'b0;
  else        araddr_m <= {19'b0,1'b1,{addr_lower},1'b0};
end
//arvalid_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      arvalid_m <= 'b0;
  else if(next_state_dr==d_MISS)  arvalid_m <= 'b1;
  else if(arready_m)              arvalid_m <= 'b0;
  else                            arvalid_m <= arvalid_m;
end
//rready_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)          rready_m <= 'b0;
  else if(arready_m)  rready_m <= 'b1;
  else if(rlast_m)    rready_m <= 'b0;
  else                rready_m <= rready_m;
end
//inst_valid
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                         out_valid <= 'b0;
  //else if(curr_state_dr==d_OUT2CPU)  out_valid <= 'b1;
  //else if(((curr_state_dr==d_FIND)&(next_state_dr==d_IDLE))|(curr_state_dr==d_WRITE))
  //*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  else if((((next_state_dr==d_UPDATE)&((sram_addr==data_addr_id)&rready_m&rvalid_m)))|(curr_state_dr==d_WRITE)|((curr_state_dr==d_FIND)&(next_state_dr==d_IDLE)))
    
                                     out_valid <= 'b1;
  else                               out_valid <= 'b0;
end
//----------------------------------------
//  FSM CTR
//----------------------------------------

wire fix_flag;
assign fix_flag = ((addr_upper_R[0]!=addr_lower_R[0])&(((data_addr_pg==addr_upper_R)&(data_addr_prefix==1'b1))|((data_addr_pg==addr_lower_R)&(data_addr_prefix==1'b0))));


always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  curr_state_dr <= d_IDLE;
  else        curr_state_dr <= next_state_dr;
end
always @(*) begin
  case(curr_state_dr)
    d_IDLE:     if(in_valid&~out_valid)begin
                /*
                  if((~sram_avail)|((~lower_check)|(~upper_check))) 
                                    next_state_dr = d_MISS;
                  else              next_state_dr = d_FIND;
                */
                  next_state_dr = d_FIND;
                end
                else            next_state_dr = d_IDLE;
    d_FIND:     if((addr_prefix!=data_addr_prefix)|(~sram_avail)|(~lower_check)|(~upper_check)|fix_flag)
                     next_state_dr = d_MISS;
                else begin
                    if(en_write)  next_state_dr = d_WRITE;//TODO: HIT
                    else          next_state_dr = d_IDLE;//TODO: HIT
                end
    d_MISS:     if(arvalid_m&arready_m)  next_state_dr = d_UPDATE;
                else                    next_state_dr = d_MISS;
    d_UPDATE:   if(rlast_m)begin
                  if(en_write)          next_state_dr = d_WRITE;
                  else                  next_state_dr = d_FIND_AF_MISS;
                end
                else                    next_state_dr = d_UPDATE;
    /*
    d_FIND_AF_MISS:                     next_state_dr = d_OUT2CPU;
    d_WRITE:                            next_state_dr = d_OUT2CPU;
    d_OUT2CPU:                          next_state_dr = d_IDLE;
    */

    //!!!!!!!!!!!!!!!!!!
    d_FIND_AF_MISS:                     next_state_dr = d_IDLE;//next_state_dr = d_FIND;
    d_WRITE:                            next_state_dr = d_IDLE;

    default:                            next_state_dr = d_IDLE;
  endcase
end

//----------------------------------------
//  addr bound
//----------------------------------------

/*
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)            addr_target <= 'b0;
  else if(search_flag)  addr_target <= inst_addr;
  else                  addr_target <= addr_target;
end
*/

always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_center <= 'b0;
  else if((in_valid)&(curr_state_dr==d_IDLE))
                                  addr_center <= data_addr;
  else                            addr_center <= addr_center;
end

assign addr_lower_comp = addr_center -'d63;
always @(*) begin
  if(addr_center<='d63)     addr_lower = 'd0;
  else begin
    if(addr_center>11'd1983)  addr_lower = 11'd1920;
    else                    addr_lower = addr_lower_comp;
  end
end

always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_lower_R <= 'b0;
  else if(next_state_dr==d_MISS)  addr_lower_R <= addr_lower[10:8];
  else                            addr_lower_R <= addr_lower_R;
end

assign addr_upper_comp = addr_center + 'd64;
always @(*) begin
  if(addr_center<='d63)     addr_upper = 3'd0;
  else begin
    if(addr_center>'d1983)  addr_upper = 3'd7;
    else                    addr_upper = addr_upper_comp[10:8];
  end
end
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)                      addr_upper_R <= 'b0;
  else if(next_state_dr==d_MISS)  addr_upper_R <= addr_upper;
  else                            addr_upper_R <= addr_upper_R;
end

assign lower_check = (data_addr_pg>=addr_lower_R);
assign upper_check = (data_addr_pg<=addr_upper_R);
//----------------------------------------
//  Dram buffer
//----------------------------------------
/*
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)        dram_buffer <= 'b0;
  else if(rvalid_m) dram_buffer <= rdata_m;
  else              dram_buffer <= dram_buffer;
end
always @(posedge clk or negedge rst_n)begin
  if(~rst_n)        rlast_delay <= 'b0;
  else              rlast_delay <= rlast_m;
end
*/
//----------------------------------------
//  SRAM MACRO
//----------------------------------------
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                    sram_avail <= 'b0;
  else if(curr_state_dr==d_UPDATE) sram_avail <= 'b1;
  else                          sram_avail <= sram_avail;
end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  sram_addr <= 'b0;
/*  else if (next_state_dr==i_FIND)begin
              sram_addr <= {inst_addr[7:1]};
  end
*/
  else if(next_state_dr==d_MISS)begin
              sram_addr <= addr_lower[7:0];
  end
  else if(((rvalid_m)&(rready_m)))begin
              sram_addr <= sram_addr + 'b1;
  end
  else        sram_addr <= sram_addr;

end
always @(*) begin
  if(curr_state_dr==d_UPDATE)  sram_addr_filter = sram_addr[7:0];
  else                         sram_addr_filter = {data_addr[7:0]};
end

always @(*) begin
  if(curr_state_dr==d_UPDATE)begin
    sram_wen = ~((rvalid_m)&(rready_m));
  end
  else if(curr_state_dr==d_WRITE)begin
        sram_wen = 'b0;
  end
  else  sram_wen = 'b1;
end
always @(*) begin
  if(curr_state_dr==d_UPDATE) data_filter = rdata_m;
  else                        data_filter = in_data;
end

RA1SH_17b_128w Weight_SRAM(.Q({addr_prefix, data_2_cpu}), .CLK(clk), .CEN(1'b0), .WEN(sram_wen), .A(sram_addr_filter[6:0]), .D({sram_addr_filter[7],data_filter}), .OEN(1'b0));

endmodule



//####################################################################
//           AXI write/response: STORE submodule
//----------------------------------------------------
//    Input:      clk, rst_n
//                awready_m_inf,  
//                wready_m_inf,   
//                bid_m_inf[3:0],      bresp_m_inf[1:0],   bvalid_m_inf
//                data_addr[11:1],     data_content[15:0], in_valid
//    Output:     awaddr_m_inf[31:0],  awvalid_m_inf,  
//                wdata_m_inf[15:0],   wlast_m_inf,       wvalid_m_inf,
//                bready_m_inf
//                out_valid
// Global ports:  
//                awid_m_inf, awsize_m_inf, awburst_m_inf, awlen_m_inf
//####################################################################
module AXI_DATA_WRITE(
//inputs
      clk, rst_n,
      awready_m,
      wready_m,
      bid_m,      bresp_m,      bvalid_m,
      data_addr,  data_content, in_valid,
//outputs
      awaddr_m,   awvalid_m,
      wdata_m,    wlast_m,    wvalid_m,
      bready_m,
      out_valid
);
// input port  
input  wire clk, rst_n;
input wire awready_m;
input wire wready_m;
input wire [3:0] bid_m;
input wire [1:0] bresp_m;
input wire bvalid_m;
input wire [10:0] data_addr;
input wire [15:0] data_content;
input wire in_valid;
// output port
output reg [31:0] awaddr_m;
output reg awvalid_m;
output reg [15:0] wdata_m;
output reg wlast_m;
output reg wvalid_m;
output reg bready_m;
output reg out_valid;
//----------------------------------------
//  Parameter
//----------------------------------------
parameter w_IDLE =  'd0,
          w_CONN =  'd1,
          w_WRITE = 'd2,
          w_BRES =  'd3;
//----------------------------------------
//  Regs and Wires
//----------------------------------------
reg [1:0] curr_state_dw, next_state_dw;
//----------------------------------------
//  GLOBAL WIRES
//----------------------------------------
//----------------------------------------
//  OUTPUT CTR
//----------------------------------------
//awaddr_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)        awaddr_m <= 'b0;
  else if(in_valid) awaddr_m <= {19'b0,1'b1,{data_addr},1'b0};
  else              awaddr_m <= awaddr_m;
end
//awvalid_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                     awvalid_m <= 'b0;
  else if(next_state_dw==w_CONN) awvalid_m <= 'b1;
  else                           awvalid_m <= 'b0;
end
//wdata_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                     wdata_m <= 'b0;
  else if(in_valid)              wdata_m <= data_content;
  else                           wdata_m <= wdata_m;
end
//wlast_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      wlast_m <= 'b0;
  else if(next_state_dw==w_WRITE) wlast_m <= 'b1;
  else                            wlast_m <= 'b0;
end
//wvalid_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      wvalid_m <= 'b0;
  else if(next_state_dw==w_WRITE) wvalid_m <= 'b1;
  else                            wvalid_m <= 'b0;
end
//bready_m
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      bready_m <= 'b0;
  else if(next_state_dw==w_BRES)  bready_m <= 'b1;
  else                            bready_m <= 'b0;
end
//out_valid
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)                      out_valid <= 'b0;
  else if((bvalid_m)&(bresp_m==2'b00)&(bready_m))
                                  out_valid <= 'b1;
  else                            out_valid <= 'b0;
end
//----------------------------------------
//  FSM CTR
//----------------------------------------
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)  curr_state_dw <= w_IDLE;
  else        curr_state_dw <= next_state_dw;
end
always @(*)begin
  case(curr_state_dw)
    w_IDLE: if(in_valid&~out_valid)  
              next_state_dw = w_CONN;
            else          next_state_dw = w_IDLE;
    w_CONN: if(awready_m) next_state_dw = w_WRITE;
            else          next_state_dw = w_CONN;
    w_WRITE:if(wready_m)  next_state_dw = w_BRES;
            else          next_state_dw = w_WRITE;
    w_BRES: if((bvalid_m)&(bresp_m==2'b00)&(bready_m))
                          next_state_dw = w_IDLE;
            else          next_state_dw = w_BRES;
    default:              next_state_dw = w_IDLE;
  endcase
end



endmodule


