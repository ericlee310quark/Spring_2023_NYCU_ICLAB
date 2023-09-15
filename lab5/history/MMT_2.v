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
          TRACE = 'd5;
          OUTPUT_state = 'd6;
          
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
//--Weight_MEM---//
wire [15:0] data_w_out;
reg wsram_state, wsram_state_comb;
reg [9:0] addr_w, addr_w_comb;
reg [15:0] data_w_in;
//--TEMP_MEM---//
wire [18:0] data_t_out;
reg tsram_state;
reg [7:0] addr_t, addr_t_comb;
reg [18:0] data_t_in, data_t_in_comb;
//--MAC--//
wire signed [34:0] mac_result;
reg signed [18:0] mult_1a, mult_1b;
reg signed [18:0] mult_2a, mult_2b;
//reg signed [18:0] mult_1a_t0, mult_1b_t0, mult_2a_t0, mult_2b_t0;
reg signed [34:0] accm;

//INPUT_MAT_USE
reg in_valid_d;
reg input_cnt, input_cnt_comb;
reg [2:0] shift_amount, shift_amount_comb;
reg [3:0] row_limit, row_limit_comb;
reg [1:0] row_shift, row_shift_comb;
reg [2:0] col_limit, col_limit_comb;
//INPUT_IDX_USE
reg in_valid2_d, in_valid2_d1;
reg [14:0] idx_list, idx_list_comb;
reg [1:0] mode_reg;
wire [4:0] A_idx, B_idx, C_idx;
//COMPUTE
reg [3:0] A_row, A_row_comb;
reg [2:0] A_col, A_col_comb;
reg [3:0] B_row, B_row_comb;
reg [2:0] B_col, B_col_comb;
reg [3:0] C_row, C_row_comb;
reg input_cnt_d;
reg [3:0] B_col_eq_coll_limit;

reg [1:0] compute_cnt, compute_cnt_comb;

reg [3:0] AxBT_delay;
reg [3:0] AxBT_toTrace;
reg [3:0] TRACE_delay;
reg [3:0] TRACE_to_OUTPUT;

reg BTxAT_A_flag;
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
    if(~rst_n)  out_value = 'b0;
    //TODO: ready to output
    else if(next_state == OUTPUT_state)   out_value <=  accm;
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
                else if(in_valid2)  next_state = PROCESS;
                else                next_state = IDLE;

        INPUT_MAT:  if(~in_valid)   next_state = IDLE;
                    else            next_state = INPUT_MAT;

        INPUT_2:    if(in_valid2)               next_state = INPUT_2;
                    else if (mode_reg=='b0)     next_state = AxBT;
                    else                        next_state = BTxAT;

        AxBT:       if(AxBT_toTrace[3])            next_state = TRACE;
                    else            next_state = AxBT;

        BTxAT:      if()            next_state = TRACE;
                    else            next_state = BTxAT;

        TRACE:      if(TRACE_to_OUTPUT[3])            next_state = OUTPUT_state;
                    else            next_state = TRACE;

        OUTPUT_state:               next_state = IDLE;
        default:                    next_state = IDLE;
    endcase
end


//========================================
//  STORE Matrix Size
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  in_valid_d <= 'b0;
    else        in_valid_d <= in_valid;
end
//--shift_amount--//
always@(*)begin
    if((in_valid^in_valid_d)&&(in_valid))begin
        case(matrix_size)
            2'b00:      shift_amount_comb = 'd1;
            2'b01:      shift_amount_comb = 'd3;
            2'b10:      shift_amount_comb = 'd5;
            2'b11:      shift_amount_comb = 'd7;
            default:    shift_amount_comb = shift_amount;
        endcase
    end
    else    shift_amount_comb = shift_amount;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  shift_amount <= 'b0;
    else        shift_amount <= shift_amount_comb;
end
//--row limit--//
always@(*)begin
    if((in_valid^in_valid_d)&&(in_valid))begin
        case(matrix_size)
            2'b00:      row_limit_comb = 'd1;
            2'b01:      row_limit_comb = 'd3;
            2'b10:      row_limit_comb = 'd7;
            2'b11:      row_limit_comb = 'd15;
            default:    row_limit_comb = row_limit_comb;
        endcase
    end
    else    row_limit_comb = row_limit_comb;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  row_limit <= 'b0;
    else        row_limit <= row_limit_comb;
end
//--row shift--//
always@(*)begin
    if((in_valid^in_valid_d)&&(in_valid))   row_shift_comb = matrix_size;
    else                                    row_shift_comb = row_shift;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  row_shift <= 'b0;
    else        row_shift <= row_shift_comb;
end


//--col limit--//
always@(*)begin
    if((in_valid^in_valid_d)&&(in_valid))begin
        case(matrix_size)
            2'b00:      col_limit_comb = 'd0;
            2'b01:      col_limit_comb = 'd1;
            2'b10:      col_limit_comb = 'd3;
            2'b11:      col_limit_comb = 'd7;
            default:    col_limit_comb = col_limit;
        endcase
    end
    else    col_limit_comb = col_limit;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  col_limit <= 'b0;
    else        col_limit <= col_limit_comb;
end


//========================================
//  INPUT_cnt
//========================================
assign input_cnt_comb = ~input_cnt;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                  input_cnt <= 'b0;
    else if(in_valid||(current_state == AxBT)||(current_state == TRACE)) input_cnt <= input_cnt_comb;
    else if(next_state == IDLE)                 input_cnt <= 'b0;
    else                                    input_cnt <= input_cnt;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                  input_cnt_d <= 'b0;
    else                                        input_cnt_d <= input_cnt;
end


//========================================
//  Weight SRAM CTR
//========================================
//--addr--//
always@(*)begin
    if((current_state == INPUT_MAT)&&(input_cnt))  addr_w_comb = addr_w +'d1;
    else if(current_state == AxBT)begin
        if(input_cnt)                               addr_w_comb = (B_idx << shift_amount) + (B_row << row_shift) + B_col;
        else                                        addr_w_comb = (A_idx << shift_amount) + (A_row << row_shift) + B_col;
    end
    else if(current_state == BTxAT)
        if(compute_cnt<'d2)                         addr_w_comb = (A_idx << shift_amount) + (A_row << row_shift) + A_col;
        else                                        addr_w_comb = (B_idx << shift_amount) + (B_row << row_shift) + B_col;

    else if (current_state == TRACE)                addr_w_comb = (B_idx << shift_amount) + (B_row << row_shift) + B_col;

    else                                            addr_w_comb = addr_w;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  addr_w <= 10'b11_1111_1111;
    else        addr_w <= addr_w_comb;
end
//--data_in--//
always@(*)begin
    if((in_valid))begin
        if(input_cnt)   data_w_in_comb = {matrix, data_w_in[15:8]};
        else            data_w_in_comb = {matrix, 8'b0};        
    end
    else                data_w_in_comb = 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  data_w_in <= 'b0;
    else        data_w_in <= data_w_in_comb;
end
//--sram state--//
always@(*)begin
    if((current_state == INPUT_MAT))begin
        if(input_cnt)   wsram_state_comb = 'b0;
        else            wsram_state_comb = 'b1;
    end
    else                wsram_state_comb = 'b1;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  wsram_state <= 'b1;
    else        wsram_state <= wsram_state_comb;
end
//========================================
//  Temp SRAM CTR
//========================================
//--addr--//
always@(*)begin
    if((current_state == AxBT)&&(B_col_eq_coll_limit[3]))
        addr_t_comb = addr_t + 'd1;
    else if((current_state == BTxAT))
    else if (current_state == TRACE)                addr_t_comb = addr_t +'d1;
    
    else                                            addr_t_comb = addr_t;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  addr_t <= 'b0;
    else        addr_t <= addr_t_comb;
end
//--data_in--//
always@(*)begin
    //TODO: 
    if(((current_state == BTxAT)&&())||((current_state == AxBT)&&(input_cnt_d)&&(B_col_eq_coll_limit[2])))    
            data_t_in_comb =  mac_result;
    else
            data_t_in_comb = 'b0;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  data_t_in <= 'b0;
    else        data_t_in <= data_t_in_comb;
end
//--sram state--//
always@(*)begin
    //TODO: 
    if(((current_state == BTxAT)&&())||((current_state == AxBT)&&(input_cnt_d)&&(B_col_eq_coll_limit[2])))    tsram_state_comb = 'b0;
    else                                                                            tsram_state_comb = 'b1;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  wsram_state <= 'b1;
    else        wsram_state <= wsram_state_comb;
end
//========================================
//  GET Index and ReOrder
//========================================
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                          mode_reg <= 'b0;
    else if((in_valid2)&&(current_state==IDLE))         mode_reg <= mode;
    else                                                mode_reg <= mode_reg;
end
always@(*)begin
    if(in_valid2)       idx_list_comb = {matrix_idx, idx_list[14:5]};
    else if(current_state == INPUT_2)begin
        case(mode_reg)
            2'b00:      idx_list_comb = {idx_list[4:0], idx_list[9:5], idx_list[14:10]};
            2'b01:      idx_list_comb = {idx_list[9:5], idx_list[14:10], idx_list[4:0]};
            2'b10:      idx_list_comb = {idx_list[14:10], idx_list[4:0], idx_list[9:5]};
            2'b11:      idx_list_comb = {idx_list[14:10], idx_list[9:5], idx_list[14:10]};
            default:    idx_list_comb = idx_list;
        endcase
    end
    else                idx_list_comb = idx_list;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  idx_list <= 'b0;
    else        idx_list <= idx_list_comb;
end
assign A_idx = idx_list[4:0];
assign B_idx = idx_list[9:5];
assign C_idx = idx_list[14:10];
//========================================
// COMPUTE ATxBT
//========================================







//========================================
// COMPUTE AxBT
//========================================
//delay4
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        AxBT_delay <= 'b0;
    end
    else begin
        if(current_state==AxBT)     AxBT_delay[0] <= 'b1;
        else                        AxBT_delay[0] <= 'b0;
        AxBT_delay[1] <= AxBT_delay[0];
        AxBT_delay[2] <= AxBT_delay[1];
        AxBT_delay[3] <= AxBT_delay[2];
    end
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  AxBT_toTrace ='b0;
    else        AxBT_toTrace = {AxBT_toTrace[2:0],((B_row==row_limit)&&(B_col==col_limit)&&(input_cnt))};
end
//TRACE_delay
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  TRACE_delay ='b0;
    else        TRACE_delay = {TRACE_delay[2:0],(current_state==TRACE)};
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  TRACE_to_OUTPUT ='b0;
    else        TRACE_to_OUTPUT = {TRACE_to_OUTPUT[2:0],(B_row==row_limit)&&(B_col==col_limit)};
end






always@(*)begin
    if(current_state == BTxAT||current_state==TRACE)begin
        if(compute_cnt<'d2) compute_cnt_comb = compute_cnt +'d1
        else                compute_cnt_comb = 'd0;
    end
    else    compute_cnt_comb = compute_cnt;
    
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)      compute_cnt <= 'd0;
    else            compute_cnt <= compute_cnt_comb;
end


//mult_1a
always@(*)begin
    if((current_state == AxBT)&&(~input_cnt))  mult_1a_comb = {(11{data_w_out[7]}),data_w_out[7:0]};
    else if((next_state == TRACE)&&(input_cnt)) mult_1a_comb = data_t_out;
    else                                        mult_1a_comb = mult_1a;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  mult_1a <= 'b0
    else if(current_state == IDLE)  mult_1a <='b0;
    else        mult_1a <= mult_1a_comb;
end
//mult_1b
always@(*)begin
    if((current_state == AxBT)&&(~input_cnt))                               mult_1b_comb = {(11{data_w_out[15]}),data_w_out[15:8]};
    else if ((next_state == TRACE)&&(~input_cnt)&&(TRACE_delay[1]))         mult_1b_comb = data_t_out;
    else                                        mult_1b_comb = mult_1b;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  mult_1b <= 'b0
    else if(current_state == IDLE)  mult_1b <='b0;
    else        mult_1b <= mult_1b_comb;
end
//mult_2a
always@(*)begin
    if((current_state == AxBT)&&(input_cnt))   mult_2a_comb = {(11{data_w_out[7]}),data_w_out[7:0]};
    else if(next_state == AxBT)&&(input_cnt)   mult_2a_comb = {(11{data_w_out[7]}),data_w_out[7:0]};
    else                                        mult_2a_comb = mult_2a;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  mult_2a <= 'b0
    else if(current_state == IDLE)  mult_2a <='b0;
    else        mult_2a <= mult_2a_comb;
end
//mult_2b
always@(*)begin
    if((current_state == AxBT)&&(input_cnt))   mult_2b_comb = {(11{data_w_out[15]}),data_w_out[15:8]};
    else if((current_state == TRACE)&&(input_cnt))   mult_2b_comb = {(11{data_w_out[15]}),data_w_out[15:8]};
    else                                        mult_2b_comb = mult_2b;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  mult_2b <= 'b0
    else if(current_state == IDLE)  mult_2b <='b0;
    else        mult_2b <= mult_2b_comb;
end
//accm
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  B_col_eq_coll_limit <= 'b0
    else         B_col_eq_coll_limit <= {B_col_eq_coll_limit[2:0],(B_col==col_limit)};
end
always@(*)begin
    if((current_state == AxBT)&&(B_col_eq_coll_limit[2])&&(input_cnt_d)||(AxBT_toTrace[3])) accm_comb = 'b0;
    else                                                                                    accm_comb = mac_result;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  accm <= 'b0
    else if(current_state==IDLE) accm <= 'b0;
    else        accm <= accm_comb;
end


//B_col
always@(*)begin
    if((current_state == AxBT)&&(input_cnt))begin
        if(B_col < col_limit)   B_col_comb = B_col + 'd1;
        else                    B_col_comb = 'd0;
    end
    else if(AxBT_toTrace[3])    B_col_comb = 'd0;
    else if((current_state == TRACE)&&(input_cnt))begin
        if(B_col < col_limit)   B_col_comb = B_col + 'd1;
        else                    B_col_comb = 'd0;
    end
    else    B_col_comb = B_col;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  B_col <= 'b0;
    else if(current_state== IDLE)   B_col <= 'b0;
    else                            B_col <= B_col_comb;
end


//B_row
always@(*)begin
    if((current_state == AxBT)&&(B_col == col_limit)&&(input_cnt))begin
        if(B_row < row_limit)   B_row_comb = B_row + 'd1;
        else                    B_row_comb = 'd0;
    end
    else if(AxBT_toTrace[3])    B_row_comb = 'd0;
    else if ((current_state == TRACE)&&(B_col == col_limit)&&(input_cnt))begin
        if(B_row < row_limit)   B_row_comb = B_row + 'd1;
        else                    B_row_comb = 'd0;
    end
    else    B_row_comb = B_row;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  B_row <= 'b0;
    else if(current_state== IDLE)   B_row<='d0;
    else        B_row <= B_row_comb;
end

//A_row
always@(*)begin
    if((current_state == AxBT)&&(B_row==row_limit)&&(B_col==col_limit)&&(input_cnt))begin
        if(A_row < row_limit)   A_row_comb = A_row + 'd1;
        else                    A_row_comb = 'd0;
    end
    else if((current_state==BTxAT)&&(compute_cnt<'d2))begin
        A_row_comb = A_row +'d1;

    end

    else    A_row_comb = A_row;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  A_row <= 'b0;
    else if(current_state==IDLE)    A_row <= 'b0;
    else        A_row <= A_row_comb;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  BTxAT_A_flag ='d0;
    else if (current_state == IDLE) BTxAT_A_flag = 'd0;
    else if((current_state == BTxAT)&&(B_row==B))
end






//========================================
//  COMPUTE Trace
//========================================





//========================================
//  WEIGHT_SRAM DECLARATION
//========================================
RA1SH_16b_4096w Weight_SRAM(.Q(data_w_out), .CLK(clk), .CEN(1'b0), .WEN(wsram_state), .A(addr_w), .D(data_w_in), .OEN(1'b0));
RA1SH_19b_256w TEMP_SRAM(.Q(data_t_out), .CLK(clk), .CEN(1'b0), .WEN(tsram_state), .A(addr_t), .D(data_t_in), .OEN(1'b0));






endmodule
