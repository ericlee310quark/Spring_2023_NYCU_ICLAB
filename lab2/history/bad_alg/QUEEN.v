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
parameter s_idle = 3'd0; 
parameter s_input = 3'd1;
parameter s_col_plus = 3'd2;
parameter s_find_row = 3'd3;

parameter s_back = 3'd5;
//parameter s_record = 3'd6;
parameter s_output = 3'd7; 
//parameter s_clear = 3'd4;
//==============================================//
//                 reg declaration              //
//==============================================//
reg [2:0] current_state, next_state;

reg [3:0] ans_row_position [11:0];
reg [15:0] fixed_col_flag;
reg [12:0] fixed_row_flag;
reg [11:0] fixed_row_flag_un;
reg [12:0] testing;


reg [3:0] col_pointer_comb, col_pointer;
reg [3:0] row_pointer_comb, row_pointer;//, row_pointer_temp;

reg [11:0] dia_flag;//, dia_flag_pre, dia_flag_pre2;
reg signed [4:0] k_sub_n_comb[11:0];
reg signed [4:0] col_k_sub_n_comb[11:0],col_k_sub_n_comb_pre[11:0];
reg signed [4:0] k_sub_n_comb_in[11:0];
wire  [3:0] col_pointer_comb_sub1, col_pointer_comb_plus;

wire [3:0] row_pointer_comb_sub1;
reg [1:0] input_change_condition;
reg [1:0] col_change_condition;
wire [4:0] fixed_row_flag_pre;


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

//current_state
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        current_state <= s_idle;
    else
        current_state <= next_state;
end
//next_state

always @(*) begin
    input_change_condition = {in_valid, fixed_col_flag[col_pointer]};
    col_change_condition = {fixed_col_flag[col_pointer]|testing[col_pointer], col_pointer>'d11};
    case(current_state)
    s_idle: if(in_valid) next_state = s_input;
            else         next_state = s_idle;
    s_input: 
        if(~(|input_change_condition))  next_state = s_find_row;
        else                            next_state = s_input;
    s_col_plus:begin
            case(col_change_condition)
            2'b00: next_state = s_find_row;
            2'b01,2'b11: next_state = s_output;
            default: next_state = s_col_plus;
            endcase
    end
    s_find_row:begin
        case({row_pointer>'d11, ((|dia_flag)|(fixed_row_flag[row_pointer]))})
            2'b10,2'b11: next_state =s_back;
            2'b01:       next_state = s_find_row;
            default:     next_state = s_col_plus;
        endcase
    end
    s_back: if(fixed_col_flag[col_pointer_comb]) next_state = s_back;
            else                                      next_state = s_find_row;
    s_output: if(col_pointer=='d7) next_state = s_idle;
             else                  next_state = s_output;
    default: next_state = current_state;
    endcase
end


//Combinational-pointer reg
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        col_pointer <= 'd0;
        row_pointer <= 'd0;
    end
    else begin
        col_pointer <= col_pointer_comb;
        row_pointer <= row_pointer_comb;
    end
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
        else                                    col_pointer_comb = col_pointer;
        end
    s_col_plus: begin    //2
        if(fixed_col_flag[col_pointer]|testing[col_pointer])    col_pointer_comb = col_pointer_comb_plus + fixed_col_flag[col_pointer_comb_plus];
        else                                                    col_pointer_comb = col_pointer;
        row_pointer_comb = 'b0;// (fixed_row_flag[0])+fixed_row_flag[0]&fixed_row_flag[1];
        /*
        case(fixed_row_flag_un)
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
        default: row_pointer_comb = 'b0;
        endcase
        */

    end
    s_find_row:begin  //3
        row_pointer_comb=row_pointer+'d1+(fixed_row_flag_pre[0])+(fixed_row_flag_pre[1])+fixed_row_flag_pre[2]+fixed_row_flag_pre[3]+fixed_row_flag_pre[4];//+fixed_row_flag_pre[5]+fixed_row_flag_pre[6]+fixed_row_flag_pre[7]+fixed_row_flag_pre[8]+fixed_row_flag_pre[9];
        col_pointer_comb = col_pointer;
    end
    s_back: begin
        col_pointer_comb = col_pointer_comb_sub1;
        row_pointer_comb = ans_row_position[col_pointer_comb_sub1]+'d1;
    end
    s_output: begin //7
        col_pointer_comb = col_pointer_comb_plus;
        row_pointer_comb = row_pointer;
    end
    default: begin
        row_pointer_comb = row_pointer;
        col_pointer_comb = col_pointer;
    end
    endcase
end

//forward look in y-direction
assign fixed_row_flag_pre[0] = fixed_row_flag[row_pointer+'d1];
assign fixed_row_flag_pre[1] = fixed_row_flag_pre[0]&fixed_row_flag[row_pointer+'d2];
assign fixed_row_flag_pre[2] = fixed_row_flag_pre[1]&fixed_row_flag[row_pointer+'d3];
assign fixed_row_flag_pre[3] = fixed_row_flag_pre[2]&fixed_row_flag[row_pointer+'d4];
assign fixed_row_flag_pre[4] = fixed_row_flag_pre[3]&fixed_row_flag[row_pointer+'d5];

// Dia-check
genvar i;
generate
    for(i = 0;i<12;i=i+1)begin: loop_1
        always @(*) begin
            k_sub_n_comb[i] = $signed({1'b0,col_pointer}) - $signed(i);
            k_sub_n_comb_in[i] = k_sub_n_comb[i] * -'d1;
            col_k_sub_n_comb[i] = $signed({1'b0,row_pointer}) - $signed({1'b0,ans_row_position[i]});
            dia_flag[i] = ((k_sub_n_comb[i]==col_k_sub_n_comb[i])|(k_sub_n_comb_in[i] ==col_k_sub_n_comb[i]))&(testing[i]|fixed_col_flag[i])&(i!=col_pointer_comb);
        end
    end
endgenerate

//some extras
assign col_pointer_comb_sub1 = col_pointer -'d1;
assign col_pointer_comb_plus = col_pointer +'d1;
assign row_pointer_comb_sub1 = ans_row_position[col_pointer_comb_sub1];


//==============================================//
//                  Input Block                 //
//==============================================//

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        ans_row_position[11] <='d0;
        ans_row_position[10] <='d0;ans_row_position[9] <='d0;ans_row_position[8] <='d0;
        ans_row_position[7] <='d0;ans_row_position[6] <='d0;ans_row_position[5] <='d0;
        ans_row_position[4] <='d0;ans_row_position[3] <='d0;ans_row_position[2] <='d0;
        ans_row_position[1] <='d0;ans_row_position[0] <='d0;
        
        fixed_row_flag<='d0; 
        fixed_col_flag<='d0;    
        testing<='d0;
        fixed_row_flag_un<='d0;
    end
    
    else if(in_valid)begin
        ans_row_position[col] <= row;
        fixed_col_flag[col]<='d1; //span in x-direction.
        fixed_row_flag[row]<='d1; //span in y-direction.
        fixed_row_flag_un[row]<='d1;
    end
    
    else begin
    case(current_state)
        s_find_row:begin
            if({row_pointer>'d11, ((|dia_flag)|(fixed_row_flag[row_pointer]))}=='b0)begin
                testing[col_pointer] <= 'd1;
                ans_row_position[col_pointer] <= row_pointer;
                fixed_row_flag[row_pointer]<='d1;
            end
            else begin
                testing[col_pointer] <= testing[col_pointer];
                ans_row_position[col_pointer] <= ans_row_position[col_pointer];
                fixed_row_flag[row_pointer]<=fixed_row_flag[row_pointer];
            end
        end
        s_back:begin
            testing[col_pointer]<='d0;
            fixed_row_flag[row_pointer_comb_sub1] <= fixed_row_flag_un[row_pointer_comb_sub1];
        end
        s_output: begin
            ans_row_position[11] <= 'd0;
            ans_row_position[10] <= ans_row_position[11];
            ans_row_position[9] <= ans_row_position[10];
            ans_row_position[8] <= ans_row_position[9];
            ans_row_position[7] <= ans_row_position[8];
            ans_row_position[6] <= ans_row_position[7];
            ans_row_position[5] <= ans_row_position[6];
            ans_row_position[4] <= ans_row_position[5];
            ans_row_position[3] <= ans_row_position[4];
            ans_row_position[2] <= ans_row_position[3]; 
            ans_row_position[1] <= ans_row_position[2];
            ans_row_position[0] <= ans_row_position[1];

            fixed_row_flag<= 'd0; 
            fixed_col_flag<='d0;    
            testing <= 'd0;
            fixed_row_flag_un<='d0;
        end

        default:begin
            ans_row_position[11] <=ans_row_position[11];
            ans_row_position[10] <=ans_row_position[10];ans_row_position[9] <=ans_row_position[9];ans_row_position[8] <=ans_row_position[8];
            ans_row_position[7] <=ans_row_position[7] ;ans_row_position[6] <=ans_row_position[6] ;ans_row_position[5] <=ans_row_position[5] ;
            ans_row_position[4] <=ans_row_position[4] ;ans_row_position[3] <=ans_row_position[3] ;ans_row_position[2] <=ans_row_position[2] ;
            ans_row_position[1] <=ans_row_position[1] ;ans_row_position[0] <=ans_row_position[0] ;
            
            fixed_row_flag<= fixed_row_flag; 
            fixed_col_flag<=fixed_col_flag;    
            testing <= testing;
            fixed_row_flag_un<=fixed_row_flag_un;
        end
    endcase
    end
end
//GOOD LUCKY

endmodule 
