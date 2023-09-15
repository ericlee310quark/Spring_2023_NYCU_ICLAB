`ifdef RTL
`define CYCLE_TIME 10
`endif
`ifdef GATE
`define CYCLE_TIME 10
`endif


`include "../00_TESTBED/MEM_MAP_define.v"
`include "../00_TESTBED/pseudo_DRAM.v"

module PATTERN #(parameter ID_WIDTH=4, DATA_WIDTH=32, ADDR_WIDTH=32)(
        
				clk,	
			  rst_n,	
	
			in_addr_M,
			in_addr_G,
			in_dir,
			in_dis,
			in_valid,
			out_valid, 
	

         awid_s_inf,
       awaddr_s_inf,
       awsize_s_inf,
      awburst_s_inf,
        awlen_s_inf,
      awvalid_s_inf,
      awready_s_inf,
                    
        wdata_s_inf,
        wlast_s_inf,
       wvalid_s_inf,
       wready_s_inf,
                    
          bid_s_inf,
        bresp_s_inf,
       bvalid_s_inf,
       bready_s_inf,
                    
         arid_s_inf,
       araddr_s_inf,
        arlen_s_inf,
       arsize_s_inf,
      arburst_s_inf,
      arvalid_s_inf,
                    
      arready_s_inf, 
          rid_s_inf,
        rdata_s_inf,
        rresp_s_inf,
        rlast_s_inf,
       rvalid_s_inf,
       rready_s_inf 
             );




//Connection wires
output reg			  clk,rst_n;
        
// -----------------------------
// IO port
output reg [ADDR_WIDTH-1:0]      in_addr_M;
output reg [ADDR_WIDTH-1:0]      in_addr_G;
output reg [1:0]  	  		in_dir;
output reg [3:0]	    	in_dis;
output reg 			    	in_valid;
input	              out_valid;
// -----------------------------

reg [ADDR_WIDTH-1:0]      gold_addr_G;


// axi write address channel 
input wire [ID_WIDTH-1:0]        awid_s_inf;
input wire [ADDR_WIDTH-1:0]    awaddr_s_inf;
input wire [2:0]            awsize_s_inf;
input wire [1:0]           awburst_s_inf;
input wire [3:0]             awlen_s_inf;
input wire                 awvalid_s_inf;
output wire                awready_s_inf;
// axi write data channel 
input wire [DATA_WIDTH-1:0]     wdata_s_inf;
input wire                   wlast_s_inf;
input wire                  wvalid_s_inf;
output wire                 wready_s_inf;
// axi write response channel
output wire [ID_WIDTH-1:0]         bid_s_inf;
output wire [1:0]             bresp_s_inf;
output wire              	  bvalid_s_inf;
input wire                    bready_s_inf;
// -----------------------------
// axi read address channel 
input wire [ID_WIDTH-1:0]       arid_s_inf;
input wire [ADDR_WIDTH-1:0]   araddr_s_inf;
input wire [3:0]            arlen_s_inf;
input wire [2:0]           arsize_s_inf;
input wire [1:0]          arburst_s_inf;
input wire                arvalid_s_inf;
output wire               arready_s_inf;
// -----------------------------
// axi read data channel 
output wire [ID_WIDTH-1:0]         rid_s_inf;
output wire [DATA_WIDTH-1:0]     rdata_s_inf;
output wire [1:0]             rresp_s_inf;
output wire                   rlast_s_inf;
output wire                  rvalid_s_inf;
input wire                   rready_s_inf;
// -----------------------------




endmodule

