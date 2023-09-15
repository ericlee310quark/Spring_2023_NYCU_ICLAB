module QUEEN(
    //Input Port
    clk,
    rst_n,

    in_valid,
    col,
    row,

    in_valid_num,
    in_num,

    out_valid,
    out,

    );

input               clk, rst_n, in_valid,in_valid_num;
input       [3:0]   col,row;
input       [2:0]   in_num;

output reg          out_valid;
output reg  [3:0]   out;

//==============================================//
//             Parameter and Integer            //
//==============================================//
parameter s_idle = 2'd0; 
parameter s_input = 2'd1;
parameter s_find_row = 2'd2;
parameter s_output = 2'd3; 
//==============================================//
//                 reg declaration              //
//==============================================//
reg [1:0] current_state, next_state;

reg [3:0] ans_row_position [11:0];
reg [15:0] fixed_col_flag;
reg [0:11] fixed_row_flag;       //inverse bit
reg [11:0] testing;

reg [3:0] col_pointer_comb, col_pointer;
reg [3:0] row_pointer_comb, row_pointer;

wire  [3:0] col_pointer_comb_sub1, col_pointer_comb_plus;

wire [3:0] row_pointer_comb_sub1;
wire [1:0] input_change_condition;

reg [0:22] lu_ram, rd_ram;      
wire [0:11] lu_ram_mask, rd_ram_mask, dia_mask, ternary_mask; //inverse bit
reg [0:11]  record_mask;                                     //inverse bit
wire [4:0] lu_pointer, lu_pointer2;//,lu_pointer_input;

wire signed [4:0]  rd_pointer_temp, rd_pointer_temp_in;
//wire signed [4:0]  rd_pointer_temp_input, rd_pointer_temp_in_input;
wire signed [4:0]  rd_pointer_temp2, rd_pointer_temp_in2;
wire [4:0] rd_pointer, rd_pointer2;//, rd_pointer_input;
wire [3:0] dia_col, dia_row;
//wire [3:0] dia_col_input, dia_row_input;

//==============================================//
//            FSM State Declaration             //
//==============================================//

//OUTPUT control
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        out_valid <= 'd0;
        out <= 'd0;
    end
    else begin
        if (current_state==s_output) begin
            out_valid <= 'd1;
            out <= ans_row_position[0];
        end
        else begin
             out_valid <= 'd0;
             out <='d0;
        end
    end
end
//Current_state
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        current_state <= s_idle;
    else
        current_state <= next_state;
end
//Next:_state
assign input_change_condition = {in_valid, fixed_col_flag[col_pointer]};
always @(*) begin
    case(current_state)
    s_idle: if(in_valid) next_state = s_input;
            else         next_state = s_idle;
    s_input: if(~(|input_change_condition))  next_state = s_find_row;
             else                            next_state = s_input;
    s_find_row: if(col_pointer>'d11)    next_state =s_output;
                else                    next_state =s_find_row;
    s_output: if(col_pointer=='d6) next_state = s_idle;
              else                  next_state = s_output;
    default:  next_state = current_state;
    endcase
end

//some extras shared wire
assign col_pointer_comb_sub1 = col_pointer - 'd1;
assign col_pointer_comb_plus = col_pointer + 'd1;
assign row_pointer_comb_sub1 = ans_row_position[col_pointer_comb_sub1];

// Input: ram pointer
/*
assign dia_col_input = col;
assign dia_row_input = row;
assign lu_pointer_input = dia_col_input + dia_row_input;
assign rd_pointer_temp_input = $signed({2'b0,dia_row_input}) - 'd11;
assign rd_pointer_temp_in_input = rd_pointer_temp_input * -'d1;
assign rd_pointer_input = $unsigned(rd_pointer_temp_in_input) + dia_col_input;
*/
// Process: ram pointer
assign dia_col = (in_valid)?col:col_pointer;
assign dia_row = (in_valid)?row:row_pointer_comb;
assign lu_pointer = dia_col + dia_row;
assign rd_pointer_temp = $signed({2'b0,dia_row})- 'd11;
assign rd_pointer_temp_in = rd_pointer_temp * -'d1;
assign rd_pointer = $unsigned(rd_pointer_temp_in) + dia_col;

// Backtracing: ram pointer
assign lu_pointer2 = col_pointer_comb_sub1 + row_pointer_comb_sub1;
assign rd_pointer_temp2 = $signed({1'b0, row_pointer_comb_sub1}) - 'd11;
assign rd_pointer_temp_in2 = rd_pointer_temp2 * -'d1;
assign rd_pointer2 = $unsigned(rd_pointer_temp_in2) + col_pointer_comb_sub1;

// Masks: lu_ram, rd_ram, dia, ternary(above three), record

assign lu_ram_mask = {lu_ram[col_pointer], lu_ram[col_pointer+'d1], lu_ram[col_pointer+'d2], lu_ram[col_pointer+'d3],
                lu_ram[col_pointer+'d4], lu_ram[col_pointer+'d5], lu_ram[col_pointer+'d6], lu_ram[col_pointer+'d7],
                lu_ram[col_pointer+'d8], lu_ram[col_pointer+'d9], lu_ram[col_pointer+'d10], lu_ram[col_pointer+'d11]};
assign rd_ram_mask = {rd_ram[col_pointer+'d11], rd_ram[col_pointer+'d10], rd_ram[col_pointer+'d9], rd_ram[col_pointer+'d8],
                rd_ram[col_pointer+'d7], rd_ram[col_pointer+'d6], rd_ram[col_pointer+'d5], rd_ram[col_pointer+'d4],
                rd_ram[col_pointer+'d3], rd_ram[col_pointer+'d2], rd_ram[col_pointer+'d1], rd_ram[col_pointer]};


assign dia_mask = lu_ram_mask | rd_ram_mask;
assign ternary_mask = dia_mask | fixed_row_flag[0:11]| record_mask;
always @(*) begin
    if (testing[col_pointer]&(~fixed_col_flag[col_pointer]))begin
        case({ans_row_position[col_pointer]})
            4'd0:       record_mask = 12'b1000_0000_0000;
            4'd1:       record_mask = 12'b1100_0000_0000;
            4'd2:       record_mask = 12'b1110_0000_0000;
            4'd3:       record_mask = 12'b1111_0000_0000;

            4'd4:       record_mask = 12'b1111_1000_0000;
            4'd5:       record_mask = 12'b1111_1100_0000;
            4'd6:       record_mask = 12'b1111_1110_0000;
            4'd7:       record_mask = 12'b1111_1111_0000;
            
            4'd8:       record_mask = 12'b1111_1111_1000;
            4'd9:       record_mask = 12'b1111_1111_1100;
            4'd10:      record_mask = 12'b1111_1111_1110;
            4'd11:      record_mask = 12'b1111_1111_1111;
            default:    record_mask = 12'b0;
        endcase
    end
    else begin
        if(fixed_col_flag[col_pointer])    record_mask = 12'b1111_1111_1111;
        else                               record_mask = 12'b0000_0000_0000;
    end
end 
//Combinational-pointer reg

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  col_pointer <= 'd0;
    else        col_pointer <= col_pointer_comb;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  row_pointer <= 'd0;
    else row_pointer <= row_pointer_comb;
end

//Combinational-pointer ctr
always @(*) begin
    case(current_state)
    s_idle: begin
        row_pointer_comb = 'b0;
        col_pointer_comb = 'b0;
        end
    s_input: begin
        row_pointer_comb = 'b0;
        if(fixed_col_flag[col_pointer])    col_pointer_comb = col_pointer_comb_plus;
        else                               col_pointer_comb = col_pointer;
        end
    s_find_row:begin
        casex(ternary_mask)
            12'b0xxx_xxxx_xxxx: row_pointer_comb = 'b0;
            12'b10xx_xxxx_xxxx: row_pointer_comb = 'd1;
            12'b110x_xxxx_xxxx: row_pointer_comb = 'd2;
            12'b1110_xxxx_xxxx: row_pointer_comb = 'd3;

            12'b1111_0xxx_xxxx: row_pointer_comb = 'd4;
            12'b1111_10xx_xxxx: row_pointer_comb = 'd5;
            12'b1111_110x_xxxx: row_pointer_comb = 'd6;
            12'b1111_1110_xxxx: row_pointer_comb = 'd7;

            12'b1111_1111_0xxx: row_pointer_comb = 'd8;
            12'b1111_1111_10xx: row_pointer_comb = 'd9;
            12'b1111_1111_110x: row_pointer_comb = 'd10;
            12'b1111_1111_1110: row_pointer_comb = 'd11;
            default: row_pointer_comb = 'd12;
        endcase
        if(((row_pointer_comb<'d12))|((fixed_col_flag[col_pointer])&(~testing[col_pointer]))) col_pointer_comb = col_pointer_comb_plus;
        else                                                                                  col_pointer_comb = col_pointer_comb_sub1;
    end
    s_output: begin
        col_pointer_comb = col_pointer_comb_plus;
        row_pointer_comb = 'b0;
    end
    default: begin
        row_pointer_comb = row_pointer;
        col_pointer_comb = col_pointer;
    end
    endcase
end

//==============================================//
//            Input and Store Block             //
//==============================================//

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        ans_row_position[10] <= 'd0;    ans_row_position[9] <= 'd0;     ans_row_position[8] <= 'd0;
        ans_row_position[7] <= 'd0;     ans_row_position[6] <= 'd0;     ans_row_position[5] <= 'd0;
        ans_row_position[4] <= 'd0;     ans_row_position[3] <= 'd0;     ans_row_position[2] <= 'd0;
        ans_row_position[1] <= 'd0;     ans_row_position[0] <= 'd0;

        fixed_row_flag <= 'd0; 
        fixed_col_flag <= 'd0;    
        testing <= 'd0;
        lu_ram <= 'd0;
        rd_ram <= 'd0;
    end
    else if(in_valid)begin
        ans_row_position[col] <= row;
        fixed_col_flag[col] <= 'd1; //span in x-direction.
        fixed_row_flag[row] <= 'd1; //span in y-direction.
        //lu_ram[lu_pointer_input] <= 'd1;
        //rd_ram[rd_pointer_input] <= 'd1;
        lu_ram[lu_pointer] <= 'd1;
        rd_ram[rd_pointer] <= 'd1;
    end
    else begin
    case(current_state)
        s_find_row:begin
            if(((row_pointer_comb<'d12))|((fixed_col_flag[col_pointer])&(~testing[col_pointer]))) begin
                testing[col_pointer] <= 'd1;
                if(fixed_col_flag[col_pointer])begin
                    ans_row_position[col_pointer] <= ans_row_position[col_pointer] ;
                    fixed_row_flag[row_pointer_comb]<=fixed_row_flag[row_pointer_comb];
                    lu_ram[lu_pointer] <= lu_ram[lu_pointer];
                    rd_ram[rd_pointer] <= rd_ram[rd_pointer];
                end
                else begin
                    ans_row_position[col_pointer] <= row_pointer_comb;
                    fixed_row_flag[row_pointer_comb]<='d1;
                    lu_ram[lu_pointer] <= 'd1;
                    rd_ram[rd_pointer] <= 'd1;
                end
            end
            else begin
                ans_row_position[col_pointer] <= ans_row_position[col_pointer] ;
                testing[col_pointer] <= 'd0;
                case ({fixed_col_flag[col_pointer_comb_sub1], fixed_col_flag[col_pointer]})
                    2'b01,2'b00: begin
                        fixed_row_flag[ans_row_position[col_pointer_comb_sub1]] <='d0;
                        lu_ram[lu_pointer2] <= 'd0;
                        rd_ram[rd_pointer2] <= 'd0;
                    end
                    2'b10,2'b11:begin
                        fixed_row_flag[row_pointer_comb]<=fixed_row_flag[row_pointer_comb];
                        lu_ram[lu_pointer] <= lu_ram[lu_pointer];
                        rd_ram[rd_pointer] <= rd_ram[rd_pointer];
                    end
                    default: begin
                        fixed_row_flag[row_pointer_comb] <= fixed_row_flag[row_pointer_comb];
                        lu_ram[lu_pointer] <=  lu_ram[lu_pointer];
                        rd_ram[rd_pointer] <= rd_ram[rd_pointer];
                    end
                endcase         
            end
        end
        s_output: begin
            ans_row_position[11] <= 'd0;
            ans_row_position[10] <= ans_row_position[11];       ans_row_position[9] <= ans_row_position[10];        ans_row_position[8] <= ans_row_position[9];
            ans_row_position[7] <= ans_row_position[8];         ans_row_position[6] <= ans_row_position[7];         ans_row_position[5] <= ans_row_position[6];
            ans_row_position[4] <= ans_row_position[5];         ans_row_position[3] <= ans_row_position[4];         ans_row_position[2] <= ans_row_position[3]; 
            ans_row_position[1] <= ans_row_position[2];         ans_row_position[0] <= ans_row_position[1];

            fixed_row_flag<= 'd0; 
            fixed_col_flag<='d0;    
            testing <= 'd0;
            lu_ram <= 'd0;
            rd_ram <= 'd0;
        end

        default:begin
            ans_row_position[11] <= ans_row_position[11];
            ans_row_position[10] <= ans_row_position[10];   ans_row_position[9] <= ans_row_position[9];     ans_row_position[8] <= ans_row_position[8];
            ans_row_position[7] <= ans_row_position[7];     ans_row_position[6] <= ans_row_position[6];     ans_row_position[5] <= ans_row_position[5];
            ans_row_position[4] <= ans_row_position[4];     ans_row_position[3] <= ans_row_position[3];     ans_row_position[2] <= ans_row_position[2];
            ans_row_position[1] <= ans_row_position[1];     ans_row_position[0] <= ans_row_position[0];

            fixed_row_flag<= fixed_row_flag; 
            fixed_col_flag<=fixed_col_flag;    
            testing <= testing;
            lu_ram <= lu_ram;
            rd_ram <= rd_ram;
        end
    endcase
    end
end
//GOOD LUCKY
endmodule 
