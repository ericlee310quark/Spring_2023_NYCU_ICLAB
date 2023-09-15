 
****************************************
Report : resources
Design : CDC
Version: T-2022.03
Date   : Mon Apr 17 02:39:16 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab07/EXERCISE/01_RTL/CDC.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_1         | DW_cmp         | width=13   | gt_101 (CDC.v:101)         |
| add_x_4        | DW01_inc       | width=13   | add_121_S2 (CDC.v:121)     |
| gt_x_19        | DW_cmp         | width=13   | gt_347 (CDC.v:347)         |
| gte_x_22       | DW_cmp         | width=13   | gte_374 (CDC.v:374)        |
| add_x_25       | DW01_add       | width=5    | afifo_u0/rptr_empty_m0/add_33 (rptr_empty.v:33) |
| eq_x_26        | DW_cmp         | width=5    | afifo_u0/rptr_empty_m0/eq_38 (rptr_empty.v:38) |
| add_x_27       | DW01_add       | width=5    | afifo_u0/wptr_full_m0/add_32 (wptr_full.v:32) |
| eq_x_28        | DW_cmp         | width=5    | afifo_u0/wptr_full_m0/eq_37 (wptr_full.v:37) |
| DP_OP_115J1_122_7983            |            |                            |
|                | DP_OP_115J1_122_7983 |      |                            |
| DP_OP_116J1_123_7983            |            |                            |
|                | DP_OP_116J1_123_7983 |      |                            |
| DP_OP_117J1_124_1339            |            |                            |
|                | DP_OP_117J1_124_1339 |      |                            |
=============================================================================

Datapath Report for DP_OP_115J1_122_7983
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_115J1_122_7983 | mult_255_G2 (CDC.v:255) add_290_G2 (CDC.v:290)      |
|                      | add_290_2_G2 (CDC.v:290) mult_256_G2 (CDC.v:256)    |
|                      | mult_257_G2 (CDC.v:257) gt_344 (CDC.v:344)          |
|                      | add_290 (CDC.v:290) add_290_2 (CDC.v:290)           |
|                      | mult_255 (CDC.v:255) mult_256 (CDC.v:256)           |
|                      | mult_257 (CDC.v:257)                                |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 8     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 8     |                                          |
| I8    | PI   | Unsigned | 8     |                                          |
| I9    | PI   | Unsigned | 8     |                                          |
| T18   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:255)                      |
| T19   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:256)                      |
| T20   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:257)                      |
| T15   | IFO  | Unsigned | 11    | I7 * I2 (CDC.v:255)                      |
| T16   | IFO  | Unsigned | 11    | I8 * I4 (CDC.v:256)                      |
| T17   | IFO  | Unsigned | 11    | I9 * I6 (CDC.v:257)                      |
| O1    | PO   | Unsigned | 13    | T18 + T19 + T20 (CDC.v:290)              |
| O2    | PO   | Unsigned | 1     | O1 > O3 (CDC.v:344)                      |
| O3    | PO   | Unsigned | 13    | T15 + T16 + T17 (CDC.v:290)              |
==============================================================================

Datapath Report for DP_OP_116J1_123_7983
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_116J1_123_7983 | mult_255_G4 (CDC.v:255) add_290_G4 (CDC.v:290)      |
|                      | add_290_2_G4 (CDC.v:290) mult_256_G4 (CDC.v:256)    |
|                      | mult_257_G4 (CDC.v:257) gt_345 (CDC.v:345)          |
|                      | add_290_G3 (CDC.v:290) add_290_2_G3 (CDC.v:290)     |
|                      | mult_255_G3 (CDC.v:255) mult_256_G3 (CDC.v:256)     |
|                      | mult_257_G3 (CDC.v:257)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 8     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 8     |                                          |
| I8    | PI   | Unsigned | 8     |                                          |
| I9    | PI   | Unsigned | 8     |                                          |
| T24   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:255)                      |
| T25   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:256)                      |
| T26   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:257)                      |
| T21   | IFO  | Unsigned | 11    | I7 * I2 (CDC.v:255)                      |
| T22   | IFO  | Unsigned | 11    | I8 * I4 (CDC.v:256)                      |
| T23   | IFO  | Unsigned | 11    | I9 * I6 (CDC.v:257)                      |
| O1    | PO   | Unsigned | 13    | T24 + T25 + T26 (CDC.v:290)              |
| O2    | PO   | Unsigned | 1     | O1 > O3 (CDC.v:345)                      |
| O3    | PO   | Unsigned | 13    | T21 + T22 + T23 (CDC.v:290)              |
==============================================================================

Datapath Report for DP_OP_117J1_124_1339
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_117J1_124_1339 | mult_255_G5 (CDC.v:255) add_290_G5 (CDC.v:290)      |
|                      | add_290_2_G5 (CDC.v:290) mult_256_G5 (CDC.v:256)    |
|                      | mult_257_G5 (CDC.v:257) gt_346 (CDC.v:346)          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 8     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 13    |                                          |
| T27   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:255)                      |
| T28   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:256)                      |
| T29   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:257)                      |
| O1    | PO   | Unsigned | 13    | T27 + T28 + T29 (CDC.v:290)              |
| O2    | PO   | Unsigned | 1     | O1 > I7 (CDC.v:346)                      |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_1             | DW_cmp           | apparch (area)     |                |
| add_x_4            | DW01_inc         | apparch (area)     |                |
| gt_x_19            | DW_cmp           | apparch (area)     |                |
| gte_x_22           | DW_cmp           | apparch (area)     |                |
| add_x_25           | DW01_add         | apparch (area)     |                |
| eq_x_26            | DW_cmp           | apparch (area)     |                |
| add_x_27           | DW01_add         | apparch (area)     |                |
| eq_x_28            | DW_cmp           | apparch (area)     |                |
| DP_OP_115J1_122_7983                  |                    |                |
|                    | DP_OP_115J1_122_7983 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_116J1_123_7983                  |                    |                |
|                    | DP_OP_116J1_123_7983 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_117J1_124_1339                  |                    |                |
|                    | DP_OP_117J1_124_1339 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
