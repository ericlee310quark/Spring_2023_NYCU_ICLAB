 
****************************************
Report : resources
Design : SNN
Version: T-2022.03
Date   : Fri Apr 21 00:40:02 2023
****************************************

Resource Sharing Report for design SNN in file
        /RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE_wocg/01_RTL/SNN_wocg.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r635     | DW01_inc     | width=6    |               | add_137 add_138      |
|          |              |            |               | add_140 add_141      |
| r636     | DW_cmp       | width=6    |               | lt_203_G3_G3 lt_210  |
|          |              |            |               | lt_210_G2            |
|          |              |            |               | lt_210_G2_G1         |
|          |              |            |               | lt_210_G2_G2         |
|          |              |            |               | lt_210_G2_G3         |
|          |              |            |               | lt_210_G3            |
|          |              |            |               | lt_210_G3_G1         |
|          |              |            |               | lt_210_G3_G2         |
| r724     | DW_cmp       | width=6    |               | gt_223               |
| r726     | DW_cmp       | width=6    |               | lt_223               |
| r728     | DW_cmp       | width=6    |               | gt_224               |
| r730     | DW_cmp       | width=6    |               | lt_224               |
| r732     | DW_cmp       | width=6    |               | gt_225               |
| r734     | DW_cmp       | width=6    |               | lt_225               |
| r736     | DW_cmp       | width=6    |               | gt_226               |
| r772     | DW_div_uns   | a_width=20 |               | div_427              |
|          |              | b_width=12 |               |                      |
| r774     | DW_div_uns   | a_width=17 |               | div_428              |
|          |              | b_width=9  |               |                      |
| r776     | DW_cmp       | width=8    |               | gt_430               |
| r778     | DW_cmp       | width=8    |               | gt_431               |
| r780     | DW_cmp       | width=8    |               | gt_432               |
| r782     | DW_cmp       | width=8    |               | gt_434               |
| r784     | DW_cmp       | width=8    |               | gt_435               |
| r786     | DW_cmp       | width=8    |               | gt_436               |
| r788     | DW01_sub     | width=9    |               | sub_439              |
| r790     | DW01_sub     | width=9    |               | sub_440              |
| r792     | DW01_sub     | width=9    |               | sub_441              |
| r794     | DW01_sub     | width=9    |               | sub_442              |
| r796     | DW01_sub     | width=8    |               | sub_mult_444         |
| r798     | DW01_sub     | width=8    |               | sub_mult_445         |
| r800     | DW01_sub     | width=8    |               | sub_mult_446         |
| r802     | DW01_sub     | width=8    |               | sub_mult_447         |
| r1533    | DW_mult_uns  | a_width=8  |               | mult_409             |
|          |              | b_width=8  |               |                      |
| r1535    | DW_mult_uns  | a_width=8  |               | mult_408             |
|          |              | b_width=8  |               |                      |
| r1537    | DW01_add     | width=17   |               | add_419              |
| r2262    | DW_mult_uns  | a_width=8  |               | mult_411             |
|          |              | b_width=8  |               |                      |
| r2264    | DW_mult_uns  | a_width=8  |               | mult_410             |
|          |              | b_width=8  |               |                      |
| r2266    | DW01_add     | width=17   |               | add_420              |
| r3037    | DW_mult_uns  | a_width=8  |               | mult_417             |
|          |              | b_width=8  |               |                      |
| r3039    | DW_mult_uns  | a_width=8  |               | mult_416             |
|          |              | b_width=8  |               |                      |
| r3041    | DW_mult_uns  | a_width=8  |               | mult_415             |
|          |              | b_width=8  |               |                      |
| r3043    | DW_mult_uns  | a_width=8  |               | mult_414             |
|          |              | b_width=8  |               |                      |
| r3045    | DW_mult_uns  | a_width=8  |               | mult_413             |
|          |              | b_width=8  |               |                      |
| r3047    | DW01_add     | width=18   |               | add_5_root_add_0_root_add_423_4 |
| r3049    | DW01_add     | width=18   |               | add_4_root_add_0_root_add_423_4 |
| r3051    | DW01_add     | width=20   |               | add_3_root_add_0_root_add_423_4 |
| r3053    | DW01_add     | width=20   |               | add_2_root_add_0_root_add_423_4 |
| r3055    | DW01_add     | width=19   |               | add_1_root_add_0_root_add_423_4 |
| r3057    | DW01_add     | width=20   |               | add_0_root_add_0_root_add_423_4 |
| r3786    | DW01_add     | width=10   |               | add_2_root_add_0_root_add_449_3 |
| r3788    | DW01_add     | width=10   |               | add_1_root_add_0_root_add_449_3 |
| r3790    | DW01_add     | width=11   |               | add_0_root_add_0_root_add_449_3 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_427/u_div/u_add_B3                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_B6                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_B5                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_B7                |                    |                |
|                    | DW01_sub         | pparch (area,speed) | pparch        |
| add_2_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_419            | DW01_add         | pparch (area,speed)                 |
| div_427/u_div/u_add_PartRem_3_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_410           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_420            | DW01_add         | pparch (area,speed)                 |
| add_1_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| div_427/u_div/u_add_PartRem_2_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_2_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_2_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_2_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_408           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_409           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| div_427/u_div/u_add_PartRem_2_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_3_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_3_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_0_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| div_427/u_div/u_add_PartRem_2_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_2_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_411           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| div_427/u_div/u_add_PartRem_1_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_3_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| div_427/u_div/u_add_PartRem_1_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_5_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_4_root_add_0_root_add_423_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_417           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| mult_413           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| div_427/u_div/u_add_PartRem_3_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_3_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_1_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_1_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_1_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_416           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_415           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_414           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| div_427/u_div/u_add_PartRem_1_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_1_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_427/u_div/u_add_PartRem_0_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_428            | DW_div_uns       | mlt                |                |
| add_0_root_add_0_root_add_449_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_1_root_add_0_root_add_449_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_449_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_439            | DW01_sub         | rpl                |                |
| sub_440            | DW01_sub         | rpl                |                |
| sub_441            | DW01_sub         | rpl                |                |
| sub_442            | DW01_sub         | rpl                |                |
===============================================================================

1
