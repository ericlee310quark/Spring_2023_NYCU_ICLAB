 
****************************************
Report : resources
Design : QUEEN
Version: R-2020.09
Date   : Tue Mar  7 20:36:49 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab02/Exercise/01_RTL/QUEEN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_2         | DW_cmp         | width=4    | gt_98 (QUEEN.v:98)         |
| sub_x_4        | DW01_dec       | width=4    | sub_107 (QUEEN.v:107)      |
| add_x_5        | DW01_inc       | width=4    | add_108 (QUEEN.v:108)      |
| add_x_8        | DW01_add       | width=5    | add_123 (QUEEN.v:123)      |
| add_x_9        | DW01_add       | width=5    | add_129 (QUEEN.v:129)      |
| lt_x_34        | DW_cmp         | width=4    | lt_213 (QUEEN.v:213)       |
| lt_x_39        | DW_cmp         | width=4    | lt_256 (QUEEN.v:256)       |
| DP_OP_280J1_122_6493            |            |                            |
|                | DP_OP_280J1_122_6493 |      |                            |
| DP_OP_281J1_123_6493            |            |                            |
|                | DP_OP_281J1_123_6493 |      |                            |
=============================================================================

Datapath Report for DP_OP_280J1_122_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_280J1_122_6493 | sub_124 (QUEEN.v:124) mult_125 (QUEEN.v:125)        |
|                      | add_126 (QUEEN.v:126)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T8    | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:124)    |
| T9    | IFO  | Signed   | 5     | T8 * $signed(1'b1) (QUEEN.v:125)         |
| O1    | PO   | Unsigned | 5     | T9 + I2 (QUEEN.v:126)                    |
==============================================================================

Datapath Report for DP_OP_281J1_123_6493
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_281J1_123_6493 | sub_130 (QUEEN.v:130) mult_131 (QUEEN.v:131)        |
|                      | add_132 (QUEEN.v:132)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| T12   | IFO  | Signed   | 5     | I1 - $unsigned(4'b1011) (QUEEN.v:130)    |
| T13   | IFO  | Signed   | 5     | T12 * $signed(1'b1) (QUEEN.v:131)        |
| O1    | PO   | Unsigned | 5     | T13 + I2 (QUEEN.v:132)                   |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_107 (QUEEN.v:107)' in design 'QUEEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'add_129 (QUEEN.v:129)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_2             | DW_cmp           | apparch (area)     |                |
| sub_x_4            | DW01_dec         | apparch (area)     |                |
| add_x_5            | DW01_inc         | apparch (area)     |                |
| add_x_8            | DW01_add         | apparch (area)     |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| lt_x_34            | DW_cmp           | apparch (area)     |                |
| lt_x_39            | DW_cmp           | apparch (area)     |                |
| DP_OP_280J1_122_6493                  |                    |                |
|                    | DP_OP_280J1_122_6493 | str (area)     |                |
| DP_OP_281J1_123_6493                  |                    |                |
|                    | DP_OP_281J1_123_6493 | str (area)     |                |
===============================================================================

1
