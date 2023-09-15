 
****************************************
Report : resources
Design : IP
Version: T-2022.03
Date   : Thu Apr 20 19:24:37 2023
****************************************

Resource Sharing Report for design IP in file
        /RAID2/COURSE/iclab/iclab034/Lab08/PRACTICE/01_RTL/IP.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r1414    | DW_cmp       | width=8    |               | gt_153 gt_158        |
| r1415    | DW_cmp       | width=8    |               | gt_154 gt_159        |
| r1416    | DW_cmp       | width=8    |               | gt_155 gt_160        |
| r1417    | DW_cmp       | width=8    |               | gt_156 gt_161        |
| r1466    | DW01_inc     | width=6    |               | add_148_S2           |
| r1468    | DW_cmp       | width=8    |               | gt_163               |
| r1470    | DW_cmp       | width=8    |               | gt_164               |
| r1472    | DW_cmp       | width=8    |               | gt_166               |
| r1474    | DW_cmp       | width=8    |               | gt_167               |
| r1476    | DW_cmp       | width=8    |               | gt_169               |
| r1478    | DW_cmp       | width=8    |               | gt_171               |
| r1480    | DW_cmp       | width=8    |               | gt_173               |
| r1482    | DW_cmp       | width=8    |               | gt_174               |
| r1510    | DW_div_uns   | a_width=12 |               | div_301_G8_G8        |
|          |              | b_width=4  |               |                      |
| r1512    | DW01_add     | width=9    |               | add_304_G8_G8        |
| r2271    | DW01_add     | width=10   |               | add_7_root_add_0_root_add_301_8_G8_G8 |
| r2273    | DW01_add     | width=12   |               | add_2_root_add_0_root_add_301_8_G8_G8 |
| r2275    | DW01_add     | width=11   |               | add_3_root_add_0_root_add_301_8_G8_G8 |
| r2277    | DW01_add     | width=12   |               | add_5_root_add_0_root_add_301_8_G8_G8 |
| r2279    | DW01_add     | width=12   |               | add_6_root_add_0_root_add_301_8_G8_G8 |
| r2281    | DW01_add     | width=12   |               | add_1_root_add_0_root_add_301_8_G8_G8 |
| r2283    | DW01_add     | width=12   |               | add_4_root_add_0_root_add_301_8_G8_G8 |
| r2285    | DW01_add     | width=12   |               | add_0_root_add_0_root_add_301_8_G8_G8 |
| r3023    | DW_mult_uns  | a_width=3  |               | mult_300_G8_G8       |
|          |              | b_width=12 |               |                      |
| r3025    | DW01_add     | width=12   |               | add_3_root_sub_0_root_sub_300_4_G8_G8 |
| r3027    | DW01_add     | width=12   |               | add_2_root_sub_0_root_sub_300_4_G8_G8 |
| r3029    | DW01_add     | width=12   |               | add_1_root_sub_0_root_sub_300_4_G8_G8 |
| r3031    | DW01_sub     | width=12   |               | sub_0_root_sub_0_root_sub_300_4_G8_G8 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_301_G8_G8      | DW_div_uns       | rpl                |                |
| add_0_root_add_0_root_add_301_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_301_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_7_root_add_0_root_add_301_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_0_root_sub_0_root_sub_300_4_G8_G8 |                    |                |
|                    | DW01_sub         | rpl                |                |
| add_1_root_sub_0_root_sub_300_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_sub_0_root_sub_300_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_3_root_sub_0_root_sub_300_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| mult_300_G8_G8     | DW_mult_uns      | apparch (area)     |                |
| add_304_G8_G8      | DW01_add         | rpl                |                |
===============================================================================

1
