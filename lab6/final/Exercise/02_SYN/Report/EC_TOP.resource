 
****************************************
Report : resources
Design : EC_TOP
Version: T-2022.03
Date   : Fri Apr  7 16:22:15 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/EC_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_3         | DW_cmp         | width=6    | eq_105 (EC_TOP.v:105)      |
| eq_x_4         | DW_cmp         | width=6    | eq_105_2 (EC_TOP.v:105)    |
| gte_x_17       | DW_cmp         | width=6    | gte_246 (EC_TOP.v:246)     |
| gte_x_19       | DW_cmp         | width=6    | gte_247 (EC_TOP.v:247)     |
| gte_x_21       | DW_cmp         | width=8    | gte_248 (EC_TOP.v:248)     |
| gte_x_23       | DW_cmp         | width=7    | gte_249 (EC_TOP.v:249)     |
| gte_x_25       | DW_cmp         | width=12   | gte_250 (EC_TOP.v:250)     |
| gte_x_27       | DW_cmp         | width=6    | gte_251 (EC_TOP.v:251)     |
| mult_x_47      | DW_mult_uns    | a_width=8  | mult_388 (EC_TOP.v:388)    |
|                |                | b_width=7  |                            |
| rem_48         | DW_div_uns     | a_width=13 | rem_390 (EC_TOP.v:390)     |
|                |                | b_width=6  |                            |
| gt_x_54        | DW_cmp         | width=6    | I_INV_IP/gt_366 (INV_IP.v:366) |
| div_57         | DW_div_uns     | a_width=6  | I_INV_IP/div_368 (INV_IP.v:368) |
            |                | b_width=6  |                            |
| rem_58         | DW_div_uns     | a_width=6  | I_INV_IP/rem_369 (INV_IP.v:369) |
            |                | b_width=6  |                            |
| div_59         | DW_div_uns     | a_width=6  | I_INV_IP/div_374 (INV_IP.v:374) |
            |                | b_width=5  |                            |
| rem_60         | DW_div_uns     | a_width=6  | I_INV_IP/rem_375 (INV_IP.v:375) |
            |                | b_width=5  |                            |
| div_61         | DW_div_uns     | a_width=5  | I_INV_IP/div_380 (INV_IP.v:380) |
            |                | b_width=5  |                            |
| rem_62         | DW_div_uns     | a_width=5  | I_INV_IP/rem_381 (INV_IP.v:381) |
            |                | b_width=5  |                            |
| div_63         | DW_div_uns     | a_width=5  | I_INV_IP/div_386 (INV_IP.v:386) |
            |                | b_width=4  |                            |
| rem_64         | DW_div_uns     | a_width=5  | I_INV_IP/rem_387 (INV_IP.v:387) |
            |                | b_width=4  |                            |
| div_65         | DW_div_uns     | a_width=4  | I_INV_IP/div_392 (INV_IP.v:392) |
            |                | b_width=3  |                            |
| rem_66         | DW_div_uns     | a_width=4  | I_INV_IP/rem_393 (INV_IP.v:393) |
            |                | b_width=3  |                            |
| div_67         | DW_div_uns     | a_width=3  | I_INV_IP/div_398 (INV_IP.v:398) |
            |                | b_width=2  |                            |
| sub_x_68       | DW01_sub       | width=6    | I_INV_IP/sub_407 (INV_IP.v:407) |
| gt_x_71        | DW_cmp         | width=2    | gt_111 (EC_TOP.v:111)      |
|                |                |            | gt_115 (EC_TOP.v:115)      |
|                |                |            | gt_129 (EC_TOP.v:129)      |
|                |                |            | gt_130 (EC_TOP.v:130)      |
| gt_x_72        | DW_cmp         | width=2    | gt_113 (EC_TOP.v:113)      |
|                |                |            | gt_128 (EC_TOP.v:128)      |
|                |                |            | gt_174 (EC_TOP.v:174)      |
|                |                |            | gt_261 (EC_TOP.v:261)      |
|                |                |            | gt_279 (EC_TOP.v:279)      |
|                |                |            | gt_295 (EC_TOP.v:295)      |
| add_x_7        | DW01_inc       | width=2    | add_128 (EC_TOP.v:128)     |
|                |                |            | add_129 (EC_TOP.v:129)     |
|                |                |            | add_130 (EC_TOP.v:130)     |
| DP_OP_131J1_122_4741            |            |                            |
|                | DP_OP_131J1_122_4741 |      |                            |
| DP_OP_132J1_123_980             |            |                            |
|                | DP_OP_132J1_123_980 |       |                            |
=============================================================================

Datapath Report for DP_OP_131J1_122_4741
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_131J1_122_4741 | I_INV_IP/mult_376 (INV_IP.v:376)                    |
|                      | I_INV_IP/add_376 (INV_IP.v:376)                     |
|                      | I_INV_IP/mult_382 (INV_IP.v:382)                    |
|                      | I_INV_IP/add_382 (INV_IP.v:382)                     |
|                      | I_INV_IP/mult_388 (INV_IP.v:388)                    |
|                      | I_INV_IP/add_388 (INV_IP.v:388)                     |
|                      | I_INV_IP/mult_394 (INV_IP.v:394)                    |
|                      | I_INV_IP/add_394 (INV_IP.v:394)                     |
|                      | I_INV_IP/mult_399 (INV_IP.v:399)                    |
|                      | I_INV_IP/add_399 (INV_IP.v:399)                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 5     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Unsigned | 5     |                                          |
| I4    | PI   | Unsigned | 5     |                                          |
| I5    | PI   | Unsigned | 4     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| T76   | IFO  | Unsigned | 5     | I1 * I2 (INV_IP.v:376)                   |
| T80   | IFO  | Unsigned | 5     | O1 * I3 (INV_IP.v:382)                   |
| T84   | IFO  | Unsigned | 5     | O2 * I4 (INV_IP.v:388)                   |
| T88   | IFO  | Unsigned | 5     | O3 * I5 (INV_IP.v:394)                   |
| T91   | IFO  | Unsigned | 5     | O4 * I6 (INV_IP.v:399)                   |
| O1    | PO   | Unsigned | 5     | T76 + $unsigned(1'b1) (INV_IP.v:376)     |
| O2    | PO   | Unsigned | 5     | T80 + I1 (INV_IP.v:382)                  |
| O3    | PO   | Unsigned | 5     | T84 + O1 (INV_IP.v:388)                  |
| O4    | PO   | Unsigned | 5     | T88 + O2 (INV_IP.v:394)                  |
| O5    | PO   | Unsigned | 5     | T91 + O3 (INV_IP.v:399)                  |
==============================================================================

Datapath Report for DP_OP_132J1_123_980
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_132J1_123_980  | sub_393 (EC_TOP.v:393) C1465 (EC_TOP.v:313)         |
|                      | C1466 (EC_TOP.v:307) add_392 (EC_TOP.v:392)         |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 7     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 6     |                                          |
| T129  | IFO  | Unsigned | 8     | { I3, I5 } ? O1 : I4 ( EC_TOP.v:307 EC_TOP.v:313 ) |
| O1    | PO   | Signed   | 8     | I1 - I2 (EC_TOP.v:393)                   |
| O2    | PO   | Unsigned | 8     | T129 + I6 (EC_TOP.v:392)                 |
==============================================================================


Resource Report for Ungrouped Hierarchy div_63
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_61
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_59
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_58
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_57
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_48
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_67
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| u_div          | DW_div         | a_width=3  | u_div                      |
|                |                | b_width=2  |                            |
|                |                | tc_mode=0  |                            |
|                |                | rem_mode=1 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy rem_66
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_65
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_64
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_62
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_60
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'mult_388 (EC_TOP.v:388)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C1462 (EC_TOP.v:299)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/add_399 (INV_IP.v:399)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C143 (INV_IP.v:451)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| eq_x_3             | DW_cmp           | apparch (area)     |                |
| eq_x_4             | DW_cmp           | apparch (area)     |                |
| gte_x_17           | DW_cmp           | apparch (area)     |                |
| gte_x_19           | DW_cmp           | apparch (area)     |                |
| gte_x_21           | DW_cmp           | apparch (area)     |                |
| gte_x_23           | DW_cmp           | apparch (area)     |                |
| gte_x_25           | DW_cmp           | apparch (area)     |                |
| gte_x_27           | DW_cmp           | apparch (area)     |                |
| mult_x_47          | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| rem_48             | DW_div_uns       | cla                |                |
| gt_x_54            | DW_cmp           | apparch (area)     |                |
| div_57             | DW_div_uns       | cla                |                |
| rem_58             | DW_div_uns       | cla                |                |
| div_59             | DW_div_uns       | cla                |                |
| rem_60             | DW_div_uns       | cla                |                |
| div_61             | DW_div_uns       | cla                |                |
| rem_62             | DW_div_uns       | cla                |                |
| div_63             | DW_div_uns       | cla                |                |
| rem_64             | DW_div_uns       | cla                |                |
| div_65             | DW_div_uns       | cla3               |                |
| rem_66             | DW_div_uns       | cla2               |                |
| div_67             | DW_div_uns       | lut                |                |
| sub_x_68           | DW01_sub         | apparch (area)     |                |
| gt_x_71            | DW_cmp           | apparch (area)     |                |
| gt_x_72            | DW_cmp           | apparch (area)     |                |
| add_x_7            | DW01_inc         | apparch (area)     |                |
| u_div              | DW_div           | lut                |                |
| DP_OP_131J1_122_4741                  |                    |                |
|                    | DP_OP_131J1_122_4741 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_132J1_123_980                   |                    |                |
|                    | DP_OP_132J1_123_980 | str (area)      |                |
===============================================================================

1
