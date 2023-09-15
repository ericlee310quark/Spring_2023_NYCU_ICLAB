 
****************************************
Report : resources
Design : OS
Version: T-2022.03
Date   : Mon May  1 17:51:03 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab09/Exercise/01_RTL/OS.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_12       | DW01_inc       | width=3    | add_289 (OS.sv:289)        |
| lt_x_47        | DW_cmp         | width=6    | lt_601 (OS.sv:601)         |
| ne_x_48        | DW_cmp         | width=8    | ne_609 (OS.sv:609)         |
| ne_x_49        | DW_cmp         | width=8    | ne_609_2 (OS.sv:609)       |
| ne_x_50        | DW_cmp         | width=8    | ne_610 (OS.sv:610)         |
| ne_x_51        | DW_cmp         | width=6    | ne_611 (OS.sv:611)         |
| ne_x_52        | DW_cmp         | width=2    | ne_612 (OS.sv:612)         |
| add_x_58       | DW01_add       | width=7    | add_637 (OS.sv:637)        |
| sub_x_59       | DW01_sub       | width=6    | sub_638 (OS.sv:638)        |
| sub_x_71       | DW01_sub       | width=2    | sub_688_S2_aco (OS.sv:688) |
| gt_x_610       | DW_cmp         | width=2    | gt_681 (OS.sv:681)         |
|                |                |            | gt_687 (OS.sv:687)         |
| DP_OP_1417J1_122_8239           |            |                            |
|                | DP_OP_1417J1_122_8239 |     |                            |
| DP_OP_1418J1_123_3180           |            |                            |
|                | DP_OP_1418J1_123_3180 |     |                            |
=============================================================================

Datapath Report for DP_OP_1417J1_122_8239
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_1417J1_122_8239 | mult_653 (OS.sv:653) C42545 (OS.sv:592)            |
|                      | add_640 (OS.sv:640) sub_641 (OS.sv:641)             |
|                      | sub_642 (OS.sv:642)                                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 16    |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 16    |                                          |
| I7    | PI   | Unsigned | 16    |                                          |
| I8    | PI   | Unsigned | 7     |                                          |
| T321  | IFO  | Unsigned | 15    | I1 * I2 (OS.sv:653)                      |
| T301  | IFO  | Unsigned | 16    | { I4, I5 } ? I3 : T321 (OS.sv:592)       |
| O1    | PO   | Unsigned | 17    | I6 + T301 (OS.sv:640)                    |
| O2    | PO   | Signed   | 17    | I7 - T321 (OS.sv:641)                    |
| O3    | PO   | Signed   | 17    | O2 - I8 (OS.sv:642)                      |
==============================================================================

Datapath Report for DP_OP_1418J1_123_3180
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_1418J1_123_3180 | mult_679 (OS.sv:679) add_679 (OS.sv:679)           |
|                      | gte_603 (OS.sv:603)                                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 12    |                                          |
| I4    | PI   | Unsigned | 12    |                                          |
| T325  | IFO  | Unsigned | 12    | I1 * I2 (OS.sv:679)                      |
| O1    | PO   | Unsigned | 13    | T325 + I3 (OS.sv:679)                    |
| O2    | PO   | Unsigned | 1     | O1 >= I4 (OS.sv:603)                     |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_12           | DW01_inc         | apparch (area)     |                |
| lt_x_47            | DW_cmp           | apparch (area)     |                |
| ne_x_48            | DW_cmp           | apparch (area)     |                |
| ne_x_49            | DW_cmp           | apparch (area)     |                |
| ne_x_50            | DW_cmp           | apparch (area)     |                |
| ne_x_51            | DW_cmp           | apparch (area)     |                |
| ne_x_52            | DW_cmp           | apparch (area)     |                |
| add_x_58           | DW01_add         | pparch (area,speed)                 |
| sub_x_59           | DW01_sub         | pparch (area,speed)                 |
| sub_x_71           | DW01_sub         | apparch (area)     |                |
| gt_x_610           | DW_cmp           | apparch (area)     |                |
| DP_OP_1417J1_122_8239                 |                    |                |
|                    | DP_OP_1417J1_122_8239 | str (area,speed)               |
|                    |                  | mult_arch: and     |                |
| DP_OP_1418J1_123_3180                 |                    |                |
|                    | DP_OP_1418J1_123_3180 | str (area,speed)               |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
