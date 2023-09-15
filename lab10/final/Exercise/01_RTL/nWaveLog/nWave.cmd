wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab10/Exercise/01_RTL/OSB.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08175a18"
wvGetSignalSetScope -win $_nWave1 "/usertype"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/test_p"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_p"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_b"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dram_r"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/check_inst/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetCursor -win $_nWave1 33960.797491 -snap {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/check_inst/clk} \
{/TESTBED/check_inst/is_6} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/check_inst/clk} \
{/TESTBED/check_inst/is_6} \
{/TESTBED/check_inst/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 32925.456989 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 33016.411290 -snap {("G1" 4)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 32743.548387 -snap {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
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
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/check_inst/clk} \
{/TESTBED/check_inst/is_6} \
{/TESTBED/check_inst/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/cnt\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 38483.172043 -snap {("G2" 1)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/check_inst/clk} \
{/TESTBED/check_inst/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/cnt\[3:0\]} \
{/TESTBED/inf/act_valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExit
