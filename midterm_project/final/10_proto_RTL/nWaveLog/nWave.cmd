wvExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 3719043.824534 -snap {("G1" 17)}
wvGetSignalOpen -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_GLCM"
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_GLCM/clk} \
{/TESTBED/U_GLCM/rst_n} \
{/TESTBED/U_GLCM/weight_sram/read_unit_state_c\[2:0\]} \
{/TESTBED/U_GLCM/weight_sram/data_valid} \
{/TESTBED/U_GLCM/weight_sram/sram_read_out\[19:0\]} \
{/TESTBED/U_GLCM/image\[15:0\]} \
{/TESTBED/U_GLCM/image\[15\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[14\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[13\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[12\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[11\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[10\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[9\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[8\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[7\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[6\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[5\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[4\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[3\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[2\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[1\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[0\]\[79:0\]} \
{/TESTBED/U_GLCM/weight_sram/dram_addr_reg\[5:0\]} \
{/TESTBED/U_GLCM/weight_sram/last_data} \
{/TESTBED/U_GLCM/target_row_filter\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSetCursor -win $_nWave1 3705408.224152 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvExpandBus -win $_nWave1 {("G1" 25)}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_GLCM/eq_0\[1\]"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_GLCM"
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 42)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_GLCM/clk} \
{/TESTBED/U_GLCM/rst_n} \
{/TESTBED/U_GLCM/weight_sram/read_unit_state_c\[2:0\]} \
{/TESTBED/U_GLCM/weight_sram/data_valid} \
{/TESTBED/U_GLCM/weight_sram/sram_read_out\[19:0\]} \
{/TESTBED/U_GLCM/image\[15:0\]} \
{/TESTBED/U_GLCM/image\[15\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[14\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[13\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[12\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[11\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[10\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[9\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[8\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[7\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[6\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[5\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[4\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[3\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[2\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[1\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[0\]\[79:0\]} \
{/TESTBED/U_GLCM/weight_sram/dram_addr_reg\[5:0\]} \
{/TESTBED/U_GLCM/weight_sram/last_data} \
{/TESTBED/U_GLCM/target_row_filter\[15:0\]} \
{/TESTBED/U_GLCM/target_row_filter\[15\]} \
{/TESTBED/U_GLCM/target_row_filter\[14\]} \
{/TESTBED/U_GLCM/target_row_filter\[13\]} \
{/TESTBED/U_GLCM/target_row_filter\[12\]} \
{/TESTBED/U_GLCM/target_row_filter\[11\]} \
{/TESTBED/U_GLCM/target_row_filter\[10\]} \
{/TESTBED/U_GLCM/target_row_filter\[9\]} \
{/TESTBED/U_GLCM/target_row_filter\[8\]} \
{/TESTBED/U_GLCM/target_row_filter\[7\]} \
{/TESTBED/U_GLCM/target_row_filter\[6\]} \
{/TESTBED/U_GLCM/target_row_filter\[5\]} \
{/TESTBED/U_GLCM/target_row_filter\[4\]} \
{/TESTBED/U_GLCM/target_row_filter\[3\]} \
{/TESTBED/U_GLCM/target_row_filter\[2\]} \
{/TESTBED/U_GLCM/target_row_filter\[1\]} \
{/TESTBED/U_GLCM/target_row_filter\[0\]} \
{/TESTBED/U_GLCM/in_dis\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 42 )} 
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 43)}
wvSetPosition -win $_nWave1 {("G1" 43)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_GLCM/clk} \
{/TESTBED/U_GLCM/rst_n} \
{/TESTBED/U_GLCM/weight_sram/read_unit_state_c\[2:0\]} \
{/TESTBED/U_GLCM/weight_sram/data_valid} \
{/TESTBED/U_GLCM/weight_sram/sram_read_out\[19:0\]} \
{/TESTBED/U_GLCM/image\[15:0\]} \
{/TESTBED/U_GLCM/image\[15\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[14\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[13\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[12\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[11\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[10\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[9\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[8\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[7\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[6\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[5\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[4\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[3\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[2\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[1\]\[79:0\]} \
{/TESTBED/U_GLCM/image\[0\]\[79:0\]} \
{/TESTBED/U_GLCM/weight_sram/dram_addr_reg\[5:0\]} \
{/TESTBED/U_GLCM/weight_sram/last_data} \
{/TESTBED/U_GLCM/target_row_filter\[15:0\]} \
{/TESTBED/U_GLCM/target_row_filter\[15\]} \
{/TESTBED/U_GLCM/target_row_filter\[14\]} \
{/TESTBED/U_GLCM/target_row_filter\[13\]} \
{/TESTBED/U_GLCM/target_row_filter\[12\]} \
{/TESTBED/U_GLCM/target_row_filter\[11\]} \
{/TESTBED/U_GLCM/target_row_filter\[10\]} \
{/TESTBED/U_GLCM/target_row_filter\[9\]} \
{/TESTBED/U_GLCM/target_row_filter\[8\]} \
{/TESTBED/U_GLCM/target_row_filter\[7\]} \
{/TESTBED/U_GLCM/target_row_filter\[6\]} \
{/TESTBED/U_GLCM/target_row_filter\[5\]} \
{/TESTBED/U_GLCM/target_row_filter\[4\]} \
{/TESTBED/U_GLCM/target_row_filter\[3\]} \
{/TESTBED/U_GLCM/target_row_filter\[2\]} \
{/TESTBED/U_GLCM/target_row_filter\[1\]} \
{/TESTBED/U_GLCM/target_row_filter\[0\]} \
{/TESTBED/U_GLCM/in_dis\[3:0\]} \
{/TESTBED/U_GLCM/in_dis_reg\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 43 )} 
wvSetPosition -win $_nWave1 {("G1" 43)}
wvSelectSignal -win $_nWave1 {( "G1" 42 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 42)}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvExit
