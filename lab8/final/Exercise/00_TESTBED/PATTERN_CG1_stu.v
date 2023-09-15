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
// 04/06                SNN Pattern w/ CG, cg_en = 1
/**************************************************************************/
`define CYCLE_TIME   15
`define PAT_NUM   10
`define MAX_CYCLE  1000
`define SEED       2023
`define CG_EN         1
`define DEBUG         0

//pragma protect begin_protected
//pragma protect encrypt_agent="NCPROTECT"
//pragma protect encrypt_agent_info="Encrypted using API"
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=prv(CDS_RSA_KEY_VER_1)
//pragma protect key_method=RSA
//pragma protect key_block
Cad92ojBY7o8czQxVGnLTH8h7ppcsHZgHoHHvgqk5KWtp29c+X9Mywmf44Y9y75R
15pNc6Va9ks23lZtFPLN7PgMhUpwU/uqMhNSDSE6bEr2ApkS0bu2gQkPjTulnaDf
w3cQ+i6m9IKUgy5IIrmVpKHEJFiJu62Z6jTUI+ep06oWFvAH6sdLAFJrNx0Jr9N7
PW7FtVupCPpgSvvG4o61gZ5Qzmc1UUqMsYTQ1AldaNwVqxHO2NdpQvmyRg0lUo0N
zbwHHw4gVxeQhqB5Qp/ykE7fiCJrjUZwgSsZJA6VjbFDT7EAFCPCUMh0D6IRFlD7
p1PwXxl35uWeohTurM04ZQ==
//pragma protect end_key_block
//pragma protect digest_block
2YIlSqGPDpS9BqIAPlTQe4mAZr8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
LnAipUWu+Xdd7UscC/d22esrJug=
//pragma protect end_digest_block
//pragma protect end_protected