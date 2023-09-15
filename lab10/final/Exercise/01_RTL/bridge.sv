module bridge(input clk, INF.bridge_inf inf);


//==================================
//  parameters
//==================================
parameter IDLE = 'd0,
          READ = 'd1,
          WRITE = 'd2,
          OUTPUT = 'd3;




//==================================
//  logics
//==================================
logic [16:0] addr_comb;
logic [1:0] curr_state, next_state;
logic [31:0] R_DATA_reverse[1:0];
logic [31:0] W_DATA_reverse[1:0];
//==================================
//  FSM
//==================================
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  curr_state <= 'b0;    
    else        curr_state <= next_state;
end
always_comb begin
    case(curr_state)
        IDLE:   if(inf.C_in_valid)begin
                    if(inf.C_r_wb)  next_state = READ;
                    else            next_state = WRITE;
                end
                else                next_state = IDLE;
        READ:   if(inf.R_VALID)               next_state = OUTPUT;
                else                          next_state = READ;
        WRITE:  if(inf.B_VALID)               next_state = OUTPUT;
                else                          next_state = WRITE;
        OUTPUT:                               next_state = IDLE;
        default:                              next_state = IDLE;
    endcase
end





//==================================
//  Combinations
//==================================

assign  addr_comb = {6'b100000,inf.C_addr,3'b000};
assign R_DATA_reverse[0] = {inf.R_DATA[7:0], inf.R_DATA[15:8], inf.R_DATA[23:16], inf.R_DATA[31:24]};
assign R_DATA_reverse[1] = {inf.R_DATA[39:32], inf.R_DATA[47:40], inf.R_DATA[55:48], inf.R_DATA[63:56]};

assign W_DATA_reverse[0] = {inf.C_data_w[7:0], inf.C_data_w[15:8], inf.C_data_w[23:16], inf.C_data_w[31:24]};
assign W_DATA_reverse[1] = {inf.C_data_w[39:32], inf.C_data_w[47:40], inf.C_data_w[55:48], inf.C_data_w[63:56]};

//==================================
//  cnt CTR
//==================================

//==================================
//  OUTPUT CTR
//==================================
//--------------------------
//  OS
//--------------------------
//C_out_valid
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                      inf.C_out_valid <= 'b0;
    else if(next_state == OUTPUT)   inf.C_out_valid <= 'b1; 
    else                            inf.C_out_valid <= 'b0;
end
//C_data_r
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                              inf.C_data_r <= 'b0;
    else if(next_state==OUTPUT&inf.R_VALID) inf.C_data_r <= {R_DATA_reverse[1],R_DATA_reverse[0]};
    else                                    inf.C_data_r <= 'b0;
end
//--------------------------
//  DRAM
//--------------------------
//AR_VALID
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                          inf.AR_VALID <= 'b0;
    else if(inf.C_in_valid&inf.C_r_wb)                      inf.AR_VALID <= 'b1;
    else if(inf.AR_READY)                                   inf.AR_VALID <= 'b0;
    else                                                    inf.AR_VALID <= inf.AR_VALID;
end
//AR_ADDR
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                              inf.AR_ADDR <= 'b0;
    else if(inf.C_in_valid&inf.C_r_wb)                      inf.AR_ADDR <= addr_comb;
    else if(inf.AR_READY)                                   inf.AR_ADDR <= 'b0;
    else                                                    inf.AR_ADDR <= inf.AR_ADDR;
end
//R_READY
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)              inf.R_READY <= 'b0;
    else if(inf.AR_READY)       inf.R_READY <= 'b1;
    else if(inf.R_VALID)        inf.R_READY <= 'b0;
    else                        inf.R_READY <= inf.R_READY;
end
//AW_VALID
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                   inf.AW_VALID <= 'b0;
    else if(inf.C_in_valid&(~inf.C_r_wb))            inf.AW_VALID <= 'b1;
    else if(inf.AW_READY)                            inf.AW_VALID <= 'b0;
    else                                             inf.AW_VALID <= inf.AW_VALID;
end
//AW_ADDR
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                   inf.AW_ADDR <= 'b0;
    else if(inf.C_in_valid&(~inf.C_r_wb))            inf.AW_ADDR <= addr_comb;
    else if(inf.AW_READY)                            inf.AW_ADDR <= 'b0;
    else                                             inf.AW_ADDR <= inf.AW_ADDR;
end
//W_VALID
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                   inf.W_VALID <= 'b0;
    else if(inf.AW_READY)                            inf.W_VALID <= 'b1;
    else if(inf.W_READY)                             inf.W_VALID <= 'b0;
    else                                             inf.W_VALID <= inf.W_VALID;
end
//W_DATA
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                  inf.W_DATA <= 'b0;
    else if(inf.C_in_valid&(~inf.C_r_wb))           inf.W_DATA <= {W_DATA_reverse[1],W_DATA_reverse[0]};//inf.C_data_w;
    else if(inf.W_READY)                            inf.W_DATA <= 'b0;
    else                                            inf.W_DATA <= inf.W_DATA;
end
//B_READY
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)              inf.B_READY <= 'b0;
    else if(inf.AW_READY)   inf.B_READY <= 'b1;
    else if(inf.B_VALID)    inf.B_READY <= 'b0;
    else                    inf.B_READY <= inf.B_READY;
end
//==================================
//  INPUT CTR
//==================================
/*
always_ff@(posedge clk or negedge inf.rst_n)begin
    if(~inf.rst_n)                                  data_buffer <= 'b0;
    else if(inf.C_in_valid&(~inf.C_r_wb))       data_buffer <= inf.C_data_w;
    else                                        data_buffer <= data_buffer;
end
*/


endmodule