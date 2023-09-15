 
****************************************
Report : resources
Design : MMT
Version: R-2020.09
Date   : Tue Mar 28 07:15:25 2023
****************************************

Resource Sharing Report for design MMT in file
        /RAID2/COURSE/iclab/iclab034/Lab05/Exercise/01_RTL/MMT.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r812     | DW01_cmp6    | width=5    |               | eq_238 eq_540        |
|          |              |            |               | eq_567_2 gt_245      |
|          |              |            |               | gt_451 gt_508 gt_535 |
|          |              |            |               | lt_274 lt_443 lt_453 |
| r815     | DW_leftsh    | A_width=9  |               | sll_242_S2 sll_246   |
|          |              | SH_width=3 |               |                      |
| r816     | DW01_add     | width=9    |               | add_242_S2 add_246   |
| r817     | DW_leftsh    | A_width=9  |               | sll_243 sll_245_S2   |
|          |              | SH_width=3 |               |                      |
| r818     | DW01_add     | width=9    |               | add_243 add_245_S2   |
| r822     | DW01_cmp6    | width=5    |               | eq_664 eq_691 gt_352 |
|          |              |            |               | gt_376 lt_298        |
| r825     | DW01_inc     | width=8    |               | add_331_S2           |
|          |              |            |               | add_334_S2 add_337   |
| r827     | DW_cmp       | width=5    |               | gt_350 gt_374        |
| r828     | DW01_inc     | width=5    |               | add_443_S2           |
|          |              |            |               | add_447_S2 add_452   |
|          |              |            |               | add_453_S2           |
| r829     | DW01_cmp6    | width=5    |               | eq_555_2 eq_643      |
|          |              |            |               | lt_447               |
| r830     | DW01_cmp6    | width=4    |               | eq_561 lt_509 lt_514 |
| r831     | DW01_inc     | width=4    |               | add_509_S2           |
|          |              |            |               | add_514_S2           |
| r834     | DW01_cmp6    | width=4    |               | eq_561_2 eq_567      |
|          |              |            |               | lt_531 lt_536        |
| r835     | DW01_inc     | width=4    |               | add_531_S2           |
|          |              |            |               | add_536_S2           |
|          |              |            |               | add_540_S2           |
| r838     | DW_cmp       | width=5    |               | eq_598 lte_581       |
| r921     | DW01_dec     | width=4    |               | sub_208              |
| r923     | DW01_inc     | width=9    |               | add_238_S2           |
| r925     | DW_cmp       | width=4    |               | gt_241               |
| r927     | DW_cmp       | width=4    |               | gt_244               |
| r929     | DW_leftsh    | A_width=9  |               | sll_248              |
|          |              | SH_width=3 |               |                      |
| r931     | DW01_add     | width=9    |               | add_248              |
| r933     | DW_cmp       | width=5    |               | eq_308_2             |
| r935     | DW_cmp       | width=5    |               | gt_331               |
| r937     | DW_cmp       | width=5    |               | gt_334               |
| r939     | DW_cmp       | width=5    |               | gt_513               |
| r941     | DW_cmp       | width=5    |               | gt_530               |
| r943     | DW_cmp       | width=4    |               | eq_555               |
| r945     | DW_cmp       | width=5    |               | gt_578               |
| r947     | DW_cmp       | width=5    |               | eq_589               |
| r949     | DW01_inc     | width=4    |               | add_643_S2           |
| r1892    | DW_mult_tc   | a_width=20 |               | mult_705_2           |
|          |              | b_width=8  |               |                      |
| r1894    | DW_mult_tc   | a_width=20 |               | mult_705             |
|          |              | b_width=8  |               |                      |
| r1896    | DW_mult_tc   | a_width=20 |               | mult_705_3           |
|          |              | b_width=8  |               |                      |
| r1898    | DW_mult_tc   | a_width=20 |               | mult_705_4           |
|          |              | b_width=8  |               |                      |
| r1900    | DW_mult_tc   | a_width=20 |               | mult_705_5           |
|          |              | b_width=8  |               |                      |
| r1902    | DW_mult_tc   | a_width=20 |               | mult_705_6           |
|          |              | b_width=8  |               |                      |
| r1904    | DW_mult_tc   | a_width=20 |               | mult_705_7           |
|          |              | b_width=8  |               |                      |
| r1906    | DW_mult_tc   | a_width=20 |               | mult_705_8           |
|          |              | b_width=8  |               |                      |
| r1908    | DW_mult_tc   | a_width=20 |               | mult_705_9           |
|          |              | b_width=8  |               |                      |
| r1910    | DW_mult_tc   | a_width=20 |               | mult_705_10          |
|          |              | b_width=8  |               |                      |
| r1912    | DW_mult_tc   | a_width=20 |               | mult_705_11          |
|          |              | b_width=8  |               |                      |
| r1914    | DW_mult_tc   | a_width=20 |               | mult_705_12          |
|          |              | b_width=8  |               |                      |
| r1916    | DW_mult_tc   | a_width=20 |               | mult_705_13          |
|          |              | b_width=8  |               |                      |
| r1918    | DW_mult_tc   | a_width=20 |               | mult_705_14          |
|          |              | b_width=8  |               |                      |
| r1920    | DW_mult_tc   | a_width=20 |               | mult_705_15          |
|          |              | b_width=8  |               |                      |
| r1922    | DW_mult_tc   | a_width=20 |               | mult_705_16          |
|          |              | b_width=8  |               |                      |
| r1924    | DW01_add     | width=29   |               | add_15_root_add_705_16 |
| r1926    | DW01_add     | width=30   |               | add_14_root_add_705_16 |
| r1928    | DW01_add     | width=31   |               | add_13_root_add_705_16 |
| r1930    | DW01_add     | width=32   |               | add_12_root_add_705_16 |
| r1932    | DW01_add     | width=33   |               | add_11_root_add_705_16 |
| r1934    | DW01_add     | width=34   |               | add_10_root_add_705_16 |
| r1936    | DW01_add     | width=35   |               | add_9_root_add_705_16 |
| r1938    | DW01_add     | width=36   |               | add_7_root_add_0_root_add_705_16 |
| r1940    | DW01_add     | width=36   |               | add_8_root_add_0_root_add_705_16 |
| r1942    | DW01_add     | width=36   |               | add_2_root_add_0_root_add_705_16 |
| r1944    | DW01_add     | width=36   |               | add_3_root_add_0_root_add_705_16 |
| r1946    | DW01_add     | width=36   |               | add_5_root_add_0_root_add_705_16 |
| r1948    | DW01_add     | width=36   |               | add_6_root_add_0_root_add_705_16 |
| r1950    | DW01_add     | width=36   |               | add_1_root_add_0_root_add_705_16 |
| r1952    | DW01_add     | width=36   |               | add_4_root_add_0_root_add_705_16 |
| r1954    | DW01_add     | width=36   |               | add_0_root_add_0_root_add_705_16 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_7_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_1_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_0_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_14_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_12_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_705_2         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_9_root_add_705_16                 |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_10_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_11_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_13_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_2_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_705           | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_4_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_6_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_5_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_705_6         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_12        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_11        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_5         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_9         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_10        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_13        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_7         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_8         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_14        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_3         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_15        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_4         | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_705_16        | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_3_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_15_root_add_705_16                |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_8_root_add_0_root_add_705_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| r825               | DW01_inc         | rpl                |                |
| add_238_S2         | DW01_inc         | rpl                |                |
===============================================================================

1
