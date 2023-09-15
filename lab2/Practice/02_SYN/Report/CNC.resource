 
****************************************
Report : resources
Design : CNC
Version: R-2020.09
Date   : Thu Mar  2 23:48:19 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab02/Practice/01_RTL/CNC.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_3        | DW01_inc       | width=2    | add_113 (CNC.v:113)        |
|                |                |            | add_115 (CNC.v:115)        |
|                |                |            | add_117 (CNC.v:117)        |
|                |                |            | add_119 (CNC.v:119)        |
|                |                |            | add_121 (CNC.v:121)        |
| DP_OP_75J1_122_4330             |            |                            |
|                | DP_OP_75J1_122_4330 |       |                            |
=============================================================================

Datapath Report for DP_OP_75J1_122_4330
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_75J1_122_4330  | sub_183_S2 (CNC.v:183) C1339 (CNC.v:183)            |
|                      | C1341 (CNC.v:181) sub_183_S3 (CNC.v:183)            |
|                      | sub_192_S4 (CNC.v:192) C1342 (CNC.v:192)            |
|                      | C1343 (CNC.v:189) mult_166 (CNC.v:166)              |
|                      | add_166 (CNC.v:166) add_205_S4 (CNC.v:205)          |
|                      | add_216_S4 (CNC.v:216)                              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 8     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Signed   | 9     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Signed   | 8     |                                          |
| I7    | PI   | Unsigned | 1     |                                          |
| I8    | PI   | Signed   | 9     |                                          |
| I9    | PI   | Unsigned | 1     |                                          |
| I10   | PI   | Signed   | 16    |                                          |
| I11   | PI   | Unsigned | 17    |                                          |
| I12   | PI   | Unsigned | 17    |                                          |
| T20   | IFO  | Signed   | 9     | $signed(1'b0) - I1 (CNC.v:183)           |
| T21   | IFO  | Signed   | 9     | $signed(1'b0) - I6 ( CNC.v:183 CNC.v:192 ) |
| T62   | IFO  | Signed   | 9     | { I2, I3, I5 } ? T20 : T21 : I4 ( CNC.v:181 CNC.v:183 ) |
| T73   | IFO  | Signed   | 9     | { I7, I9 } ? T21 : I8 ( CNC.v:189 CNC.v:192 ) |
| T15   | IFO  | Signed   | 17    | T62 * T73 (CNC.v:166)                    |
| O1    | PO   | Signed   | 17    | I10 + T15 (CNC.v:166)                    |
| O2    | PO   | Unsigned | 17    | I11 + O1 (CNC.v:205)                     |
| O3    | PO   | Unsigned | 17    | I12 + O1 (CNC.v:216)                     |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_3            | DW01_inc         | apparch (area)     |                |
| DP_OP_75J1_122_4330                   |                    |                |
|                    | DP_OP_75J1_122_4330 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
