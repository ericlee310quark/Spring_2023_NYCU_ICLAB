# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.03
# platform  : Linux 3.10.0-1160.88.1.el7.x86_64
# version   : 2023.03 FCS 64 bits
# build date: 2023.03.29 16:16:18 UTC
# ----------------------------------------
# started   : 2023-04-18 23:37:25 CST
# hostname  : ee24.EEHPC
# pid       : 239004
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:36678' '-style' 'windows' '-data' 'AAAAhnicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpOGA8QGUYcPIgAwYAxtQaAYGVphCmAogFmHQZShmKGUoYEhlKGLIYchkyGMoAakFABcpDd4=' '-proj' '/RAID2/COURSE/iclab/iclab034/Lab06/jgproject/sessionLogs/session_0' '-init' '-hidden' '/RAID2/COURSE/iclab/iclab034/Lab06/jgproject/.tmp/.initCmds.tcl'
check_superlint -init
check_superlint -restore -file /RAID2/COURSE/iclab/iclab034/Lab06/Exercise/01_RTL/EC_TOP.v
config_rtlds -rule  -enable -category {BLACKBOX FILEFORMAT CODINGSTYLE SIM_SYNTH SYNTHESIS STRUCTURAL} 
analyze -v2k {/RAID2/COURSE/iclab/iclab034/Lab06/Exercise/01_RTL/EC_TOP.v} ; analyze -v2k {/RAID2/COURSE/iclab/iclab034/Lab06/Exercise/01_RTL/INV_IP.v} ; 
elaborate
get_clock_info -gui
clock clk -factor 1 -phase 1
reset -expression !rst_n;
check_superlint -extract 
check_superlint -prove  -bg
