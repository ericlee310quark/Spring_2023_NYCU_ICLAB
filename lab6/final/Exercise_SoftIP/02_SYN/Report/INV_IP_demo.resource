 
****************************************
Report : resources
Design : INV_IP_demo
Version: T-2022.03
Date   : Tue Apr  4 17:24:58 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/INV_IP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_1         | DW_cmp         | width=6    | I_INV_IP/gt_366 (INV_IP.v:366) |
| div_4          | DW_div_uns     | a_width=6  | I_INV_IP/div_368 (INV_IP.v:368) |
            |                | b_width=6  |                            |
| rem_5          | DW_div_uns     | a_width=6  | I_INV_IP/rem_369 (INV_IP.v:369) |
            |                | b_width=6  |                            |
| div_6          | DW_div_uns     | a_width=6  | I_INV_IP/div_374 (INV_IP.v:374) |
            |                | b_width=5  |                            |
| rem_7          | DW_div_uns     | a_width=6  | I_INV_IP/rem_375 (INV_IP.v:375) |
            |                | b_width=5  |                            |
| div_8          | DW_div_uns     | a_width=5  | I_INV_IP/div_380 (INV_IP.v:380) |
            |                | b_width=5  |                            |
| rem_9          | DW_div_uns     | a_width=5  | I_INV_IP/rem_381 (INV_IP.v:381) |
            |                | b_width=5  |                            |
| div_10         | DW_div_uns     | a_width=5  | I_INV_IP/div_386 (INV_IP.v:386) |
            |                | b_width=4  |                            |
| rem_11         | DW_div_uns     | a_width=5  | I_INV_IP/rem_387 (INV_IP.v:387) |
            |                | b_width=4  |                            |
| div_12         | DW_div_uns     | a_width=4  | I_INV_IP/div_392 (INV_IP.v:392) |
            |                | b_width=3  |                            |
| rem_13         | DW_div_uns     | a_width=4  | I_INV_IP/rem_393 (INV_IP.v:393) |
            |                | b_width=3  |                            |
| div_14         | DW_div_uns     | a_width=3  | I_INV_IP/div_398 (INV_IP.v:398) |
            |                | b_width=2  |                            |
| sub_x_15       | DW01_sub       | width=6    | I_INV_IP/sub_407 (INV_IP.v:407) |
| DP_OP_34J1_122_3465             |            |                            |
|                | DP_OP_34J1_122_3465 |       |                            |
=============================================================================

Datapath Report for DP_OP_34J1_122_3465
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_34J1_122_3465  | I_INV_IP/mult_376 (INV_IP.v:376)                    |
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
| T7    | IFO  | Unsigned | 5     | I1 * I2 (INV_IP.v:376)                   |
| T11   | IFO  | Unsigned | 5     | O1 * I3 (INV_IP.v:382)                   |
| T15   | IFO  | Unsigned | 5     | O2 * I4 (INV_IP.v:388)                   |
| T19   | IFO  | Unsigned | 5     | O3 * I5 (INV_IP.v:394)                   |
| T22   | IFO  | Unsigned | 5     | O4 * I6 (INV_IP.v:399)                   |
| O1    | PO   | Unsigned | 5     | T7 + $unsigned(1'b1) (INV_IP.v:376)      |
| O2    | PO   | Unsigned | 5     | T11 + I1 (INV_IP.v:382)                  |
| O3    | PO   | Unsigned | 5     | T15 + O1 (INV_IP.v:388)                  |
| O4    | PO   | Unsigned | 5     | T19 + O2 (INV_IP.v:394)                  |
| O5    | PO   | Unsigned | 5     | T22 + O3 (INV_IP.v:399)                  |
==============================================================================


Resource Report for Ungrouped Hierarchy div_14
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| u_div          | DW_div         | a_width=3  | u_div                      |
|                |                | b_width=2  |                            |
|                |                | tc_mode=0  |                            |
|                |                | rem_mode=1 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy rem_13
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_12
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_11
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_10
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_9
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_8
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_7
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_6
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_5
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'I_INV_IP/add_399 (INV_IP.v:399)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C143 (INV_IP.v:451)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_1             | DW_cmp           | apparch (area)     |                |
| div_4              | DW_div_uns       | cla2               |                |
| rem_5              | DW_div_uns       | cla2               |                |
| div_6              | DW_div_uns       | cla2               |                |
| rem_7              | DW_div_uns       | cla2               |                |
| div_8              | DW_div_uns       | cla3               |                |
| rem_9              | DW_div_uns       | cla2               |                |
| div_10             | DW_div_uns       | cla3               |                |
| rem_11             | DW_div_uns       | cla2               |                |
| div_12             | DW_div_uns       | cla2               |                |
| rem_13             | DW_div_uns       | cla2               |                |
| div_14             | DW_div_uns       | lut                |                |
| sub_x_15           | DW01_sub         | apparch (area)     |                |
| u_div              | DW_div           | lut                |                |
| DP_OP_34J1_122_3465                   |                    |                |
|                    | DP_OP_34J1_122_3465 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
