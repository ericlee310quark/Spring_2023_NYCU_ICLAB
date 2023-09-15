 
****************************************
Report : resources
Design : CDC
Version: T-2022.03
Date   : Sun Apr 16 22:53:18 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab07/EXERCISE/01_RTL/CDC.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_1         | DW_cmp         | width=13   | gt_103 (CDC.v:103)         |
| add_x_4        | DW01_inc       | width=13   | add_143_S2 (CDC.v:143)     |
| gt_x_18        | DW_cmp         | width=13   | gt_366 (CDC.v:366)         |
| gte_x_21       | DW_cmp         | width=13   | gte_403 (CDC.v:403)        |
| add_x_24       | DW01_add       | width=5    | afifo_u0/rptr_empty_m0/add_33 (rptr_empty.v:33) |
| eq_x_25        | DW_cmp         | width=5    | afifo_u0/rptr_empty_m0/eq_38 (rptr_empty.v:38) |
| add_x_26       | DW01_add       | width=5    | afifo_u0/wptr_full_m0/add_32 (wptr_full.v:32) |
| eq_x_27        | DW_cmp         | width=5    | afifo_u0/wptr_full_m0/eq_37 (wptr_full.v:37) |
| DP_OP_112J1_122_7983            |            |                            |
|                | DP_OP_112J1_122_7983 |      |                            |
| DP_OP_113J1_123_7983            |            |                            |
|                | DP_OP_113J1_123_7983 |      |                            |
| DP_OP_114J1_124_1339            |            |                            |
|                | DP_OP_114J1_124_1339 |      |                            |
=============================================================================

Datapath Report for DP_OP_112J1_122_7983
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_112J1_122_7983 | mult_275_G2 (CDC.v:275) add_310_G2 (CDC.v:310)      |
|                      | add_310_2_G2 (CDC.v:310) mult_276_G2 (CDC.v:276)    |
|                      | mult_277_G2 (CDC.v:277) gt_363 (CDC.v:363)          |
|                      | add_310 (CDC.v:310) add_310_2 (CDC.v:310)           |
|                      | mult_275 (CDC.v:275) mult_276 (CDC.v:276)           |
|                      | mult_277 (CDC.v:277)                                |
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
| T17   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:275)                      |
| T18   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:276)                      |
| T19   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:277)                      |
| T14   | IFO  | Unsigned | 11    | I7 * I2 (CDC.v:275)                      |
| T15   | IFO  | Unsigned | 11    | I8 * I4 (CDC.v:276)                      |
| T16   | IFO  | Unsigned | 11    | I9 * I6 (CDC.v:277)                      |
| O1    | PO   | Unsigned | 13    | T17 + T18 + T19 (CDC.v:310)              |
| O2    | PO   | Unsigned | 1     | O1 > O3 (CDC.v:363)                      |
| O3    | PO   | Unsigned | 13    | T14 + T15 + T16 (CDC.v:310)              |
==============================================================================

Datapath Report for DP_OP_113J1_123_7983
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_113J1_123_7983 | mult_275_G4 (CDC.v:275) add_310_G4 (CDC.v:310)      |
|                      | add_310_2_G4 (CDC.v:310) mult_276_G4 (CDC.v:276)    |
|                      | mult_277_G4 (CDC.v:277) gt_364 (CDC.v:364)          |
|                      | add_310_G3 (CDC.v:310) add_310_2_G3 (CDC.v:310)     |
|                      | mult_275_G3 (CDC.v:275) mult_276_G3 (CDC.v:276)     |
|                      | mult_277_G3 (CDC.v:277)                             |
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
| T23   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:275)                      |
| T24   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:276)                      |
| T25   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:277)                      |
| T20   | IFO  | Unsigned | 11    | I7 * I2 (CDC.v:275)                      |
| T21   | IFO  | Unsigned | 11    | I8 * I4 (CDC.v:276)                      |
| T22   | IFO  | Unsigned | 11    | I9 * I6 (CDC.v:277)                      |
| O1    | PO   | Unsigned | 13    | T23 + T24 + T25 (CDC.v:310)              |
| O2    | PO   | Unsigned | 1     | O1 > O3 (CDC.v:364)                      |
| O3    | PO   | Unsigned | 13    | T20 + T21 + T22 (CDC.v:310)              |
==============================================================================

Datapath Report for DP_OP_114J1_124_1339
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_114J1_124_1339 | mult_275_G5 (CDC.v:275) add_310_G5 (CDC.v:310)      |
|                      | add_310_2_G5 (CDC.v:310) mult_276_G5 (CDC.v:276)    |
|                      | mult_277_G5 (CDC.v:277) gt_365 (CDC.v:365)          |
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
| T26   | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:275)                      |
| T27   | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:276)                      |
| T28   | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:277)                      |
| O1    | PO   | Unsigned | 13    | T26 + T27 + T28 (CDC.v:310)              |
| O2    | PO   | Unsigned | 1     | O1 > I7 (CDC.v:365)                      |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_1             | DW_cmp           | apparch (area)     |                |
| add_x_4            | DW01_inc         | apparch (area)     |                |
| gt_x_18            | DW_cmp           | apparch (area)     |                |
| gte_x_21           | DW_cmp           | apparch (area)     |                |
| add_x_24           | DW01_add         | apparch (area)     |                |
| eq_x_25            | DW_cmp           | apparch (area)     |                |
| add_x_26           | DW01_add         | apparch (area)     |                |
| eq_x_27            | DW_cmp           | apparch (area)     |                |
| DP_OP_112J1_122_7983                  |                    |                |
|                    | DP_OP_112J1_122_7983 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_113J1_123_7983                  |                    |                |
|                    | DP_OP_113J1_123_7983 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_114J1_124_1339                  |                    |                |
|                    | DP_OP_114J1_124_1339 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
