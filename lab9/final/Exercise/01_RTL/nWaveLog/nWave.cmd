wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab09/Exercise/01_RTL/OSB.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08175a18"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/D} \
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
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvResizeWindow -win $_nWave1 8 31 1536 801
wvSetCursor -win $_nWave1 0.000000
wvSetCursor -win $_nWave1 0.000000
wvSetCursor -win $_nWave1 46158.312098
wvSetCursor -win $_nWave1 104235.228755
wvSetCursor -win $_nWave1 104708.647341
wvSetCursor -win $_nWave1 104945.356634
wvSetCursor -win $_nWave1 45689.130333
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 85559.157065 -snap {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/test_pp"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_p"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/inf"
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvGetSignalSetScope -win $_nWave1 "/TESTBED/dut_p"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/D} \
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
{/TESTBED/dut_p/last_user_INFO} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetCursor -win $_nWave1 99725.870371
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvExpandBus -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvCollapseBus -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvExpandBus -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvCollapseBus -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetCursor -win $_nWave1 84423.038181 -snap {("G1" 12)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 83107.269373
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/inf/D} \
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
{/TESTBED/dut_p/last_user_INFO} \
{/TESTBED/dut_p/last_user_shop_info} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvExpandBus -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvCollapseBus -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvExpandBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvScrollUp -win $_nWave1 5
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvCollapseBus -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetCursor -win $_nWave1 104580.653192 -snap {("G2" 0)}
wvExit
