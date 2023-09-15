module MMT(
// input signals
    clk,
    rst_n,
    in_valid,
	in_valid2,
    matrix,
	matrix_size,
    matrix_idx,
    mode,
	
// output signals
    out_valid,
    out_value
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input        clk, rst_n, in_valid, in_valid2;
input [7:0] matrix;
input [1:0]  matrix_size,mode;
input [4:0]  matrix_idx;

output reg       	     out_valid;
output reg signed [49:0] out_value;
//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------
parameter IDLE = 'd0,
          INPUT_MAT = 'd1,
          INPUT_2 = 'd2,
          AxBT = 'd3,
          BTxAT = 'd4,
          TRACE = 'd5,
          OUTPUT_state = 'd6;
          
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
//--Weight_MEM---//
wire [127:0] data_w_out;
reg wsram_state, wsram_state_comb;
reg [8:0] addr_w, addr_w_comb;
reg [127:0] data_w_in, data_w_in_comb;
//--TEMP_MEM---//
wire signed [19:0] data_t_out;
reg tsram_state, tsram_state_comb;
reg [7:0] addr_t, addr_t_comb;
reg signed [19:0] data_t_in, data_t_in_comb;
//--MAC--//
wire signed [19:0] mu1 [15:0];
wire signed [19:0] mu2 [15:0];
wire signed [35:0] mac_result;

reg [127:0] data_w_row_store, data_w_row_store_comb;


reg input_delay;
reg [3:0] matrix_size_ff;
//
reg [1:0] mode_ff;
reg [3:0] input_cnt, input_cnt_comb;

reg [2:0] current_state, next_state;
reg in_valid_delay;

wire [3:0] matrix_size_ff_m1;

reg [2:0] addr_shift;


reg [14:0] index_list, index_list_comb;
wire [4:0]  A_idx, B_idx, C_idx;

reg [1:0] in_valid2_delay;

reg [4:0] compute_cnt, compute_cnt_comb;

reg [4:0] compute_1_delay;
reg [4:0] compute_2_delay;
reg [4:0] compute_3_delay;
reg [4:0] compute_4_delay;

reg [3:0] A_row, A_row_comb;
reg [3:0] B_row, B_row_comb;
reg [3:0] stop_BTxAT;
reg [3:0] stop_AxBT;
reg [5:0] stop_TRACE;
reg [319:0] buffer_t; 

reg signed [35:0] accm, accm_comb;
wire [19:0] mu_data_w_in [15:0];

wire [7:0]  AT_sel [15:0];


reg [4:0] BTxAT_limit;
reg [3:0] BTxAT_col_cnt, BTxAT_col_cnt_comb; 
//---------------------------------------------------------------------
//   DESIGN
//---------------------------------------------------------------------

//========================================
//  OUTPUT CTR
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  out_valid <= 'b0;
    //TODO: ready to output
    else if(next_state == OUTPUT_state)   out_valid <= 'b1;
    else        out_valid <= 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  out_value <= 'b0;
    //TODO: ready to output
    else if(next_state == OUTPUT_state)   
            if(matrix_size_ff=='b1)
            out_value <= accm;
            else out_value<= accm_comb;
    else        out_value <= 'b0;
end
//========================================
//  FSM CTR
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  current_state <= IDLE;
    else        current_state <= next_state;
end
always@(*)begin
    //TODO: 
    case(current_state)
        IDLE:   if(in_valid)        next_state = INPUT_MAT;
                else if(in_valid2)  next_state = INPUT_2;
                else                next_state = IDLE;

        INPUT_MAT:  if(~in_valid)   next_state = IDLE;
                    else            next_state = INPUT_MAT;

        INPUT_2:    if((in_valid2)||(in_valid2_delay[0]))  next_state = INPUT_2;
                    else if (mode_ff=='b0)      next_state = BTxAT;
                    else                        next_state = AxBT;

        AxBT:       if(stop_AxBT[3])            next_state = TRACE;
                    else                        next_state = AxBT;

        BTxAT:      if(stop_BTxAT[3])            next_state = TRACE;
                  else            next_state = BTxAT;
        TRACE:      if(stop_TRACE[5]||((matrix_size_ff=='d1)&&(stop_TRACE[3])))            next_state = OUTPUT_state;
                    else            next_state = TRACE;

        OUTPUT_state:               next_state = IDLE;

        default:                    next_state = IDLE;
    endcase
end


//========================================
//  STORE Matrix Size
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  matrix_size_ff <= 'b0;
    else if((in_valid^in_valid_delay)&&(in_valid))
        case(matrix_size)
            2'b00:      matrix_size_ff <= 'd1;
            2'b01:      matrix_size_ff <= 'd3;
            2'b10:      matrix_size_ff <= 'd7;            
            2'b11:      matrix_size_ff <= 'd15;
            default:    matrix_size_ff <= 'd1;
        endcase
    else matrix_size_ff <= matrix_size_ff;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  addr_shift <= 'b0;
    else if((in_valid^in_valid_delay)&&(in_valid))
        case(matrix_size)
            2'b00:      addr_shift <= 'd1;
            2'b01:      addr_shift <= 'd2;
            2'b10:      addr_shift <= 'd3;            
            2'b11:      addr_shift <= 'd4;
            default:    addr_shift <= 'd1;
        endcase
    else addr_shift <= addr_shift;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  BTxAT_limit <= 'b0;
    else if((in_valid^in_valid_delay)&&(in_valid))
        case(matrix_size)
            2'b00:      BTxAT_limit <= 'd3;
            2'b01:      BTxAT_limit <= 'd7;
            2'b10:      BTxAT_limit <= 'd15;            
            2'b11:      BTxAT_limit <= 'd31;
            default:    BTxAT_limit <= 'd3;
        endcase
    else BTxAT_limit <= BTxAT_limit;
end



//========================================
//  INPUT_cnt
//========================================
assign matrix_size_ff_m1 = matrix_size_ff -'d1;
/*
always@(*)begin
    if(current_state == INPUT_MAT)
        if(input_cnt < matrix_size_ff)      input_cnt_comb = input_cnt +'d1;
        else                                input_cnt_comb = 'b0;
    else if (current_state == IDLE) input_cnt_comb = 'd0;
    else input_cnt_comb = input_cnt;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  input_cnt <= 'b0;
    else  input_cnt <= input_cnt_comb;
end
*/
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  in_valid_delay <= 'b0;
    else        in_valid_delay <= in_valid;
end

//========================================
//  Weight SRAM CTR
//========================================
//addr
always@(*)begin
    case(current_state)
        IDLE:   addr_w_comb = 'b0;
        //!!
        INPUT_MAT:  if(compute_cnt==matrix_size_ff)   addr_w_comb = addr_w +'d1;
                    else                            addr_w_comb = addr_w;

        AxBT:   if(stop_AxBT>'b0)               addr_w_comb = 'b0;  
                else if(compute_cnt=='b0)       addr_w_comb = (A_idx<<addr_shift) + A_row;
                else                            addr_w_comb = (B_idx<<addr_shift) + B_row;
        BTxAT:  if(stop_BTxAT>'b0)              addr_w_comb ='b0;
                else if(compute_cnt>matrix_size_ff)  addr_w_comb = (B_idx<<addr_shift) + B_row;
                else                            addr_w_comb = (A_idx<<addr_shift) + A_row;
        
        TRACE: addr_w_comb = (C_idx<<addr_shift) + B_row;
        OUTPUT_state: addr_w_comb ='d0;
        default:    addr_w_comb ='d0;

    endcase
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  addr_w <= 'b0;
    else        addr_w <= addr_w_comb;
end


//write data
always@(*)begin
    if((in_valid^in_valid_delay)&&(in_valid))begin
        case(matrix_size)
            2'b00:      data_w_in_comb = {112'b0,matrix,8'b0};
            2'b01:      data_w_in_comb = {96'b0,matrix,24'b0};
            2'b10:      data_w_in_comb = {64'b0,matrix,56'b0};
            2'b11:      data_w_in_comb = {matrix,120'b0};
            default:    data_w_in_comb = 'd0;
        endcase
    end
    else if(in_valid)begin
        //!
        if(compute_cnt<matrix_size_ff)begin
            case(matrix_size_ff)
                4'd1:   data_w_in_comb = {112'b0,matrix,data_w_in[15:8]};
                4'd3:   data_w_in_comb = {96'b0,matrix,data_w_in[31:8]};
                4'd7:   data_w_in_comb = {64'b0,matrix,data_w_in[63:8]};
                4'd15:  data_w_in_comb = {matrix,data_w_in[127:8]};
                default:    data_w_in_comb = 'd0;
            endcase
        end
        else begin
            case(matrix_size_ff)
                4'd1:   data_w_in_comb = {112'b0,matrix,8'b0};
                4'd3:   data_w_in_comb = {96'b0,matrix,24'b0};
                4'd7:   data_w_in_comb = {64'b0,matrix,56'b0};
                4'd15:  data_w_in_comb = {matrix,120'b0};
                default:    data_w_in_comb = 'd0;
            endcase
        end

    end
    else if(current_state == AxBT)
        if(compute_2_delay=='b0)     data_w_in_comb = data_w_out;
        else                        data_w_in_comb = data_w_in;
    else if(current_state == BTxAT)
        if(compute_3_delay<matrix_size_ff) data_w_in_comb = data_w_in;
        else                               data_w_in_comb = data_w_out;
    else data_w_in_comb ='b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  data_w_in <= 'b0;
    else        data_w_in <= data_w_in_comb;
end
//state
always@(*)begin
    if(current_state == INPUT_MAT&&(compute_cnt==matrix_size_ff_m1))begin
            wsram_state_comb = 'b0;
    end
    else    wsram_state_comb = 'b1;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  wsram_state <= 'b1;
    else        wsram_state <= wsram_state_comb;
end






//========================================
//  Temp SRAM CTR
//========================================
//addr
always@(*)begin
    case(current_state)
    IDLE:   addr_t_comb = 'b0;
    AxBT:   if(stop_AxBT[3])            addr_t_comb = 'd255;
            else if(compute_4_delay>'b0) addr_t_comb = addr_t +'d1;
            else                    addr_t_comb = addr_t;
    BTxAT:  if(stop_BTxAT[3])           addr_t_comb = 'd255;
            else if(compute_4_delay>matrix_size_ff)  addr_t_comb = addr_t +'d1;
            else    addr_t_comb = addr_t;
    
    TRACE: addr_t_comb = addr_t +'d1;
    default:                        addr_t_comb = 'd0;
    endcase
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  addr_t <= 'b0;
    else        addr_t <= addr_t_comb;
end
//data_in
always@(*)begin
    case(current_state)
    IDLE:   data_t_in_comb = 'b0;
    AxBT:   if(compute_3_delay>'b0) data_t_in_comb = mac_result;
            else                    data_t_in_comb = 'b0;
    BTxAT:  if(compute_3_delay>matrix_size_ff)    data_t_in_comb = mac_result;
            else                    data_t_in_comb = 'b0;
    default:                        data_t_in_comb = 'd0;
    endcase


end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)      data_t_in <= 'b0;
    else            data_t_in <= data_t_in_comb;

end






//state
always@(*)begin
    case(current_state)
    IDLE:   tsram_state_comb = 'b1;
    AxBT:   if(compute_3_delay>'b0) tsram_state_comb = 'b0;
            else                    tsram_state_comb = 'b1;
    BTxAT:  if(compute_3_delay>matrix_size_ff) tsram_state_comb = 'b0;
            else                               tsram_state_comb = 'b1;

    default:                        tsram_state_comb = 'b1;
    endcase
end


always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  tsram_state <= 'b1;
    else        tsram_state <= tsram_state_comb;
end





//========================================
//  INPUT2
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  in_valid2_delay <= 'b0;
    else        in_valid2_delay <= {in_valid2_delay[0],in_valid2};
end


always@(*)begin
    if(in_valid2)begin
        index_list_comb = {matrix_idx, index_list[14:5]};
    end
    else if(in_valid2_delay[0])begin
        case(mode_ff)
            2'b00:      index_list_comb = {index_list[4:0], index_list[9:5], index_list[14:10]};
            2'b01:      index_list_comb = {index_list[9:5], index_list[14:10], index_list[4:0]};
            2'b10:      index_list_comb = {index_list[14:10], index_list[4:0], index_list[9:5]};
            2'b11:      index_list_comb = {index_list[4:0], index_list[9:5], index_list[14:10]};
            default:    index_list_comb = {index_list[4:0], index_list[9:5], index_list[14:10]};
        endcase
    end
    else index_list_comb = index_list;

end
assign A_idx = index_list[4:0];
assign B_idx = index_list[9:5];
assign C_idx = index_list[14:10];


always @(posedge clk or negedge rst_n) begin
    if(~rst_n) index_list <='b0;
    else    index_list <= index_list_comb;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  mode_ff <= 'b0;
    else if((in_valid2^in_valid2_delay[0])&&(in_valid2))
                mode_ff <= mode;
    else        mode_ff <= mode_ff;
end


//========================================
// COMPUTE AxBT
//========================================

always@(*)begin
    case(current_state)
        IDLE:   compute_cnt_comb = 'b0;
        INPUT_MAT: if(compute_cnt < matrix_size_ff) compute_cnt_comb = compute_cnt +'d1;
                    else                            compute_cnt_comb ='d0;

        BTxAT:   if(stop_BTxAT=='b1000)                compute_cnt_comb = 'b0;
                else if(compute_cnt<BTxAT_limit)     compute_cnt_comb = compute_cnt +'d1;
                else                                compute_cnt_comb = 'b0;

        AxBT:   if(stop_AxBT=='b1000)                    compute_cnt_comb = 'b0;
                else if(compute_cnt>matrix_size_ff)      compute_cnt_comb = 'b0;
                else                                compute_cnt_comb = compute_cnt +'d1;
        TRACE:  if(compute_cnt<matrix_size_ff)         compute_cnt_comb = compute_cnt +'d1;
                else                                   compute_cnt_comb = 'b0;
        default: compute_cnt_comb = 'b0;

    endcase
end
/*
always@(*)begin
    case(current_state)
        IDLE:   compute_cnt_comb = 'b0;
       
        BTxAT:   if(stop_BTxAT=='b1000)                compute_cnt_comb = 'b0;
                else if(compute_cnt<BTxAT_limit)     compute_cnt_comb = compute_cnt +'d1;
                else                                compute_cnt_comb = 'b0;

        AxBT:   if(stop_AxBT=='b1000)                    compute_cnt_comb = 'b0;
                else if(compute_cnt>matrix_size_ff)      compute_cnt_comb = 'b0;
                else                                compute_cnt_comb = compute_cnt +'d1;
        TRACE:  if(compute_cnt<matrix_size_ff)         compute_cnt_comb = compute_cnt +'d1;
                else                                   compute_cnt_comb = 'b0;
        default: compute_cnt_comb = 'b0;

    endcase
end
*/
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  compute_cnt <= 'b0;
    else        compute_cnt <= compute_cnt_comb;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  compute_1_delay <= 'b0;
    else if((stop_AxBT=='b1000)||(stop_BTxAT=='b1000)) compute_1_delay <= 'b0;
    else        compute_1_delay <= compute_cnt;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  compute_2_delay <= 'b0;
        else if((stop_AxBT=='b1000)||(stop_BTxAT=='b1000)) compute_2_delay <= 'b0;
    else        compute_2_delay <= compute_1_delay;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  compute_3_delay <= 'b0;
        else if((stop_AxBT=='b1000)||(stop_BTxAT=='b1000)) compute_3_delay <= 'b0;
    else        compute_3_delay <= compute_2_delay;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  compute_4_delay <= 'b0;
    else if((stop_AxBT=='b1000)||(stop_BTxAT=='b1000)) compute_4_delay <= 'b0;
    else        compute_4_delay <= compute_3_delay;
end

always@(*)begin
    case(current_state)
    IDLE:   A_row_comb = 'b0;
    AxBT:   if (|(stop_AxBT))               A_row_comb = 'b0;
            else if(compute_cnt>matrix_size_ff)
                if(A_row<matrix_size_ff)    A_row_comb = A_row +'d1;
                else                        A_row_comb = 'b0;
            else                            A_row_comb = A_row;
    BTxAT:  if(|(stop_BTxAT))               A_row_comb ='b0;
            else if(compute_cnt_comb>BTxAT_limit)    A_row_comb = A_row;
            else if(A_row<matrix_size_ff)       A_row_comb = A_row +'d1;
            else                                A_row_comb = 'b0;
    default:    A_row_comb = 'b0;
    endcase
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  A_row <= 'b0;
    else        A_row <= A_row_comb;
end


always@(*)begin
    case(current_state)
    IDLE:   B_row_comb = 'b0;
    AxBT:   if (|(stop_AxBT))                 B_row_comb = 'b0;                       
            else if(compute_cnt>'b0)  
                if(B_row<matrix_size_ff)    B_row_comb = B_row +'d1;
                else                        B_row_comb = 'b0;
            else                            B_row_comb = B_row;
    BTxAT: if(|(stop_BTxAT))                B_row_comb ='b0;
            else if(compute_cnt>matrix_size_ff)
                if(B_row<matrix_size_ff)    B_row_comb = B_row +'d1;
                else                        B_row_comb = 'b0;
            else                            B_row_comb = B_row;
    
    TRACE: if(compute_cnt==matrix_size_ff)  B_row_comb = B_row +'d1;
            else                            B_row_comb = B_row;
    default:    B_row_comb = 'b0;
    endcase
end



always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  B_row <= 'b0;
    else        B_row <= B_row_comb;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  stop_BTxAT <= 'b0;
    else        stop_BTxAT <= {stop_BTxAT[2:0], ((BTxAT_col_cnt==matrix_size_ff)&&(compute_cnt==BTxAT_limit)&&(current_state==BTxAT))};
end


always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  stop_AxBT <= 'b0;
    else        stop_AxBT <= {stop_AxBT[2:0],((A_row==matrix_size_ff)&&(B_row==matrix_size_ff)&&(current_state==AxBT))};
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  stop_TRACE <= 'b0;
    else if (current_state==TRACE) begin
        stop_TRACE <= {stop_TRACE[4:0],((B_row==matrix_size_ff)&&(compute_cnt==matrix_size_ff))};
    end
    else stop_TRACE <= 'b0;
end




always@(*)begin
    case(current_state)
    IDLE: data_w_row_store_comb ='b0;
    AxBT:   if(compute_2_delay>'d0)  data_w_row_store_comb = data_w_out;
            else                     data_w_row_store_comb = 'b0;
    
    BTxAT:  if(compute_2_delay<=matrix_size_ff)
                case(matrix_size_ff)
                4'd1:   data_w_row_store_comb = {112'b0,AT_sel[BTxAT_col_cnt],data_w_row_store[15:8]};
                4'd3:   data_w_row_store_comb = {96'b0,AT_sel[BTxAT_col_cnt],data_w_row_store[31:8]};
                4'd7:   data_w_row_store_comb = {64'b0,AT_sel[BTxAT_col_cnt],data_w_row_store[63:8]};
                4'd15:  data_w_row_store_comb = {AT_sel[BTxAT_col_cnt],data_w_row_store[127:8]};
                default:    data_w_row_store_comb = 'd0;
                endcase
            else if(compute_3_delay==BTxAT_limit) 
                 case(matrix_size_ff)
                4'd1:   data_w_row_store_comb = {112'b0,AT_sel[BTxAT_col_cnt],8'b0};
                4'd3:   data_w_row_store_comb = {96'b0,AT_sel[BTxAT_col_cnt],24'b0};
                4'd7:   data_w_row_store_comb = {64'b0,AT_sel[BTxAT_col_cnt],56'b0};
                4'd15:  data_w_row_store_comb = {AT_sel[BTxAT_col_cnt],120'b0};
                default:    data_w_row_store_comb = 'd0;
                endcase
            else data_w_row_store_comb = data_w_row_store;
    TRACE:  if(compute_2_delay==matrix_size_ff)     data_w_row_store_comb = data_w_out;
            else                                    data_w_row_store_comb = 'b0;
    default:                         data_w_row_store_comb = 'b0;

    endcase
end




always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  data_w_row_store <= 'b0;
    else        data_w_row_store <= data_w_row_store_comb;
end







//========================================
// COMPUTE BTxAT
//========================================
assign AT_sel[0] = data_w_out[7:0];
assign AT_sel[1] = data_w_out[15:8];
assign AT_sel[2] = data_w_out[23:16];
assign AT_sel[3] = data_w_out[31:24];
assign AT_sel[4] = data_w_out[39:32];
assign AT_sel[5] = data_w_out[47:40];
assign AT_sel[6] = data_w_out[55:48];
assign AT_sel[7] = data_w_out[63:56];
assign AT_sel[8] = data_w_out[71:64];
assign AT_sel[9] = data_w_out[79:72];
assign AT_sel[10] = data_w_out[87:80];
assign AT_sel[11] = data_w_out[95:88];
assign AT_sel[12] = data_w_out[103:96];
assign AT_sel[13] = data_w_out[111:104];
assign AT_sel[14] = data_w_out[119:112];
assign AT_sel[15] = data_w_out[127:120];


always@(*)begin
    case(current_state)
    IDLE:   BTxAT_col_cnt_comb ='b0;
    BTxAT:  if(compute_cnt==BTxAT_limit)    BTxAT_col_cnt_comb = BTxAT_col_cnt +'d1;
            else                            BTxAT_col_cnt_comb = BTxAT_col_cnt;
    default:    BTxAT_col_cnt_comb ='b0;
    endcase
end


always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  BTxAT_col_cnt <= 'b0;
    else BTxAT_col_cnt <= BTxAT_col_cnt_comb;
end



//========================================
//  COMPUTE Trace
//========================================
always@(posedge clk )begin//or negedge rst_n)begin
    //if(~rst_n)  buffer_t <= 'b0;
    if(current_state== IDLE)    buffer_t <= 'b0;
    else if(current_state == TRACE)
        if(compute_3_delay==matrix_size_ff)
            case(matrix_size_ff)
                4'd1:   buffer_t <= {280'b0 ,data_t_out, 20'b0};
                4'd3:   buffer_t <= {240'b0, data_t_out, 60'b0};
                4'd7:   buffer_t <= {160'b0,data_t_out, 140'b0};
                4'd15:  buffer_t <= {data_t_out, 300'b0};
                default: buffer_t <='b0;
            endcase
        else begin
            case(matrix_size_ff)
                4'd1:   buffer_t <= {280'b0, data_t_out, buffer_t[39:20]};
                4'd3:   buffer_t <= {240'b0, data_t_out, buffer_t[79:20]};
                4'd7:   buffer_t <= {160'b0, data_t_out, buffer_t[159:20]};
                4'd15:  buffer_t <= {data_t_out, buffer_t[319:20]};
                default: buffer_t <='b0;
            endcase
        end
    else buffer_t <= 'b0;


end



always@(*)begin
    case(current_state)
    IDLE:   accm_comb = 'b0;
    TRACE:  if(compute_3_delay==matrix_size_ff) accm_comb = mac_result;
            else                                accm_comb = accm;  
    default: accm_comb = 'b0;
    endcase
end


always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  accm <= 'b0;
    else accm <= accm_comb;        
end



assign mac_result = mu1[0] * mu2[0] + mu1[1] * mu2[1] + mu1[2] * mu2[2] + mu1[3] * mu2[3]
            + mu1[4] * mu2[4] + mu1[5] * mu2[5] + mu1[6] * mu2[6] + mu1[7] * mu2[7]
            + mu1[8] * mu2[8] + mu1[9] * mu2[9] + mu1[10] * mu2[10] + mu1[11] * mu2[11]
            + mu1[12] * mu2[12] + mu1[13] * mu2[13] + mu1[14] * mu2[14] + mu1[15] * mu2[15] +accm;


assign mu_data_w_in[0] = {{12{data_w_in[7]}},data_w_in[7:0]};
assign mu_data_w_in[1] = ({{12{data_w_in[15]}},data_w_in[15:8]});
assign mu_data_w_in[2] = ({{12{data_w_in[23]}},data_w_in[23:16]});
assign mu_data_w_in[3] = ({{12{data_w_in[31]}},data_w_in[31:24]});
assign mu_data_w_in[4] = ({{12{data_w_in[39]}},data_w_in[39:32]});
assign mu_data_w_in[5] = ({{12{data_w_in[47]}},data_w_in[47:40]});
assign mu_data_w_in[6] = ({{12{data_w_in[55]}},data_w_in[55:48]});
assign mu_data_w_in[7] = ({{12{data_w_in[63]}},data_w_in[63:56]});
assign mu_data_w_in[8] = ({{12{data_w_in[71]}},data_w_in[71:64]});
assign mu_data_w_in[9] = ({{12{data_w_in[79]}},data_w_in[79:72]});
assign mu_data_w_in[10] = ({{12{data_w_in[87]}},data_w_in[87:80]});
assign mu_data_w_in[11] = ({{12{data_w_in[95]}},data_w_in[95:88]});
assign mu_data_w_in[12] = ({{12{data_w_in[103]}},data_w_in[103:96]});
assign mu_data_w_in[13] = ({{12{data_w_in[111]}},data_w_in[111:104]});
assign mu_data_w_in[14] = ({{12{data_w_in[119]}},data_w_in[119:112]});
assign mu_data_w_in[15] = ({{12{data_w_in[127]}},data_w_in[127:120]});















assign mu1[0] =(current_state==TRACE)? (buffer_t[19:0]) : mu_data_w_in[0];
assign mu1[1] = (current_state==TRACE)? buffer_t[39:20] : mu_data_w_in[1];
assign mu1[2] = (current_state==TRACE)? buffer_t[59:40] : mu_data_w_in[2];
assign mu1[3] = (current_state==TRACE)? buffer_t[79:60] :mu_data_w_in[3];
assign mu1[4] = (current_state==TRACE)? buffer_t[99:80] : mu_data_w_in[4];
assign mu1[5] = (current_state==TRACE)? buffer_t[119:100] : mu_data_w_in[5];
assign mu1[6] = (current_state==TRACE)? buffer_t[139:120] : mu_data_w_in[6];
assign mu1[7] = (current_state==TRACE)? buffer_t[159:140] : mu_data_w_in[7];
assign mu1[8] = (current_state==TRACE)? buffer_t[179:160] : mu_data_w_in[8];
assign mu1[9] = (current_state==TRACE)? buffer_t[199:180] : mu_data_w_in[9];
assign mu1[10] = (current_state==TRACE)? buffer_t[219:200] : mu_data_w_in[10];
assign mu1[11] = (current_state==TRACE)? buffer_t[239:220] : mu_data_w_in[11];
assign mu1[12] = (current_state==TRACE)? buffer_t[259:240] : mu_data_w_in[12];
assign mu1[13] = (current_state==TRACE)? buffer_t[279:260] : mu_data_w_in[13];
assign mu1[14] = (current_state==TRACE)? buffer_t[299:280] : mu_data_w_in[14];
assign mu1[15] = (current_state==TRACE)? buffer_t[319:300] : mu_data_w_in[15];

assign mu2[0] = {{12{data_w_row_store[7]}},data_w_row_store[7:0]};
assign mu2[1] = {{12{data_w_row_store[15]}},data_w_row_store[15:8]};
assign mu2[2] = {{12{data_w_row_store[23]}},data_w_row_store[23:16]};
assign mu2[3] = {{12{data_w_row_store[31]}},data_w_row_store[31:24]};
assign mu2[4] = {{12{data_w_row_store[39]}},data_w_row_store[39:32]};
assign mu2[5] = {{12{data_w_row_store[47]}},data_w_row_store[47:40]};
assign mu2[6] = {{12{data_w_row_store[55]}},data_w_row_store[55:48]};
assign mu2[7] = {{12{data_w_row_store[63]}},data_w_row_store[63:56]};
assign mu2[8] = {{12{data_w_row_store[71]}},data_w_row_store[71:64]};
assign mu2[9] = {{12{data_w_row_store[79]}},data_w_row_store[79:72]};
assign mu2[10] = {{12{data_w_row_store[87]}},data_w_row_store[87:80]};
assign mu2[11] = {{12{data_w_row_store[95]}},data_w_row_store[95:88]};
assign mu2[12] = {{12{data_w_row_store[103]}},data_w_row_store[103:96]};
assign mu2[13] = {{12{data_w_row_store[111]}},data_w_row_store[111:104]};
assign mu2[14] = {{12{data_w_row_store[119]}},data_w_row_store[119:112]};
assign mu2[15] = {{12{data_w_row_store[127]}},data_w_row_store[127:120]};








//========================================
//  WEIGHT_SRAM DECLARATION
//========================================
RA1SH_128b_512w Weight_SRAM(.Q(data_w_out), .CLK(clk), .CEN(1'b0), .WEN(wsram_state), .A(addr_w), .D(data_w_in), .OEN(1'b0));
RA1SH_20b_256w TEMP_SRAM(.Q(data_t_out), .CLK(clk), .CEN(1'b0), .WEN(tsram_state), .A(addr_t), .D(data_t_in), .OEN(1'b0));






endmodule
