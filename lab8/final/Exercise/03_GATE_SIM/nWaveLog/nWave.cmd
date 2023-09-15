wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE/03_GATE_SIM/SNN_SYN_CG.fsdb}
wvResizeWindow -win $_nWave1 0 23 1536 801
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1214664.469436 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1169515.070692 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1185438.729604 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1200197.242742 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1214567.373955 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1198643.715043 -snap {("G1" 2)}
wvExit
