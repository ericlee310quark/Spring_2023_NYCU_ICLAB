wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab10/Exercise/01_RTL/OSB.fsdb}
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08175a18"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
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
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_b"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_p"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
{/TESTBED/check_inst/assert_5_rout0} \
{/TESTBED/check_inst/assert_5_rout1} \
{/TESTBED/check_inst/assert_5_rout3} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 0.605927 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst/assert_1"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst/assert_5_1"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/act_pass} \
{/TESTBED/check_inst/act_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/act_pass} \
{/TESTBED/check_inst/act_state\[3:0\]} \
{/TESTBED/check_inst/curr_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/id_valid} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/act_pass} \
{/TESTBED/check_inst/act_state\[3:0\]} \
{/TESTBED/check_inst/curr_state\[3:0\]} \
{/TESTBED/check_inst/in_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetCursor -win $_nWave1 63688.906053 -snap {("G2" 4)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/check_inst"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/act_valid} \
{/TESTBED/inf/amnt_valid} \
{/TESTBED/inf/complete} \
{/TESTBED/inf/err_msg\[3:0\]} \
{/TESTBED/inf/item_valid} \
{/TESTBED/inf/num_valid} \
{/TESTBED/inf/out_info\[31:0\]} \
{/TESTBED/inf/out_valid} \
{/TESTBED/inf/id_valid} \
{/TESTBED/check_inst/cnt\[3:0\]} \
{/TESTBED/inf/rst_n} \
{/TESTBED/dut_p/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/check_inst/act_pass} \
{/TESTBED/check_inst/act_state\[3:0\]} \
{/TESTBED/check_inst/curr_state\[3:0\]} \
{/TESTBED/check_inst/in_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 32937.653846 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 33513.022699 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 33504.170870 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 34566.390290 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 35318.795712 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 36381.015132 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 37398.975410 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 33504.170870 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 33504.170870 -snap {("G1" 10)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 37941.149905 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 38516.518758 -snap {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 69221.298865 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 63423.351198 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 64059.281841 -snap {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 64944.592055 -snap {("G1" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 63996.045397 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 69497.616015 -snap {("G1" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 64030.825441 -snap {("G1" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
