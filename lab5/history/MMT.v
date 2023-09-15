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
          PROCESS = 'd2,
          OUTPUT_state = 'd3;

parameter 

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
wire [15:0] data_from_weight;
reg [12:0] weight_address;
reg [12:0] next_weight_address;
reg [15:0] weight_into_sram;
reg weight_sram_wr_state;    //write: 0, read: 1

reg [1:0] current_state, next_state;
reg [3:0] input_cnt;
wire [3:0] input_cnt_comb;
reg [3:0] input_row_cnt;
wire [3:0] input_row_cnt_comb;
reg [3:0] matrix_size_ff, matrix_size_comb;
reg in_valid1_delay, in_valid2_delay;;

reg [1:0] mode_ff;

reg signed [18:0] multi_a1, multi_a2, multi_b1, multi_b2;
reg signed [33:0] partial_sum, partial_sum_comb;
reg [14:0] idx_order, idx_order_comb;


reg [3:0] A_row;
wire [3:0] A_row_comb;
reg [3:0] A_col;
wire [3:0] A_col_comb;
reg A_element_idx;
reg [3:0] B_row;
wire [3:0] B_row_comb;
reg [3:0] B_col;
wire [3:0] B_col_comb;
reg B_element_idx;



reg [1:0] access_cnt, 
wire [1:0] access_cnt_comb;

reg [3:0] repeat_cnt;
wire [3:0] repeat_cnt_comb;
wire start_A_B;
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
    else if(next_state == OUTPUT_state)   out_value <=
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
    case(current_state)
    IDLE:   if(in_valid)        next_state = INPUT_MAT;
            else if(in_valid2)  next_state = PROCESS;
            else                next_state = IDLE;
    INPUT_MAT:  if(~in_valid)   next_state = IDLE;
                else            next_state = INPUT_MAT;
    PROCESS:    if()            next_state = OUTPUT_state;
                else            next_state = PROCESS;
    OUTPUT_state:               next_state = IDLE;
    default:                    next_state = IDLE;
    endcase
end

assign input_cnt_comb = input_cnt + 'b1;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                                          input_cnt <= 'b0;
    else if((current_state == IDLE)||(input_cnt==matrix_size_ff))       input_cnt <= 'b0;
    else if(current_state == INPUT_MAT)                                 input_cnt <= input_cnt_comb;
    else                                                                input_cnt <= input_cnt;
end
assign input_row_cnt_comb = input_row_cnt + 'b1;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                                          input_row_cnt <= 'b0;
    else if(current_state == IDLE)                                      input_row_cnt <= 'b0;
    else if((current_state == INPUT_MAT)&&(input_cnt==matrix_size_ff))  input_row_cnt <= input_row_cnt_comb;
    else                                                                input_row_cnt <= input_row_cnt;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                          in_valid1_delay <= 'b0;
    else                                in_valid1_delay <= in_valid;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                          in_valid2_delay <= 'b0;
    else                                in_valid2_delay <= in_valid2;
end


//========================================
//  STORE Matrix Size
//========================================
always@(*)begin
    case(matrix_size)
    2'b00:      matrix_size_comb = 'd1;
    2'b01:      matrix_size_comb = 'd3;
    2'b10:      matrix_size_comb = 'd7;
    2'b11:      matrix_size_comb = 'd15;
    default:    matrix_size_comb = 'd1;
    endcase
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                          matrix_size_ff <= 'd1;
    else if((in_valid^in_valid1_delay)&&(in_valid))     matrix_size_ff <= matrix_size_comb;
    else                                                matrix_size_ff <= matrix_size_ff;
end
//========================================
//  SRAM CTR
//========================================
//INPUT WEIGHT
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)  weight_into_sram <= 'b0;
    else if(current_state==INPUT_MAT)
        if(input_cnt=='b0)          weight_into_sram <= {matrix, 8'b0};
        else                        weight_into_sram <= {matrix, weight_into_sram[15:8]};
    //TODO: temparary store A*B elements
    else if()                       weight_into_sram <= ;
    else                            weight_into_sram <= 'b0;

end
//SRAM_MODE CTR
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                                          weight_sram_wr_state <= 'b1;
    else if((current_state==INPUT_MAT)&&(input_cnt==matrix_size_ff))    weight_sram_wr_state <= 'b0;
    //TODO: temparary store A*B elements
    else if()                                                           weight_sram_wr_state <= 'b0;
    else                                                                weight_sram_wr_state <= 'b1;
end
//ADDRESS CTR
always@(*)begin
    if((input_cnt==weight_address)&&(input_row_cnt>'d0))
        case(matrix_size_ff)
        4'b1000:        next_weight_address = weight_address + 'd1;
        4'b0100:        next_weight_address = weight_address + 'd5;
        4'b0010:        next_weight_address = weight_address + 'd7;
        4'b0001:        next_weight_address = weight_address + 'd8;
        4'd0, 4'd2, 
        4'd4, 4'd5, 
        4'd6, 4'd8, 
        4'd9, 4'd10, 
        4'd11, 4'd12, 
        4'd13, 4'd14:   next_weight_address = weight_address + 'd1;
        default:        next_weight_address = weight_address + 'd1;
        endcase
    //TODO: A*B
    else if((current_state==PROCESS)&&)
            case(access_cnt)
                2'd2:   next_weight_address = 8'd128 *idx_order[4:0] + A_row * 4'd8 + A_col;
                2'd0, 2'd1:
                        next_weight_address = 8'd128 *idx_order[9:5] + B_row * 4'd8 + B_col;
            default:    next_weight_address = 'd0;
            endcase
    //TODO: *C
    else if ((current_state==PROCESS)&&)

    else            next_weight_address = weight_address + 'd1;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                                          weight_address <= 13'b1_1111_1111_1111;
    else if((current_state==INPUT_MAT)&&(input_cnt[0]))                 weight_address <= next_weight_address;
    //TODO: temparary access A, B, C elements
    else if ()                                                          weight_address <= ;
    //TODO: temparary store A*B elements
    else if()                                                           weight_address <= ;
    else                                                                weight_address <= weight_address;
end
//========================================
//  COMPUTE
//========================================
always@(*)begin
    if((in_valid2^in_valid2_delay)&&(in_valid2))begin
        case(mode)
            2'b00, 2'b10:      mode_comb = mode;
            2'b01, 2'b11:      mode_comb = 2'b10;
            default:           mode_comb = 'b0;
        endcase
    end
    else                       mode_comb = mode_ff;
end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)              mode_ff <= 'b0;
    else                    mode_ff <= mode_comb;
end
always@(*)begin
    if(in_valid2)        idx_order_comb = {matrix_idx, idx_order[14:5]};
    else if((in_valid2^in_valid2_delay)&&(in_valid2_delay))begin
        case(mode_ff)
            2'b00:      idx_order_comb = idx_order
            2'b01:      idx_order_comb = {idx_order[9:0],idx_order[14:10]};
            2'b10:      idx_order_comb = idx_order;
            2'b11:      idx_order_comb = {idx_order[4:0], idx_order[14:10], idx_order[9:5]}   
            default:    idx_order_comb = idx_order;
        endcase
    end
    else                idx_order_comb = idx_order;

end
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                  idx_order <= 'b0;
    else                        idx_order <= idx_order_comb;
end


assign start_A_B = (current_state==PROCESS)&&(~in_valid2)&&(~in_valid2_delay);
assign access_cnt_comb = (access_cnt<'d2)?access_cnt +'d1:'d0;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)         access_cnt <= 'b0;
    else if(in_valid2) access_cnt <= 'b2;
    else if(start_A_B) access_cnt <= access_cnt_comb;
    else               access_cnt <= access_cnt;
end
assign repeat_cnt_comb = (repeat_cnt < matrix_size_ff)?repeat_cnt +'d1:'d0;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                  repeat_cnt <= 'b0;
    else if((start_A_B)&&(access_cnt=='d2))     repeat_cnt <= repeat_cnt_comb;
    else                                        repeat_cnt <= repeat_cnt;
end

assign B_row_comb = (B_row < matrix_size_ff)? B_row + 'd1:'d0;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                 B_row <= 4'hF;
    else if((start_A_B)&&(access_cnt<'d2))     B_row <= B_row_comb;
    else                                       B_row <= B_row;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                      B_element_idx <= 'd0;
    else if(B_row==matrix_size_ff)  B_element_idx <= ~(B_element_idx);
    else                            B_element_idx <= B_element_idx;
end

assign B_col_comb = (B_col < (matrix_size_ff-'d1)/2)? B_col + 'd1:'d0;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)                                                      B_col <= 'b0;
    else if((start_A_B)&&(B_element_idx)&&(B_row==matrix_size_ff))  B_col <= B_col_comb;
    else                                                            B_col <= B_col;
end







assign partial_sum_comb = partial_sum + multi_a1 * multi_a2 + multi_b1 * multi_b2;







//========================================
//  WEIGHT_SRAM DECLARATION
//========================================
RA1SH_19b_4352w Weight_SRAM(.Q(data_from_weight), .CLK(clk), .CEN(1'b0), .WEN(weight_sram_wr_state), .A(weight_address), .D(weight_into_sram), .OEN(1'b0))





endmodule
