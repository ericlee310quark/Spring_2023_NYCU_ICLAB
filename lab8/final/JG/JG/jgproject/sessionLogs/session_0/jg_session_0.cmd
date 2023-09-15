# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.03
# platform  : Linux 3.10.0-1160.88.1.el7.x86_64
# version   : 2023.03 FCS 64 bits
# build date: 2023.03.29 16:16:18 UTC
# ----------------------------------------
# started   : 2023-04-24 12:28:25 CST
# hostname  : ee24.EEHPC
# pid       : 210483
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:46286' '-style' 'windows' '-data' 'AAAAnHicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpOGA8QGUYcPIgAwYAxtQaAYGVphCKM0ExBwMugzFDKkMyUC2HEMWQzpDPJQfz1DEUMqQx2DEoMdQAuTnAFVwAQBjlxEN' '-proj' '/RAID2/COURSE/iclab/iclab034/Lab08/JG/jgproject/sessionLogs/session_0' '-init' '-hidden' '/RAID2/COURSE/iclab/iclab034/Lab08/JG/jgproject/.tmp/.initCmds.tcl' 'jg_sec_run2.tcl'
clear -all 

set_proofgrid_max_local_jobs 10
check_sec -analyze -sv -both ../EXERCISE/01_RTL/GATED_OR.v
check_sec -analyze -sv -both ../EXERCISE/01_RTL/SNN.v 
check_sec -elaborate -both  -top SNN -disable_x_handling -disable_auto_bbox
check_sec -setup

#clock clk -both_edge
clock clk -both_edge 
reset ~rst_n

check_sec -gen
check_sec -interface

assume cg_en==0
assume SNN_imp.cg_en==1
check_sec -waive -waive_signals cg_en
check_sec -waive -waive_signals SNN_imp.cg_en

check_sec -interface


set_sec_autoprove_strategy design_style
set_sec_autoprove_design_style_type clock_gating


check_sec -prove -bg
