//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//
//   File Name   : CHECKER.sv
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
//`include "Usertype_PKG.sv"

module Checker(input clk, INF.CHECKER inf);
import usertype::*;

//covergroup Spec1 @();
//	
//       finish your covergroup here
//	
//	
//endgroup

//declare other cover group

//declare the cover group 
//Spec1 cov_inst_1 = new();

covergroup Spec1 @(posedge clk iff( inf.amnt_valid));
    coverpoint inf.D.d_money{
        option.at_least = 10;
        bins b1 = {[0:12000]};
        bins b2 = {[12001:24000]};
        bins b3 = {[24001:36000]};
        bins b4 = {[36001:48000]};
        bins b5 = {[48001:60000]};
    }
endgroup : Spec1


covergroup Spec2 @(posedge clk iff (inf.id_valid));
    coverpoint inf.D.d_id[0]{
        option.at_least = 2;
        option.auto_bin_max = 256;
    }
endgroup : Spec2


covergroup Spec3 @(posedge clk iff (inf.act_valid));
    coverpoint inf.D.d_act[0]{
        option.at_least = 10;
        bins b[] = (Buy, Check, Deposit, Return => Buy, Check, Deposit, Return );
    }
endgroup : Spec3


covergroup Spec4 @(posedge clk iff (inf.item_valid));
    coverpoint inf.D.d_item[0]{
        option.at_least = 20;
        bins b1 = {Large};
        bins b2 = {Medium};
        bins b3 = {Small};
    }
endgroup : Spec4


covergroup Spec5 @(posedge clk iff( inf.out_valid));
    coverpoint inf.err_msg{
        option.at_least = 20;

        bins b1 = {No_Err};
        bins b2 = {INV_Not_Enough};
        bins b3 = {Out_of_money};
        bins b4 = {INV_Full};
        bins b5 = {Wallet_is_Full};
        bins b6 = {Wrong_ID};
        bins b7 = {Wrong_Num};
        bins b8 = {Wrong_Item};
        bins b9 = {Wrong_act};
    }
endgroup : Spec5

covergroup Spec6 @(posedge clk iff (inf.out_valid===1));
    coverpoint inf.complete{
        option.at_least = 200;
        bins b1 = {0};
        bins b2 = {1};
    }
endgroup : Spec6


Spec1 conv_1 = new();
Spec2 conv_2 = new();
Spec3 conv_3 = new();
Spec4 conv_4 = new();
Spec5 conv_5 = new();
Spec6 conv_6 = new();


//************************************ below assertion is to check your pattern ***************************************** 
//                                          Please finish and hand in it
// This is an example assertion given by TA, please write other assertions at the below
// assert_interval : assert property ( @(posedge clk)  inf.out_valid |=> inf.id_valid == 0)
// else
// begin
// 	$display("Assertion X is violated");
// 	$fatal; 
// end

//write other assertions

always@(negedge inf.rst_n)begin
    #1;
    assert_1:   assert((inf.out_valid===0)&(inf.err_msg===No_Err)&(inf.complete===0)&(inf.out_info===0))
                else begin
                    $display("Assertion 1 is violated");
                    $fatal;
                end
end

assert_2:   assert property(@(posedge clk) (inf.complete===1)|->(inf.err_msg===No_Err))
            else begin
                $display("Assertion 2 is violated");
                $fatal;
            end


assert_3:   assert property(@(posedge clk) (inf.complete===0)|->(inf.out_info==='b0))
            else begin
                $display("Assertion 3 is violated");
                $fatal;
            end

assert_4_1: assert property(@(posedge clk) (inf.id_valid===1)|=>(inf.id_valid===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end
assert_4_2: assert property(@(posedge clk) (inf.act_valid===1)|=>(inf.act_valid===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end
assert_4_3: assert property(@(posedge clk) (inf.item_valid===1)|=>(inf.item_valid===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end

assert_4_4: assert property(@(posedge clk) (inf.num_valid===1)|=>(inf.num_valid===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end
assert_4_5: assert property(@(posedge clk) (inf.amnt_valid===1)|=>(inf.amnt_valid===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end
/*            
assert_4_6: assert property(@(posedge clk) (inf.D===1)|=>(inf.D===0))
            else begin
                $display("Assertion 4 is violated");
                $fatal;
            end
*/
sequence id_2_act;
    (inf.id_valid ##[2:6] inf.act_valid);
endsequence: id_2_act

sequence buyOrReturn_act_all;
    (((inf.act_valid===1)&((inf.D.d_act===Buy)|(inf.D.d_act===Return))) ##[2:6] inf.item_valid ##[2:6] inf.num_valid ##[2:6] inf.id_valid);
endsequence: buyOrReturn_act_all




/*
assert_5:   assert property(@(posedge clk) $onehot({inf.id_valid, inf.act_valid, inf.item_valid, inf.num_valid, inf.amnt_valid}))
            else begin
                $display("Assertion 6 is violated");
                $fatal;
            end

*/


logic [2:0] in_state;

always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  begin
        in_state <= 'b0;
    end
    else if(inf.id_valid)begin
           
           
           in_state <= 'd1;
    end
    else if(inf.act_valid)begin
        
          in_state <= 'd2;
    
    end
    else if(inf.item_valid)begin
        
         in_state <= 'd3;
    
    end
    else if(inf.num_valid)begin
      in_state <= 'd4;
    end
    else if(inf.amnt_valid) in_state <= 'd5;
    else                    in_state <= in_state;
end
//1 2 3 4 1
//2 3 4 1
//1 2 5
//2 5
//121
//12
//2

/*
logic start;

always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)  begin
        start <= 'b0;
    end
    else if(inf.id_valid)   start <= 'd1;
    else                    start <= start;
end

assert_5_start_0: assert property(@(posedge clk) ((start==0))|=>(##[0:$](inf.id_valid===1) ))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
assert_5_start_1: assert property(@(posedge clk) ((inf.out_valid))|=>##[0:$]((inf.id_valid===1)|(inf.act_valid===1)))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end




assert_5_item_0:   assert property(@(posedge clk) (inf.item_valid)|=>##0 (inf.num_valid===0)##[1:5](inf.num_valid===1))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
sequence item_2_num;
    (##0(inf.num_valid===0)##[1:5](inf.num_valid===1));
endsequence: item_2_num
sequence item_2_num_ept;
    ((inf.act_valid===0)&(inf.id_valid===0)&(inf.amnt_valid===0)##[1:5](inf.num_valid===1)&(inf.item_valid===0)&(inf.act_valid===0)&(inf.id_valid===0)&(inf.amnt_valid===0));
endsequence: item_2_num_ept

assert_5_item_1:   assert property(@(posedge clk) (inf.item_valid)|=>##0 (item_2_num intersect item_2_num_ept))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end

assert_5_num_0:     assert property(@(posedge clk) (inf.num_valid)|=>##0 (inf.id_valid===0)##[1:5](inf.id_valid===1))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
sequence num_2_id;
    (##0(inf.id_valid===0)##[1:5](inf.id_valid===1));
endsequence: num_2_id

assert_5_num_2:     assert property(@(posedge clk) (inf.num_valid)|=>  num_2_id  intersect $stable(inf.act_valid)[*10]  intersect $stable(inf.item_valid)[*10] intersect $stable(inf.amnt_valid)[*10] intersect $stable(inf.id_valid)[*1] )
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
assert_5_num_3:     assert property(@(posedge clk) (inf.num_valid)|=> ##1 $stable(inf.num_valid)[*10])
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
*/

/*
assert_5_item_0:   assert property(@(posedge clk) (inf.item_valid)|=>#0 (inf.num_valid===0) ##[1:4](inf.num_valid===1))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
assert_5_item_1:   assert property(@(posedge clk) (inf.item_valid)|=>#0 (inf.num_valid===0) ##[1:4](inf.num_valid===1))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end


assert_5_num:   assert property(@(posedge clk) (inf.num_valid)|=> #0 (inf.id_valid===0) #[1:5](inf.id_valid===1))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end

assert_5_amnt:   assert property(@(posedge clk) ((inf.act_valid===1)&(inf.D.d_act===Deposit))|=> ##0 (inf.amnt_valid===0) ##[0:4](inf.amnt_valid===1)##1(close_all)##[0:$]($stable(close_all)&(inf.out_valid)))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
logic close_all;
assign close_all = (((inf.num_valid)&(inf.id_valid)&(inf.num_valid)&(inf.amnt_valid)&(inf.act_valid))== 'b0);


assert_5_buy_return:   assert property(@(posedge clk) (((inf.act_valid===1)&((inf.D.d_act[0]===Return)|(inf.D.d_act[0]===Buy))))|=> ##0(close_all)##[1:4](inf.item_valid)##1(close_all)##[1:4](inf.num_valid)##1(close_all)##[1:4](inf.id_valid)##1(close_all)##[1:$]($stable(close_all)&(inf.out_valid)))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
assert_5_new_user:  assert property(@(posedge clk) (((inf.act_valid===1)&((inf.D.d_act[0]===Return)|(inf.D.d_act[0]===Buy))))|=> ##0(close_all)##[1:4](inf.item_valid)##1(close_all)##[1:4](inf.num_valid)##1(close_all)##[1:4](inf.id_valid)##1(close_all)##[1:$]($stable(close_all)&(inf.out_valid)))
                    else begin
                        $display("Assertion 5 is violated");
                        $fatal;
                    end
*/


assert_6:   assert property(@(posedge clk) $onehot0({inf.id_valid, inf.act_valid, inf.item_valid, inf.num_valid, inf.amnt_valid}))
            else begin
                $display("Assertion 6 is violated");
                $fatal;
            end


assert_7: assert property(@(posedge clk) (inf.out_valid===1)|=>(inf.out_valid===0))
            else begin
                $display("Assertion 7 is violated");
                $fatal;
            end

assert_8: assert property(@(posedge clk) (inf.out_valid===1)|=> ##[1:9]((inf.id_valid===1)|(inf.act_valid===1)))
            else begin
                $display("Assertion 8 is violated");
                $fatal;
            end


Action act_state;
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(~inf.rst_n)          
        act_state <= 'b0;
    else if(inf.act_valid)
        act_state <= inf.D.d_act;
    else                    act_state <= act_state;
end

sequence check_seller;
    ((inf.act_valid===1)&(inf.D.d_act[0]===Check)) ##[1:5](inf.id_valid===1);
endsequence: check_seller

sequence check_buyer;
    (((inf.act_valid===1)&(inf.D.d_act[0]===Check)) ##0 (~inf.id_valid)[*6]);
endsequence: check_buyer


sequence buy_return;
    (((inf.act_valid===1)&((inf.D.d_act[0]===Return)|(inf.D.d_act[0]===Buy))) ##[1:5] (inf.item_valid===1) ##[1:5] (inf.num_valid===1) ##[1:5](inf.id_valid===1));
endsequence: buy_return

assert_9_1: assert property(@(posedge clk) (   check_seller   |=>##[0:10000] (inf.out_valid===1)))
            else begin
                $display("Assertion 9 is violated");
                $fatal;
            end
assert_9_2: assert property(@(posedge clk) (   check_buyer   |->##[1:9996] (inf.out_valid===1)))
            else begin
                $display("Assertion 9 is violated");
                $fatal;
            end
assert_9_3: assert property(@(posedge clk) (  (inf.amnt_valid===1)   |=>##[0:10000] (inf.out_valid===1)))
            else begin
                $display("Assertion 9 is violated");
                $fatal;
            end
assert_9_4: assert property(@(posedge clk) (  buy_return   |=>##[0:10000] (inf.out_valid===1)))
            else begin
                $display("Assertion 9 is violated");
                $fatal;
            end


/*
initial begin
    repeat(30000)begin
        @(clk);
        conv_1.sample();
        conv_2.sample();
        conv_3.sample();
        conv_4.sample();
        conv_5.sample();
        conv_6.sample();
    end
        conv_1.stop();
        conv_2.stop();
        conv_3.stop();
        conv_4.stop();
        conv_5.stop();
        conv_6.stop();
    $display("Spec_1: %e", conv_1.get_coverage());
    $display("Spec_2: %e", conv_2.get_coverage());
    $display("Spec_3: %e", conv_3.get_coverage());
    $display("Spec_4: %e", conv_4.get_coverage());
    $display("Spec_5: %e", conv_5.get_coverage());
    $display("Spec_6: %e", conv_6.get_coverage());
end
*/



endmodule