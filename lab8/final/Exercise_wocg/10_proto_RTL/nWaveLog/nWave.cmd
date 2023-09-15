wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE_wocg/10_RTL/novas.fsdb}
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN"
wvZoom -win $_nWave1 145324.584063 160879.203152
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvExpandBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvCollapseBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 9 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 673503.311365 -snap {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 9 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 11 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetRadix -win $_nWave1 -format UDec
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvExpandBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetCursor -win $_nWave1 670660.477570 -snap {("G1" 0)}
wvSetCursor -win $_nWave1 670660.477570
wvSetCursor -win $_nWave1 673323.385175
wvSetCursor -win $_nWave1 673467.326127
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvExpandBus -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 675014.691358 -snap {("G1" 15)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 689966.557712 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 691477.937704 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 693061.288173 -snap {("G1" 19)}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetCursor -win $_nWave1 729090.751951 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 730422.205754 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 731969.570985 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 733516.936215 -snap {("G1" 16)}
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvSetCursor -win $_nWave1 713938.789573 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 731937.944302 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 733419.802423 -snap {("G1" 16)}
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvSetCursor -win $_nWave1 722881.047385 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 724469.268131 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 726019.674098 -snap {("G1" 16)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/L1_partial_comb\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/L1_partial_comb\[3:0\]} \
{/TESTBED/I_SNN/sub_comb_result\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvExpandBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvCollapseBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvExpandBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/nn_1\[3\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[2\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[1\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[0\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/L1_partial_comb\[3:0\]} \
{/TESTBED/I_SNN/sub_comb_result\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvExpandBus -win $_nWave1 {("G1" 14)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 724488.175521 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 725981.859318 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 724544.897691 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/nn_1\[3\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[2\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[1\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[0\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/nn_2\[3\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[2\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[1\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[0\]\[7:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/L1_partial_comb\[3:0\]} \
{/TESTBED/I_SNN/sub_comb_result\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_SNN/mult_a\[3:0\]} \
{/TESTBED/I_SNN/mult_b\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvExpandBus -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvExpandBus -win $_nWave1 {("G4" 6)}
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G4" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[3:0\]} \
{/TESTBED/I_SNN/nn_1\[3\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[2\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[1\]\[7:0\]} \
{/TESTBED/I_SNN/nn_1\[0\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/nn_2\[3\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[2\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[1\]\[7:0\]} \
{/TESTBED/I_SNN/nn_2\[0\]\[7:0\]} \
{/TESTBED/I_SNN/max_map_new\[1:0\]} \
{/TESTBED/I_SNN/max_map0\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[1\]\[1:0\]} \
{/TESTBED/I_SNN/weight_map\[0\]\[1:0\]} \
{/TESTBED/I_SNN/weight_sel\[1:0\]} \
{/TESTBED/I_SNN/nn_2\[3:0\]} \
{/TESTBED/I_SNN/ratio_result_vec\[7:0\]} \
{/TESTBED/I_SNN/nn_comb\[16:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/L1_partial_comb\[3:0\]} \
{/TESTBED/I_SNN/sub_comb_result\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/TESTBED/I_SNN/mult_a\[3:0\]} \
{/TESTBED/I_SNN/mult_a\[3\]\[7:0\]} \
{/TESTBED/I_SNN/mult_a\[2\]\[7:0\]} \
{/TESTBED/I_SNN/mult_a\[1\]\[7:0\]} \
{/TESTBED/I_SNN/mult_a\[0\]\[7:0\]} \
{/TESTBED/I_SNN/mult_b\[3:0\]} \
{/TESTBED/I_SNN/mult_b\[3\]\[7:0\]} \
{/TESTBED/I_SNN/mult_b\[2\]\[7:0\]} \
{/TESTBED/I_SNN/mult_b\[1\]\[7:0\]} \
{/TESTBED/I_SNN/mult_b\[0\]\[7:0\]} \
{/TESTBED/I_SNN/max_map1\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 11 )} 
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSelectSignal -win $_nWave1 {( "G4" 11 )} 
wvExpandBus -win $_nWave1 {("G4" 11)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 11 )} 
wvSelectSignal -win $_nWave1 {( "G4" 11 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G4" 12 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 715499.235456 -snap {("G2" 1)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 717066.400072 -snap {("G2" 1)}
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 715473.958607 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 713982.624537 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 715600.342850 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 717003.207950 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 596977.432600 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 598430.851397 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 600086.484984 -snap {("G2" 1)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 361582.031250 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 359957.812500 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 358457.343750 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 360112.500000 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 361427.343750 -snap {("G2" 1)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 360019.687500 -snap {("G1" 19)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 28 )} 
wvSetCursor -win $_nWave1 356556.758975 -snap {("G1" 28)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 366100.977725 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 363084.571475 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 366023.633975 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 364492.227725 -snap {("G1" 28)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 361413.946475 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 357670.508975 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 361506.758975 -snap {("G1" 6)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvExit
