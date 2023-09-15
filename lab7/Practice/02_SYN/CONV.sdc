set_false_path -from 	clk_1	 -to 	clk_2	

#set_multicycle_path 2 -setup -end -from [get_cells "clk_1"] -to [get_cells "clk_2"]
#set_multicycle_path 1 -hold  -end -from  [get_cells "clk_1"] -to [get_cells "clk_2"]

#set_multicycle_path 2 -setup -end -from [get_cells "      "] -to [get_cells "      "]
#set_multicycle_path 1 -hold  -end -from  [get_cells "      "] -to [get_cells "      "]
set_multicycle_path 2 -setup -end -from clk_1 -to clk_2
set_multicycle_path 1 -hold  -end -from  clk_1 -to clk_2

#set_multicycle_path 2 -setup -end -from [get_cells "      "] -to [get_cells "      "]
#set_multicycle_path 1 -hold  -end -from  [get_cells "      "] -to [get_cells "      "]

set_multicycle_path 2 -setup -end -from clk_2 -to clk_1
set_multicycle_path 1 -hold  -end -from  clk_2 -to clk_1