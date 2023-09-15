 
****************************************
Report : resources
Design : CONV
Version: T-2022.03
Date   : Fri Apr 14 14:47:06 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab034/Lab07/PRACTICE/01_RTL/CONV.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_4        | DW01_inc       | width=2    | add_118 (CONV.v:118)       |
| add_x_5        | DW01_inc       | width=3    | add_128 (CONV.v:128)       |
| DP_OP_150J1_122_2395            |            |                            |
|                | DP_OP_150J1_122_2395 |      |                            |
| DP_OP_151J1_123_2395            |            |                            |
|                | DP_OP_151J1_123_2395 |      |                            |
| DP_OP_152J1_124_2395            |            |                            |
|                | DP_OP_152J1_124_2395 |      |                            |
| DP_OP_153J1_125_2395            |            |                            |
|                | DP_OP_153J1_125_2395 |      |                            |
| DP_OP_154J1_126_2395            |            |                            |
|                | DP_OP_154J1_126_2395 |      |                            |
| DP_OP_155J1_127_2395            |            |                            |
|                | DP_OP_155J1_127_2395 |      |                            |
| DP_OP_156J1_128_2395            |            |                            |
|                | DP_OP_156J1_128_2395 |      |                            |
=============================================================================

Datapath Report for DP_OP_150J1_122_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_150J1_122_2395 | mult_94 (CONV.v:94) add_94 (CONV.v:94)              |
|                      | add_94_2 (CONV.v:94) add_94_3 (CONV.v:94)           |
|                      | mult_94_2 (CONV.v:94) mult_94_3 (CONV.v:94)         |
|                      | mult_94_4 (CONV.v:94)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T2    | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:94)                      |
| T3    | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:94)                      |
| T5    | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:94)                      |
| T7    | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:94)                      |
| O1    | PO   | Unsigned | 8     | T2 + T3 + T5 + T7 (CONV.v:94)            |
==============================================================================

Datapath Report for DP_OP_151J1_123_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_151J1_123_2395 | mult_95 (CONV.v:95) add_95 (CONV.v:95)              |
|                      | add_95_2 (CONV.v:95) add_95_3 (CONV.v:95)           |
|                      | mult_95_2 (CONV.v:95) mult_95_3 (CONV.v:95)         |
|                      | mult_95_4 (CONV.v:95)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T9    | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:95)                      |
| T10   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:95)                      |
| T12   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:95)                      |
| T14   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:95)                      |
| O1    | PO   | Unsigned | 8     | T9 + T10 + T12 + T14 (CONV.v:95)         |
==============================================================================

Datapath Report for DP_OP_152J1_124_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_152J1_124_2395 | mult_96 (CONV.v:96) add_96 (CONV.v:96)              |
|                      | add_96_2 (CONV.v:96) add_96_3 (CONV.v:96)           |
|                      | mult_96_2 (CONV.v:96) mult_96_3 (CONV.v:96)         |
|                      | mult_96_4 (CONV.v:96)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T16   | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:96)                      |
| T17   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:96)                      |
| T19   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:96)                      |
| T21   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:96)                      |
| O1    | PO   | Unsigned | 8     | T16 + T17 + T19 + T21 (CONV.v:96)        |
==============================================================================

Datapath Report for DP_OP_153J1_125_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_153J1_125_2395 | mult_97 (CONV.v:97) add_97 (CONV.v:97)              |
|                      | add_97_2 (CONV.v:97) add_97_3 (CONV.v:97)           |
|                      | mult_97_2 (CONV.v:97) mult_97_3 (CONV.v:97)         |
|                      | mult_97_4 (CONV.v:97)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T23   | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:97)                      |
| T24   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:97)                      |
| T26   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:97)                      |
| T28   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:97)                      |
| O1    | PO   | Unsigned | 8     | T23 + T24 + T26 + T28 (CONV.v:97)        |
==============================================================================

Datapath Report for DP_OP_154J1_126_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_154J1_126_2395 | mult_98 (CONV.v:98) add_98 (CONV.v:98)              |
|                      | add_98_2 (CONV.v:98) add_98_3 (CONV.v:98)           |
|                      | mult_98_2 (CONV.v:98) mult_98_3 (CONV.v:98)         |
|                      | mult_98_4 (CONV.v:98)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T30   | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:98)                      |
| T31   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:98)                      |
| T33   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:98)                      |
| T35   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:98)                      |
| O1    | PO   | Unsigned | 8     | T30 + T31 + T33 + T35 (CONV.v:98)        |
==============================================================================

Datapath Report for DP_OP_155J1_127_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_155J1_127_2395 | mult_99 (CONV.v:99) add_99 (CONV.v:99)              |
|                      | add_99_2 (CONV.v:99) add_99_3 (CONV.v:99)           |
|                      | mult_99_2 (CONV.v:99) mult_99_3 (CONV.v:99)         |
|                      | mult_99_4 (CONV.v:99)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T37   | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:99)                      |
| T38   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:99)                      |
| T40   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:99)                      |
| T42   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:99)                      |
| O1    | PO   | Unsigned | 8     | T37 + T38 + T40 + T42 (CONV.v:99)        |
==============================================================================

Datapath Report for DP_OP_156J1_128_2395
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_156J1_128_2395 | mult_100 (CONV.v:100) add_100 (CONV.v:100)          |
|                      | add_100_2 (CONV.v:100) add_100_3 (CONV.v:100)       |
|                      | mult_100_2 (CONV.v:100) mult_100_3 (CONV.v:100)     |
|                      | mult_100_4 (CONV.v:100)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 3     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| I7    | PI   | Unsigned | 3     |                                          |
| I8    | PI   | Unsigned | 3     |                                          |
| T44   | IFO  | Unsigned | 6     | I1 * I2 (CONV.v:100)                     |
| T45   | IFO  | Unsigned | 6     | I3 * I4 (CONV.v:100)                     |
| T47   | IFO  | Unsigned | 6     | I5 * I6 (CONV.v:100)                     |
| T49   | IFO  | Unsigned | 6     | I7 * I8 (CONV.v:100)                     |
| O1    | PO   | Unsigned | 8     | T44 + T45 + T47 + T49 (CONV.v:100)       |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_4            | DW01_inc         | apparch (area)     |                |
| add_x_5            | DW01_inc         | apparch (area)     |                |
| DP_OP_150J1_122_2395                  |                    |                |
|                    | DP_OP_150J1_122_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_151J1_123_2395                  |                    |                |
|                    | DP_OP_151J1_123_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_152J1_124_2395                  |                    |                |
|                    | DP_OP_152J1_124_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_153J1_125_2395                  |                    |                |
|                    | DP_OP_153J1_125_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_154J1_126_2395                  |                    |                |
|                    | DP_OP_154J1_126_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_155J1_127_2395                  |                    |                |
|                    | DP_OP_155J1_127_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_156J1_128_2395                  |                    |                |
|                    | DP_OP_156J1_128_2395 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
