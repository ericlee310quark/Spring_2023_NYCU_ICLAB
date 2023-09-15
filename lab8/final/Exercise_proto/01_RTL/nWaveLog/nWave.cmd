wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE_v2/01_RTL/SNN_CG.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
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
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[1\]"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvResizeWindow -win $_nWave1 0 23 1536 801
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[2\]"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[2\]"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[0\]"
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 13 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[1\]"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalSetScope -win $_nWave1 \
           "/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[3\]"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[0\]"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/gated_img_array\[0\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[1\]"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/gated_img_array\[0\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[2\]"
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/gated_img_array\[0\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_SNN/gated_img_array\[1\]"
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/cg_en} \
{/TESTBED/clk} \
{/TESTBED/img\[7:0\]} \
{/TESTBED/in_valid} \
{/TESTBED/ker\[7:0\]} \
{/TESTBED/out_data\[9:0\]} \
{/TESTBED/out_valid} \
{/TESTBED/rst_n} \
{/TESTBED/weight\[7:0\]} \
{/TESTBED/I_SNN/cnt\[5:0\]} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/SLEEP_CTRL} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[3\]/GATED_input__/SLEEP_CTRL} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/I_SNN/gated_img_array\[0\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TESTBED/I_SNN/gated_img_array\[2\]/GATED_input__/CLOCK_GATED} \
{/TESTBED/I_SNN/gated_img_array\[1\]/GATED_input__/CLOCK_GATED} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvExit
