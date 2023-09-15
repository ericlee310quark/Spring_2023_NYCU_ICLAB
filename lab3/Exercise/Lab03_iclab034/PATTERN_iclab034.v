`ifdef RTL
    `define CYCLE_TIME 10.0
`endif
`ifdef GATE
    `define CYCLE_TIME 10.0
`endif


module PATTERN(
    // Output Signals
    clk,
    rst_n,
    in_valid,
    init,
    in0,
    in1,
    in2,
    in3,
    // Input Signals
    out_valid,
    out
);


/* Input for design */
output reg       clk, rst_n;
output reg       in_valid;
output reg [1:0] init;
output reg [1:0] in0, in1, in2, in3; 


/* Output for pattern */
input            out_valid;
input      [1:0] out; 
//================================================================
// parameters & integer
//================================================================
real CYCLE = `CYCLE_TIME;
parameter PATNUM = 300;
parameter LEN = 64;
integer SEED = 210786;
integer patcount = 1, total_latency, wait_val_time;
integer i, out_val_clk_times, x;
integer in_read,in_hold,out_read,out_hold;

integer map_x, map_y, tn;
integer loop_num,obs_col, ob_type;
integer train_num,track_choose_train,rand_obs_num,track_choose_obs,obs_track;
integer create_train,create_obs;


integer track,step;
integer cost;
//================================================================
// wire & registers 
//================================================================
reg [1:0] initial_point;
reg [1:0] map [3:0][63:0];
reg [3:0] train_set;


//================================================================
// clock
//================================================================
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;


//================================================================
// initial
//================================================================
initial 
begin
	rst_n = 1'b1;
	in_valid = 1'b0;
	force clk = 0;
 	total_latency = 0;
 	cost = 'd0;
	reset_signal_task;  //SPEC 3
	
	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) 
	begin
		input_task;             //give the inputs
		wait_out_valid;         //check
		check_ans;              //check answers
	end	
  	YOU_PASS_task;
end
//================================================================
// task
//================================================================
task reset_signal_task; 
begin 
  #(0.5);  rst_n=0;
  #(2.0);

  if((out_valid !== 0)||(out !== 0)) 
	begin
		$display("SPEC 3 IS FAIL!");
		$finish;
	end

  #(10);  rst_n=1;
  #(3);  release clk;
end 
endtask

task input_task; 
begin

	// Inputs start from second negtive edge after the begining of clock
	if(patcount=='d1)
		repeat(2)@(negedge clk);

	// Set in_valid and input the data
	for(map_x=0;map_x<64;map_x=map_x+'d1)begin
		for(map_y=0;map_y<4;map_y=map_y+'d1)begin
			map[map_y][map_x] = 2'b00;
		end
	end
	initial_point ='d0;
	for(loop_num='d0;loop_num<'d8;loop_num=loop_num+'d1)begin
		train_set[3:0] = 'd0;
		train_num = $urandom(SEED)%'d2 +'d1;
		if(loop_num=='d0)begin
				initial_point = $urandom(SEED)%'d4;
				train_set[initial_point] = 'd1;
		end

		create_train ='d0;
		while(create_train<train_num)begin
			
			track_choose_train = $random(SEED)%'d4;
			if(!train_set[track_choose_train])begin
				train_set[track_choose_train] = 'd1;
				map[track_choose_train][loop_num*'d8] = 2'b11;
				map[track_choose_train][loop_num*'d8+'d1] = 2'b11;
				map[track_choose_train][loop_num*'d8+'d2] = 2'b11;
				map[track_choose_train][loop_num*'d8+'d3] = 2'b11;
				create_train = create_train +'d1;
			end

		end
		for(obs_col='d0;obs_col<'d3;obs_col=obs_col+'d1)begin
			train_set[3:0] = 'd0;
		
			rand_obs_num = $random(SEED)%'d5;
			create_obs ='d0;
			while(create_obs<rand_obs_num)begin
				track_choose_obs = $random(SEED)%'d4;
				if(!train_set[track_choose_obs])begin
					train_set[track_choose_obs] = 'd1;
					ob_type = $random(SEED)%'d2;
					if(ob_type=='d0)	map[track_choose_obs][(loop_num*'d8)+(obs_col*'d2)+'d2] = 2'b01|map[track_choose_obs][(loop_num*'d8)+(obs_col*'d2)+'d2];
					else 				map[track_choose_obs][(loop_num*'d8)+(obs_col*'d2)+'d2] = 2'b10|map[track_choose_obs][(loop_num*'d8)+(obs_col*'d2)+'d2];
					create_obs = create_obs +'d1;
				end
			end
		end
	end

	@(negedge clk);
	in_valid = 1'b1;
	for(map_x=0;map_x<64;map_x=map_x+1)begin
		if(map_x==0) 	init = initial_point;
		else 			init = 0;
		in0 = map[0][map_x];
		in1 = map[1][map_x];
		in2 = map[2][map_x];
		in3	= map[3][map_x];

		if((out_valid==='d0)&(out!=='d0))begin
			$display("SPEC 4 IS FAIL!");
			$finish;
		end
		if((in_valid==='d0)&(out_valid!='d0))begin
			 	$display("SPEC 5 IS FAIL!");
			$finish;
		end
		@(negedge clk);
	end
	in_valid = 1'b0;
end
endtask

task wait_out_valid; begin
  wait_val_time = -1;
  while(out_valid !== 1) begin
	wait_val_time = wait_val_time + 1;
	if(wait_val_time == 3000)
	begin
		$display("SPEC 6 IS FAIL!");
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + wait_val_time;
end endtask


task check_ans; 
begin
  
  //++++++++++++++++++++++++++++++++++++++++++++++++
  // Check the answer here
	x = 'd0;
	track = initial_point + 'd1;
	step = 'd1;
	
  	while(out_valid==='b1)
	begin
		if((x>62)|(out===2'bxx)|(out===2'bzz)|(out===2'bzz)|(out===2'bxz)|(out===2'bzx))//x>max-1
			begin
				$display("SPEC 7 IS FAIL!");
				$finish;
			end
		if ((track==='d0)|(track==='d5))begin
			$display ("SPEC 8-1 IS FAIL!");
			$finish;
		end

		if(((track!=='d1)&(map[track-'d2][step]=='b01)&(out==='d2))|((map[track-'d1][step]=='b01)&(out==='d0))|((map[track][step]=='b01)&(out==='d1)&(track!=='d4)))begin
			$display ("SPEC 8-2 IS FAIL!");
			$finish;
		end
		if(((track!=='d1)&(map[track-'d2][step]=='b10)&(out==='d2))|((map[track-'d1][step]=='b10)&(out==='d3))|((map[track][step]=='b10)&(out==='d1)&(track!=='d4)))begin
			$display ("SPEC 8-3 IS FAIL!");
			$finish;
		end
		if(((track!=='d1)&(map[track-'d2][step]=='b11)&(out==='d2))|((map[track-'d1][step]=='b11)&((out==='d3)|(out==='d0)))|((map[track][step]=='b11)&(out==='d1)&(track!=='d4)))begin
			$display ("SPEC 8-4 IS FAIL!");
			$finish;
		end
		if(step>'d0)begin
			if((map[track-'d1][step-'d1]=='b01)&(out==='d3))begin
				$display ("SPEC 8-5 IS FAIL!");
				$finish;
			end
		end
		if(out==='d1) track = track + 'd1;
		else if (out==='d2) track = track -'d1;

		if(out==='d0) cost = cost +'d1;
		else if(out==='d1)	cost= cost +'d2;
		else if(out==='d2)	cost= cost +'d2;
		else if(out==='d3)	cost= cost +'d4;
		



		@(negedge clk);	
		x=x+1;
		step = step + 'd1;

	end
	if((out_valid==='d0)&(out!=='d0))begin
		$display("SPEC 4 IS FAIL!");
		$finish;
	end
	if(x<62)//x>max-1
	begin
		$display("SPEC 7 IS FAIL!");
		$finish;
	end

  //+++++++++++++++++++++++++++++++++++++++++++++++
end 
endtask


task YOU_PASS_task; 
begin
//  $display ("--------------------------------------------------------------------");
//  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~            ");
//  $display ("                         Congratulations!                           ");
//  $display ("                  You have passed all patterns!                     ");
//  $display ("--------------------------------------------------------------------");        
//$display ("COST: %d",cost);   
//#(500);
$finish;
end
endtask






endmodule