 
****************************************
Report : resources
Design : QUEEN
Version: R-2020.09
Date   : Tue Mar  7 23:29:28 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab02/Exercise/01_RTL/QUEEN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_2         | DW_cmp         | width=4    | gt_90 (QUEEN.v:90)         |
| sub_x_4        | DW01_dec       | width=4    | sub_99 (QUEEN.v:99)        |
| add_x_7        | DW01_add       | width=5    | add_115 (QUEEN.v:115)      |
| add_x_8        | DW01_add       | width=5    | add_121 (QUEEN.v:121)      |
| lt_x_141       | DW_cmp         | width=4    | lt_211 (QUEEN.v:211)       |
|                |                |            | lt_246 (QUEEN.v:246)       |
| DP_OP_315J1_122_1638            |            |                            |
|                | DP_OP_315J1_122_1638 |      |                            |
| DP_OP_316J1_123_6493            |            |                            |
|                | DP_OP_316J1_123_6493 |      |                            |
| DP_OP_317J1_124_6493            |            |                            |
|                | DP_OP_317J1_124_6493 |      |                            |
=============================================================================

Datapath Report for DP_OP_315J1_122_1638
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_315J1_122_1638 | add_100 (QUEEN.v:100) add_211_S2 (QUEEN.v:211)      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 4     | I1 + $unsigned(1'b1) (QUEEN.v:100)       |
| O2    | PO   | Unsigned | 4     | O1 + I2 (QUEEN.v:211)                    |
==============================================================================

Datapath Report for DP_OP_316J1_123_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_316J1_123_6493 | sub_116 (QUEEN.v:116) mult_117 (QUEEN.v:117)        |
|                      | add_118 (QUEEN.v:118)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T8    | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:116)    |
| T9    | IFO  | Signed   | 5     | T8 * $signed(1'b1) (QUEEN.v:117)         |
| O1    | PO   | Unsigned | 5     | T9 + I2 (QUEEN.v:118)                    |
==============================================================================

Datapath Report for DP_OP_317J1_124_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_317J1_124_6493 | sub_122 (QUEEN.v:122) mult_123 (QUEEN.v:123)        |
|                      | add_124 (QUEEN.v:124)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T12   | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:122)    |
| T13   | IFO  | Signed   | 5     | T12 * $signed(1'b1) (QUEEN.v:123)        |
| O1    | PO   | Unsigned | 5     | T13 + I2 (QUEEN.v:124)                   |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_99 (QUEEN.v:99)' in design 'QUEEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'add_121 (QUEEN.v:121)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_2             | DW_cmp           | apparch (area)     |                |
| sub_x_4            | DW01_dec         | apparch (area)     |                |
| add_x_7            | DW01_add         | apparch (area)     |                |
| add_x_8            | DW01_add         | apparch (area)     |                |
| lt_x_141           | DW_cmp           | apparch (area)     |                |
| DP_OP_315J1_122_1638                  |                    |                |
|                    | DP_OP_315J1_122_1638 | str (area)     |                |
| DP_OP_316J1_123_6493                  |                    |                |
|                    | DP_OP_316J1_123_6493 | str (area)     |                |
| DP_OP_317J1_124_6493                  |                    |                |
|                    | DP_OP_317J1_124_6493 | str (area)     |                |
===============================================================================

1
