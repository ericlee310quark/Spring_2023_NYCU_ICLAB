module OS(input clk, INF.OS_inf inf);
import usertype::*;




/*
IDLE--id--act--amnt           (deposit)
    |        |-NONE           (check money)
    |        |-id             (check stock)
    |        |-item-num-id    (buy)
    |        |-item-num       (return)
    |
    |-act--amnt           (deposit)     [15:0]
         |-NONE           (check money)
         |-id             (check stock) [7:0]
         |-item-num-id    (buy)
         |-item-num-id    (return)
*/
/*
buy->     r/w user info. & r/w seller info.
deposit-> r/w user info
check->   r user info  | r seller info. 
return->  r/w user info  & r/w seller info



fetch user->fetch seller


write user->write seller

out


*/


//==================================
//  parameters
//==================================
parameter s_IDLE            = 'd0,
          s_INPUT           = 'd1,
          s_FETCH_USER      = 'd2,
          s_FETCH_SELLER    = 'd3,
          s_CMP             = 'd4,
          s_WRITE_USER      = 'd5,
          s_WRITE_SELLER    = 'd6,
          s_OUTPUT          = 'd7;
/*
parameter a_BUY             = 'd0,
          a_CHECK_USER      = 'd1,
          a_CHECK_SELLER    = 'd2,
          a_DEPOSIT         = 'd3,
          a_RETURN          = 'd4;
*/

//==================================
//  logics
//==================================
logic enable_return [255:0];
//logic enable_return_s [255:0];
logic enable_seller;
logic [7:0] last_buyer_id [255:0];
logic dif_user;

Shop_Info last_user_shop_info, last_seller_shop_info;
Shop_Info user_shop_comb, seller_shop_comb;
User_Info last_user_INFO, last_seller_INFO;
User_Info user_INFO_comb, seller_INFO_comb;
//logic [63:0] last_user_info;
//logic [63:0] last_seller_info;

logic [15:0] in_money;
logic [7:0] in_user, in_seller;
OP_TYPE in_act;
logic [1:0] in_item_type;
logic [5:0] in_item_num;


logic [31:0] out_info_buffer;
Err_Msg er_state;


//FSM
logic [2:0] curr_os, next_os;
//cnt
logic [2:0] cnt, cnt_comb;
//conditions
logic bridge_input_condi;
logic fetch_from_sell, fetch_from_user;
//buy flag
logic user_stock_full;      //1
logic seller_lack_stock;    //2
logic lack_money;           //3
logic level_up;
//deposit flag
logic wallet_full;          //1
//return flag
logic w_op;              //1
logic w_id;              //2
logic w_op2;
logic w_num;             //3
logic w_item;            //4
//stock filter
logic [5:0] buyer_stock;
logic [5:0] seller_stock;

logic target_reverse;
//compute
logic [6:0] add_stock_comb;
logic [6:0] sub_stock_comb;

logic [16:0] add_monney_comb;
logic signed [16:0] sub_monney_comb;
logic signed [16:0] sub_monney_fee_comb;

logic [15:0] money_A, money_B;
logic [15:0] money_add_result;

logic [15:0] add_2_sel;
logic [15:0] cost_comb;
logic [15:0] cost_fee_comb;

logic [8:0] unit_cost;
logic [6:0] unit_fee;
logic commit_flag;
//level
User_Level rank;
logic [12:0] exp_comb;
logic [11:0] exp_result_comb;
logic [11:0] exp_limit;
logic [5:0] unit_exp;

//prefetch
logic fetch_user_from_user;
logic fetch_user_from_seller;

logic fetch_seller_from_user;
logic fetch_seller_from_seller;
logic first_flag;
//====================================================================
//  Designs
//=====================================================================
//==================================
//  OUTPUT CTR
//==================================
//-------------------
//  USER port
//-------------------
//out_valid
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                  inf.out_valid <= 'b0;
    else if(next_os==s_OUTPUT)      inf.out_valid <= 'b1;
    else                            inf.out_valid <= 'b0;
end
//err_msg
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                   inf.err_msg <= 'b0;
    else if(next_os==s_OUTPUT&(|(er_state)))      inf.err_msg <= er_state;
    else                                             inf.err_msg <= 'b0;
end
//complete
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                      inf.complete <= 'b0;
    else if(next_os==s_OUTPUT&~(|(er_state)))        inf.complete <= 'b1;
    else                                                inf.complete <= 'b0;
end
//out_info
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                      inf.out_info <= 'b0;
    else if(next_os==s_OUTPUT&~(|(er_state)))
        case(in_act)
            a_BUY:          inf.out_info <= last_user_INFO;
            a_CHECK_USER:   inf.out_info <= {16'b0, inf.C_data_r[63:48]};
            /*
                            if(fetch_from_sell)         inf.out_info <= {16'b0, last_seller_info[63:48]};
                            else if(fetch_from_user)    inf.out_info <= {16'b0, last_user_info[63:48]};
                            else                        inf.out_info <= {16'b0, inf.C_data_r[63:48]};
            */
            a_DEPOSIT:      inf.out_info <= {16'b0, last_user_INFO[31:16]};
            a_CHECK_SELLER: inf.out_info <= {14'b0, inf.C_data_r[31:14]};  
            /*
                            if(fetch_from_sell)         inf.out_info <= {14'b0, last_seller_info[31:14]};
                            else if(fetch_from_user)    inf.out_info <= {14'b0, last_user_info[31:14]};
                            else                        inf.out_info <= {14'b0, inf.C_data_r[31:14]};  
            */
            a_RETURN:       inf.out_info <= {14'b0, last_user_shop_info[31:14]};
            default:    inf.out_info <= 'b0;
        endcase
    else                                                inf.out_info <= 'b0;
end
//-------------------
//  Bridge port
//-------------------
//C_addr
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                                                          inf.C_addr <= 'b0;
    else if(((curr_os==s_FETCH_USER)&(cnt=='b1))|(curr_os==s_CMP&next_os==s_WRITE_USER))                    inf.C_addr <= in_user;
    else if(((curr_os==s_FETCH_SELLER)&(cnt=='b1))|((curr_os==s_WRITE_USER)&(next_os==s_WRITE_SELLER)))     inf.C_addr <= in_seller;
    //else if((curr_os==s_INPUT&next_os==s_FETCH_USER)|(curr_os==s_CMP&next_os==s_WRITE_USER))                                            inf.C_addr <= in_user;
    //else if(((curr_os==s_FETCH_USER)&next_os==s_FETCH_SELLER)|((curr_os==s_WRITE_USER&next_os==s_WRITE_SELLER)))                        inf.C_addr <= in_seller;
    //else if(curr_os==s_INPUT&next_os==s_FETCH_SELLER)                                                                  inf.C_addr <= inf.D.d_id[0];
    else                                                                            inf.C_addr <= 'b0;
end
//C_data_W
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                                  inf.C_data_w <= 'b0;
    else if(curr_os==s_CMP&next_os==s_WRITE_USER)                                   inf.C_data_w <= {user_INFO_comb, user_shop_comb};//{last_user_INFO,last_user_shop_info};     //!
    else if(curr_os==s_WRITE_USER&next_os==s_WRITE_SELLER)                          inf.C_data_w <= {last_seller_INFO,last_seller_shop_info};
    else                                                                            inf.C_data_w <= 'b0;
end
//C_in_valid
assign bridge_input_condi = ((curr_os==s_FETCH_USER)&(cnt=='b1))|(curr_os==s_CMP&next_os==s_WRITE_USER)|((curr_os==s_FETCH_SELLER)&(cnt=='b1))|((curr_os==s_WRITE_USER)&(next_os==s_WRITE_SELLER));
//(curr_os==s_INPUT&next_os==s_FETCH_USER)|((curr_os==s_INPUT|curr_os==s_FETCH_USER)&next_os==s_FETCH_SELLER)|(curr_os==s_CMP&next_os==s_WRITE_USER)|(curr_os==s_WRITE_USER&next_os==s_WRITE_SELLER);
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                inf.C_in_valid <= 'b0;
    else if(bridge_input_condi)                                   inf.C_in_valid <= 'b1;     //!
    else                                                          inf.C_in_valid <= 'b0;
end
//C_r_wb
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)      inf.C_r_wb <= 'b1;
    else if((curr_os==s_CMP&next_os==s_WRITE_USER)|(curr_os==s_WRITE_USER&next_os==s_WRITE_SELLER))
                        inf.C_r_wb <= 'b0;     //!
    else                inf.C_r_wb <= 'b1;
end
//==================================
//  FSM CTR
//==================================
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  curr_os <= s_IDLE;
    else            curr_os <= next_os;
end
always_comb begin
    case(curr_os)    
        s_IDLE: if(inf.id_valid|inf.act_valid)    next_os = s_INPUT;
                else                              next_os = s_IDLE;
        s_INPUT:    if(in_act==a_CHECK_USER&inf.id_valid)
                        next_os = s_FETCH_SELLER;
                    /*
                        if(fetch_from_sell)         next_os = s_OUTPUT;
                        else if(fetch_from_user)    next_os = s_OUTPUT;
                        else                        next_os = s_FETCH_SELLER;
                    */
                    else if(cnt=='d5&(~((inf.id_valid)|(inf.act_valid)|(inf.item_valid)|(inf.num_valid)|(inf.amnt_valid))))
                        next_os = s_FETCH_USER;
                    /*
                        if(fetch_from_sell&in_act==a_CHECK_USER)         next_os = s_OUTPUT;
                        else if(fetch_from_user&in_act==a_CHECK_USER)    next_os = s_OUTPUT;
                        else                                             next_os = s_FETCH_USER;
                    */
                    else    next_os = s_INPUT;
        s_FETCH_USER:   if(inf.C_out_valid|fetch_user_from_user|fetch_user_from_seller)
                            if(in_act==a_CHECK_USER)
                                next_os = s_OUTPUT;
                            else if(in_act==a_DEPOSIT)
                                next_os = s_CMP;    
                            else    next_os = s_FETCH_SELLER;
                        else next_os = s_FETCH_USER;

        s_FETCH_SELLER: if(inf.C_out_valid|fetch_seller_from_user|fetch_seller_from_seller)
                            if(in_act==a_CHECK_SELLER)
                                next_os = s_OUTPUT;
                            else
                                next_os = s_CMP;
                        else next_os = s_FETCH_SELLER;
        
        s_CMP:          if(commit_flag) next_os = s_WRITE_USER;
                        else            next_os = s_OUTPUT;

        s_WRITE_USER:   if(inf.C_out_valid) 
                            if(in_act==a_DEPOSIT)   next_os = s_OUTPUT;
                            else                    next_os = s_WRITE_SELLER;

                        else                next_os = s_WRITE_USER;
        s_WRITE_SELLER: if(inf.C_out_valid) next_os = s_OUTPUT;
                        else                next_os = s_WRITE_SELLER;
        s_OUTPUT:       next_os = s_IDLE;

        default:        next_os = s_IDLE;
    endcase
end
//==================================
//  cnt CTR
//==================================
always_comb begin
    case(curr_os)
        s_INPUT:    if((inf.id_valid)|(inf.act_valid)|(inf.item_valid)|(inf.num_valid)|(inf.amnt_valid)|(next_os!=s_INPUT))
                        cnt_comb = 'b0;
                    else cnt_comb = cnt + 'b1;
        s_FETCH_USER:   if(~(fetch_user_from_seller|fetch_user_from_user))
                            cnt_comb=(cnt<'d2)?cnt+'d1:(next_os!=s_FETCH_USER)?'b0:cnt;
                        else cnt_comb = 'b0;

        s_FETCH_SELLER:     if(~(fetch_seller_from_seller|fetch_seller_from_user))  
                                cnt_comb=(cnt<'d2)?cnt+'d1:(next_os!=s_FETCH_SELLER)?'b0:cnt;
                            else cnt_comb = 'b0;

        default:            cnt_comb = 'b0;

    endcase
    /*
    if(curr_os==s_INPUT)
        if((inf.id_valid)|(inf.act_valid)|(inf.item_valid)|(inf.num_valid)|(inf.amnt_valid))
            cnt_comb = 'b0;
        else cnt_comb = cnt + 'b1;
    else 
    
    
         cnt_comb = 'b0;
*/
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)   cnt <= 'b0;
    else            cnt <= cnt_comb;
end
//==================================
//  INPUT CTR
//==================================
assign dif_user = curr_os==s_IDLE&(inf.id_valid);
//user_id
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)      in_user <= 'b0;
    else if(dif_user)   in_user <= inf.D.d_id[0];
    else                in_user <= in_user;
end
//first_flag
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)            first_flag <= 'b0;
    else if((inf.complete))   first_flag <= 'b1;
    else                      first_flag <= first_flag;
end

//fetch_user_from_user
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                               fetch_user_from_user <= 'b0;
    else if((first_flag))
        if(dif_user)    fetch_user_from_user <= 'b0;
        else            fetch_user_from_user <= 'b1;
    else                                                         fetch_user_from_user <= fetch_user_from_user;
end
//fetch_user_from_seller
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                  fetch_user_from_seller <= 'b0;
    else if((dif_user)&(first_flag))     fetch_user_from_seller <= (in_seller==inf.D.d_id[0]);
    else                                                            fetch_user_from_seller <= fetch_user_from_seller;
end


//seller id
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                              in_seller <= 'b0;
    else if(curr_os==s_INPUT&(inf.id_valid)) in_seller <= inf.D.d_id[0];
    else                                        in_seller <= in_seller;
end

//fetch_seller_from_user
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                                      fetch_seller_from_user <= 'b0;
    else if((curr_os==s_INPUT&(inf.id_valid))&(first_flag))    fetch_seller_from_user <= (in_user==inf.D.d_id[0]);
    else                                                                                fetch_seller_from_user <= fetch_seller_from_user;
end
//fetch_user_from_seller
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                                                      fetch_seller_from_seller <= 'b0;
    else if((curr_os==s_INPUT&(inf.id_valid))&(first_flag))  fetch_seller_from_seller <= (in_seller==inf.D.d_id[0]);
    else                                                                                fetch_seller_from_seller <= fetch_seller_from_seller;
end


//enable_seller
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                           enable_seller <= 'b0;
    else if(curr_os==s_INPUT&(inf.id_valid)) enable_seller <= 'b1;
    else if(curr_os==s_OUTPUT)               enable_seller <= 'b0;
    else                                     enable_seller <= enable_seller;
end

//in_act
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)              in_act <= a_NOTHING;
    else if(inf.act_valid)
        case(inf.D.d_act[0])
            4'b0001:            in_act <= a_BUY;
            4'b0010:            in_act <= a_CHECK_USER;
            4'b0100:            in_act <= a_DEPOSIT;
            4'b1000:            in_act <= a_RETURN;
            default:            in_act <= a_NOTHING;
        endcase
    else if(in_act==a_CHECK_USER&inf.id_valid)
            in_act <= a_CHECK_SELLER;
    else if(curr_os==s_OUTPUT)                  in_act <= a_NOTHING; 
    else                                        in_act <= in_act;
end
//in_item_type
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)          in_item_type <= 'b0;
    else if(inf.item_valid) in_item_type <= inf.D.d_item;
    else                    in_item_type <= in_item_type;
end
//in_item_num
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)          in_item_num <= 'b0;
    else if(inf.num_valid)  in_item_num <= inf.D.d_item_num;
    else                    in_item_num <= in_item_num;
end
//in_money
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                  in_money <= 'b0;
    else if(inf.amnt_valid)         in_money <= inf.D.d_money;
    else                            in_money <= in_money;
end
//==================================
//  INFO CTR
//==================================
assign commit_flag = ((in_act!=a_CHECK_SELLER)|(in_act!=a_CHECK_USER))&(er_state==No_Err);

always_comb begin
    if(curr_os==s_FETCH_USER)
        if(fetch_user_from_seller)      user_INFO_comb = last_seller_INFO;
        else if(inf.C_out_valid)        user_INFO_comb = inf.C_data_r[63:32];
        else                            user_INFO_comb = last_user_INFO;
    else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:                  user_INFO_comb = {sub_monney_fee_comb[15:0],in_item_type,in_item_num,in_seller};
            a_DEPOSIT,a_RETURN:     user_INFO_comb = {money_add_result,last_user_INFO[15:0]};
            default:                user_INFO_comb = last_user_INFO;
        endcase
    else                            user_INFO_comb = last_user_INFO;
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  last_user_INFO <= 'b0;
    else            last_user_INFO <= user_INFO_comb;
end
/*
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                    last_user_INFO <= 'b0;
    else if(curr_os==s_FETCH_USER&(inf.C_out_valid))  last_user_INFO <= inf.C_data_r[63:32];
    else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:      last_user_INFO <= {sub_monney_fee_comb,in_item_type,in_item_num,in_seller};
            a_DEPOSIT:  last_user_INFO <= {add_monney_comb,last_user_INFO[15:0]};
            a_RETURN:   last_user_INFO <= {add_monney_comb,last_user_INFO[15:0]};
            default:    last_user_INFO <= last_user_INFO;
        endcase
    else                                              last_user_INFO <= last_user_INFO;
end
*/
always_comb begin
    if(curr_os==s_FETCH_USER)
        if(fetch_user_from_seller)      user_shop_comb = last_seller_shop_info;
        else if(inf.C_out_valid)        user_shop_comb = inf.C_data_r[31:0];
        else                            user_shop_comb = last_user_shop_info;
    else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:      case(in_item_type)
                            2'b01:      user_shop_comb = {add_stock_comb[5:0],last_user_shop_info[25:14],rank,exp_result_comb};
                            2'b10:      user_shop_comb = {last_user_shop_info[31:26],add_stock_comb[5:0],last_user_shop_info[19:14],rank,exp_result_comb};
                            2'b11:      user_shop_comb = {last_user_shop_info[31:20],add_stock_comb[5:0],rank,exp_result_comb};
                            default:    user_shop_comb = last_user_shop_info;
                        endcase


            a_RETURN:   case(in_item_type)
                            2'b01:      user_shop_comb = {sub_stock_comb[5:0],last_user_shop_info[25:0]};
                            2'b10:      user_shop_comb = {last_user_shop_info[31:26],sub_stock_comb[5:0],last_user_shop_info[19:0]};
                            2'b11:      user_shop_comb = {last_user_shop_info[31:20],sub_stock_comb[5:0],last_user_shop_info[13:0]};
                            default:    user_shop_comb = last_user_shop_info;
                        endcase
            default:    user_shop_comb = last_user_shop_info;
        endcase
    else                user_shop_comb = last_user_shop_info;
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  last_user_shop_info <= 'b0;
    else            last_user_shop_info <= user_shop_comb;
end








/*
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                    last_user_shop_info <= 'b0;
    else if(curr_os==s_FETCH_USER&(inf.C_out_valid))  last_user_shop_info <= inf.C_data_r[31:0];
    else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:      case(in_item_type)
                            2'b01: last_user_shop_info <= {add_stock_comb[5:0],last_user_shop_info[23:14],rank,exp_comb};
                            2'b10: last_user_shop_info <= {last_user_shop_info[31:26],add_stock_comb[5:0],last_user_shop_info[19:14],rank,exp_comb};
                            2'b11: last_user_shop_info <= {last_user_shop_info[31:20],add_stock_comb[5:0],rank,exp_comb};
                            default:    last_user_shop_info <= last_user_shop_info;
                        endcase

            a_RETURN:   case(in_item_type)
                            2'b01: last_user_shop_info <= {sub_stock_comb[5:0],last_user_shop_info[23:0]};
                            2'b10: last_user_shop_info <= {last_user_shop_info[31:26],sub_stock_comb[5:0],last_user_shop_info[19:0]};
                            2'b11: last_user_shop_info <= {last_user_shop_info[31:20],sub_stock_comb[5:0],last_user_shop_info[13:0]};
                            default:    last_user_shop_info <= last_user_shop_info;
                        endcase
            default:    last_user_shop_info <= last_user_shop_info;
        endcase
    else                                              last_user_shop_info <= last_user_shop_info;
end
*/



//---------------------
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                    last_seller_INFO <= 'b0;
    else if((curr_os==s_FETCH_USER)&(fetch_seller_from_user)&(cnt=='b0))    last_seller_INFO <= last_user_INFO;
    else if(curr_os==s_FETCH_SELLER)
        if(inf.C_out_valid)        last_seller_INFO <= inf.C_data_r[63:32];
        else                            last_seller_INFO <= last_seller_INFO;
     else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:      last_seller_INFO <= {money_add_result[15:0],last_seller_INFO[15:0]};
            a_RETURN:   last_seller_INFO <= {sub_monney_comb[15:0],last_seller_INFO[15:0]};
            default:    last_seller_INFO <= last_seller_INFO;
        endcase
    else                                              last_seller_INFO <= last_seller_INFO;
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)                                    last_seller_shop_info <= 'b0;
    else if((curr_os==s_FETCH_USER)&(fetch_seller_from_user)&(cnt=='b0))    last_seller_shop_info <= last_user_shop_info;
    else if(curr_os==s_FETCH_SELLER)
        if(inf.C_out_valid)        last_seller_shop_info <= inf.C_data_r[31:0];
        else                            last_seller_shop_info <= last_seller_shop_info;
    else if(curr_os==s_CMP&commit_flag)
        case(in_act)
            a_BUY:      case(in_item_type)
                            2'b01: last_seller_shop_info <= {sub_stock_comb[5:0],last_seller_shop_info[25:0]};
                            2'b10: last_seller_shop_info <= {last_seller_shop_info[31:26],sub_stock_comb[5:0],last_seller_shop_info[19:0]};
                            2'b11: last_seller_shop_info <= {last_seller_shop_info[31:20],sub_stock_comb[5:0],last_seller_shop_info[13:0]};
                            default:    last_seller_shop_info <= last_seller_shop_info;
                        endcase

            a_RETURN:   case(in_item_type)
                            2'b01: last_seller_shop_info <= {add_stock_comb[5:0],last_seller_shop_info[25:0]};
                            2'b10: last_seller_shop_info <= {last_seller_shop_info[31:26],add_stock_comb[5:0],last_seller_shop_info[19:0]};
                            2'b11: last_seller_shop_info <= {last_seller_shop_info[31:20],add_stock_comb[5:0],last_seller_shop_info[13:0]};
                            default:    last_seller_shop_info <= last_seller_shop_info;
                        endcase
            default:    last_seller_shop_info <= last_seller_shop_info;
        endcase
    else                last_seller_shop_info <= last_seller_shop_info;
end

genvar enable_idx;
generate
    for(enable_idx=0;enable_idx<256;enable_idx=enable_idx+1)begin:enable_return_ff
        always_ff @(posedge clk or negedge inf.rst_n)begin
            if(~inf.rst_n) enable_return[enable_idx] <= 'b0;
            else if(((in_user==enable_idx)) &(inf.complete))
                if(in_act==a_BUY)
                    enable_return[enable_idx] <= 'b1;
                else 
                    enable_return[enable_idx] <= 'b0;
            else if(((in_seller==enable_idx)&(enable_seller)) &(inf.complete))
                   enable_return[enable_idx] <= 'b0;

            /*else if(((in_user==enable_idx)|((in_seller==enable_idx)&(enable_seller))) &(inf.complete))
                if(in_act==a_BUY)
                    enable_return[enable_idx] <= 'b1;
                else
                    enable_return[enable_idx] <= 'b0;
            */
            else           enable_return[enable_idx] <= enable_return[enable_idx];
        end
    end    
endgenerate
/*
genvar enable_sell_idx;
generate
    for(enable_sell_idx=0;enable_sell_idx<256;enable_sell_idx=enable_sell_idx+1)begin:enable_sell_ff
        always_ff @(posedge clk or negedge inf.rst_n)begin
            if(~inf.rst_n) enable_return_s[enable_sell_idx] <= 'b0;
            else if((in_seller==enable_sell_idx)&inf.complete&enable_seller)
                if(in_act==a_BUY)
                    enable_return_s[enable_sell_idx] <= 'b1;
                else
                    enable_return_s[enable_sell_idx] <= 'b0;
            else           enable_return_s[enable_sell_idx] <= enable_return_s[enable_sell_idx];
        end
    end    
endgenerate
*/

genvar seller_idx;
generate
    for(seller_idx=0;seller_idx<256;seller_idx=seller_idx+1)begin:seller_record
        always_ff @(posedge clk or negedge inf.rst_n)begin
            if(~inf.rst_n) last_buyer_id[seller_idx] <= 'b0;
            else if(in_seller==seller_idx&inf.complete&enable_seller)
                    last_buyer_id[seller_idx] <= in_user;
            else if(in_user==seller_idx&inf.complete)
                if(enable_seller)  last_buyer_id[seller_idx] <= in_seller;
                else            last_buyer_id[seller_idx] <= in_user;
            else           last_buyer_id[seller_idx] <= last_buyer_id[seller_idx];
        end
    end    
endgenerate



//==================================
//  stock filter
//==================================
always_comb begin
    case(in_item_type)
        2'd1:       buyer_stock = (in_act==a_RETURN)? last_seller_shop_info[31:26]:last_user_shop_info[31:26];
        2'd2:       buyer_stock = (in_act==a_RETURN)? last_seller_shop_info[25:20]:last_user_shop_info[25:20];
        2'd3:       buyer_stock = (in_act==a_RETURN)? last_seller_shop_info[19:14]:last_user_shop_info[19:14];
        default:    buyer_stock = (in_act==a_RETURN)? last_seller_shop_info[19:14]:last_user_shop_info[19:14];
    endcase
end
always_comb begin
    case(in_item_type)
        2'd1:       seller_stock = (in_act==a_RETURN)?last_user_shop_info[31:26]:last_seller_shop_info[31:26];
        2'd2:       seller_stock = (in_act==a_RETURN)?last_user_shop_info[25:20]:last_seller_shop_info[25:20];
        2'd3:       seller_stock = (in_act==a_RETURN)?last_user_shop_info[19:15]:last_seller_shop_info[19:14];
        default:    seller_stock = (in_act==a_RETURN)?last_user_shop_info[19:14]:last_seller_shop_info[19:14];
    endcase
end
//==================================
//  money CTR
//==================================
always_comb begin
    case(in_act)
        a_BUY:                  money_A = last_seller_INFO[31:16];
        a_DEPOSIT,a_RETURN:     money_A = last_user_INFO[31:16];
        default:                money_A = 'b0;
    endcase
end
always_comb begin
    if(in_act==a_BUY)   money_B = last_user_INFO[31:16];
    else                money_B = last_seller_INFO[31:16];
end
always_comb begin
    if(in_act==a_DEPOSIT)   add_2_sel = in_money;
    else                    add_2_sel = cost_comb;
end


//==================================
//  er CTR
//==================================
assign user_stock_full = add_stock_comb[6];
assign seller_lack_stock = seller_stock<in_item_num;
assign lack_money = sub_monney_fee_comb[16];
assign level_up = (exp_comb>=exp_limit);

assign wallet_full = add_monney_comb[16];

assign w_op = (~enable_return[in_user]);
//assign w_op2 = ((~enable_return_s[last_user_INFO[7:0]]))|(last_buyer_id[last_user_INFO[7:0]]!=in_user)|(last_buyer_id[in_user]!=last_user_INFO[7:0]);
assign w_op2 =(last_buyer_id[last_user_INFO[7:0]]!=in_user)|(last_buyer_id[in_user]!=last_user_INFO[7:0]);
assign w_id = (last_user_INFO[7:0]!=in_seller);
assign w_num = (last_user_INFO[13:8]!=in_item_num);
assign w_item = (last_user_INFO[15:14]!=in_item_type);


always_comb begin
    if (curr_os == s_CMP)
    case(in_act)
        a_BUY:  if(user_stock_full)         er_state = INV_Full_new;
                else if(seller_lack_stock)  er_state = INV_Not_Enough_new;
                else if(lack_money)         er_state = Out_of_money_new;
                else                        er_state = No_Err_new;
        a_DEPOSIT:  if(wallet_full)         er_state = Wallet_is_Full_new;
                    else                    er_state = No_Err_new;
        a_RETURN:   if(w_op|w_op2)          er_state = Wrong_act_new;
                    else if(w_id)           er_state = Wrong_ID_new;
                    //else if(w_op2)          er_state = Wrong_act_new;
                    else if(w_num)          er_state = Wrong_Num_new;
                    else if(w_item)         er_state = Wrong_Item_new;
                    else                    er_state = No_Err_new;
        default:                            er_state = No_Err_new;
    endcase
    else    er_state = No_Err;
end
//==================================
//  CMP CTR
//==================================
assign add_stock_comb = buyer_stock + in_item_num;
assign sub_stock_comb = seller_stock - in_item_num;

assign add_monney_comb = money_A + add_2_sel;
assign sub_monney_comb = {1'b0,money_B} - {1'b0,cost_comb};
assign sub_monney_fee_comb = {sub_monney_comb} - {1'b0,unit_fee};

assign money_add_result = (add_monney_comb[16])?'d65535:add_monney_comb[15:0];
always_comb begin
    case(in_item_type)
        2'd1:       unit_cost = 'd300;
        2'd2:       unit_cost = 'd200;
        2'd3:       unit_cost = 'd100;
        default:    unit_cost = 'd100;
    endcase
end
assign cost_comb = unit_cost * in_item_num;
always_comb begin
    case(last_user_shop_info[13:12])
        2'b00:      unit_fee = 7'd10;
        2'b01:      unit_fee = 7'd30;
        2'b10:      unit_fee = 7'd50;
        2'b11:      unit_fee = 7'd70;
        default:    unit_fee = 7'd70;
    endcase
end
always_comb begin
    case(in_item_type)
        2'd1:       unit_exp = 'd60;
        2'd2:       unit_exp = 'd40;
        2'd3:       unit_exp = 'd20;
        default:    unit_exp = 'd20;
    endcase
end
always_comb begin
    case(last_user_shop_info[13:12])
        2'd1:       exp_limit = 'd4000;
        2'd2:       exp_limit = 'd2500;
        2'd3:       exp_limit = 'd1000;
        default:    exp_limit = 'd1000;
    endcase
end
assign exp_comb = unit_exp * in_item_num + last_user_shop_info[11:0];
always_comb begin
    if(last_user_shop_info[13:12]>'d0)
        if(level_up)    exp_result_comb = 'b0;
        else            exp_result_comb = exp_comb;
    else                exp_result_comb = 'b0;
end
always_comb begin
    if(last_user_shop_info[13:12]>'d0)
        if(level_up)    rank = last_user_shop_info[13:12]-'d1;
        else            rank = last_user_shop_info[13:12];
    else                rank = last_user_shop_info[13:12];
end


endmodule