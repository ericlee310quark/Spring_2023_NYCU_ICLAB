 
****************************************
Report : resources
Design : NN
Version: T-2022.03
Date   : Fri Apr  7 23:10:01 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/NN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_1         | DW_cmp         | width=6    | gt_197 (NN.v:197)          |
| add_x_7        | DW01_inc       | width=6    | add_232 (NN.v:232)         |
| lt_x_9         | DW_cmp         | width=6    | lt_251 (NN.v:251)          |
| lt_x_14        | DW_cmp         | width=6    | lt_269 (NN.v:269)          |
| M0             | DW_fp_mult     | sig_width=23 | M0 (NN.v:159)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A0             | DW_fp_add      | sig_width=23 | A0 (NN.v:160)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A6             | DW_fp_add      | sig_width=23 | A6 (NN.v:163)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| M1             | DW_fp_mult     | sig_width=23 | M1 (NN.v:165)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A1             | DW_fp_add      | sig_width=23 | A1 (NN.v:166)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| M2             | DW_fp_mult     | sig_width=23 | M2 (NN.v:168)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A2             | DW_fp_add      | sig_width=23 | A2 (NN.v:169)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| M3             | DW_fp_mult     | sig_width=23 | M3 (NN.v:171)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A3             | DW_fp_add      | sig_width=23 | A3 (NN.v:172)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| M4             | DW_fp_mult     | sig_width=23 | M4 (NN.v:174)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A4             | DW_fp_add      | sig_width=23 | A4 (NN.v:175)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| M5             | DW_fp_mult     | sig_width=23 | M5 (NN.v:177)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A5             | DW_fp_add      | sig_width=23 | A5 (NN.v:178)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| REC_0          | DW_fp_recip    | sig_width=23 | REC_0 (NN.v:187)         |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
|                |                | faithful_round=0 |                      |
| EXP_0          | DW_fp_exp      | sig_width=23 | EXP_0 (NN.v:189)         |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
|                |                | arch=2     |                            |
| gt_x_150       | DW_cmp         | width=6    | gt_202 (NN.v:202)          |
|                |                |            | gt_207 (NN.v:207)          |
| gt_x_151       | DW_cmp         | width=6    | gt_203 (NN.v:203)          |
|                |                |            | gt_208 (NN.v:208)          |
| DP_OP_77_231_7241               |            |                            |
|                | DP_OP_77_231_7241 |         |                            |
=============================================================================

Datapath Report for DP_OP_77_231_7241
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_77_231_7241    | mult_403 add_410 add_431 mult_426 mult_418 add_550  |
|                      | add_551 add_549                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 26    |                                          |
| I3    | PI   | Unsigned | 28    |                                          |
| I4    | PI   | Unsigned | 14    |                                          |
| I5    | PI   | Unsigned | 14    |                                          |
| T4    | IFO  | Unsigned | 35    | I1 * I2                                  |
| T35   | IFO  | Unsigned | 21    | T4[34:14]                                |
| T6    | IFO  | Unsigned | 28    | I5 * I5                                  |
| T38   | IFO  | Unsigned | 14    | T6[27:14]                                |
| T7    | IFO  | Unsigned | 28    | I4 * T38                                 |
| T39   | IFO  | Unsigned | 14    | T7[27:14]                                |
| T40   | IFO  | Unsigned | 25    | O2[27:3]                                 |
| O1    | PO   | Unsigned | 28    | I3 + T35                                 |
| O2    | PO   | Unsigned | 28    | O1 + T39                                 |
| O3    | PO   | Unsigned | 25    | T40 + $unsigned(2'b10)                   |
| O4    | PO   | Unsigned | 25    | T40 + $unsigned(2'b11)                   |
| O5    | PO   | Unsigned | 25    | T40 + $unsigned(1'b1)                    |
==============================================================================


Resource Report for Ungrouped Hierarchy EXP_0/U2 in file ./DW_exp2__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_95J1_123_8617             |            |                            |
|                | DP_OP_95J1_123_8617 |       |                            |
=============================================================================

Datapath Report for DP_OP_95J1_123_8617
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_95J1_123_8617  | mult_3595 add_3595 mult_3597 add_3597 add_3600      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 29    |                                          |
| I2    | PI   | Signed   | 27    |                                          |
| I3    | PI   | Unsigned | 56    |                                          |
| I4    | PI   | Unsigned | 26    |                                          |
| I5    | PI   | Unsigned | 53    |                                          |
| T83   | IFO  | Signed   | 57    | I1 * I2                                  |
| T84   | IFO  | Signed   | 58    | T83 + I3                                 |
| T90   | IFO  | Signed   | 32    | T84[57:26]                               |
| T85   | IFO  | Signed   | 56    | T90 * I4                                 |
| T86   | IFO  | Unsigned | 56    | T85 + I5                                 |
| T92   | IFO  | Unsigned | 28    | T86[55:28]                               |
| O1    | PO   | Unsigned | 28    | T92 + $unsigned(2'b10)                   |
==============================================================================


Resource Report for Ungrouped Hierarchy EXP_0 in file ./DW_fp_exp__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_4       | DW_mult_uns    | a_width=33 | mult_219                   |
|                |                | b_width=33 |                            |
| sub_x_5        | DW01_sub       | width=9    | sub_221                    |
| gte_x_6        | DW_cmp         | width=9    | gte_232                    |
| add_x_9        | DW01_add       | width=26   | add_270                    |
| add_x_11       | DW01_inc       | width=24   | add_276_round              |
| U1             | DW01_ash       | A_width=41 | U1                         |
|                |                | SH_width=9 |                            |
| U2             | DW_exp2        | op_width=26 | U2                        |
|                |                | arch=2     |                            |
|                |                | err_range=1 |                           |
| sub_x_16       | DW01_sub       | width=10   | add_242 sub_242            |
| add_x_17       | DW01_dec       | width=2    | add_247_ni_ni sub_add_247  |
| sub_x_18       | DW01_sub       | width=26   | add_247_ni_ni sub_add_247  |
| add_x_19       | DW01_add       | width=8    | add_260 add_261            |
| add_x_20       | DW01_add       | width=10   | add_260 add_261            |
=============================================================================


Resource Report for Ungrouped Hierarchy REC_0 in file ./DW_fp_recip__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_2       | DW_mult_uns    | a_width=25 | mult_399                   |
|                |                | b_width=9  |                            |
| mult_x_3       | DW_mult_uns    | a_width=25 | mult_552                   |
|                |                | b_width=25 |                            |
| gte_x_9        | DW_cmp         | width=9    | gte_649                    |
| eq_x_14        | DW_cmp         | width=10   | eq_650 eq_678              |
| DP_OP_79J1_124_5437             |            |                            |
|                | DP_OP_79J1_124_5437 |       |                            |
=============================================================================

Datapath Report for DP_OP_79J1_124_5437
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_79J1_124_5437  | sub_342 add_342 sub_574_ni                          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 10    | -I1 - I2 + $unsigned(10'b0011111110)     |
==============================================================================


Resource Report for Ungrouped Hierarchy A5
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A6
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy A0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*17723/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*17723/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M5 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_155_7736              |            |                            |
|                | DP_OP_108_155_7736 |        |                            |
| DP_OP_109_156_8092              |            |                            |
|                | DP_OP_109_156_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_155_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_155_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_156_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_156_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*27528/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*27528/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M4 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_159_7736              |            |                            |
|                | DP_OP_108_159_7736 |        |                            |
| DP_OP_109_160_8092              |            |                            |
|                | DP_OP_109_160_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_159_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_159_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_160_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_160_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*37190/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*37190/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M3 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_163_7736              |            |                            |
|                | DP_OP_108_163_7736 |        |                            |
| DP_OP_109_164_8092              |            |                            |
|                | DP_OP_109_164_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_163_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_163_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_164_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_164_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*46850/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*46850/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M2 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_167_7736              |            |                            |
|                | DP_OP_108_167_7736 |        |                            |
| DP_OP_109_168_8092              |            |                            |
|                | DP_OP_109_168_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_167_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_167_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_168_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_168_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*56455/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*56455/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M1 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_171_7736              |            |                            |
|                | DP_OP_108_171_7736 |        |                            |
| DP_OP_109_172_8092              |            |                            |
|                | DP_OP_109_172_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_171_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_171_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_172_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_172_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*66244/UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*66244/UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M0 in file ./DW_fp_mult__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_2        | DW_cmp         | width=9    | gte_401                    |
| gte_x_4        | DW_cmp         | width=9    | gte_403                    |
| add_x_11       | DW01_add       | width=7    | add_480_4                  |
| add_x_12       | DW01_add       | width=24   | add_528                    |
| add_x_13       | DW01_add       | width=26   | add_529                    |
| eq_x_14        | DW_cmp         | width=10   | eq_553                     |
| lt_x_21        | DW_cmp         | width=8    | lt_615                     |
| lt_x_23        | DW_cmp         | width=8    | lt_619                     |
| add_x_24       | DW01_add       | width=3    | add_622                    |
| add_x_25       | DW01_add       | width=2    | add_623_ni                 |
| UL3            | DW_lzd         | a_width=24 | UL3                        |
| UL4            | DW_lzd         | a_width=24 | UL4                        |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| DP_OP_108_175_7736              |            |                            |
|                | DP_OP_108_175_7736 |        |                            |
| DP_OP_109_176_8092              |            |                            |
|                | DP_OP_109_176_8092 |        |                            |
=============================================================================

Datapath Report for DP_OP_108_175_7736
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_108_175_7736   | add_384_4 sub_384_3 add_387 lte_399 lt_400          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T58   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 10    | I1 + I2 - $unsigned(7'b1111111)          |
| O2    | PO   | Unsigned | 8     | T58 + $unsigned(1'b1)                    |
| O3    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 < $signed(1'b0)                       |
==============================================================================

Datapath Report for DP_OP_109_176_8092
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_109_176_8092   | add_535 add_568 add_569                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 23    |                                          |
| I2    | PI   | Unsigned | 23    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| T69   | IFO  | Signed   | 22    | O1[21:0]                                 |
| T71   | IFO  | Signed   | 21    | O1[20:0]                                 |
| O1    | PO   | Unsigned | 23    | I1 + I2                                  |
| O2    | PO   | Unsigned | 22    | T69 + I3                                 |
| O3    | PO   | Unsigned | 21    | T71 + I4                                 |
==============================================================================


Resource Report for Ungrouped Hierarchy A6/U1 in file ./DW_fp_addsub__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_191                     |
| sub_x_4        | DW01_sub       | width=8    | sub_232                    |
| ashr_5         | DW_rightsh     | A_width=26 | srl_237_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_239                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=26 | sll_266                    |
|                |                | SH_width=5 |                            |
| add_x_12       | DW01_inc       | width=23   | add_303                    |
| U1             | DW_lzd         | a_width=27 | U1                         |
| DP_OP_49J1_147_3163             |            |                            |
|                | DP_OP_49J1_147_3163 |       |                            |
| DP_OP_50J1_148_9752             |            |                            |
|                | DP_OP_50J1_148_9752 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_147_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_147_3163  | add_249 add_249_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_50J1_148_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_148_9752  | add_306 sub_307                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*102067/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A4/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_188_7885               |            |                            |
|                | DP_OP_65_188_7885 |         |                            |
| DP_OP_66_189_3163               |            |                            |
|                | DP_OP_66_189_3163 |         |                            |
| DP_OP_67_190_9752               |            |                            |
|                | DP_OP_67_190_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_188_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_188_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_189_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_189_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_190_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_190_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*110563/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A5/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_196_7885               |            |                            |
|                | DP_OP_65_196_7885 |         |                            |
| DP_OP_66_197_3163               |            |                            |
|                | DP_OP_66_197_3163 |         |                            |
| DP_OP_67_198_9752               |            |                            |
|                | DP_OP_67_198_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_196_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_196_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_197_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_197_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_198_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_198_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*127405/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A1/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_212_7885               |            |                            |
|                | DP_OP_65_212_7885 |         |                            |
| DP_OP_66_213_3163               |            |                            |
|                | DP_OP_66_213_3163 |         |                            |
| DP_OP_67_214_9752               |            |                            |
|                | DP_OP_67_214_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_212_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_212_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_213_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_213_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_214_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_214_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*118955/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A2/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_204_7885               |            |                            |
|                | DP_OP_65_204_7885 |         |                            |
| DP_OP_66_205_3163               |            |                            |
|                | DP_OP_66_205_3163 |         |                            |
| DP_OP_67_206_9752               |            |                            |
|                | DP_OP_67_206_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_204_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_204_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_205_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_205_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_206_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_206_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*135912/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A3/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_220_7885               |            |                            |
|                | DP_OP_65_220_7885 |         |                            |
| DP_OP_66_221_3163               |            |                            |
|                | DP_OP_66_221_3163 |         |                            |
| DP_OP_67_222_9752               |            |                            |
|                | DP_OP_67_222_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_220_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_220_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_221_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_221_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_222_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_222_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*144465/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A0/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_228_7885               |            |                            |
|                | DP_OP_65_228_7885 |         |                            |
| DP_OP_66_229_3163               |            |                            |
|                | DP_OP_66_229_3163 |         |                            |
| DP_OP_67_230_9752               |            |                            |
|                | DP_OP_67_230_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_228_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_228_7885    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_229_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_229_3163    | add_294 add_294_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_230_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_230_9752    | add_402 sub_403                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy A6/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M5/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M5/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M4/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M4/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M3/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M3/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M2/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M2/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M1/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M1/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M0/UL3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M0/UL4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A4/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A5/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A2/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A3/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_1             | DW_cmp           | apparch (area)     |                |
| add_x_7            | DW01_inc         | apparch (area)     |                |
| lt_x_9             | DW_cmp           | apparch (area)     |                |
| lt_x_14            | DW_cmp           | apparch (area)     |                |
| M0                 | DW_fp_mult       | str                |                |
| A0                 | DW_fp_add        | rtl                |                |
| A6                 | DW_fp_add        | rtl                |                |
| M1                 | DW_fp_mult       | str                |                |
| A1                 | DW_fp_add        | rtl                |                |
| M2                 | DW_fp_mult       | str                |                |
| A2                 | DW_fp_add        | rtl                |                |
| M3                 | DW_fp_mult       | str                |                |
| A3                 | DW_fp_add        | rtl                |                |
| M4                 | DW_fp_mult       | str                |                |
| A4                 | DW_fp_add        | rtl                |                |
| M5                 | DW_fp_mult       | str                |                |
| A5                 | DW_fp_add        | rtl                |                |
| REC_0              | DW_fp_recip      | rtl                |                |
| EXP_0              | DW_fp_exp        | rtl                |                |
| gt_x_150           | DW_cmp           | apparch (area)     |                |
| gt_x_151           | DW_cmp           | apparch (area)     |                |
| mult_x_4           | DW_mult_uns      | pparch (area,speed)                 |
| sub_x_5            | DW01_sub         | apparch (area)     |                |
| gte_x_6            | DW_cmp           | apparch (area)     |                |
| add_x_9            | DW01_add         | pparch (area,speed)                 |
| add_x_11           | DW01_inc         | pparch (speed)     |                |
| U1                 | DW01_ash         | astr (area)        |                |
| U2                 | DW_exp2          | rtl                |                |
| sub_x_16           | DW01_sub         | apparch (area)     |                |
| add_x_17           | DW01_dec         | apparch (area)     |                |
| sub_x_18           | DW01_sub         | pparch (area,speed)                 |
| add_x_19           | DW01_add         | apparch (area)     |                |
| add_x_20           | DW01_add         | apparch (area)     |                |
| mult_x_2           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_x_3           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_9            | DW_cmp           | apparch (area)     |                |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | str                |                |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (area,speed)                 |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (speed)     |                |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (speed)     |                |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (area,speed)                 |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (area,speed)                 |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_add         | pparch (speed)     |                |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| UL3                | DW_lzd           | rtl                |                |
| UL4                | DW_lzd           | rtl                |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix8              |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| sub_x_4            | DW01_sub         | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_12           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_lzd           | cla                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| DP_OP_77_231_7241  | DP_OP_77_231_7241 | str (area,speed)  |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_95J1_123_8617                   |                    |                |
|                    | DP_OP_95J1_123_8617 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_79J1_124_5437                   |                    |                |
|                    | DP_OP_79J1_124_5437 | str (area)      |                |
| DP_OP_108_155_7736 | DP_OP_108_155_7736 | str (area)       |                |
| DP_OP_109_156_8092 | DP_OP_109_156_8092 | str (area,speed) |                |
| DP_OP_108_159_7736 | DP_OP_108_159_7736 | str (area)       |                |
| DP_OP_109_160_8092 | DP_OP_109_160_8092 | str (area,speed) |                |
| DP_OP_108_163_7736 | DP_OP_108_163_7736 | str (area)       |                |
| DP_OP_109_164_8092 | DP_OP_109_164_8092 | str (area,speed) |                |
| DP_OP_108_167_7736 | DP_OP_108_167_7736 | str (area)       |                |
| DP_OP_109_168_8092 | DP_OP_109_168_8092 | str (area,speed) |                |
| DP_OP_108_171_7736 | DP_OP_108_171_7736 | str (area)       |                |
| DP_OP_109_172_8092 | DP_OP_109_172_8092 | str (area,speed) |                |
| DP_OP_108_175_7736 | DP_OP_108_175_7736 | str (area)       |                |
| DP_OP_109_176_8092 | DP_OP_109_176_8092 | str (area,speed) |                |
| DP_OP_49J1_147_3163                   |                    |                |
|                    | DP_OP_49J1_147_3163 | str (area,speed)                 |
| DP_OP_50J1_148_9752                   |                    |                |
|                    | DP_OP_50J1_148_9752 | str (area,speed)                 |
| DP_OP_65_188_7885  | DP_OP_65_188_7885 | str (area,speed)  |                |
| DP_OP_66_189_3163  | DP_OP_66_189_3163 | str (area,speed)  |                |
| DP_OP_67_190_9752  | DP_OP_67_190_9752 | str (area)        |                |
| DP_OP_65_196_7885  | DP_OP_65_196_7885 | str (area,speed)  |                |
| DP_OP_66_197_3163  | DP_OP_66_197_3163 | str (area,speed)  |                |
| DP_OP_67_198_9752  | DP_OP_67_198_9752 | str (area)        |                |
| DP_OP_65_212_7885  | DP_OP_65_212_7885 | str (area,speed)  |                |
| DP_OP_66_213_3163  | DP_OP_66_213_3163 | str (area,speed)  |                |
| DP_OP_67_214_9752  | DP_OP_67_214_9752 | str (area)        |                |
| DP_OP_65_204_7885  | DP_OP_65_204_7885 | str (area,speed)  |                |
| DP_OP_66_205_3163  | DP_OP_66_205_3163 | str (area,speed)  |                |
| DP_OP_67_206_9752  | DP_OP_67_206_9752 | str (area)        |                |
| DP_OP_65_220_7885  | DP_OP_65_220_7885 | str (area,speed)  |                |
| DP_OP_66_221_3163  | DP_OP_66_221_3163 | str (area,speed)  |                |
| DP_OP_67_222_9752  | DP_OP_67_222_9752 | str (area)        |                |
| DP_OP_65_228_7885  | DP_OP_65_228_7885 | str (area,speed)  |                |
| DP_OP_66_229_3163  | DP_OP_66_229_3163 | str (area,speed)  |                |
| DP_OP_67_230_9752  | DP_OP_67_230_9752 | str (area,speed)  |                |
===============================================================================

1
