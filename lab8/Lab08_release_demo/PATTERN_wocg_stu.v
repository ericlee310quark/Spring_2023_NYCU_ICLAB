/**************************************************************************/
// Copyright (c) 2023, OASIS Lab
// MODULE: PATTERN
// FILE NAME: PATTERN.v
// VERSRION: 1.0
// DATE: Mar 31, 2023
// AUTHOR: Kuan-Wei Chen, NYCU IEE
// CODE TYPE: RTL or Behavioral Level (Verilog)
// DESCRIPTION: 2023 Spring IC Lab / Exersise Lab08 / SNN
// MODIFICATION HISTORY:
// Date                 Description
// 04/06                SNN Pattern w/o CG
/**************************************************************************/
`define CYCLE_TIME   15
`define PAT_NUM   20000
`define MAX_CYCLE  1000
`define SEED       2023
`define DEBUG         1

//pragma protect begin_protected
//pragma protect encrypt_agent="NCPROTECT"
//pragma protect encrypt_agent_info="Encrypted using API"
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=prv(CDS_RSA_KEY_VER_1)
//pragma protect key_method=RSA
//pragma protect key_block
E/qI/fhDzeGwOvc7Ll/qsaRoZ+yWrQb/VOnIvku17Uchxmm0uHYKywo9j7jb8AaZ
QhbZVviIpOXzbpGmMIVNUvpLKxm4CrVLbPTr7PyfuKS0Ob9zvBUYFXkpeG6lf9nR
S1CqSYLT3a0zHt7SU40JHWbwD8XsMk1d71JgesNp5+rvjKAPR9fKKR9hAVtcFB0a
QzAus5PxXsBR/E/EM7+aKFxG3b9nS+XoqejslveT+vY84+2qTIYJdaIQ1SfFSZqp
jDuo+4RQn6z+5SRB2rya0t8GCFBTs8DcfU++WV8j1nO5xqHXW12K7WLliFvmlXll
nPcWgshTw8/+tTEGWyfVOA==
//pragma protect end_key_block
//pragma protect digest_block
/nQHSBEECdP/j0HXIZo5QSbK4vE=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
XHWyP6m001M+pcFhOLcbaQjxFdQ=
//pragma protect end_digest_block
//pragma protect end_protected
