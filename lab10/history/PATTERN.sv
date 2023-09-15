/*
============================================================================

Date   : 2023/04/26
Author : EECS Lab

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Code Related :
    os_dm.sv

Debuggging mode :
    Display

TO Check :
    

============================================================================
*/


`include "../00_TESTBED/pseudo_DRAM.sv"
`include "Usertype_OS.sv"

program automatic PATTERN(input clk, INF.PATTERN inf);
import usertype::*;


//========================================================================
//  FONT_SETTING
//========================================================================
reg[9*8:1]  rst_color  = "\033[1;0m";
reg[10*8:1] txt_black  = "\033[1;30m";
reg[10*8:1] txt_red    = "\033[1;31m";
reg[10*8:1] txt_green  = "\033[1;32m";
reg[10*8:1] txt_yellow = "\033[1;33m";
reg[10*8:1] txt_blue   = "\033[1;34m";

reg[10*8:1] bg_black  = "\033[40;1m";
reg[10*8:1] bg_red    = "\033[41;1m";
reg[10*8:1] bg_green  = "\033[42;1m";
reg[10*8:1] bg_yellow = "\033[43;1m";
reg[10*8:1] bg_blue   = "\033[0;30;46m";
reg[10*8:1] bg_white  = "\033[47;1m";



reg[10*8:1] bg_red_s = "\033[41;5m";
//========================================================================
//  PARAMETERs
//========================================================================
parameter PAT_NUM = 10;


parameter DRAM_p_r = "../00_TESTBED/DRAM/dram.dat";
parameter DRAM_OFFSET = 'h10000;
parameter DRAM_GEN = 0;
parameter DRAM_SEED                     = 123;
parameter DISPLAY_GEN = 1;

parameter INPUT_SEED = 123;
//-----------------------------------------------------------------------
//  Probabilty - DRAM GENERATOR
//-----------------------------------------------------------------------
//*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  Large item  |Medium item|Small item | User level|   Exp     |
//--------------|-----------|-----------|-----------|-----------|
//      6 bits  |   6 bits  |   6 bits  |   2 bits  |   12 bits |
//*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//***********************************************
//  SHOP INFO:    ITEM_NUM
//***********************************************
//  From 0 to 63    |   6 bits
//...............................................
parameter AUTO_DISTRIBUTED_SHOP_ITEM_NUM    = 1;
parameter SHOP_ITEM_PROB_FULL               = 20;
parameter SHOP_ITEM_PROB_EMPTY              = 20;
//***********************************************
//  SHOP INFO:    USER_LEVEL
//***********************************************
//  From 0 to 3    |   2 bits
//  Platinum:   2'b00
//  Gold:       2'b01
//  Silver:     2'b10
//  Copper:     2'b11
//...............................................
parameter AUTO_DISTRIBUTED_USER_LEVEL       = 1;
parameter USER_LEVEL_PROB_HIGHEST           = 20;
parameter USER_LEVEL_PROB_LOWEST            = 20;
//***********************************************
//  SHOP INFO:    USER_EXP
//***********************************************
//  From 0 to 3000   |   12 bits
// Constraints
//  Platinum:   0
//  Gold:       0 ~ 3999
//  Silver:     0 ~ 2499
//  Copper:     0 ~ 999
//...............................................
parameter AUTO_DISTRIBUTED_USER_EXP       = 1;
parameter USER_EXP_PROB_HIGHEST           = 20;
parameter USER_EXP_PROB_LOWEST            = 20;
//*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  Monny    |  Item ID |   # of items  |  Seller ID|
//-----------|----------|---------------|-----------|------
//  16  bits |  2 bits  |   6   bits    |   8 bits  |
//*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//***********************************************
//  USER INFO:    USER_MONEY
//***********************************************
//  From 0 to 65535   |   16 bits
//...............................................
parameter AUTO_DISTRIBUTED_USER_MONEY       = 1;
parameter USER_MONEY_PROB_HIGHEST           = 20;
parameter USER_MONEY_PROB_LOWEST            = 20;
//***********************************************
//  USER INFO:    HISTORY_ITEM_TYPE
//***********************************************
//  From 1 to 3   |   2 bits
//...............................................

//***********************************************
//  USER INFO:    HISTORY_ITEM_NUM
//***********************************************
//  From 0 to 63   |   6 bits
//...............................................
parameter AUTO_DISTRIBUTED_HIST_ITEM_NUM        = 1;
parameter HIST_ITEM_PROB_FULL                   = 20;
parameter HIST_ITEM_PROB_EMPTY                  = 20;
//***********************************************
//  USER INFO:    HISTORY_SELL_ID
//***********************************************
//  From 0 to 255   |   8 bits
//...............................................

Item_num dram_large_item_num;
Item_num dram_medium_item_num;
Item_num dram_small_item_num;
User_Level dram_level;
EXP dram_exp;
//Fetch randomized user info
Money dram_user_money;
Item_id dram_his_item_id;
Item_num dram_hist_item_num;
User_id dram_hist_seller_id;

integer file;
int dram_addr;
int dram_id;
//-----------------------------------------------------------------------
//  Probabilty - INPUT GENERATOR
//-----------------------------------------------------------------------
parameter CHANGE_USER_PROBABLITY = 50;
//------------------------------
//  ACTION_PROB
//------------------------------
parameter BUY_PROBABILITY = 25;
parameter CHECK_PROBABILITY = 25;
parameter DEPOSIT_PROBABILITY = 25;
parameter RETURN_PROBABILITY = 25;
//-------------------------------
//  ERR PROB
//-------------------------------

/*
parameter BUY_SUCCESS_PROB = 25;
parameter INV_FULL_PROB     = 25;
paramter OUT_OF_MONEY_PROB  = 25;
parameter INV_NOT_ENOUGH_PROB    = 25;

parameter WALLET_SUCCESS_PROB = 50;
parameter WALLET_FAIL_PROB = 50;

parameter RETURN_SUCCESS_PROB = 25;
parameter WRONG_ACT_PROB = 25;
parameter WRONG_ID_PROB = 25;
parameter WRONG_ITEM_PROB = 25;
parameter WRONG_NUM_PROB = 25;
*/
parameter INV_FULL_PASS = 75;
parameter OUT_OF_MONEY_PASS = 66;
parameter INV_NOT_ENOUGH_PASS =50;

parameter CHECK_USER_PROB = 50;

parameter WALLET_PASS = 50;

parameter WRONG_ACT_PASS = 80;
parameter WRONG_ID_PASS = 75;
parameter WRONG_NUM_PASS = 60;
parameter WRONG_ITEM_PASS = 50;




//========================================================================
//  INT, bits
//========================================================================
//----------------------------------------------
//initial block variables
int clear_dirty_idx;
int wait_val_time, total_latency;
int pat_count;
//----------------------------------------------
//======================================================
//  INPUT TASK variables
//======================================================
int input_delay_num, input_delay_limit;
int change_user_flag;
Action action_gen;
//Error_Msg err_type_gen;
bit first_user = 1;
//-------------------------------------------
//Return mode: mapping table and tricks
int buyer_first_buy [255:0];
int buyer_seller_map[255:0];
User_id last_success_buy_user_id;
bit last_success_buy_user_valid = 0;
//-------------------------------------------
User_id new_user_id, new_seller_id;
Shop_Info new_user_shop, new_seller_shop;
User_Info new_user_Info, new_seller_Info;
Money new_money, new_user_money, new_seller_money;
Item_id new_item_id;
Item_num new_item_num, new_user_item_num, new_seller_item_num;
EXP new_user_exp;
User_Level new_user_level;
Shopping_His new_user_his;


int unit_price, fee, unit_exp;
int test_num00, test_num0, test_num1, test_num2, test_num3, test_num4;
int user_cost, sell_earn;
int test_exp;

//========================================================================
//  logics
//========================================================================
logic [7:0] golden_DRAM[((65536+256*8)-1):(65536+0)];
//Golden Ans
logic golden_complete;
logic [3:0] golden_err_msg;
logic [31:0] golden_out_info;

//========================================================================
//  PROBABILITY RANDOMIZE:  DRAM
//========================================================================

class rand_items_num;
    rand Item_num item_num;
    rand int item_prob;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        item_prob dist{[1:100]:/100};
        ((~AUTO_DISTRIBUTED_SHOP_ITEM_NUM)&(item_prob > 100-SHOP_ITEM_PROB_FULL))-> item_num inside{63};
        ((~AUTO_DISTRIBUTED_SHOP_ITEM_NUM)&(item_prob > (100-SHOP_ITEM_PROB_FULL-SHOP_ITEM_PROB_EMPTY))&(item_prob <= 100-SHOP_ITEM_PROB_FULL)) -> item_num inside{0};
        ((~AUTO_DISTRIBUTED_SHOP_ITEM_NUM)&(item_prob <= (100-SHOP_ITEM_PROB_FULL-SHOP_ITEM_PROB_EMPTY))) -> item_num inside{[1:62]};
        (AUTO_DISTRIBUTED_SHOP_ITEM_NUM) -> item_num inside{[0:63]};
    }
endclass
class rand_user_level_exp;
    rand User_Level user_level;
    rand EXP user_exp;
    rand int user_level_prob;
    rand int user_exp_prob;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        user_level_prob dist{[1:100]:/100};
        ((~AUTO_DISTRIBUTED_USER_LEVEL)&(user_level_prob > 100-USER_LEVEL_PROB_HIGHEST)) -> user_level inside{Platinum};
        ((~AUTO_DISTRIBUTED_USER_LEVEL)&(user_level_prob > (100-USER_LEVEL_PROB_HIGHEST-USER_LEVEL_PROB_LOWEST))&(user_level_prob <= 100-USER_LEVEL_PROB_HIGHEST)) -> user_level inside{Copper};
        ((~AUTO_DISTRIBUTED_USER_LEVEL)&(user_level_prob <= (100-USER_LEVEL_PROB_HIGHEST-USER_LEVEL_PROB_LOWEST))) -> user_level inside{Gold,Silver};
        (AUTO_DISTRIBUTED_USER_LEVEL) -> user_level inside{Platinum, Gold, Silver, Copper};
        //  EXP
        user_exp_prob dist{[1:100]:/100};
        ((user_level==Platinum)) -> user_exp inside{0};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Gold)&(user_exp_prob>100-USER_EXP_PROB_HIGHEST)) -> user_exp inside{3999};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Silver)&(user_exp_prob>100-USER_EXP_PROB_HIGHEST)) -> user_exp inside{2499};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Copper)&(user_exp_prob>100-USER_EXP_PROB_HIGHEST)) -> user_exp inside{999};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_exp_prob<=(100-USER_EXP_PROB_HIGHEST))&(user_exp_prob>(100-USER_LEVEL_PROB_HIGHEST-USER_LEVEL_PROB_LOWEST))) -> user_exp inside{0};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Gold)&(user_exp_prob<(100-USER_EXP_PROB_HIGHEST-USER_EXP_PROB_LOWEST))) -> user_exp inside{[1:3998]};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Silver)&(user_exp_prob<(100-USER_EXP_PROB_HIGHEST-USER_EXP_PROB_LOWEST))) -> user_exp inside{[1:2498]};
        ((~AUTO_DISTRIBUTED_USER_EXP)&(user_level==Copper)&(user_exp_prob<(100-USER_EXP_PROB_HIGHEST-USER_EXP_PROB_LOWEST))) -> user_exp inside{[1:998]};
        //  EXP
        ((AUTO_DISTRIBUTED_USER_EXP)&(user_level==Gold))   ->  user_exp inside{[0:3999]};  
        ((AUTO_DISTRIBUTED_USER_EXP)&(user_level==Silver)) ->  user_exp inside{[0:2499]};
        ((AUTO_DISTRIBUTED_USER_EXP)&(user_level==Copper)) ->  user_exp inside{[0:999]};
    }
endclass
class rand_user_money;
    rand Money user_money;
    rand int user_money_prob;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        user_money_prob dist{[1:100]:/100};
        ((~AUTO_DISTRIBUTED_USER_MONEY)&(user_money_prob > 100-USER_MONEY_PROB_HIGHEST))-> user_money inside{65535};
        ((~AUTO_DISTRIBUTED_USER_MONEY)&(user_money_prob > (100-USER_MONEY_PROB_HIGHEST-USER_MONEY_PROB_LOWEST))&(user_money_prob <= 100-USER_MONEY_PROB_HIGHEST)) -> user_money inside{0};
        ((~AUTO_DISTRIBUTED_USER_MONEY)&(user_money_prob <= (100-USER_MONEY_PROB_HIGHEST-USER_MONEY_PROB_LOWEST))) -> user_money inside{[1:65534]};
        (AUTO_DISTRIBUTED_USER_MONEY) -> user_money inside{[0:65535]};
    }
endclass
class rand_hist_item_id;
    rand Item_id hist_item_id;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        hist_item_id dist{[1:3]:/3};
    }
endclass

class rand_hist_items_num;
    rand Item_num hist_item_num;
    rand int hist_item_prob;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        hist_item_prob dist{[1:100]:/100};
        ((~AUTO_DISTRIBUTED_HIST_ITEM_NUM)&(hist_item_prob > 100-HIST_ITEM_PROB_FULL))-> hist_item_num inside{63};
        ((~AUTO_DISTRIBUTED_HIST_ITEM_NUM)&(hist_item_prob > (100-HIST_ITEM_PROB_FULL-HIST_ITEM_PROB_EMPTY))&(hist_item_prob <= 100-HIST_ITEM_PROB_FULL)) -> hist_item_num inside{0};
        ((~AUTO_DISTRIBUTED_HIST_ITEM_NUM)&(hist_item_prob <= (100-HIST_ITEM_PROB_FULL-HIST_ITEM_PROB_EMPTY))) -> hist_item_num inside{[1:62]};
        (AUTO_DISTRIBUTED_HIST_ITEM_NUM) -> hist_item_num inside{[0:63]};
    }
endclass

class rand_hist_seller_id;
    rand User_id hist_seller_id;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        hist_seller_id dist{[0:255]:/256};
    }
endclass

//========================================================================
//  PROBABILITY RANDOMIZE:  INSTRUCTION
//========================================================================
class rand_input_delay;
    rand int input_delay;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        input_delay dist{[1:5]:/5};
    }
endclass


// Change USER
//  4 action
class rand_change_user;
    rand int change_user;
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        change_user dist{0:=(100-CHANGE_USER_PROBABLITY), 1:=CHANGE_USER_PROBABLITY};
    }
endclass







class rand_act;
    rand Action action;
    //rand Error_Msg err_type;

    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        action dist{Buy:=BUY_PROBABILITY,
                    Check:=CHECK_PROBABILITY,
                    Deposit:=DEPOSIT_PROBABILITY,
                    Return:=RETURN_PROBABILITY};
    /*
        ((action==Buy)) -> err_type dist{No_Err:=BUY_SUCCESS_PROB,
                                        INV_Full:=INV_FULL_PROB,
                                        Out_of_money:=OUT_OF_MONEY_PROB,
                                        INV_Not_Enough:=INV_NOT_ENOUGH_PROB};
        ((action==Check)) -> err_type inside{No_Err};
        ((action==Deposit)) -> err_type{No_Err:=WALLET_SUCCESS_PROB,
                                        Wallet_is_Full:=WALLET_FAIL_PROB};
        ((action==Return)) -> err_type dist{No_Err:=RETURN_SUCCESS_PROB, 
                                            Wrong_act:=WRONG_ACT_PROB,
                                            Wrong_ID:=WRONG_ID_PROB,
                                            Wrong_Item:=WRONG_ITEM_PROB,
                                            Wrong_Num:=WRONG_NUM_PROB};
    */
    }
endclass

class rand_prob;
    rand bit inv_full;
    rand bit out_of_money;
    rand bit inv_not_enough;
    
    rand bit check_user;
    rand bit wallet_is_full;

    rand bit wrong_act;
    rand bit wrong_id;
    rand bit wrong_num;
    rand bit wrong_item;
    
    function new(int seed);
        this.srandom(seed);
    endfunction
    constraint limit{
        inv_full dist{1:=INV_FULL_PASS, 0:=(100-INV_FULL_PASS)};
        out_of_money dist{1:=OUT_OF_MONEY_PASS, 0:=(100-OUT_OF_MONEY_PASS)};
        inv_not_enough dist{1:=INV_NOT_ENOUGH_PASS, 0:=(100-INV_NOT_ENOUGH_PASS)};

        check_user dist{1:=CHECK_USER_PROB, 0:=(100-CHECK_USER_PROB)};
        wallet_is_full dist{1:=WALLET_PASS, 0:=(100-WALLET_PASS)};
        
        wrong_act dist{1:=WRONG_ACT_PASS, 0:=(100-WRONG_ACT_PASS)};
        wrong_id dist{1:=WRONG_ID_PASS, 0:=(100-WRONG_ID_PASS)};
        wrong_num dist{1:=WRONG_NUM_PASS, 0:=(100-WRONG_NUM_PASS)};
        wrong_item dist{1:=WRONG_ITEM_PASS, 0:=(100-WRONG_ITEM_PASS)};
    }


endclass


rand_input_delay rand_delay_obj = new(INPUT_SEED);
rand_change_user rand_change_user_obj = new(INPUT_SEED);
rand_act rand_act_obj = new(INPUT_SEED);


rand_hist_item_id rand_item_id_obj = new(INPUT_SEED);
rand_hist_items_num rand_items_num_obj = new(INPUT_SEED);


rand_user_money money_obj = new(INPUT_SEED);


rand_prob rand_prob_obj = new(INPUT_SEED);
rand_hist_seller_id id_obj = new(INPUT_SEED);


//========================================================================
//  DRAM GENERATE
//========================================================================
task dram_generate; begin
    //Randomization Initial
    //shop info        
    rand_items_num dram_large_item_num_obj  = new(DRAM_SEED); 
    rand_items_num dram_medium_item_num_obj = new(DRAM_SEED);
    rand_items_num dram_small_item_num_obj  = new(DRAM_SEED);
    rand_user_level_exp dram_level_exp_obj  = new(DRAM_SEED);
    //user info
    rand_user_money dram_user_money_obj         = new(DRAM_SEED);
    rand_hist_item_id dram_his_item_id_obj      = new(DRAM_SEED);
    rand_hist_items_num dram_hist_item_num_obj  = new(DRAM_SEED);
    rand_hist_seller_id dram_hist_seller_id_obj = new(DRAM_SEED);
    file = $fopen(DRAM_p_r,"w");
    for(dram_id=0;dram_id<256;dram_id=dram_id+1)begin
        dram_addr = DRAM_OFFSET + dram_id * 8;
        //Randomize shop info
        void'(dram_large_item_num_obj.randomize());
        void'(dram_medium_item_num_obj.randomize());
        void'(dram_small_item_num_obj.randomize());
        void'(dram_level_exp_obj.randomize());
        //Randomize user info
        void'(dram_user_money_obj.randomize());
        void'(dram_his_item_id_obj.randomize());
        void'(dram_hist_item_num_obj.randomize());
        void'(dram_hist_seller_id_obj.randomize());
        //Fetch randomized shop info
        dram_large_item_num     = dram_large_item_num_obj.item_num;
        dram_medium_item_num    = dram_medium_item_num_obj.item_num;
        dram_small_item_num     = dram_small_item_num_obj.item_num;
        dram_level              = dram_level_exp_obj.user_level;
        dram_exp                = dram_level_exp_obj.user_exp;
        //Fetch randomized user info
        dram_user_money         = dram_user_money_obj.user_money;
        dram_his_item_id        = dram_his_item_id_obj.hist_item_id;
        dram_hist_item_num      = dram_hist_item_num_obj.hist_item_num;
        dram_hist_seller_id     = dram_hist_seller_id_obj.hist_seller_id;

        $fwrite(file, "@%5h\n", dram_addr);
        if(DISPLAY_GEN)begin
            $display("%0s@%5h%0s", bg_blue,dram_addr,rst_color);
        end
        $fwrite(file, "%h %h %h %h\n", 
            {dram_large_item_num,       dram_medium_item_num[5:4]},
            {dram_medium_item_num[3:0], dram_small_item_num[5:2]},
            {dram_small_item_num[1:0],  dram_level,                 dram_exp[11:8]},
            {dram_exp[7:0]});
        
        dram_addr = dram_addr + 4;
        $fwrite(file, "@%5h\n", dram_addr);
        if(DISPLAY_GEN)begin
        $display("%h %h %h %h", 
            {dram_large_item_num,       dram_medium_item_num[5:4]},
            {dram_medium_item_num[3:0], dram_small_item_num[5:2]},
            {dram_small_item_num[1:0],  dram_level,                 dram_exp[11:8]},
            {dram_exp[7:0]});
        end

        if(DISPLAY_GEN)begin
            $display("%0s@%5h%0s", bg_blue,dram_addr,rst_color);
        end
        $fwrite(file, "%h %h %h %h\n", 
            {dram_user_money[15:8]},
            {dram_user_money[7:0]},
            {dram_his_item_id, dram_hist_item_num},
            {dram_hist_seller_id});

        if(DISPLAY_GEN)begin
        $display("%h %h %h %h", 
            {dram_user_money[15:8]},
            {dram_user_money[7:0]},
            {dram_his_item_id, dram_hist_item_num},
            {dram_hist_seller_id});
        end
    end
    $fclose(file);


end
endtask



//========================================================================
//  MAIN EXE
//========================================================================
initial begin

    if(DRAM_GEN)
        dram_generate;
    $readmemh(DRAM_p_r, golden_DRAM);

    inf.rst_n       = 1'b0;
    inf.id_valid    = 1'b0;
    inf.act_valid   = 1'b0;
    inf.item_valid  = 1'b0;
    inf.num_valid   = 1'b0;
    inf.amnt_valid  = 1'b0;

    inf.D           = 16'b0;


    total_latency = 0;
    rst_n_task;
    for(clear_dirty_idx=0;clear_dirty_idx<256;clear_dirty_idx=clear_dirty_idx+1)begin
        buyer_first_buy[clear_dirty_idx] = 0;
        buyer_seller_map[clear_dirty_idx] = 256;
    end

    for(pat_count=0;pat_count<PAT_NUM;pat_count=pat_count+1)begin
        //input_task;
        wait_out_valid;
        check_ans;

        @(negedge clk);
        check_low_output;
        @(negedge clk);
        check_low_output;
    end
    YOU_PASS_task;
end




//========================================================================================================
//  RST_N TASK
//========================================================================================================
//  OS.sv:
//      TO PATTERN.sv:
//          out_valid, err_msg[3:0], complete, out_info[31:0]
//      TO Bridge.sv:
//          C_addr[7:0], C_data_w[63:0], C_in_valid, C_r_wb
//
//  Bridge.sv:
//      To OS.sv:
//          C_out_valid, C_data_r[63:0]
//      To DRAM:
//          READ CHANNEL
//              AR_VALID, AR_ADDR[16:0], R_READY
//          WRITE CHANNEL
//              AW_VALID, AW_ADDR[16:0], W_VALID, W_DATA[63:0]
//          RESPOND CHANNEL
//              B_READY
//---------------------------------------------------------------------------------------------------------
task rst_n_task; begin
	#(2.0);	inf.rst_n = 0 ;
	#(3.0);
    //OUTPUT from OS.sv
	if((inf.out_valid!=='b0)|(inf.err_msg!=='b0)|(inf.complete!=='b0)|(inf.out_info!=='b0)) begin
        // Spec. 3
        // Using  asynchronous  reset  active  low  architecture. All  outputs  should  be zero after reset.
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("%0s                                                                SPEC 3 FAIL: OS.sv                                                          %0s",bg_red_s,rst_color);
        $display ("                                   All output signals should be reset after the reset signal is asserted.                                   ");
        $display ("out_valid:\t%32d|golden out_valid:\t%32d",inf.out_valid,0);
        $display ("err_msg:\t%32d|golden err_msg:\t%32d",inf.err_msg,0);
        $display ("complete:\t%32d|golden complete:\t%32d",inf.complete,0);
        $display ("out_info:\t%32d|golden out_info:\t%32d",inf.out_info,0);
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        #(100);
        $finish;
	end

	#(2.0);	inf.rst_n = 1 ;
end
endtask
//========================================================================
//  INPUT TASK
//========================================================================

task reload_user ;begin
    //Fetch DRAM data
    dram_addr = DRAM_OFFSET + new_user_id * 8;
    new_user_shop = {golden_DRAM[dram_addr], golden_DRAM[dram_addr+1], golden_DRAM[dram_addr+2], golden_DRAM[dram_addr+3]};
    new_user_Info = {golden_DRAM[dram_addr+4], golden_DRAM[dram_addr+5], golden_DRAM[dram_addr+6], golden_DRAM[dram_addr+7]};

    new_user_level  = new_user_shop.level;
    new_user_exp    = new_user_shop.exp;
    new_user_money  = new_user_Info.money;
    new_user_his    = new_user_Info.shop_history;

    case(new_item_id)
        Large:      new_user_item_num = new_user_shop.large_num;
        Medium:     new_user_item_num = new_user_shop.medium_num;
        Small:      new_user_item_num = new_user_shop.small_num;
        default:begin
                $display("Wrong on Generating new_item_id: user");
                $finish;
        end
    endcase
    case(new_item_id)
        Large:  begin
                unit_price = 300;
                if(new_user_level===Platinum)   unit_exp = 0;
                else                            unit_exp = 60;
        end
        Medium: begin
                unit_price = 200;
                if(new_user_level===Platinum)   unit_exp = 0;
                else                            unit_exp = 40; 
        end
        Small:  begin
                unit_price = 100;
                if(new_user_level===Platinum)   unit_exp = 0;
                else                            unit_exp = 20; 
        end
        default:begin
                $display("Wrong on Generating new_item_id: unit_exp_sel");
                $finish;
        end
    endcase
    case(new_user_level)
        Platinum:   fee = 10;
        Gold:       fee = 30;
        Silver:     fee = 50;
        Copper:     fee = 70;
        default:begin
                $display("Wrong on Generating new_item_id: fee_sel");
                $finish;
        end
    endcase
end
endtask

task reload_seller; begin
    dram_addr = DRAM_OFFSET + new_seller_id * 8;
    new_seller_shop = {golden_DRAM[dram_addr], golden_DRAM[dram_addr+1], golden_DRAM[dram_addr+2], golden_DRAM[dram_addr+3]};
    new_seller_Info = {golden_DRAM[dram_addr+4], golden_DRAM[dram_addr+5], golden_DRAM[dram_addr+6], golden_DRAM[dram_addr+7]};

    case(new_item_id)
        Large:      new_seller_item_num = new_seller_shop.large_num;
        Medium:     new_seller_item_num = new_seller_shop.medium_num;
        Small:      new_seller_item_num = new_seller_shop.small_num;
        default:begin
                $display("Wrong on Generating new_item_id: seller");
                $finish;
        end
    endcase
    new_seller_money  = new_seller_Info.money;
end
endtask

task check_low_output; begin
    if((inf.out_valid==='b1)|(inf.out_info!=='b0)|(inf.complete!=='b0)|(inf.err_msg!=='b0))begin
        $display("OUTPUT when INPUT stage!!!!");
        $finish;
    end
end
endtask




task input_task; begin
    check_low_output;
    change_user_flag = rand_change_user_obj.randomize()|first_user;
    void'(rand_prob_obj.randomize());
    
    void'(rand_act_obj.randomize());
    action_gen = rand_act_obj.action;

    if(change_user_flag==1)        new_user_id = id_obj.randomize();
    new_seller_id = id_obj.randomize();

    while(new_user_id===new_seller_id)begin
        new_seller_id = id_obj.randomize();
    end
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/*

    $display("stop here");
    reload_user;
    reload_seller;

    if(action_gen==Buy)begin
        //Instrution
        new_item_id = rand_item_id_obj.randomize();
        new_item_num = rand_items_num_obj.randomize();


        if((rand_prob_obj.inv_full==1))begin
            //!
            test_num00 = (new_item_num<=(64-new_item_num))?new_item_num:(64-new_item_num);
            new_item_num = $urandom_range(1,test_num00);
            //!new_item_num = $urandom_range(1,(64-new_user_item_num));
        end
        if((rand_prob_obj.out_of_money==1))begin
            test_num0 = (new_user_money>fee)?(new_user_money-fee):0;
            test_num1 = (test_num0)/unit_price +1;
            test_num2 = (new_item_num<=test_num1)?(64-new_user_item_num):test_num1;
            new_item_num = $urandom_range(1,test_num2);
        end
        if((rand_prob_obj.inv_not_enough==1))begin
            test_num3 = (new_seller_item_num==0)?1:new_seller_item_num;
            test_num4 = (new_item_num<=test_num3)?new_item_num:test_num3;        
            new_item_num = $urandom_range(1,test_num4);
        end
    end
    else if(action_gen==Deposit)begin
        void'(money_obj.randomize());
        new_money = money_obj.user_money;
    end
    else if(action_gen==Return)begin
        new_item_id = rand_item_id_obj.randomize();
        new_item_num = rand_items_num_obj.randomize();
        if((rand_prob_obj.wrong_act==1)&(last_success_buy_user_valid))begin
            new_user_id = last_success_buy_user_id;
            while(new_user_id===new_seller_id)begin
                new_seller_id = id_obj.randomize();
            end
            reload_user;
            reload_seller;
        end
        if(rand_prob_obj.wrong_id==1)begin
            new_seller_id = new_user_his.seller_ID;
            reload_seller;
        end
        end
        if(rand_prob_obj.wrong_num==1)begin
            new_item_num = new_user_his.item_num;
        end
        if(rand_prob_obj.wrong_item==1)begin
            new_item_id = new_user_his.item_ID;
        end


 

    if(change_user_flag==1)begin
        inf.D.d_id[0] = new_user_id;
        inf.id_valid = 'b1;
        input_delay_limit = rand_delay_obj.randomize();
        @(negedge clk);
        check_low_output;
        inf.D.d_id[0] = 'b0;
        inf.id_valid = 'b0;
        for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
            @(negedge clk);
            check_low_output;
        end
    end

    inf.act_valid = 'b1;
    case(action_gen)
        Buy, Return:begin

            //Action
            inf.D.d_act[0] = (action_gen==Buy)?Buy:Return;
            @(negedge clk);
            check_low_output;
            inf.act_valid = 'b0;
            inf.D.d_act[0]= 'b0;
            input_delay_limit = rand_delay_obj.randomize();
            for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
                @(negedge clk);
                check_low_output;
            end
            //Item_ID
            inf.item_valid = 'b1;
            inf.D.d_item[0] = new_item_id;
            @(negedge clk);
            check_low_output;
            inf.item_valid = 'b0;
            inf.D.d_item[0] = 'b0;
            input_delay_limit = rand_delay_obj.randomize();
            for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
                @(negedge clk);
            end
            //Num
            inf.num_valid = 'b1;
            inf.D.d_item_num = new_item_num;
            @(negedge clk);
            check_low_output;
            inf.num_valid = 'b0;
            inf.D.d_item_num = 'b0;
            input_delay_limit = rand_delay_obj.randomize();
            for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
                @(negedge clk);
                check_low_output;
            end
            //Seller ID
            inf.D.d_id[0] = new_seller_id;
            inf.id_valid = 'b1;
            input_delay_limit = rand_delay_obj.randomize();
            @(negedge clk);
            check_low_output;
            inf.D.d_id[0] = 'b0;
            inf.id_valid = 'b0;


            user_cost = unit_price * new_item_num + fee;
            sell_earn = unit_price * new_item_num;

            if(action_gen==Buy)begin
                if((new_user_item_num+new_item_num)>63)begin
                    golden_complete = 'b0;
                    golden_err_msg = 4'b0100;
                    golden_out_info = 'b0;
                end
                else if(new_item_num>new_seller_item_num)begin
                    golden_complete = 'b0;
                    golden_err_msg = 4'b0010;
                    golden_out_info = 'b0;
                end
                else if((new_user_money<user_cost))begin
                    golden_complete = 'b0;
                    golden_err_msg = 4'b0011;
                    golden_out_info = 'b0;
                end
                else begin
                    dram_addr = DRAM_OFFSET + new_user_id * 8;
                    case(new_item_id)
                        Large:  golden_DRAM[dram_addr][7:2]-=new_item_num;
                        Medium: {golden_DRAM[dram_addr][1:0],golden_DRAM[dram_addr+1][7:4]}-=new_item_num;
                        Small:  {golden_DRAM[dram_addr+1][3:0],golden_DRAM[dram_addr+2][7:6]}-=new_item_num;
                        default:begin
                            $display("wrong in ans create: buy user");
                            $finish;
                        end
                    endcase

                    if(new_user_level!==Platinum)begin
                        test_exp = new_user_exp + unit_exp * new_item_num;
                        if((new_user_level==Copper)&(test_exp>=1000))begin
                            test_exp = 0;
                            new_user_level = Silver;
                        end
                        else if((new_user_level==Silver)&(test_exp>=2500))begin
                            test_exp = 0;
                            new_user_level = Gold;
                        end
                        else if((new_user_level==Gold)&(test_exp>=4000))begin
                            test_exp = 0;
                            new_user_level = Platinum;
                        end
                        {golden_DRAM[dram_addr+2][5:4]} = new_user_level;
                        {golden_DRAM[dram_addr+2][3:0],golden_DRAM[dram_addr+3]} = test_exp;
                    end


                    {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]}-=user_cost;
                    {golden_DRAM[dram_addr+6],golden_DRAM[dram_addr+7]}={new_item_id,new_item_num,new_seller_id};


                    //golden buy and success
                    golden_complete = 'b1;
                    golden_err_msg =  'b0;
                    golden_out_info = {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5],golden_DRAM[dram_addr+6],golden_DRAM[dram_addr+7]};

                    dram_addr = DRAM_OFFSET + new_seller_id * 8;
                    new_seller_Info.money = ((new_seller_Info.money+sell_earn)>=65535)?'d65535:(new_seller_Info.money+sell_earn);

                    //update seller's money
                    {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]} = new_seller_Info.money;
                    //update item_num
                    case(new_item_id)
                        Large:  golden_DRAM[dram_addr][7:2]-=new_item_num;
                        Medium: {golden_DRAM[dram_addr][1:0],golden_DRAM[dram_addr+1][7:4]}-=new_item_num;
                        Small:  {golden_DRAM[dram_addr+1][3:0],golden_DRAM[dram_addr+2][7:6]}-=new_item_num;
                        default:begin
                            $display("wrong in ans create: buy seller");
                            $finish;
                        end
                    endcase
                    buyer_first_buy[new_user_id] = 1;
                    buyer_first_buy[new_seller_id] = 0;
                    buyer_seller_map[new_user_id] = new_seller_id;
                    buyer_seller_map[new_seller_id] = new_user_id;   
                    last_success_buy_user_valid = 1;
                    last_success_buy_user_id = new_user_id;             
                end
            end
            else begin
                //Return
                if((buyer_first_buy[new_user_id]==0)|
                    (buyer_seller_map[new_user_id]!=buyer_seller_map[new_user_his.seller_ID])|
                    (buyer_seller_map[new_user_his.seller_ID]==256))begin
                    golden_complete = 'b0;
                    golden_out_info = 'b0;
                    golden_err_msg = 4'b1111;
                end
                else if(new_seller_id!==new_user_his.seller_ID)begin
                    golden_complete = 'b0;
                    golden_out_info = 'b0;
                    golden_err_msg = 4'b1001;
                end
                else if(new_item_num!==new_user_his.item_num)begin
                    golden_complete = 'b0;
                    golden_out_info = 'b0;
                    golden_err_msg = 4'b1100;
                end
                else if(new_item_id!==new_user_his.item_ID)begin
                    golden_complete = 'b0;
                    golden_out_info = 'b0;
                    golden_err_msg = 4'b1010;
                end
                else begin

                        
                    dram_addr = DRAM_OFFSET + new_user_id * 8;
                    case(new_item_id)
                        Large:  golden_DRAM[dram_addr][7:2]-=new_item_num;
                        Medium: {golden_DRAM[dram_addr][1:0],golden_DRAM[dram_addr+1][7:4]}-=new_item_num;
                        Small:  {golden_DRAM[dram_addr+1][3:0],golden_DRAM[dram_addr+2][7:6]}-=new_item_num;
                        default:begin
                            $display("wrong in ans create: Return user");
                            $finish;
                        end
                    endcase
                    {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]}+=sell_earn;
                    
                    //golden buy and success
                    golden_complete = 'b1;
                    golden_err_msg =  'b0;
                    golden_out_info = {14'b0, golden_DRAM[dram_addr],golden_DRAM[dram_addr+1],golden_DRAM[dram_addr+2][7:4]};

                    dram_addr = DRAM_OFFSET + new_seller_id * 8;
                    //update seller's money
                    {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]}-=sell_earn;
                    //update item_num
                    case(new_item_id)
                        Large:  golden_DRAM[dram_addr][7:2]+=new_item_num;
                        Medium: {golden_DRAM[dram_addr][1:0],golden_DRAM[dram_addr+1][7:4]}+=new_item_num;
                        Small:  {golden_DRAM[dram_addr+1][3:0],golden_DRAM[dram_addr+2][7:6]}+=new_item_num;
                        default:begin
                            $display("wrong in ans create: Return Seller");
                            $finish;
                        end
                    endcase
                    buyer_first_buy[new_user_id] = 0;
                    buyer_first_buy[new_seller_id] = 0;
                    buyer_seller_map[new_user_id] = new_user_id;
                    buyer_seller_map[new_seller_id] = new_seller_id;   
                
                end
            end
        end
        Check:begin
            buyer_first_buy[new_user_id] = 0;
            inf.D.d_act[0] = Check;
            @(negedge clk);
            check_low_output;
            inf.act_valid = 'b0;
            inf.D.d_act[0]= 'b0;

            //golden_ans for check user
            golden_complete = 'b1;
            golden_err_msg = 'b0;
            dram_addr = DRAM_OFFSET + new_user_id * 8;
            golden_out_info = {16'b0, golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]};

            buyer_first_buy[new_user_id] = 0;
            buyer_seller_map[new_user_id] = new_user_id;
            if(rand_prob_obj.check_user==1)begin
                buyer_first_buy[new_seller_id] = 0;
                input_delay_limit = rand_delay_obj.randomize();
                for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
                    @(negedge clk);
                    check_low_output;
                end
                inf.id_valid = 'b1;
                inf.D.d_id[0] = new_seller_id;
                @(negedge clk);
                check_low_output;
                inf.id_valid = 'b0;
                inf.D.d_id[0] = 'b0;
                buyer_first_buy[new_seller_id] = 0;
                buyer_seller_map[new_seller_id] = new_seller_id;

                //golden_ans for check seller
                dram_addr = DRAM_OFFSET + new_seller_id * 8;
                golden_out_info = {14'b0, golden_DRAM[dram_addr],golden_DRAM[dram_addr+1],golden_DRAM[dram_addr+2][7:4]};
            end
        end
        Deposit:begin
            inf.D.d_act[0] = Deposit;
            @(negedge clk);
            check_low_output;
            inf.act_valid = 'b0;
            inf.D.d_act[0]= 'b0;
            input_delay_limit = rand_delay_obj.randomize();
            for(input_delay_num=1;input_delay_num<input_delay_limit;input_delay_num=input_delay_num+1)begin
                @(negedge clk);
                check_low_output;
            end
            inf.amnt_valid = 'b1;
            inf.D.d_money = new_money;
            @(negedge clk);
            check_low_output;
            inf.amnt_valid = 'b0;
            inf.D.d_money = 'b0;

            if((new_user_money+new_money)>65535)begin
                golden_complete = 'b0;
                golden_err_msg = 4'b1000;
                golden_out_info = 'b0;
            end
            else begin
                dram_addr = DRAM_OFFSET + new_user_id * 8;
                {golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]}+=new_money;
                golden_complete = 'b0;
                golden_err_msg = 4'b0000;
                golden_out_info = {16'b0,golden_DRAM[dram_addr+4],golden_DRAM[dram_addr+5]};

                buyer_first_buy[new_user_id] = 0;
                buyer_seller_map[new_user_id] = new_user_id;
            end
        end
        default:begin
            $display("Never Occur");
            $finish;
        end
    endcase
    first_user = 0;


    */
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end
endtask
//========================================================================
//  WAIT_LATENCY TASK
//========================================================================
task wait_out_valid; begin
    wait_val_time = -1;
    while(inf.out_valid !== 1) begin
	    wait_val_time = wait_val_time + 1;
        if(wait_val_time == 10000)
        begin
            $display("SPEC 6 IS FAIL!");
            $finish;
        end
        @(negedge clk);
  end
  total_latency = total_latency + wait_val_time;
end
endtask
//========================================================================
//  CHECK_ANS TASK
//========================================================================
task check_ans; begin
    if(inf.out_valid===1)begin
        if((inf.err_msg!== golden_err_msg)|(inf.complete!==golden_complete)|(inf.out_info!==golden_out_info))begin
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("%0s                                                                CHECK_ANS FAIL                                                      %0s",bg_red_s,rst_color);    
        $display ("err_msg:\t%64d|golden err_msg:\t%64d",inf.err_msg,golden_err_msg);
        $display ("complete:\t%64d|golden complete:\t\t%64d",inf.complete,golden_complete);
        $display ("out_info:\t%64d|golden out_info:\t%64d",inf.out_info,0);
        $display ("out_valid:\t%64d|golden out_valid:\t%64d",inf.out_valid,1);
        $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
        $finish;
        end
    end
end
endtask

//========================================================================
//  PASS
//========================================================================

task YOU_PASS_task; 
begin
  $display ("--------------------------------------------------------------------");
  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~            ");
  $display ("                         Congratulations!                           ");
  $display ("                  You have passed all patterns!                     ");
  $display ("--------------------------------------------------------------------");        
//$display ("COST: %d",cost);   
//#(500);
$finish;
end
endtask







endprogram
