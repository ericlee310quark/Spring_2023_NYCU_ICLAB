`ifdef RTL
	`timescale 1ns/1ps
	`include "CONV.v"
	`define CYCLE_TIME_clk1 10.1
	`define CYCLE_TIME_clk2 11.1
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`include "CONV_SYN.v"
	`define CYCLE_TIME_clk1 10.1
	`define CYCLE_TIME_clk2 11.1
`endif

module PATTERN(
	clk_1,
	clk_2,
	rst_n,
	in_valid,
	in_data1,
	in_data2,
	out_valid,
	out_data	
);

output reg clk_1,clk_2;
output reg rst_n;
output reg in_valid;
output reg [2:0] in_data1;
output reg [2:0] in_data2;

input out_valid;
input[7:0] out_data;


//================================================================
// parameters & integer
//================================================================
real	CYCLE_clk1 = `CYCLE_TIME_clk1;
real	CYCLE_clk2 = `CYCLE_TIME_clk2;
integer PATNUM=1000;
integer i,j,k1,k2,k,l,y,lat,total_latency;
integer patcount;
integer pat_delay;
integer ans[0:6],x[0:3],h[0:3];

//================================================================
// clock
//================================================================
always	#(CYCLE_clk1/2.0) clk_1 = ~clk_1;
initial	clk_1 = 0;
always	#(CYCLE_clk2/2.0) clk_2 = ~clk_2;
initial	clk_2 = 0;

//================================================================
// initial
//================================================================
initial begin

    rst_n = 1;    
    in_valid = 1'b0; 
	in_data1 = 'bx; 
	in_data2 = 'bx;
	
	force clk_1 = 0;
	force clk_2 = 0;
	
    total_latency = 0; 
	reset_signal_task;
	
	for(patcount=0;patcount<PATNUM;patcount=patcount+1)
	begin		
		input_task;
		compute_ans;
		wait_OUT_VALID;
		check_ans;
	end
	 
	YOU_PASS_task;
end

//================================================================
// task
//================================================================
task reset_signal_task; begin 
    #(0.5);   rst_n=0;
	
	#(2.0);
	if((out_valid !== 0)||(out_data !== 0)) begin
		fail;
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                  Output signal should be 0 after initial RESET at %t                                 ",$time);
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		
		$finish;
	end
	#(10);   rst_n=1;
	#(3);   
	release clk_1;
	release clk_2;
end endtask

task input_task; begin
	repeat(2)@(negedge clk_1);
	in_valid = 1;
	
	for(i=0;i<4;i=i+1)begin
		in_data1=$random();
		x[i]=in_data1;
		in_data2=$random();
		h[i]=in_data2;
		@(negedge clk_1);
	end

	in_data1 = 'dx;
	in_data2 = 'dx;
	in_valid = 0;
end endtask

task compute_ans; begin
		
	for(i=0;i<7;i=i+1)begin
		ans[i]=0;
		for(j=0;j<4;j=j+1)
			if(0<=i-j&&i-j<4)
				ans[i]=ans[i]+x[i-j]*h[j];
	end
	
end endtask

task wait_OUT_VALID; begin
  lat = -1;
  while(!out_valid) begin
	lat = lat + 1;
	if(lat == 40) begin
	    fail;
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                     The execution latency are over 40   cycles                                            ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		repeat(2)@(negedge clk_2);
		$finish;
	end
	@(negedge clk_2);
  end
  total_latency = total_latency + lat;
end endtask

task check_ans; begin
	y=1;
	while(out_valid)
	begin
		if(y>7)
			begin
			    fail;
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				$display ("                                                                        FAIL!                                                               ");
				$display ("                                                           Outvalid is more than 7 cycles                                                   ");
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				repeat(9) @(negedge clk_2);
				$finish;
			end		
		
		if(out_data!==ans[y-1])
				begin
					fail;
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					$display ("                                                                        FAIL!                                                               ");
					$display ("                                                                   PATTERN NO.%4d					                              ",patcount);
					$display ("                                                     Ans: %d,  Your output : %d  at %8t                                              ",ans[y-1],out_data,$time);
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					repeat(9) @(negedge clk_2);
					$finish;
				end
		@(negedge clk_2);	
		y=y+1;
	end		
	
	
end endtask

task YOU_PASS_task;begin
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OOOOOOO8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O               .o8@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.                   .o@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                         :O@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                           .o8@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@888888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88888888OOO88@@@@@@@@@@                             :@@@@@@@");
$display("@@@@@@@@@@@@8o:.          .o8@@@@@@@@@@@@@@@@@@@88Oo:.                      .:ooo                              o@@@@@@");
$display("@@@@@@@@@@8                  .8@@@@@@@@@@@@8O:.           ..::::::ooo:.                                        .8@@@@@");
$display("@@@@@@@O.                      8@@@@@8O:.        .:O88@@@@@@@@@@@@@@@@@@@@@@@88Oo.                             :8@@@@@");
$display("@@@@@@o                        :8@@8.      .:o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OO:                         o@@@@@@");
$display("@@@@@8                          :o.     .O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@8o.                      8@@@@@@");
$display("@@@@:                               o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:          :OO.                  o@@@@@8@");
$display("@@@o.                             :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.              OO:              :8@@@@@@@@");
$display("@@8.                           O8@@@@@@@@@@O:.    .oO@@@@@@@@@@@@@@@@@@@@@@@.                o88          O@@@@@@@@@@@");
$display("@@O.                         :O@@@@@@@@@@:           o@@@@@@@@@@@@@@@@@@@@@@.                 .88o.     oO@@@@@@@@@@@@");
$display("@@O.                       :8@@@@@@@@@@8:            .O@@@@@@@@@@@@@@@@@@@@@o                  .@@8O:   o8@@@@@8@@@@@@");
$display("@@@:                      8@@@@@@@@@@O.               :8@@@@@@@@@@@@@@@@@@@@8o                  O@@@@.    8@@@@@@@@@8@");
$display("@@@@o                    :@@@@@@@@@@o                 :8@@@@@@@@@@@@@@@@@@@@@@o                 O@@@@O:   .O@@@@@@@@@@");
$display("@@@@@@.                .O@@@@@@@@@@8                  O@@@@@@@@@@@@@@@@@@@@@@@@@O             .O@@@@@@@@o   :@@@@@@@@@");
$display("@@@@@@@O:.           .O@@@@@@@@@@@@o                 .8@@@@@@@@@@@@888O8@@@@@@@@@o.         .o8@@@@@@@@@@o   o8@@@@@@@");
$display("@@@@@@@@@@8.         o@@@@@@@@@@@@@:                 o@@@@@@@O:.         :O@@@@@@@@Oo.   .:8@@@@@@@@@@@@@8     @@@@@@@");
$display("@@@@@@@@@@@@@@@@:    8@@@@@@@@@@@@@8               :8@@@@8:              .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@");
$display("@@@@@@@@@@@@@@@@    :@@@@@@@@@@@@@@@O.             8@@@@@8:              o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8@@@    @@@@@@");
$display("@@@@@@@@@@@@@@@O   :@@@@@@@@@@@@@@@@@@@8O:....:O8@@@@@@@@@@@o          O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8@@@@    @@@@@");
$display("@@@@@@@@@@@@@@8:  :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Oo.    .o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@");
$display("@@@@@@@@@@@@@8:   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8  :@@@@@@@@@@@@@@@@@@@@@@@8Ooo\033[0;40;31m:::::\033[0;40;37moOO8@@8OOo   o@@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8. .8@@8o:O@@@@@@@@@@@@@8O\033[0;40;31m:::::::::::::::\033[0;40;37mO@@@O   :@@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@88888@@@@@@@@@@@@@@@@@@O:oO8@8.  .:    o@@@@@@@@@@@@O\033[0;40;31m::::::::::::::::::\033[0;40;37mo8@O   :8@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@\033[1;40;31mO\033[0;40;31m:::::::::::::\033[0;40;37mo8@@@@@@@@@@@@8.              :@@@@@@@@@@8o\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@:   .@@");
$display("@@@@@@@@@@@@O.  .8@@@@@@@@@@8Oo\033[0;40;31m.:::::::::::::::\033[0;40;37moO@@@@@@@@@@8:              .@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::::\033[0;40;37mo8O    @@");
$display("@@@@@@@@@@@@o   O@@@@@@@@@@8o\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@@@@@@@@@O              .@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::::\033[0;40;37mo8O    @@");
$display("@@@@@@@@@@@@O.  :8@@@@@@@@o\033[0;40;31m::::::::::::::::::::::::\033[0;40;37m8@@@@@@@@@              :@@@@@@@@@@8o\033[0;40;31m:::::::::::::::::::::\033[0;40;37mO@o    @@");
$display("@@@@@@@@@@@@8:  :8@@@@@@@8\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37m8@@@@@@@@@              O@@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@:   :@@");
$display("@@@@@@@@@@@@@O   O@@@@@@8O\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37mo8@@@@@@@@O           .8@@@@@@@@@@@@@8o\033[0;40;31m::::::::::::::::\033[0;40;37mo8@@@   .O@@");
$display("@@@@@@@@@@@@@O   O8@@@@@8O\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37mo8@@@@@@@@@8:       .O@@@@@@@@@@@@@@@@@O\033[0;40;31m::::::::::::::\033[0;40;37mo@@@@8   .8@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@O\033[0;40;31m::::::::::::::::::::::::.\033[0;40;37mO8@@@@8OOooo:.     :@@@@@@@@@@@@@@@@@@@@8OOo\033[0;40;31m::::::\033[0;40;37mooO8@@@@@o   :@@@");
$display("@@@@@@@@@@@@@8.  o8@@@@@@@\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37m8@8O.                  .:O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o   o@@@@");
$display("@@@@@@@@@@@@@8:  .O@@@@@@@O\033[0;40;31m:::::::::::::::::::::::\033[0;40;37mo@O.    .:oOOOo::.           .:OO8@@@@@@@@@@@@@@@@@@@@@@@@O.  :8@@@@");
$display("@@@@@@@@@@@@@@8.  :8@@@@@@@8o\033[0;40;31m:::::::::::::::::::\033[0;40;37mO8@O    8@@@@@@@@@@@@@@@@@8O..         :oO8@@@@@@@@@@@@@@@8o.  .8@@@@@");
$display("@@@@@@@@@@@@@@@O   :8@@@@@@@@8O\033[0;40;31m:::::::::::::::\033[0;40;37mO8@@@:   .@@@@@@@@@@@@@@@@@@@@@@88Oo:.       .:O8@@@@@@@@@@@.    O@@@@@@");
$display("@@@@@@@@@@@@@@@8    O@@@@@@@@@@8Oo\033[0;40;31m::::::::\033[0;40;37mooO8@@@@@O.   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.      .o@@@@@@@@@o    O@@@@@@@");
$display("@@@@@@@@@@@@@@@@o    8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:    :O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.    :O@@@8o.  .o@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@:    :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:      ...:oO8@@@@@@@@@@@@@@@@@@@@@@@@@O:   .O8.    .O@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@O:    :@@@@@@@@@@@@@@@@@@@@@@@@@@@O.   \033[0;40;33m...\033[0;40;37m          O@@@@@@@@@@@@@@@@@@@@@@@O       .O8@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@:    :O@@@@@@@@@@@@@@@@@@@@@@@@@O   \033[0;40;33m:O888Ooo:..\033[0;40;37m    :8@@@@@@@@@@@@@@@@@@@@O:     :O@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o     .O8@@@@@@@@@@@@@@@@@@@@@O:  \033[0;40;33m.o8888888888O.\033[0;40;37m  .O@@@@@@@@@@@OO888@8O:.    :O@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@O        o8@@@@@@@@@@@@@@@@@@@o   \033[0;40;33m:88888888888o\033[0;40;37m   o8@@@@@@@:              o8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@:          .:88@@@@@@@@@@@@@8:   \033[0;40;33mo8888O88888O.\033[0;40;37m  .8@@@@@@@O    \033[1;40;33m..\033[0;40;37m     .::O@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@O.                  .:o          \033[0;40;33m8888\033[0;40;37m@@@@\033[0;40;33m888o.\033[0;40;37m  o8@@@@@8o   \033[0;40;33mo88o.\033[0;40;37m   @@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@o        .OOo:.                 \033[0;40;33mO88\033[0;40;37m@@@@@\033[0;40;33m888o.\033[0;40;37m  :8@@@@@o   \033[0;40;33m:O88.\033[0;40;37m   .@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@8o         :@@@@@O:             \033[0;40;33m.O8\033[0;40;37m@@@@\033[0;40;33m8888O:\033[0;40;37m   .O88O:   \033[0;40;33m.O88O\033[0;40;37m    O@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@:                             \033[0;40;33m.o8\033[0;40;37m@@@@\033[0;40;33m\033[0;40;33m888888O:\033[0;40;37m         \033[0;40;33m.888O:\033[0;40;37m   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@8o                            \033[0;40;33m.O\033[0;40;37m@@@@\033[0;40;33m\888888888Oo:...ooO8888:   \033[0;40;37m:8@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o                         \033[0;40;33mo8\033[0;40;37m@@@@\033[0;40;33m888888888888888888888O.\033[0;40;37m  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.                      \033[0;40;33m.8\033[0;40;37m@@@@\033[0;40;33m888888888888888888888O:\033[0;40;37m   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:.                 \033[0;40;33m.o8\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888Oo\033[0;40;37m   :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OOo::::::.   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888o.\033[0;40;37m   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888.\033[0;40;37m   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888O\033[0;40;37m   .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.   \033[0;40;33mO8888\033[0;40;37m@@@\033[0;40;33m88888888888888888888O.\033[0;40;37m   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o    \033[0;40;33m8888888888888888888888888888o\033[0;40;37m   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.    \033[0;40;33m. ..:oOO8888888888888888888o.\033[0;40;37m  .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.           \033[0;40;33m..:oO8888888888888O.\033[0;40;37m  .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OO.             \033[0;40;33m.oOO88O.\033[0;40;37m   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88:..          \033[0;40;33m...\033[0;40;37m    8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88Ooo:.          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OoOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display ("----------------------------------------------------------------------------------------------------------------------");
$display ("                                                  Congratulations!                						            ");
$display ("                                           You have passed all patterns!          						            ");
$display ("                                           Your total latency = %d ns         						            ",total_latency*CYCLE_clk2);
$display ("----------------------------------------------------------------------------------------------------------------------");
$finish;	
end endtask

task fail;begin
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8Oo::::ooOOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:   ..::..       .:o88@@@@@@@@@@@8OOoo:::..::oooOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@Oo..                   ..:.:..      .:O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.  .8@@@@@@@@@@@@@@@@@@@@@@88888888888@@@@@@@@@@@@@@@@@8.    :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:. .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :o@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  8@@@@@@@@@@@@@8@@@@@@@@8o::o8@@@@@8ooO88@@@@@@@@@@@@@@@@@@@@@@@@8:.  .:ooO8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  :@@@@@@@@@@O      :@@@O   ..  :O@@@:       :@@@@OoO8@@@@@@@@@@@@@@@@Oo...     ..:o@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  :8@@@@@@@@@:  .@@88@@@8:  o@@o  :@@@. 0@@@.  O@@@      .O8@@@@@@@@@@@@@@@@@@8OOo.    O8@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o@@@@@@@@@@O.      :8@8:  o@@O. .@@8  000o  .8@@O  O8O:  .@@o .O@@@@@@@@@@@@@@@@@@@o.  .o@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. :8@@@@@@@@@@@@@@@:  .o8:  o@@o. .@@O  ::  .O@@@O.  o0o.  :@@O. :8@8::8@@@@@@@@@@@@@@@8O  .:8@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o8@@@@@@@@@@@OO@@8.  o@8   ''  .O@@o  O@:  :O@@:  ::   .8@@@O. .:   .8@@@@@@@@@@@@@@@@@@O   8@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .O@@@@@@@@@@O      .8@@@@Oo::oO@@@@O  8@8:  :@8  :@O. :O@@@@8:   .o@@@@@@@@@@@@@@@@@@@@@@o  :8@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:  8@@@@@@@@@@@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:8@8:  :@@@@:  .O@@@@@@@@@@@@@@@@@@@@@@@@8:  o@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:  .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OoO@@@O  :8@@@@@@@@@@@@@@@@@@@@@@@@@@8o  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@8::@@@@@88@@@@@@@@@@@@@@@@@@@@@@@  :8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  .:8@@@@@@@@@@@@@@@@@@@88OOoo::....:O88@@@@@@@@@@@@@@@@@@@@8o .8@@@@@@@@@@@@@@@@@@@@@@:  o@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.   ..:o8888888OO::.      ....:o:..     oO@@@@@@@@@@@@@@@@8O..@@ooO@@@@@@@@@@@@@@@@@@O. :@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Oo::.          ..:OO@@@@@@@@@@@@@@@@O:  .o@@@@@@@@@@@@@@@@@@@O   8@@@@@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8O   .8@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@. o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O    .O@@@@@@@@@@@@@@@@@@8..8@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:           ..:O88@888@@@@@@@@@@@@@@@@@@@@@@@O  O@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.                          ..:oO@@@@@@@@@@@@@@@o  @@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.                      .o@@8O::.    o8@@@@@@@@@@@O  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                         :O@@@@@@@o.  :O8@@@@@@@@8  o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88OO888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8888OOOOO8@@8888@@@@@O.                          .@@@@@@@@@:.  :@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@8o:           O8@@@@@@@@@@@@@@@@@@@8OO:.                     .::                            :8@@@@@@@@@.  .O@@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@@@.                 o8@@@@@@@@@@@O:.         .::oOOO8Oo:..::::..                                 o@@@@@@@@@@8:  8@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@:                    .@@@@@Oo.        .:OO@@@@@@@@@@@@@@@@@@@@@@@@@o.                            O@@@@@@@@@@@@  o8@@@@@O. o@");
$display("@@@@@@@@@@@@@@:                       o88.     ..O88@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@888O.                     .8@@@@@@@@@@@@  o8@@@@@: .O@");
$display("@@@@@@@@@@@@O:                             :o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                  .8@@@@@@@@@@@8o  8@@@@@O  O@@");
$display("@@@@@@@@@@@O.                            :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.              :8@@@@@@@@@@8.  .O@@@@o.  :@@@");
$display("@@@@@@@@@@@:                          :O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:          .o@@@@@@@@@8o   .o@@@8:.  .@@@@@");
$display("@@@@@@@@@@@.                        O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.    .o8@@@@@@@@@@O  :O@@8o:   .O@@@@@@@");
$display("@@@@@@@@@@@.                      :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:   o8@@@@@@@@8           oO@@@@@@@@@@");
$display("@@@@@@@@@@@:                     o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.   .@@@@@@@O.      .:o8@@@@@@@@@@@@@");
$display("@@@@@@@@@@@8o                   8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   :@@@@O     o8@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@8.               .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   .@@@8..:8@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@8:            .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@8O.        8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@8o   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   O@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O   :@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@8   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   8@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:..   .:o@@@@@@@@@@@@@@@@@@8.  O@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.         .:@@@@@@@@@@@@@@@@@:  :O@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@O.  o@@@@@@@@@@@@@@@@@@@@@@8OOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@8.             .@@@@@@@@@@@@@@@@.  .O@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  .@@@@@@@@@@@@@@@@@@@8:.       :8@@@@@@@@@@@@@@@@@@@@@@@@8.               o8@@@@@@@@@@@@@o. .:@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@O            .@@@@@@@@@@@@@@@@@@@@@@@@@:                .8@@@@@@@@@@@@O.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@:             .8@@@@@@@@@@@@@@@@@@@@@@@@O:                o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@8:               8@@@@@@@@@@@@@@@@@@@@@@@@@@.               o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@o.                8@@@@@@@@@@@@@@@@@@@@@@@@@@8o             .8@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@8:  .@@@@@@@@@@@@@                 :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.        O8@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@o   8@@@@@@@@@@@@.               :8@@@@@@@@@          :8@@@@@@@@@@@8OoooO@@@@@@@@@@@@@@@@@@.  .o@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@88O:   O@@@@@@@@@@@@O:             .@@@@@@@@O             .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8   :8@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@O:.       :O8@@@@@@@@@@8o           :O@@@@@@@8:             :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:       :o@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@o              ..:8@@@@@@@@@8o:::.:O8@@@@@@@@@@@8.           :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:.             o@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@8o                   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:.     .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                  o8@@@@@@@@@@@@@@@");
$display("8OOOooooOOoo:.                    :OOOOOOOOOO8888OOOOOOOOOOOoo:ooOOOo: .OOOOOOOOOO888OOooOO888OOOOOooO8:                   .:OOOOOOOOOOO88@@");
$display("            .                                                                                                                               ");
$display("@@@@@@@@@@@@@@8o                 .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                    :8@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@8O.             o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o                 .@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@::.       :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O..         .:8@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@@@@@@@@");
end
endtask


endmodule
