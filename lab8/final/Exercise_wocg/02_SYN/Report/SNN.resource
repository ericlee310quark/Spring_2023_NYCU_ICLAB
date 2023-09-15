 
****************************************
Report : resources
Design : SNN
Version: T-2022.03
Date   : Mon Apr 24 11:20:37 2023
****************************************

Resource Sharing Report for design SNN in file
        /RAID2/COURSE/iclab/iclab034/Lab08/EXERCISE_wocg/01_RTL/SNN_wocg.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r633     | DW_cmp       | width=6    |               | lt_124 lt_128        |
| r634     | DW01_inc     | width=6    |               | add_151 add_152      |
| r660     | DW_cmp       | width=6    |               | lt_618 lt_619        |
| r661     | DW_cmp       | width=6    |               | gt_618 gt_619        |
| r732     | DW_cmp       | width=6    |               | gt_367               |
| r734     | DW_cmp       | width=6    |               | lt_367               |
| r736     | DW_cmp       | width=6    |               | gt_368               |
| r738     | DW_cmp       | width=6    |               | lt_368               |
| r740     | DW_cmp       | width=6    |               | gt_369               |
| r742     | DW_cmp       | width=6    |               | lt_369               |
| r744     | DW_cmp       | width=6    |               | gt_370               |
| r746     | DW_cmp       | width=3    |               | gt_580               |
| r788     | DW_div_uns   | a_width=20 |               | div_631              |
|          |              | b_width=12 |               |                      |
| r790     | DW_div_uns   | a_width=17 |               | div_632              |
|          |              | b_width=9  |               |                      |
| r792     | DW_cmp       | width=8    |               | gt_637               |
| r794     | DW_cmp       | width=8    |               | gt_638               |
| r796     | DW_cmp       | width=8    |               | gt_639               |
| r798     | DW_cmp       | width=8    |               | gt_641               |
| r800     | DW_cmp       | width=8    |               | gt_642               |
| r802     | DW_cmp       | width=8    |               | gt_643               |
| r804     | DW01_sub     | width=9    |               | sub_646              |
| r806     | DW01_sub     | width=9    |               | sub_647              |
| r808     | DW01_sub     | width=9    |               | sub_648              |
| r810     | DW01_sub     | width=9    |               | sub_649              |
| r812     | DW01_sub     | width=8    |               | sub_651              |
| r814     | DW01_sub     | width=8    |               | sub_652              |
| r816     | DW01_sub     | width=8    |               | sub_653              |
| r818     | DW01_sub     | width=8    |               | sub_654              |
| r1553    | DW01_add     | width=10   |               | add_2_root_add_0_root_add_666_3 |
| r1555    | DW01_add     | width=10   |               | add_1_root_add_0_root_add_666_3 |
| r1557    | DW01_add     | width=10   |               | add_0_root_add_0_root_add_666_3 |
| r2282    | DW_mult_uns  | a_width=8  |               | mult_599             |
|          |              | b_width=8  |               |                      |
| r2284    | DW_mult_uns  | a_width=8  |               | mult_598             |
|          |              | b_width=8  |               |                      |
| r2286    | DW01_add     | width=17   |               | add_611              |
| r3011    | DW_mult_uns  | a_width=8  |               | mult_626_2           |
|          |              | b_width=8  |               |                      |
| r3013    | DW_mult_uns  | a_width=8  |               | mult_626             |
|          |              | b_width=8  |               |                      |
| r3015    | DW01_add     | width=17   |               | add_626              |
| r3802    | DW_mult_uns  | a_width=8  |               | mult_609             |
|          |              | b_width=8  |               |                      |
| r3804    | DW_mult_uns  | a_width=8  |               | mult_608             |
|          |              | b_width=8  |               |                      |
| r3806    | DW_mult_uns  | a_width=8  |               | mult_607             |
|          |              | b_width=8  |               |                      |
| r3808    | DW_mult_uns  | a_width=8  |               | mult_606             |
|          |              | b_width=8  |               |                      |
| r3810    | DW_mult_uns  | a_width=8  |               | mult_605             |
|          |              | b_width=8  |               |                      |
| r3812    | DW_mult_uns  | a_width=8  |               | mult_603             |
|          |              | b_width=8  |               |                      |
| r3814    | DW_mult_uns  | a_width=8  |               | mult_602             |
|          |              | b_width=8  |               |                      |
| r3816    | DW01_add     | width=18   |               | add_6_root_add_0_root_add_615_4 |
| r3818    | DW01_add     | width=18   |               | add_5_root_add_0_root_add_615_4 |
| r3820    | DW01_add     | width=19   |               | add_3_root_add_0_root_add_615_4 |
| r3822    | DW01_add     | width=20   |               | add_4_root_add_0_root_add_615_4 |
| r3824    | DW01_add     | width=20   |               | add_2_root_add_0_root_add_615_4 |
| r3826    | DW01_add     | width=20   |               | add_1_root_add_0_root_add_615_4 |
| r3828    | DW01_add     | width=20   |               | add_0_root_add_0_root_add_615_4 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_631/u_div/u_add_B5                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_B7                |                    |                |
|                    | DW01_sub         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_B3                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_B6                |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_3_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_3_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_0_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| div_631/u_div/u_add_PartRem_0_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_598           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| add_611            | DW01_add         | pparch (area,speed)                 |
| mult_599           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| div_631/u_div/u_add_PartRem_0_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_0_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_0_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_0_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_3_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_3_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_3_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_0_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_2_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_4       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_5_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_608           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_2_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_3_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_1_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_609           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_4_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_602           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_605           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| div_631/u_div/u_add_PartRem_2_5       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_2_6       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_2_3       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_6_root_add_0_root_add_615_4       |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| div_631/u_div/u_add_PartRem_2_1       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| mult_603           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_607           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_606           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| div_631/u_div/u_add_PartRem_2_7       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_1_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_2_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_631/u_div/u_add_PartRem_0_2       |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| add_626            | DW01_add         | pparch (speed)     |                |
| mult_626           | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| mult_626_2         | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| div_632            | DW_div_uns       | mlt                |                |
| add_0_root_add_0_root_add_666_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_1_root_add_0_root_add_666_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_666_3       |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_646            | DW01_sub         | rpl                |                |
| sub_647            | DW01_sub         | rpl                |                |
| sub_648            | DW01_sub         | rpl                |                |
| sub_649            | DW01_sub         | rpl                |                |
| sub_651            | DW01_sub         | rpl                |                |
| sub_652            | DW01_sub         | rpl                |                |
| sub_653            | DW01_sub         | rpl                |                |
| sub_654            | DW01_sub         | rpl                |                |
===============================================================================

1
