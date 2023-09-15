`define CYCLE_TIME 15.0
module PATTERN(
	// Output signals
	clk,
	rst_n,
	in_valid,
	img,
	ker,
	weight,

	// Input signals
	out_valid,
	out_data
);

output reg clk;
output reg rst_n;
output reg in_valid;
output reg [7:0] img;
output reg [7:0] ker;
output reg [7:0] weight;

input out_valid;
input  [9:0] out_data;
//================================================================
// Clock
//================================================================
real CYCLE = `CYCLE_TIME;
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;
//================================================================
// parameters & integer
//================================================================
parameter PATNUM = 500;
parameter EASY_NUM = 100, HARD_NUM = 256;

integer SEED = 123, NUM;
integer i, j, cnt, m, n;
integer temp_up, temp_down, golden_out, abs_diff;
integer patcount = 1, total_latency, wait_val_time;

integer rnd_img_up[5:0][5:0], rnd_img_down[5:0][5:0];
integer input_img_up[35:0], input_img_down[35:0];

integer rnd_ker[2:0][2:0];
integer input_ker[8:0];

integer rnd_weight[1:0][1:0];
integer input_weight[3:0];

integer map_after_conv_up[3:0][3:0], map_after_quant_up[3:0][3:0];
integer map_after_pooling_up[1:0][1:0];
integer vector_after_connect_up[3:0], vector_after_quant_up[3:0];

integer map_after_conv_down[3:0][3:0], map_after_quant_down[3:0][3:0];
integer map_after_pooling_down[1:0][1:0];
integer vector_after_connect_down[3:0], vector_after_quant_down[3:0];

integer file_debug;
integer INPUT_SIZE, row_idx, col_idx;
integer L1_distance;
//================================================================
// Wire & Reg Declaration
//================================================================
reg[9*8:1]  reset_color       = "\033[1;0m";
reg[10*8:1] txt_black_prefix  = "\033[1;30m";
reg[10*8:1] txt_blue_prefix   = "\033[1;34m";
reg[10*8:1] txt_green_prefix  = "\033[1;32m";

reg[8*28:1] debug_file_name_up="Lab08_woCG_debug(up).txt";
reg[8*28:1] debug_file_name_down="Lab08_woCG_debug(down).txt";

//================================================================
//    initial
//================================================================
initial begin
	rst_n = 1'b1;
	in_valid = 1'b0;

	img = 'dx;
	ker = 'dx;
	weight = 'dx;

	force clk = 0;
	reset_signal_task;
	total_latency = 0;
	for (patcount = 0; patcount < PATNUM; patcount = patcount + 1) begin
		gen_rnd_data;
		gen_golden_out;
		input_task;
		wait_out_valid;
		check_ans;
	end
	YOU_PASS_task;
end

//================================================================
// task
//================================================================
task reset_signal_task; begin 
  #CYCLE;  rst_n=0;
  #CYCLE;  rst_n=1;
  
  if((out_valid !== 1'b0)|| (out_data !== 0)) begin
	FAIL_task;
	$display("************************************************************");  
	$display("                          FAIL!                              ");    
	$display("*  Output signal should be 0 after initial RESET  at %8t   *",$time);
	$display("************************************************************");
	repeat(2) #CYCLE;
	$finish;
  end
  #(CYCLE);  release clk;
end endtask

task gen_rnd_data; begin
	if (patcount < 5)
		NUM = EASY_NUM;
	else
		NUM = HARD_NUM;
	
	cnt = 0;
	for (i = 0; i < 6; i = i + 1) begin
		for (j = 0; j < 6; j = j + 1) begin
			rnd_img_up[i][j] = {$random(SEED)} % NUM;
			input_img_up[cnt] = rnd_img_up[i][j];
			
			rnd_img_down[i][j] = {$random(SEED)} % NUM;
			input_img_down[cnt] = rnd_img_down[i][j];
			
			cnt = cnt + 1;
		end
	end
	
	cnt = 0;
	for (i = 0; i < 3; i = i + 1) begin
		for (j = 0; j < 3; j = j + 1) begin
			rnd_ker[i][j] = {$random(SEED)} % NUM;
			input_ker[cnt] = rnd_ker[i][j];
			cnt = cnt + 1;
		end
	end
	
	cnt = 0;
	for (i = 0; i < 2; i = i + 1) begin
		for (j = 0; j < 2; j = j + 1) begin
			rnd_weight[i][j] = {$random(SEED)} % NUM;
			input_weight[cnt] = rnd_weight[i][j];
			cnt = cnt + 1;
		end
	end
end endtask

task gen_golden_out; begin
	// Convolution
	for (i = 0; i < 4; i = i + 1) begin
		for (j = 0; j < 4; j = j + 1) begin
			temp_up = 0;
			temp_down = 0;
			for (m = 0; m < 3; m = m + 1) begin
				for (n = 0; n < 3; n = n + 1) begin
					temp_up = temp_up + rnd_img_up[m+i][n+j]*rnd_ker[m][n];
					temp_down = temp_down + rnd_img_down[m+i][n+j]*rnd_ker[m][n];
				end
			end
			map_after_conv_up[i][j] = temp_up;
			map_after_conv_down[i][j] = temp_down;
		end
	end
	
	// Quantization
	for (i = 0; i < 4; i = i + 1) begin
		for (j = 0; j < 4; j = j + 1) begin
			map_after_quant_up[i][j] = map_after_conv_up[i][j]/2295;
			map_after_quant_down[i][j] = map_after_conv_down[i][j]/2295;
		end
	end
	
	// Max-Pooling
	for (i = 0; i < 2; i = i + 1) begin
		for (j = 0; j < 2; j = j + 1) begin
			temp_up = 0;
			temp_down = 0;
			for (m = 0; m < 2; m = m + 1) begin
				for (n = 0; n < 2; n = n + 1) begin
					if (map_after_quant_up[2*i+m][2*j+n] > temp_up)
						temp_up = map_after_quant_up[2*i+m][2*j+n];
					if (map_after_quant_down[2*i+m][2*j+n] > temp_down)
						temp_down = map_after_quant_down[2*i+m][2*j+n];
				end
			end
			map_after_pooling_up[i][j] = temp_up;
			map_after_pooling_down[i][j] = temp_down;
		end
	end
	
	// Fully Connected
	cnt = 0;
	for (i = 0; i < 2; i = i + 1) begin
		for (j = 0; j < 2; j = j + 1) begin
			temp_up = 0;
			temp_down = 0;
			for (n = 0; n < 2; n = n + 1) begin
				temp_up = temp_up + map_after_pooling_up[i][n]*rnd_weight[n][j];
				temp_down = temp_down + map_after_pooling_down[i][n]*rnd_weight[n][j];
			end
			vector_after_connect_up[cnt] = temp_up;
			vector_after_connect_down[cnt] = temp_down;
			cnt = cnt + 1;
		end
	end
	
	// Quantization
	for (i = 0; i < 4; i = i + 1) begin
		vector_after_quant_up[i] = vector_after_connect_up[i]/510;
		vector_after_quant_down[i] = vector_after_connect_down[i]/510;
	end
	
	// L1 Distance
	L1_distance = 0;
	for (i = 0; i < 4; i = i + 1) begin
		if (vector_after_quant_up[i] > vector_after_quant_down[i])
			abs_diff = vector_after_quant_up[i] - vector_after_quant_down[i];
		else
			abs_diff = vector_after_quant_down[i] - vector_after_quant_up[i];
			
		L1_distance = L1_distance + abs_diff;
	end
	
	// Activation Function
	if (L1_distance < 16)
		golden_out = 0;
	else
		golden_out = L1_distance;
	
end endtask

task out_low_task; begin
	if((out_valid !== 1'b0) || (out_data !== 1'b0)) begin
		FAIL_task;
		$display("************************************************************");  
		$display("                          FAIL!                              ");    
		$display("*  Out_reg should be 0 at %8t",$time);
		$display("************************************************************");
		repeat(2) #CYCLE;
		$finish;
	end
end endtask

task input_task; begin
	in_valid = 1'b0;

	img = 'dx;
	ker = 'dx;
	weight = 'dx;
	repeat(({$random(SEED)}% 4 + 2)) @(negedge clk);
	
	for (i = 0; i < 72; i = i + 1) begin
		in_valid = 1'b1;
		if (i < 36)
			img = input_img_up[i];
		else
			img = input_img_down[i-36];
			
		if (i < 9)
			ker = input_ker[i];
		else
			ker = 'dx;
		
		if (i < 4)
			weight = input_weight[i];
		else
			weight = 'dx;
		
		@(negedge clk);
		out_low_task;
	end
	
	// Disable input
	in_valid = 1'b0;

	img = 'dx;
	ker = 'dx;
	weight = 'dx;
end endtask


task wait_out_valid; begin
  wait_val_time = -1;
  while(out_valid !== 1'b1) begin
	wait_val_time = wait_val_time + 1;
	if(wait_val_time == 1000)
	begin
		FAIL_task;
		$display("********************************************************");     
        $display("                          FAIL!                              ");
        $display("*  The execution latency are over 1000 cycles  at %8t   *",$time);//over max
        $display("********************************************************");
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + wait_val_time;
end 
endtask


task dump_task_up; begin

    file_debug = $fopen(debug_file_name_up, "w");
    $fwrite(file_debug, "[ PATNUM        ] : %-d\n", patcount);
	$fwrite(file_debug, "[ cg_en         ] : NO cg_en\n\n");
	
    //----------------
    // img matrix (up)
    //----------------
    // Column index
	INPUT_SIZE = 6;
	$fwrite(file_debug, "[ img matrix (up) ]\n");
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_img_up[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");


	//----------------
    // ker matrix
    //----------------
	$fwrite(file_debug, "[ ker matrix ]\n");
	INPUT_SIZE = 3;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_ker[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // conv. matrix(up)
    //----------------
	$fwrite(file_debug, "[ convolution matrix(up) ]\n");
	INPUT_SIZE = 4;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%7d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "________");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%7d ", map_after_conv_up[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // quant. matrix(up)
    //----------------
	$fwrite(file_debug, "[ quantization matrix(up) ]\n");
	INPUT_SIZE = 4;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%4d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "_____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%4d ", map_after_quant_up[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // max-pooling matrix(up)
    //----------------
	$fwrite(file_debug, "[ max-pooling matrix(up) ]\n");
	INPUT_SIZE = 2;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%4d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "_____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%4d ", map_after_pooling_up[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // weight matrix
    //----------------
	$fwrite(file_debug, "[ weight matrix ]\n");
	INPUT_SIZE = 2;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_weight[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // fully connected vector(up)
    //----------------
	$fwrite(file_debug, "[ fully connected vector(up) ]\n");
	
    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<2 ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
	INPUT_SIZE = 4;
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        $fwrite(file_debug, "%6d ", vector_after_connect_up[row_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // quant. vector(up)
    //----------------
	$fwrite(file_debug, "[ quant. vector(up) ]\n");
	
    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<2 ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
	INPUT_SIZE = 4;
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        $fwrite(file_debug, "%3d ", vector_after_quant_up[row_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	//----------------
    // L1_distance
    //----------------
	$fwrite(file_debug, "[ L1_distance ] : %10d\n", L1_distance);
	//----------------
    // golden_out
    //----------------
	$fwrite(file_debug, "[ golden_out  ] : %10d\n", golden_out);
	//----------------
    // your_out
    //----------------
	$fwrite(file_debug, "[ your_out    ] : %10d\n", out_data);
	
	$fwrite(file_debug, "\n\n");
    $fclose(file_debug);
end endtask


task dump_task_down; begin

    file_debug = $fopen(debug_file_name_down, "w");
    $fwrite(file_debug, "[ PATNUM        ] : %-d\n", patcount);
	$fwrite(file_debug, "[ cg_en         ] : NO cg_en\n\n");
	
    //----------------
    // img matrix (down)
    //----------------
    // Column index
	INPUT_SIZE = 6;
	$fwrite(file_debug, "[ img matrix (down) ]\n");
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_img_down[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");


	//----------------
    // ker matrix
    //----------------
	$fwrite(file_debug, "[ ker matrix ]\n");
	INPUT_SIZE = 3;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_ker[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // conv. matrix(down)
    //----------------
	$fwrite(file_debug, "[ convolution matrix(down) ]\n");
	INPUT_SIZE = 4;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%7d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "________");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%7d ", map_after_conv_down[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // quant. matrix(down)
    //----------------
	$fwrite(file_debug, "[ quantization matrix(down) ]\n");
	INPUT_SIZE = 4;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%4d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "_____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%4d ", map_after_quant_down[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // max-pooling matrix(down)
    //----------------
	$fwrite(file_debug, "[ max-pooling matrix(down) ]\n");
	INPUT_SIZE = 2;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%4d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "_____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%4d ", map_after_pooling_down[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // weight matrix
    //----------------
	$fwrite(file_debug, "[ weight matrix ]\n");
	INPUT_SIZE = 2;
    $fwrite(file_debug, "     ");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "%3d ", col_idx);
    $fwrite(file_debug, "\n");

    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        for(col_idx=0 ; col_idx<INPUT_SIZE ; col_idx=col_idx+1)
            $fwrite(file_debug, "%3d ", rnd_weight[row_idx][col_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // fully connected vector(down)
    //----------------
	$fwrite(file_debug, "[ fully connected vector(down) ]\n");
	
    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<2 ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
	INPUT_SIZE = 4;
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        $fwrite(file_debug, "%6d ", vector_after_connect_down[row_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	
	//----------------
    // quant. vector(down)
    //----------------
	$fwrite(file_debug, "[ quant. vector(down) ]\n");
	
    $fwrite(file_debug, "_____");
    for(col_idx=0 ; col_idx<2 ; col_idx=col_idx+1)
        $fwrite(file_debug, "____");
    $fwrite(file_debug, "\n");
	INPUT_SIZE = 4;
    // Value & Row index
    for(row_idx=0 ; row_idx<INPUT_SIZE ; row_idx=row_idx+1) begin
        $fwrite(file_debug, "%3d |", row_idx);
        $fwrite(file_debug, "%3d ", vector_after_quant_down[row_idx]);
        $fwrite(file_debug, "\n");
    end
    $fwrite(file_debug, "\n\n");
	
	//----------------
    // L1_distance
    //----------------
	$fwrite(file_debug, "[ L1_distance ] : %10d\n", L1_distance);
	//----------------
    // golden_out
    //----------------
	$fwrite(file_debug, "[ golden_out  ] : %10d\n", golden_out);
	//----------------
    // your_out
    //----------------
	$fwrite(file_debug, "[ your_out    ] : %10d\n", out_data);
	
	$fwrite(file_debug, "\n\n");
    $fclose(file_debug);
end endtask


task check_ans; 
begin
  
  //++++++++++++++++++++++++++++++++++++++++++++++++
	i=0;
	while(out_valid)begin
		if(i >= 1)begin
			FAIL_task;
			$display("********************************************************");     
			$display("                          FAIL!                              ");
			$display("   Output should be asserted in only 1 cycles");
			$display("********************************************************");
			repeat(2)@(negedge clk);
			$finish;
		end
		if(golden_out !== out_data)begin
			$display("\n");
			FAIL_task;
			// dump_task_up;
			// dump_task_down;
			$display("%0s", reset_color);
			$finish;
		end
		i=i+1;
		@(negedge clk);
	end
	// repeat(({$random(SEED)} % 3 + 1)) @(negedge clk);
end 
endtask

task FAIL_task;
begin
		$display("\n");
		$display("%0s", reset_color);
        $display("        ----------------------------               ");
        $display("        --                        --       |\\__/\\");
        $display("        --  OOPS!!                --      / X,X  | ");
        $display("        --                        --    /_____   | ");
        $display("        --  Simulation Failed!!   --   /^ ^ ^ \\  |");
        $display("        --                        --  |^ ^ ^ ^ |w| ");
        $display("        ----------------------------   \\m___m__|_|");
        $display("\n");
		dump_task_up;
		dump_task_down;
end
endtask

task YOU_PASS_task;
begin
        $display("\n");
        $display("\n");
		$display("%0s", reset_color);
        $display("        ----------------------------               ");
        $display("        --                        --       |\__||  ");
        $display("        --  Congratulations !!    --      / O.O  | ");
        $display("        --                        --    /_____   | ");
        $display("        --  Simulation out!!     --   /^ ^ ^ \\  |");
        $display("        --                        --  |^ ^ ^ ^ |w| ");
        $display("        ----------------------------   \\m___m__|_|");
		$display ("total latency = %d",total_latency);	
        $display("\n");
		repeat(2)@(negedge clk);
		$finish;
end
endtask

endmodule
