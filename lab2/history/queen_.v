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
parameter s_record = 3'd6;
parameter s_output = 3'd7; 
parameter s_clear = 3'd4;
//==============================================//
//                 reg declaration              //
//==============================================//
reg [2:0] current_state, next_state;

reg [3:0] ans_row_position [11:0];
reg [11:0] fixed_col_flag;
reg [11:0] fixed_row_flag, fixed_row_flag_un;
reg [11:0] testing;
reg [3:0] undo_col[10:0]; //! The first col doesn't need to record the last jumping col.

reg [3:0] col_pointer_comb, col_pointer;
reg [3:0] row_pointer_comb, row_pointer, row_pointer_temp;

reg [11:0] dia_flag;
reg signed [4:0] k_sub_n_comb[11:0];
reg signed [4:0] col_k_sub_n_comb[11:0];
reg signed [4:0] k_sub_n_comb_in[11:0];
wire  [3:0] col_pointer_comb_sub1, col_pointer_comb_sub2;

reg        [3:0]   col_temp,row_temp;
reg [3:0] row_pointer_comb_sub1;
reg [1:0] input_change_condition;
reg [1:0] col_change_condition;
//==============================================//
//            FSM State Declaration             //
//==============================================//
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

/*
always@* begin
    k_sub_n_comb[0] = $signed({1'b0,col_pointer}) - $signed(5'd0);
    k_sub_n_comb_in[0] = k_sub_n_comb[5'd0] * -'d1;
    col_k_sub_n_comb[0] = $signed({1'b0,row_pointer_comb}) - $signed({1'b0,ans_row_position[0]});
    dia_flag[0] = ((k_sub_n_comb[0]==col_k_sub_n_comb[0])|(k_sub_n_comb_in[0] ==col_k_sub_n_comb[0]))&(testing[0]|fixed_col_flag[0])&(5'd0!=col_pointer_comb);

end
*/
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
    s_input: case(input_change_condition)
            2'b00: next_state = s_find_row;
            //2'b01: next_state = s_col_plus;
            default: next_state = s_input;
            endcase
    s_col_plus:begin
            case(col_change_condition)
            //2'b10: next_state = s_col_plus
            2'b00: next_state = s_find_row;
            2'bx1: next_state = s_output;

            default: next_state = s_col_plus;
            endcase
    end
    s_find_row:begin
        if(row_pointer>'d11)begin
             next_state = s_back;
        end
        else if((|dia_flag)|(fixed_row_flag[row_pointer]))begin
            next_state = s_find_row;
        end
        else next_state = s_record;
    end
    s_back: if(fixed_col_flag[col_pointer_comb]=='d1) next_state = s_back;
            else next_state = s_find_row;
    s_record: begin 
            next_state = s_col_plus;
    end
    s_output: if(col_pointer=='d7) next_state = s_clear; //TODO using share counter
             else               next_state = s_output;
    s_clear: next_state = s_idle;
    default: next_state = current_state;
    endcase
end
always @(posedge clk) begin
    if(!rst_n|current_state==s_idle)begin
        col_pointer <= 'd0;
        row_pointer <= 'd0;
    end
    else begin
        col_pointer <= col_pointer_comb;

        row_pointer <= row_pointer_comb;
        row_pointer_temp<=row_pointer;
    end
end




//col_pointer_comb mod



always @(*) begin
    case(current_state)
    s_input:
        begin
        if(fixed_col_flag[col_pointer]=='d1)    col_pointer_comb = col_pointer + 'd1;
        else                                    col_pointer_comb = col_pointer;
        row_pointer_comb = 'b0;
        row_pointer_comb_sub1 = row_pointer;

        end
    s_col_plus:begin
        //TODO: 
            //if chooing one position to test-> jump to next col
            //if next col  is fixed -> skip
        if(fixed_col_flag[col_pointer]=='d1|testing[col_pointer]=='d1)    col_pointer_comb = col_pointer + 'd1;
        else                                                              col_pointer_comb = col_pointer;
        row_pointer_comb = 'b0;
        row_pointer_comb_sub1 = 'b0;
    end
    s_find_row:begin
        row_pointer_comb=row_pointer+'d1;
        row_pointer_comb_sub1 = row_pointer;
        col_pointer_comb = col_pointer;

    end

    s_back:  
    begin
            row_pointer_comb_sub1 = ans_row_position[col_pointer-'d1];
            row_pointer_comb = ans_row_position[col_pointer-'d1]+'d1;
            col_pointer_comb = col_pointer -'d1;
    end
    s_output: begin
        col_pointer_comb = col_pointer +'d1;
        row_pointer_comb = row_pointer;
        
        row_pointer_comb_sub1 = row_pointer;
        
    end
    default:begin
        row_pointer_comb = row_pointer;
        row_pointer_comb_sub1 = row_pointer;
        col_pointer_comb = col_pointer;
    end
    endcase
end






//==============================================//
//                  Input Block                 //
//==============================================//

assign col_pointer_comb_sub1 = col_pointer -'d1;
assign col_pointer_comb_sub2 = col_pointer -'d2;


always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        ans_row_position[11] <='d0;
        ans_row_position[10] <='d0;ans_row_position[9] <='d0;ans_row_position[8] <='d0;
        ans_row_position[7] <='d0;ans_row_position[6] <='d0;ans_row_position[5] <='d0;
        ans_row_position[4] <='d0;ans_row_position[3] <='d0;ans_row_position[2] <='d0;
        ans_row_position[1] <='d0;ans_row_position[0] <='d0;
        
        fixed_row_flag[11:0]<='d0; 
        fixed_col_flag[11:0]<='d0;    
        testing[11:0] <='d0;
        fixed_row_flag_un[11:0]<='d0;

    end
    else if(in_valid)begin
        ans_row_position[col] <= row;
        fixed_col_flag[col]<='d1; //span in x-direction.
        fixed_row_flag[row]<='d1; //span in y-direction.
        fixed_row_flag_un[row]<='d1;
       // ans_row_position[col_temp] <= row_temp;
       // fixed_col_flag[col_temp]<='d1; //span in x-direction.
       // fixed_row_flag[row_temp]<='d1; //span in y-direction.


    end
    else begin
    case(current_state)
    /*
        s_idle:begin
            ans_row_position[11] <='d0;
            ans_row_position[10] <='d0;ans_row_position[9] <='d0;ans_row_position[8] <='d0;
            ans_row_position[7] <='d0;ans_row_position[6] <='d0;ans_row_position[5] <='d0;
            ans_row_position[4] <='d0;ans_row_position[3] <='d0;ans_row_position[2] <='d0;
            ans_row_position[1] <='d0;ans_row_position[0] <='d0;
            
            fixed_row_flag[11:0]<='d0; 
            fixed_col_flag[11:0]<='d0;    
            testing[11:0] <='d0;
            


            col_temp<=col;
            row_temp<=row;


        end
    */
/*

        s_find_row:
        s_col_plus 
 */
       s_record:begin
            testing[col_pointer] <= 'd1;
            ans_row_position[col_pointer] <= row_pointer_temp;
            fixed_row_flag[row_pointer_temp]<='d1;
        end
        s_back:begin
            testing[col_pointer]<='d0;
        
            fixed_row_flag[row_pointer_comb_sub1]<='d0|fixed_row_flag_un[row_pointer_comb_sub1];

        
        
        
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
        end
        s_clear:begin
            ans_row_position[11] <='d0;
            ans_row_position[10] <='d0;ans_row_position[9] <='d0;ans_row_position[8] <='d0;
            ans_row_position[7] <='d0;ans_row_position[6] <='d0;ans_row_position[5] <='d0;
            ans_row_position[4] <='d0;ans_row_position[3] <='d0;ans_row_position[2] <='d0;
            ans_row_position[1] <='d0;ans_row_position[0] <='d0;
            
            fixed_row_flag[11:0]<='d0; 
            fixed_col_flag[11:0]<='d0;    
            testing[11:0] <='d0;
            fixed_row_flag_un[11:0]<='d0;

        end

        default:begin


        end
    endcase
    end


end

//GOOD LUCKY

endmodule 
