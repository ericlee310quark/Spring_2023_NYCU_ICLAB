 
****************************************
Report : resources
Design : SNN
Version: T-2022.03
Date   : Fri Apr 21 17:41:35 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE/01_RTL/SNN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_35        | DW_cmp         | width=6    | lt_279 (SNN.v:279)         |
| gt_x_36        | DW_cmp         | width=6    | gt_280 (SNN.v:280)         |
| lt_x_37        | DW_cmp         | width=6    | lt_280 (SNN.v:280)         |
| gt_x_38        | DW_cmp         | width=6    | gt_281 (SNN.v:281)         |
| lt_x_39        | DW_cmp         | width=6    | lt_281 (SNN.v:281)         |
| gt_x_40        | DW_cmp         | width=6    | gt_282 (SNN.v:282)         |
| div_68         | DW_div_uns     | a_width=20 | div_483 (SNN.v:483)        |
|                |                | b_width=12 |                            |
| div_69         | DW_div_uns     | a_width=17 | div_484 (SNN.v:484)        |
|                |                | b_width=9  |                            |
| gt_x_71        | DW_cmp         | width=8    | gt_486 (SNN.v:486)         |
| gt_x_73        | DW_cmp         | width=8    | gt_487 (SNN.v:487)         |
| gt_x_75        | DW_cmp         | width=8    | gt_488 (SNN.v:488)         |
| gt_x_77        | DW_cmp         | width=8    | gt_490 (SNN.v:490)         |
| gt_x_79        | DW_cmp         | width=8    | gt_491 (SNN.v:491)         |
| gt_x_81        | DW_cmp         | width=8    | gt_492 (SNN.v:492)         |
| gt_x_88        | DW_cmp         | width=6    | gt_129 (SNN.v:129)         |
|                |                |            | gt_279 (SNN.v:279)         |
|                |                |            | gt_447 (SNN.v:447)         |
|                |                |            | gt_448 (SNN.v:448)         |
|                |                |            | gt_449 (SNN.v:449)         |
|                |                |            | gt_450 (SNN.v:450)         |
|                |                |            | gt_453 (SNN.v:453)         |
|                |                |            | gt_454 (SNN.v:454)         |
|                |                |            | gt_455 (SNN.v:455)         |
|                |                |            | gt_456 (SNN.v:456)         |
|                |                |            | gt_469 (SNN.v:469)         |
|                |                |            | gt_470 (SNN.v:470)         |
|                |                |            | gt_471 (SNN.v:471)         |
|                |                |            | gt_472 (SNN.v:472)         |
|                |                |            | gt_473 (SNN.v:473)         |
|                |                |            | gt_475 (SNN.v:475)         |
|                |                |            | gt_476 (SNN.v:476)         |
|                |                |            | gt_477 (SNN.v:477)         |
|                |                |            | gt_478 (SNN.v:478)         |
|                |                |            | gt_479 (SNN.v:479)         |
|                |                |            | gt_481 (SNN.v:481)         |
| lt_x_89        | DW_cmp         | width=6    | lt_259_G3_G3 (SNN.v:259)   |
|                |                |            | lt_266 (SNN.v:266)         |
|                |                |            | lt_266_G2 (SNN.v:266)      |
|                |                |            | lt_266_G2_G1 (SNN.v:266)   |
|                |                |            | lt_266_G2_G2 (SNN.v:266)   |
|                |                |            | lt_266_G2_G3 (SNN.v:266)   |
|                |                |            | lt_266_G3 (SNN.v:266)      |
|                |                |            | lt_266_G3_G1 (SNN.v:266)   |
|                |                |            | lt_266_G3_G2 (SNN.v:266)   |
| add_x_4        | DW01_inc       | width=6    | add_193 (SNN.v:193)        |
|                |                |            | add_194 (SNN.v:194)        |
|                |                |            | add_196 (SNN.v:196)        |
|                |                |            | add_197 (SNN.v:197)        |
| DP_OP_268J1_122_6894            |            |                            |
|                | DP_OP_268J1_122_6894 |      |                            |
| DP_OP_269J1_123_6894            |            |                            |
|                | DP_OP_269J1_123_6894 |      |                            |
| DP_OP_270J1_124_6894            |            |                            |
|                | DP_OP_270J1_124_6894 |      |                            |
| DP_OP_271J1_125_6894            |            |                            |
|                | DP_OP_271J1_125_6894 |      |                            |
| DP_OP_272J1_126_2512            |            |                            |
|                | DP_OP_272J1_126_2512 |      |                            |
| DP_OP_273J1_127_2519            |            |                            |
|                | DP_OP_273J1_127_2519 |      |                            |
| DP_OP_274J1_128_2519            |            |                            |
|                | DP_OP_274J1_128_2519 |      |                            |
| DP_OP_275J1_129_6782            |            |                            |
|                | DP_OP_275J1_129_6782 |      |                            |
=============================================================================

Datapath Report for DP_OP_268J1_122_6894
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_268J1_122_6894 | sub_496 (SNN.v:496) sub_mult_501 (SNN.v:501)        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T221  | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2 (SNN.v:496)                      |
| O2    | PO   | Signed   | 8     | $signed(1'b0) - T221 (SNN.v:501)         |
==============================================================================

Datapath Report for DP_OP_269J1_123_6894
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_269J1_123_6894 | sub_497 (SNN.v:497) sub_mult_502 (SNN.v:502)        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T222  | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2 (SNN.v:497)                      |
| O2    | PO   | Signed   | 8     | $signed(1'b0) - T222 (SNN.v:502)         |
==============================================================================

Datapath Report for DP_OP_270J1_124_6894
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_270J1_124_6894 | sub_498 (SNN.v:498) sub_mult_503 (SNN.v:503)        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T223  | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2 (SNN.v:498)                      |
| O2    | PO   | Signed   | 8     | $signed(1'b0) - T223 (SNN.v:503)         |
==============================================================================

Datapath Report for DP_OP_271J1_125_6894
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_271J1_125_6894 | sub_499 (SNN.v:499) sub_mult_504 (SNN.v:504)        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T224  | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2 (SNN.v:499)                      |
| O2    | PO   | Signed   | 8     | $signed(1'b0) - T224 (SNN.v:504)         |
==============================================================================

Datapath Report for DP_OP_272J1_126_2512
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_272J1_126_2512 | add_506 (SNN.v:506) add_506_2 (SNN.v:506)           |
|                      | add_506_3 (SNN.v:506)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| O1    | PO   | Unsigned | 10    | I1 + I2 + I3 + I4 (SNN.v:506)            |
==============================================================================

Datapath Report for DP_OP_273J1_127_2519
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_273J1_127_2519 | mult_464 (SNN.v:464) add_475 (SNN.v:475)            |
|                      | mult_465 (SNN.v:465)                                |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| T85   | IFO  | Unsigned | 16    | I1 * I2 (SNN.v:464)                      |
| T86   | IFO  | Unsigned | 16    | I3 * I4 (SNN.v:465)                      |
| O1    | PO   | Unsigned | 17    | T85 + T86 (SNN.v:475)                    |
==============================================================================

Datapath Report for DP_OP_274J1_128_2519
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_274J1_128_2519 | mult_466 (SNN.v:466) add_476 (SNN.v:476)            |
|                      | mult_467 (SNN.v:467)                                |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| T87   | IFO  | Unsigned | 16    | I1 * I2 (SNN.v:466)                      |
| T88   | IFO  | Unsigned | 16    | I3 * I4 (SNN.v:467)                      |
| O1    | PO   | Unsigned | 17    | T87 + T88 (SNN.v:476)                    |
==============================================================================

Datapath Report for DP_OP_275J1_129_6782
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_275J1_129_6782 | mult_469 (SNN.v:469) C3565 (SNN.v:469)              |
|                      | add_477 (SNN.v:477) C3566 (SNN.v:470)               |
|                      | mult_470 (SNN.v:470) C3572 (SNN.v:477)              |
|                      | add_479 (SNN.v:479) add_479_2 (SNN.v:479)           |
|                      | add_479_3 (SNN.v:479) add_479_4 (SNN.v:479)         |
|                      | C3573 (SNN.v:478) add_478 (SNN.v:478)               |
|                      | C3567 (SNN.v:471) mult_471 (SNN.v:471)              |
|                      | C3568 (SNN.v:472) mult_472 (SNN.v:472)              |
|                      | C3569 (SNN.v:473) mult_473 (SNN.v:473)              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 1     |                                          |
| I7    | PI   | Unsigned | 8     |                                          |
| I8    | PI   | Unsigned | 8     |                                          |
| I9    | PI   | Unsigned | 1     |                                          |
| I10   | PI   | Unsigned | 1     |                                          |
| I11   | PI   | Unsigned | 17    |                                          |
| I12   | PI   | Unsigned | 17    |                                          |
| I13   | PI   | Unsigned | 1     |                                          |
| I14   | PI   | Unsigned | 1     |                                          |
| I15   | PI   | Unsigned | 1     |                                          |
| I16   | PI   | Unsigned | 1     |                                          |
| I17   | PI   | Unsigned | 8     |                                          |
| I18   | PI   | Unsigned | 8     |                                          |
| I19   | PI   | Unsigned | 1     |                                          |
| I20   | PI   | Unsigned | 1     |                                          |
| I21   | PI   | Unsigned | 8     |                                          |
| I22   | PI   | Unsigned | 8     |                                          |
| I23   | PI   | Unsigned | 1     |                                          |
| I24   | PI   | Unsigned | 1     |                                          |
| I25   | PI   | Unsigned | 8     |                                          |
| I26   | PI   | Unsigned | 8     |                                          |
| T90   | IFO  | Unsigned | 16    | I1 * I2 (SNN.v:469)                      |
| T91   | IFO  | Unsigned | 16    | { I3, I4 } ? $unsigned(1'b0) : T90 (SNN.v:469) |
| T93   | IFO  | Unsigned | 16    | I7 * I8 (SNN.v:470)                      |
| T94   | IFO  | Unsigned | 16    | { I5, I6 } ? $unsigned(1'b0) : T93 (SNN.v:470) |
| T111  | IFO  | Unsigned | 17    | T91 + T94 (SNN.v:477)                    |
| T112  | IFO  | Unsigned | 17    | { I9, I10 } ? $unsigned(1'b0) : T111 (SNN.v:477) |
| T96   | IFO  | Unsigned | 16    | I17 * I18 (SNN.v:471)                    |
| T97   | IFO  | Unsigned | 16    | { I15, I16 } ? $unsigned(1'b0) : T96 (SNN.v:471) |
| T99   | IFO  | Unsigned | 16    | I21 * I22 (SNN.v:472)                    |
| T100  | IFO  | Unsigned | 16    | { I19, I20 } ? $unsigned(1'b0) : T99 (SNN.v:472) |
| T114  | IFO  | Unsigned | 17    | T97 + T100 (SNN.v:478)                   |
| T115  | IFO  | Unsigned | 17    | { I13, I14 } ? $unsigned(1'b0) : T114 (SNN.v:478) |
| T102  | IFO  | Unsigned | 16    | I25 * I26 (SNN.v:473)                    |
| T103  | IFO  | Unsigned | 16    | { I23, I24 } ? $unsigned(1'b0) : T102 (SNN.v:473) |
| O1    | PO   | Unsigned | 20    | I11 + I12 + T112 + T115 + T103 (SNN.v:479) |
==============================================================================


Resource Report for Ungrouped Hierarchy div_69
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_68
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_mult_501 (SNN.v:501)' in design 'SNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C3585 (SNN.v:501)'.  (HDL-120)

Information: Operator associated with resources 'sub_mult_502 (SNN.v:502)' in design 'SNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C3586 (SNN.v:502)'.  (HDL-120)

Information: Operator associated with resources 'sub_mult_503 (SNN.v:503)' in design 'SNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C3587 (SNN.v:503)'.  (HDL-120)

Information: Operator associated with resources 'sub_mult_504 (SNN.v:504)' in design 'SNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C3588 (SNN.v:504)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| lt_x_35            | DW_cmp           | apparch (area)     |                |
| gt_x_36            | DW_cmp           | apparch (area)     |                |
| lt_x_37            | DW_cmp           | apparch (area)     |                |
| gt_x_38            | DW_cmp           | apparch (area)     |                |
| lt_x_39            | DW_cmp           | apparch (area)     |                |
| gt_x_40            | DW_cmp           | apparch (area)     |                |
| div_68             | DW_div_uns       | cla3               |                |
| div_69             | DW_div_uns       | cla2               |                |
| gt_x_71            | DW_cmp           | apparch (area)     |                |
| gt_x_73            | DW_cmp           | apparch (area)     |                |
| gt_x_75            | DW_cmp           | apparch (area)     |                |
| gt_x_77            | DW_cmp           | apparch (area)     |                |
| gt_x_79            | DW_cmp           | apparch (area)     |                |
| gt_x_81            | DW_cmp           | apparch (area)     |                |
| gt_x_88            | DW_cmp           | apparch (area)     |                |
| lt_x_89            | DW_cmp           | apparch (area)     |                |
| add_x_4            | DW01_inc         | apparch (area)     |                |
| DP_OP_268J1_122_6894                  |                    |                |
|                    | DP_OP_268J1_122_6894 | str (area)     |                |
| DP_OP_269J1_123_6894                  |                    |                |
|                    | DP_OP_269J1_123_6894 | str (area)     |                |
| DP_OP_270J1_124_6894                  |                    |                |
|                    | DP_OP_270J1_124_6894 | str (area)     |                |
| DP_OP_271J1_125_6894                  |                    |                |
|                    | DP_OP_271J1_125_6894 | str (area)     |                |
| DP_OP_272J1_126_2512                  |                    |                |
|                    | DP_OP_272J1_126_2512 | str (area)     |                |
| DP_OP_273J1_127_2519                  |                    |                |
|                    | DP_OP_273J1_127_2519 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
| DP_OP_274J1_128_2519                  |                    |                |
|                    | DP_OP_274J1_128_2519 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
| DP_OP_275J1_129_6782                  |                    |                |
|                    | DP_OP_275J1_129_6782 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
