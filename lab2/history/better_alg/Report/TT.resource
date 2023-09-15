 
****************************************
Report : resources
Design : QUEEN
Version: R-2020.09
Date   : Tue Mar  7 05:18:50 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab02/Exercise/01_RTL/QUEEN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_2         | DW_cmp         | width=4    | gt_98 (QUEEN.v:98)         |
| add_x_5        | DW01_inc       | width=4    | add_108 (QUEEN.v:108)      |
| add_x_6        | DW01_add       | width=5    | add_112 (QUEEN.v:112)      |
| add_x_7        | DW01_add       | width=5    | add_120 (QUEEN.v:120)      |
| add_x_8        | DW01_add       | width=5    | add_128 (QUEEN.v:128)      |
| lt_x_33        | DW_cmp         | width=4    | lt_209 (QUEEN.v:209)       |
| lt_x_38        | DW_cmp         | width=4    | lt_250 (QUEEN.v:250)       |
| sub_x_4        | DW01_dec       | width=4    | sub_107 (QUEEN.v:107)      |
|                |                |            | sub_210 (QUEEN.v:210)      |
| DP_OP_284J1_122_6493            |            |                            |
|                | DP_OP_284J1_122_6493 |      |                            |
| DP_OP_285J1_123_6493            |            |                            |
|                | DP_OP_285J1_123_6493 |      |                            |
| DP_OP_286J1_124_6493            |            |                            |
|                | DP_OP_286J1_124_6493 |      |                            |
=============================================================================

Datapath Report for DP_OP_284J1_122_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_284J1_122_6493 | sub_113 (QUEEN.v:113) mult_114 (QUEEN.v:114)        |
|                      | add_115 (QUEEN.v:115)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T6    | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:113)    |
| T7    | IFO  | Signed   | 5     | T6 * $signed(1'b1) (QUEEN.v:114)         |
| O1    | PO   | Unsigned | 5     | T7 + I2 (QUEEN.v:115)                    |
==============================================================================

Datapath Report for DP_OP_285J1_123_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_285J1_123_6493 | sub_121 (QUEEN.v:121) mult_122 (QUEEN.v:122)        |
|                      | add_123 (QUEEN.v:123)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T10   | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:121)    |
| T11   | IFO  | Signed   | 5     | T10 * $signed(1'b1) (QUEEN.v:122)        |
| O1    | PO   | Unsigned | 5     | T11 + I2 (QUEEN.v:123)                   |
==============================================================================

Datapath Report for DP_OP_286J1_124_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_286J1_124_6493 | sub_129 (QUEEN.v:129) mult_130 (QUEEN.v:130)        |
|                      | add_131 (QUEEN.v:131)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T14   | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:129)    |
| T15   | IFO  | Signed   | 5     | T14 * $signed(1'b1) (QUEEN.v:130)        |
| O1    | PO   | Unsigned | 5     | T15 + I2 (QUEEN.v:131)                   |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_107 (QUEEN.v:107) sub_210 (QUEEN.v:210)' in design 'QUEEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'add_128 (QUEEN.v:128)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_2             | DW_cmp           | apparch (area)     |                |
| add_x_5            | DW01_inc         | apparch (area)     |                |
| add_x_6            | DW01_add         | apparch (area)     |                |
| add_x_7            | DW01_add         | apparch (area)     |                |
| add_x_8            | DW01_add         | apparch (area)     |                |
| lt_x_33            | DW_cmp           | apparch (area)     |                |
| lt_x_38            | DW_cmp           | apparch (area)     |                |
| sub_x_4            | DW01_dec         | apparch (area)     |                |
| DP_OP_284J1_122_6493                  |                    |                |
|                    | DP_OP_284J1_122_6493 | str (area)     |                |
| DP_OP_285J1_123_6493                  |                    |                |
|                    | DP_OP_285J1_123_6493 | str (area)     |                |
| DP_OP_286J1_124_6493                  |                    |                |
|                    | DP_OP_286J1_124_6493 | str (area)     |                |
===============================================================================

1
