/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Mon Apr 24 11:20:37 2023
/////////////////////////////////////////////////////////////


module SNN ( clk, rst_n, in_valid, img, ker, weight, out_valid, out_data );
  input [7:0] img;
  input [7:0] ker;
  input [7:0] weight;
  output [9:0] out_data;
  input clk, rst_n, in_valid;
  output out_valid;
  wire   next_state_0_, N97, N98, N99, N100, N101, N102, N103, N104, N105,
         N106, N191, N192, N193, N194, N195, N196, N197, N198, N201, N202,
         N203, N204, N205, N206, N207, N208, N211, N212, N213, N214, N215,
         N216, N217, N218, N221, N222, N223, N224, N225, N226, N227, N228,
         N231, N232, N233, N234, N235, N236, N237, N238, N241, N242, N243,
         N244, N245, N246, N247, N248, N251, N252, N253, N254, N255, N256,
         N257, N258, N261, N262, N263, N264, N265, N266, N267, N268, N271,
         N272, N273, N274, N275, N276, N277, N278, N281, N282, N283, N284,
         N285, N286, N287, N288, N291, N292, N293, N294, N295, N296, N297,
         N298, N301, N302, N303, N304, N305, N306, N307, N308, N311, N312,
         N313, N314, N315, N316, N317, N318, N321, N322, N323, N324, N325,
         N326, N327, N328, N331, N332, N333, N334, N335, N336, N337, N338,
         N341, N342, N343, N344, N345, N346, N347, N348, N351, N352, N353,
         N354, N355, N356, N357, N358, N361, N362, N363, N364, N365, N366,
         N367, N368, N371, N372, N373, N374, N375, N376, N377, N378, N381,
         N382, N383, N384, N385, N386, N387, N388, N391, N392, N393, N394,
         N395, N396, N397, N398, N401, N402, N403, N404, N405, N406, N407,
         N408, N411, N412, N413, N414, N415, N416, N417, N418, N421, N422,
         N423, N424, N425, N426, N427, N428, N431, N432, N433, N434, N435,
         N436, N437, N438, N441, N442, N443, N444, N445, N446, N447, N448,
         N451, N452, N453, N454, N455, N456, N457, N458, N461, N462, N463,
         N464, N465, N466, N467, N468, N482, N483, N484, N485, N486, N487,
         N488, N489, N492, N493, N494, N495, N496, N497, N498, N499, N502,
         N503, N504, N505, N506, N507, N508, N509, N512, N513, N514, N515,
         N516, N517, N518, N519, N522, N523, N524, N525, N526, N527, N528,
         N529, N532, N533, N534, N535, N536, N537, N538, N539, N542, N543,
         N544, N545, N546, N547, N548, N549, N552, N553, N554, N555, N556,
         N557, N558, N559, N562, N563, N564, N565, N566, N567, N568, N569,
         N570, N571, N572, N573, N574, N575, N576, N577, mult_a_1__7_,
         mult_a_1__6_, mult_a_1__5_, mult_a_1__4_, mult_a_1__3_, mult_a_1__2_,
         mult_a_1__1_, mult_a_1__0_, mult_a_0__7_, mult_a_0__6_, mult_a_0__5_,
         mult_a_0__4_, mult_a_0__3_, mult_a_0__2_, mult_a_0__1_, mult_a_0__0_,
         mult_b_1__7_, mult_b_1__6_, mult_b_1__5_, mult_b_1__4_, mult_b_1__3_,
         mult_b_1__2_, mult_b_1__1_, mult_b_1__0_, mult_b_0__7_, mult_b_0__6_,
         mult_b_0__5_, mult_b_0__4_, mult_b_0__3_, mult_b_0__2_, mult_b_0__1_,
         mult_b_0__0_, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n682, n684, n686, n687,
         n702, n703, n705, n706, n707, n708, n709, n710, n712, n715, n716,
         n717, n718, n724, n726, n727, n728, n729, n737, n738, n741, n743,
         n744, n746, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, mult_comb_result_8__9_,
         mult_comb_result_8__8_, mult_comb_result_8__7_,
         mult_comb_result_8__6_, mult_comb_result_8__5_,
         mult_comb_result_8__4_, mult_comb_result_8__3_,
         mult_comb_result_8__2_, mult_comb_result_8__1_,
         mult_comb_result_8__15_, mult_comb_result_8__14_,
         mult_comb_result_8__13_, mult_comb_result_8__12_,
         mult_comb_result_8__11_, mult_comb_result_8__10_,
         mult_comb_result_8__0_, mult_comb_result_7__9_,
         mult_comb_result_7__8_, mult_comb_result_7__7_,
         mult_comb_result_7__6_, mult_comb_result_7__5_,
         mult_comb_result_7__4_, mult_comb_result_7__3_,
         mult_comb_result_7__2_, mult_comb_result_7__1_,
         mult_comb_result_7__15_, mult_comb_result_7__14_,
         mult_comb_result_7__13_, mult_comb_result_7__12_,
         mult_comb_result_7__11_, mult_comb_result_7__10_,
         mult_comb_result_7__0_, mult_comb_result_6__9_,
         mult_comb_result_6__8_, mult_comb_result_6__7_,
         mult_comb_result_6__6_, mult_comb_result_6__5_,
         mult_comb_result_6__4_, mult_comb_result_6__3_,
         mult_comb_result_6__2_, mult_comb_result_6__1_,
         mult_comb_result_6__15_, mult_comb_result_6__14_,
         mult_comb_result_6__13_, mult_comb_result_6__12_,
         mult_comb_result_6__11_, mult_comb_result_6__10_,
         mult_comb_result_6__0_, mult_comb_result_5__9_,
         mult_comb_result_5__8_, mult_comb_result_5__7_,
         mult_comb_result_5__6_, mult_comb_result_5__5_,
         mult_comb_result_5__4_, mult_comb_result_5__3_,
         mult_comb_result_5__2_, mult_comb_result_5__1_,
         mult_comb_result_5__15_, mult_comb_result_5__14_,
         mult_comb_result_5__13_, mult_comb_result_5__12_,
         mult_comb_result_5__11_, mult_comb_result_5__10_,
         mult_comb_result_5__0_, mult_comb_result_4__9_,
         mult_comb_result_4__8_, mult_comb_result_4__7_,
         mult_comb_result_4__6_, mult_comb_result_4__5_,
         mult_comb_result_4__4_, mult_comb_result_4__3_,
         mult_comb_result_4__2_, mult_comb_result_4__1_,
         mult_comb_result_4__15_, mult_comb_result_4__14_,
         mult_comb_result_4__13_, mult_comb_result_4__12_,
         mult_comb_result_4__11_, mult_comb_result_4__10_,
         mult_comb_result_4__0_, mult_comb_result_3__9_,
         mult_comb_result_3__8_, mult_comb_result_3__7_,
         mult_comb_result_3__6_, mult_comb_result_3__5_,
         mult_comb_result_3__4_, mult_comb_result_3__3_,
         mult_comb_result_3__2_, mult_comb_result_3__1_,
         mult_comb_result_3__15_, mult_comb_result_3__14_,
         mult_comb_result_3__13_, mult_comb_result_3__12_,
         mult_comb_result_3__11_, mult_comb_result_3__10_,
         mult_comb_result_3__0_, mult_comb_result_2__9_,
         mult_comb_result_2__8_, mult_comb_result_2__7_,
         mult_comb_result_2__6_, mult_comb_result_2__5_,
         mult_comb_result_2__4_, mult_comb_result_2__3_,
         mult_comb_result_2__2_, mult_comb_result_2__1_,
         mult_comb_result_2__15_, mult_comb_result_2__14_,
         mult_comb_result_2__13_, mult_comb_result_2__12_,
         mult_comb_result_2__11_, mult_comb_result_2__10_,
         mult_comb_result_2__0_, N651, N650, N649, N648, N647, N646, N645,
         N644, N643, N642, N641, N640, N639, N638, N637, N636, N635, N614,
         N613, N612, N611, N610, N609, N608, N607, N606, N605, N604, N603,
         N602, N601, N600, N599, N598, mult_comb_result_1__9_,
         mult_comb_result_1__8_, mult_comb_result_1__7_,
         mult_comb_result_1__6_, mult_comb_result_1__5_,
         mult_comb_result_1__4_, mult_comb_result_1__3_,
         mult_comb_result_1__2_, mult_comb_result_1__1_,
         mult_comb_result_1__15_, mult_comb_result_1__14_,
         mult_comb_result_1__13_, mult_comb_result_1__12_,
         mult_comb_result_1__11_, mult_comb_result_1__10_,
         mult_comb_result_1__0_, mult_comb_result_0__9_,
         mult_comb_result_0__8_, mult_comb_result_0__7_,
         mult_comb_result_0__6_, mult_comb_result_0__5_,
         mult_comb_result_0__4_, mult_comb_result_0__3_,
         mult_comb_result_0__2_, mult_comb_result_0__1_,
         mult_comb_result_0__15_, mult_comb_result_0__14_,
         mult_comb_result_0__13_, mult_comb_result_0__12_,
         mult_comb_result_0__11_, mult_comb_result_0__10_,
         mult_comb_result_0__0_, N694, N693, N692, N691, N690, N689, N688,
         N687, N686, N685, N684, N683, N682, N681, N680, N679, N678, N677,
         N676, N675, N674, N673, N672, N671, N670, N669, N668, N667, N666,
         N665, N664, N663, N728, N727, N726, N725, N724, N723, N722, N721,
         N720, div_631_u_div_BInv_3__12_, div_631_u_div_BInv_3__11_,
         div_631_u_div_BInv_3__10_, div_631_u_div_BInv_3__9_,
         div_631_u_div_BInv_3__4_, div_631_u_div_BInv_3__3_,
         div_631_u_div_BInv_3__2_, div_631_u_div_BInv_3__1_,
         div_631_u_div_BInv_3__0_, div_631_u_div_BInv_5__13_,
         div_631_u_div_BInv_5__10_, div_631_u_div_BInv_5__2_,
         div_631_u_div_BInv_5__0_, div_631_u_div_BInv_6__13_,
         div_631_u_div_BInv_6__12_, div_631_u_div_BInv_6__11_,
         div_631_u_div_BInv_6__10_, div_631_u_div_BInv_6__9_,
         div_631_u_div_BInv_6__5_, div_631_u_div_BInv_6__4_,
         div_631_u_div_BInv_6__3_, div_631_u_div_BInv_6__2_,
         div_631_u_div_BInv_6__1_, div_631_u_div_BInv_7__13_,
         div_631_u_div_BInv_7__12_, div_631_u_div_BInv_7__9_,
         div_631_u_div_BInv_7__8_, div_631_u_div_BInv_7__4_,
         div_631_u_div_BInv_7__1_, div_631_u_div_BInv_7__0_,
         div_631_u_div_PartRem_5__4_, div_631_u_div_PartRem_5__3_,
         div_631_u_div_PartRem_3__14_, div_631_u_div_PartRem_3__13_,
         div_631_u_div_PartRem_3__12_, div_631_u_div_PartRem_3__11_,
         div_631_u_div_PartRem_3__10_, div_631_u_div_PartRem_3__9_,
         div_631_u_div_PartRem_3__8_, div_631_u_div_PartRem_3__7_,
         div_631_u_div_PartRem_3__6_, div_631_u_div_PartRem_3__5_,
         div_631_u_div_PartRem_3__4_, div_631_u_div_PartRem_3__3_,
         div_631_u_div_PartRem_2__14_, div_631_u_div_PartRem_2__13_,
         div_631_u_div_PartRem_2__12_, div_631_u_div_PartRem_2__11_,
         div_631_u_div_PartRem_2__10_, div_631_u_div_PartRem_2__9_,
         div_631_u_div_PartRem_2__8_, div_631_u_div_PartRem_2__7_,
         div_631_u_div_PartRem_2__6_, div_631_u_div_PartRem_1__14_,
         div_631_u_div_PartRem_1__13_, div_631_u_div_PartRem_1__12_,
         div_631_u_div_PartRem_1__11_, div_631_u_div_PartRem_1__10_,
         div_631_u_div_PartRem_1__8_, div_631_u_div_PartRem_1__6_,
         div_631_u_div_PartRem_1__5_, div_631_u_div_PartRem_1__4_,
         div_631_u_div_PartRem_1__3_, div_631_u_div_CryOut_1__3_,
         div_631_u_div_CryOut_1__2_, div_631_u_div_CryOut_1__1_,
         div_631_u_div_CryOut_1__0_, div_631_u_div_CryOut_2__3_,
         div_631_u_div_CryOut_2__2_, div_631_u_div_CryOut_2__1_,
         div_631_u_div_CryOut_2__0_, div_631_u_div_CryOut_3__3_,
         div_631_u_div_CryOut_3__2_, div_631_u_div_CryOut_3__1_,
         div_631_u_div_CryOut_3__0_, div_631_u_div_CryOut_5__2_,
         div_631_u_div_CryOut_5__1_, div_631_u_div_CryOut_5__0_,
         div_631_u_div_CryOut_6__3_, div_631_u_div_CryOut_6__2_,
         div_631_u_div_CryOut_6__1_, div_631_u_div_CryOut_6__0_,
         div_631_u_div_CryOut_7__2_, div_631_u_div_CryOut_7__1_,
         div_631_u_div_CryOut_7__0_, div_631_u_div_SumTmp_1__3__11_,
         div_631_u_div_SumTmp_1__3__10_, div_631_u_div_SumTmp_1__3__9_,
         div_631_u_div_SumTmp_1__3__8_, div_631_u_div_SumTmp_1__3__7_,
         div_631_u_div_SumTmp_1__3__6_, div_631_u_div_SumTmp_1__3__5_,
         div_631_u_div_SumTmp_1__3__4_, div_631_u_div_SumTmp_1__3__3_,
         div_631_u_div_SumTmp_1__3__2_, div_631_u_div_SumTmp_1__3__1_,
         div_631_u_div_SumTmp_1__3__0_, div_631_u_div_SumTmp_1__2__11_,
         div_631_u_div_SumTmp_1__2__10_, div_631_u_div_SumTmp_1__2__9_,
         div_631_u_div_SumTmp_1__2__8_, div_631_u_div_SumTmp_1__2__7_,
         div_631_u_div_SumTmp_1__2__6_, div_631_u_div_SumTmp_1__2__5_,
         div_631_u_div_SumTmp_1__2__4_, div_631_u_div_SumTmp_1__2__3_,
         div_631_u_div_SumTmp_1__2__2_, div_631_u_div_SumTmp_1__2__1_,
         div_631_u_div_SumTmp_1__2__0_, div_631_u_div_SumTmp_1__1__11_,
         div_631_u_div_SumTmp_1__1__10_, div_631_u_div_SumTmp_1__1__9_,
         div_631_u_div_SumTmp_1__1__8_, div_631_u_div_SumTmp_1__1__7_,
         div_631_u_div_SumTmp_1__1__6_, div_631_u_div_SumTmp_1__1__5_,
         div_631_u_div_SumTmp_1__1__4_, div_631_u_div_SumTmp_1__1__3_,
         div_631_u_div_SumTmp_1__1__2_, div_631_u_div_SumTmp_1__1__1_,
         div_631_u_div_SumTmp_1__1__0_, div_631_u_div_SumTmp_2__3__11_,
         div_631_u_div_SumTmp_2__3__10_, div_631_u_div_SumTmp_2__3__9_,
         div_631_u_div_SumTmp_2__3__8_, div_631_u_div_SumTmp_2__3__7_,
         div_631_u_div_SumTmp_2__3__6_, div_631_u_div_SumTmp_2__3__5_,
         div_631_u_div_SumTmp_2__3__4_, div_631_u_div_SumTmp_2__3__3_,
         div_631_u_div_SumTmp_2__3__2_, div_631_u_div_SumTmp_2__3__1_,
         div_631_u_div_SumTmp_2__3__0_, div_631_u_div_SumTmp_2__2__11_,
         div_631_u_div_SumTmp_2__2__10_, div_631_u_div_SumTmp_2__2__9_,
         div_631_u_div_SumTmp_2__2__8_, div_631_u_div_SumTmp_2__2__7_,
         div_631_u_div_SumTmp_2__2__6_, div_631_u_div_SumTmp_2__2__5_,
         div_631_u_div_SumTmp_2__2__4_, div_631_u_div_SumTmp_2__2__3_,
         div_631_u_div_SumTmp_2__2__2_, div_631_u_div_SumTmp_2__2__1_,
         div_631_u_div_SumTmp_2__2__0_, div_631_u_div_SumTmp_2__1__11_,
         div_631_u_div_SumTmp_2__1__10_, div_631_u_div_SumTmp_2__1__9_,
         div_631_u_div_SumTmp_2__1__8_, div_631_u_div_SumTmp_2__1__7_,
         div_631_u_div_SumTmp_2__1__6_, div_631_u_div_SumTmp_2__1__5_,
         div_631_u_div_SumTmp_2__1__4_, div_631_u_div_SumTmp_2__1__3_,
         div_631_u_div_SumTmp_2__1__2_, div_631_u_div_SumTmp_2__1__1_,
         div_631_u_div_SumTmp_2__1__0_, div_631_u_div_SumTmp_3__3__11_,
         div_631_u_div_SumTmp_3__3__10_, div_631_u_div_SumTmp_3__3__9_,
         div_631_u_div_SumTmp_3__3__8_, div_631_u_div_SumTmp_3__3__7_,
         div_631_u_div_SumTmp_3__3__6_, div_631_u_div_SumTmp_3__3__5_,
         div_631_u_div_SumTmp_3__3__4_, div_631_u_div_SumTmp_3__3__3_,
         div_631_u_div_SumTmp_3__3__2_, div_631_u_div_SumTmp_3__3__1_,
         div_631_u_div_SumTmp_3__3__0_, div_631_u_div_SumTmp_3__2__11_,
         div_631_u_div_SumTmp_3__2__10_, div_631_u_div_SumTmp_3__2__9_,
         div_631_u_div_SumTmp_3__2__8_, div_631_u_div_SumTmp_3__2__7_,
         div_631_u_div_SumTmp_3__2__6_, div_631_u_div_SumTmp_3__2__5_,
         div_631_u_div_SumTmp_3__2__4_, div_631_u_div_SumTmp_3__2__3_,
         div_631_u_div_SumTmp_3__2__2_, div_631_u_div_SumTmp_3__2__1_,
         div_631_u_div_SumTmp_3__2__0_, div_631_u_div_SumTmp_3__1__11_,
         div_631_u_div_SumTmp_3__1__10_, div_631_u_div_SumTmp_3__1__9_,
         div_631_u_div_SumTmp_3__1__8_, div_631_u_div_SumTmp_3__1__7_,
         div_631_u_div_SumTmp_3__1__6_, div_631_u_div_SumTmp_3__1__5_,
         div_631_u_div_SumTmp_3__1__4_, div_631_u_div_SumTmp_3__1__3_,
         div_631_u_div_SumTmp_3__1__2_, div_631_u_div_SumTmp_3__1__1_,
         div_631_u_div_SumTmp_3__1__0_, div_631_u_div_SumTmp_4__3__11_,
         div_631_u_div_SumTmp_4__3__10_, div_631_u_div_SumTmp_4__3__9_,
         div_631_u_div_SumTmp_4__3__8_, div_631_u_div_SumTmp_4__3__7_,
         div_631_u_div_SumTmp_4__3__6_, div_631_u_div_SumTmp_4__3__5_,
         div_631_u_div_SumTmp_4__3__4_, div_631_u_div_SumTmp_4__3__3_,
         div_631_u_div_SumTmp_4__3__2_, div_631_u_div_SumTmp_4__3__1_,
         div_631_u_div_SumTmp_4__3__0_, div_631_u_div_SumTmp_4__2__11_,
         div_631_u_div_SumTmp_4__2__10_, div_631_u_div_SumTmp_4__2__9_,
         div_631_u_div_SumTmp_4__2__8_, div_631_u_div_SumTmp_4__2__7_,
         div_631_u_div_SumTmp_4__2__6_, div_631_u_div_SumTmp_4__2__5_,
         div_631_u_div_SumTmp_4__2__4_, div_631_u_div_SumTmp_4__2__3_,
         div_631_u_div_SumTmp_4__2__2_, div_631_u_div_SumTmp_4__2__1_,
         div_631_u_div_SumTmp_4__2__0_, div_631_u_div_SumTmp_4__1__11_,
         div_631_u_div_SumTmp_4__1__10_, div_631_u_div_SumTmp_4__1__9_,
         div_631_u_div_SumTmp_4__1__8_, div_631_u_div_SumTmp_4__1__7_,
         div_631_u_div_SumTmp_4__1__6_, div_631_u_div_SumTmp_4__1__5_,
         div_631_u_div_SumTmp_4__1__4_, div_631_u_div_SumTmp_4__1__3_,
         div_631_u_div_SumTmp_4__1__2_, div_631_u_div_SumTmp_4__1__1_,
         div_631_u_div_SumTmp_4__1__0_, div_631_u_div_SumTmp_5__2__11_,
         div_631_u_div_SumTmp_5__2__10_, div_631_u_div_SumTmp_5__2__9_,
         div_631_u_div_SumTmp_5__2__8_, div_631_u_div_SumTmp_5__2__7_,
         div_631_u_div_SumTmp_5__2__6_, div_631_u_div_SumTmp_5__2__5_,
         div_631_u_div_SumTmp_5__2__4_, div_631_u_div_SumTmp_5__2__3_,
         div_631_u_div_SumTmp_5__2__2_, div_631_u_div_SumTmp_5__2__1_,
         div_631_u_div_SumTmp_5__2__0_, div_631_u_div_SumTmp_5__1__11_,
         div_631_u_div_SumTmp_5__1__10_, div_631_u_div_SumTmp_5__1__9_,
         div_631_u_div_SumTmp_5__1__8_, div_631_u_div_SumTmp_5__1__7_,
         div_631_u_div_SumTmp_5__1__6_, div_631_u_div_SumTmp_5__1__5_,
         div_631_u_div_SumTmp_5__1__4_, div_631_u_div_SumTmp_5__1__3_,
         div_631_u_div_SumTmp_5__1__2_, div_631_u_div_SumTmp_5__1__1_,
         div_631_u_div_SumTmp_5__1__0_, div_631_u_div_SumTmp_6__3__11_,
         div_631_u_div_SumTmp_6__3__10_, div_631_u_div_SumTmp_6__3__9_,
         div_631_u_div_SumTmp_6__3__8_, div_631_u_div_SumTmp_6__3__7_,
         div_631_u_div_SumTmp_6__3__6_, div_631_u_div_SumTmp_6__3__5_,
         div_631_u_div_SumTmp_6__3__4_, div_631_u_div_SumTmp_6__3__3_,
         div_631_u_div_SumTmp_6__3__2_, div_631_u_div_SumTmp_6__3__1_,
         div_631_u_div_SumTmp_6__3__0_, div_631_u_div_SumTmp_6__2__11_,
         div_631_u_div_SumTmp_6__2__10_, div_631_u_div_SumTmp_6__2__9_,
         div_631_u_div_SumTmp_6__2__8_, div_631_u_div_SumTmp_6__2__7_,
         div_631_u_div_SumTmp_6__2__6_, div_631_u_div_SumTmp_6__2__5_,
         div_631_u_div_SumTmp_6__2__4_, div_631_u_div_SumTmp_6__2__3_,
         div_631_u_div_SumTmp_6__2__2_, div_631_u_div_SumTmp_6__2__1_,
         div_631_u_div_SumTmp_6__2__0_, div_631_u_div_SumTmp_6__1__11_,
         div_631_u_div_SumTmp_6__1__10_, div_631_u_div_SumTmp_6__1__9_,
         div_631_u_div_SumTmp_6__1__8_, div_631_u_div_SumTmp_6__1__7_,
         div_631_u_div_SumTmp_6__1__6_, div_631_u_div_SumTmp_6__1__5_,
         div_631_u_div_SumTmp_6__1__4_, div_631_u_div_SumTmp_6__1__3_,
         div_631_u_div_SumTmp_6__1__2_, div_631_u_div_SumTmp_6__1__1_,
         div_631_u_div_SumTmp_6__1__0_, div_631_u_div_SumTmp_7__2__11_,
         div_631_u_div_SumTmp_7__2__10_, div_631_u_div_SumTmp_7__2__9_,
         div_631_u_div_SumTmp_7__2__8_, div_631_u_div_SumTmp_7__2__7_,
         div_631_u_div_SumTmp_7__2__6_, div_631_u_div_SumTmp_7__2__5_,
         div_631_u_div_SumTmp_7__2__4_, div_631_u_div_SumTmp_7__2__3_,
         div_631_u_div_SumTmp_7__2__2_, div_631_u_div_SumTmp_7__2__1_,
         div_631_u_div_SumTmp_7__2__0_, div_631_u_div_SumTmp_7__1__11_,
         div_631_u_div_SumTmp_7__1__10_, div_631_u_div_SumTmp_7__1__9_,
         div_631_u_div_SumTmp_7__1__8_, div_631_u_div_SumTmp_7__1__7_,
         div_631_u_div_SumTmp_7__1__6_, div_631_u_div_SumTmp_7__1__5_,
         div_631_u_div_SumTmp_7__1__4_, div_631_u_div_SumTmp_7__1__3_,
         div_631_u_div_SumTmp_7__1__2_, div_631_u_div_SumTmp_7__1__1_,
         div_631_u_div_SumTmp_7__1__0_, div_631_quotient_8_,
         div_631_quotient_11_, div_631_b_3_, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1040, n1048, n1049, n1050,
         n1051, n1052, n1053, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282,
         n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292,
         n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302,
         n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312,
         n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322,
         n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332,
         n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342,
         n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352,
         n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362,
         n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372,
         n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382,
         n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392,
         n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402,
         n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412,
         n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422,
         n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432,
         n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442,
         n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452,
         n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462,
         n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472,
         n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482,
         n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492,
         n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502,
         n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512,
         n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522,
         n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532,
         n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542,
         n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552,
         n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562,
         n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572,
         n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582,
         n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592,
         n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602,
         n1603, n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612,
         n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622,
         n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632,
         n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642,
         n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652,
         n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662,
         n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672,
         n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682,
         n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692,
         n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702,
         n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712,
         n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722,
         n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732,
         n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742,
         n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752,
         n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762,
         n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772,
         n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782,
         n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792,
         n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802,
         n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812,
         n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822,
         n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832,
         n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842,
         n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852,
         n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862,
         n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872,
         n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882,
         n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892,
         n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902,
         n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912,
         n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922,
         n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932,
         n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942,
         n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952,
         n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962,
         n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972,
         n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982,
         n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992,
         n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002,
         n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012,
         n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022,
         n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032,
         n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042,
         n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052,
         n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062,
         n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072,
         n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082,
         n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092,
         n2093, n2094, n2095, n2096, n2097, n2099, n2100, n2101, n2102, n2103,
         n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113,
         n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123,
         n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133,
         n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2144, n2145,
         n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2162, n2163, n2164,
         n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174,
         n2175, n2176, n2177, n2178, n2180, n2181, n2182, n2183, n2184, n2185,
         n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195,
         n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205,
         n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215,
         n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225,
         n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235,
         n2236, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
         SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
         SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
         SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
         SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36,
         SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38,
         SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40,
         SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42,
         SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44,
         SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46,
         SYNOPSYS_UNCONNECTED_47, SYNOPSYS_UNCONNECTED_48,
         SYNOPSYS_UNCONNECTED_49, SYNOPSYS_UNCONNECTED_50,
         SYNOPSYS_UNCONNECTED_51, SYNOPSYS_UNCONNECTED_52,
         SYNOPSYS_UNCONNECTED_53, SYNOPSYS_UNCONNECTED_54,
         SYNOPSYS_UNCONNECTED_55, SYNOPSYS_UNCONNECTED_56,
         SYNOPSYS_UNCONNECTED_57, SYNOPSYS_UNCONNECTED_58,
         SYNOPSYS_UNCONNECTED_59, SYNOPSYS_UNCONNECTED_60,
         SYNOPSYS_UNCONNECTED_61, SYNOPSYS_UNCONNECTED_62,
         SYNOPSYS_UNCONNECTED_63, SYNOPSYS_UNCONNECTED_64,
         SYNOPSYS_UNCONNECTED_65, SYNOPSYS_UNCONNECTED_66,
         SYNOPSYS_UNCONNECTED_67, SYNOPSYS_UNCONNECTED_68,
         SYNOPSYS_UNCONNECTED_69, SYNOPSYS_UNCONNECTED_70,
         SYNOPSYS_UNCONNECTED_71, SYNOPSYS_UNCONNECTED_72,
         SYNOPSYS_UNCONNECTED_73, SYNOPSYS_UNCONNECTED_74,
         SYNOPSYS_UNCONNECTED_75, SYNOPSYS_UNCONNECTED_76,
         SYNOPSYS_UNCONNECTED_77, SYNOPSYS_UNCONNECTED_78,
         SYNOPSYS_UNCONNECTED_79, SYNOPSYS_UNCONNECTED_80,
         SYNOPSYS_UNCONNECTED_81, SYNOPSYS_UNCONNECTED_82,
         SYNOPSYS_UNCONNECTED_83, SYNOPSYS_UNCONNECTED_84,
         SYNOPSYS_UNCONNECTED_85, SYNOPSYS_UNCONNECTED_86,
         SYNOPSYS_UNCONNECTED_87, SYNOPSYS_UNCONNECTED_88,
         SYNOPSYS_UNCONNECTED_89, SYNOPSYS_UNCONNECTED_90,
         SYNOPSYS_UNCONNECTED_91, SYNOPSYS_UNCONNECTED_92,
         SYNOPSYS_UNCONNECTED_93, SYNOPSYS_UNCONNECTED_94,
         SYNOPSYS_UNCONNECTED_95, SYNOPSYS_UNCONNECTED_96,
         SYNOPSYS_UNCONNECTED_97, SYNOPSYS_UNCONNECTED_98,
         SYNOPSYS_UNCONNECTED_99, SYNOPSYS_UNCONNECTED_100,
         SYNOPSYS_UNCONNECTED_101, SYNOPSYS_UNCONNECTED_102,
         SYNOPSYS_UNCONNECTED_103, SYNOPSYS_UNCONNECTED_104,
         SYNOPSYS_UNCONNECTED_105, SYNOPSYS_UNCONNECTED_106,
         SYNOPSYS_UNCONNECTED_107, SYNOPSYS_UNCONNECTED_108,
         SYNOPSYS_UNCONNECTED_109, SYNOPSYS_UNCONNECTED_110,
         SYNOPSYS_UNCONNECTED_111, SYNOPSYS_UNCONNECTED_112,
         SYNOPSYS_UNCONNECTED_113, SYNOPSYS_UNCONNECTED_114,
         SYNOPSYS_UNCONNECTED_115, SYNOPSYS_UNCONNECTED_116,
         SYNOPSYS_UNCONNECTED_117, SYNOPSYS_UNCONNECTED_118,
         SYNOPSYS_UNCONNECTED_119, SYNOPSYS_UNCONNECTED_120,
         SYNOPSYS_UNCONNECTED_121, SYNOPSYS_UNCONNECTED_122,
         SYNOPSYS_UNCONNECTED_123, SYNOPSYS_UNCONNECTED_124,
         SYNOPSYS_UNCONNECTED_125, SYNOPSYS_UNCONNECTED_126,
         SYNOPSYS_UNCONNECTED_127, SYNOPSYS_UNCONNECTED_128,
         SYNOPSYS_UNCONNECTED_129, SYNOPSYS_UNCONNECTED_130,
         SYNOPSYS_UNCONNECTED_131, SYNOPSYS_UNCONNECTED_132,
         SYNOPSYS_UNCONNECTED_133, SYNOPSYS_UNCONNECTED_134,
         SYNOPSYS_UNCONNECTED_135, SYNOPSYS_UNCONNECTED_136,
         SYNOPSYS_UNCONNECTED_137, SYNOPSYS_UNCONNECTED_138,
         SYNOPSYS_UNCONNECTED_139, SYNOPSYS_UNCONNECTED_140,
         SYNOPSYS_UNCONNECTED_141, SYNOPSYS_UNCONNECTED_142,
         SYNOPSYS_UNCONNECTED_143, SYNOPSYS_UNCONNECTED_144,
         SYNOPSYS_UNCONNECTED_145, SYNOPSYS_UNCONNECTED_146,
         SYNOPSYS_UNCONNECTED_147, SYNOPSYS_UNCONNECTED_148,
         SYNOPSYS_UNCONNECTED_149, SYNOPSYS_UNCONNECTED_150,
         SYNOPSYS_UNCONNECTED_151, SYNOPSYS_UNCONNECTED_152,
         SYNOPSYS_UNCONNECTED_153, SYNOPSYS_UNCONNECTED_154,
         SYNOPSYS_UNCONNECTED_155, SYNOPSYS_UNCONNECTED_156,
         SYNOPSYS_UNCONNECTED_157, SYNOPSYS_UNCONNECTED_158,
         SYNOPSYS_UNCONNECTED_159, SYNOPSYS_UNCONNECTED_160,
         SYNOPSYS_UNCONNECTED_161, SYNOPSYS_UNCONNECTED_162,
         SYNOPSYS_UNCONNECTED_163, SYNOPSYS_UNCONNECTED_164,
         SYNOPSYS_UNCONNECTED_165, SYNOPSYS_UNCONNECTED_166,
         SYNOPSYS_UNCONNECTED_167, SYNOPSYS_UNCONNECTED_168,
         SYNOPSYS_UNCONNECTED_169, SYNOPSYS_UNCONNECTED_170,
         SYNOPSYS_UNCONNECTED_171, SYNOPSYS_UNCONNECTED_172,
         SYNOPSYS_UNCONNECTED_173, SYNOPSYS_UNCONNECTED_174,
         SYNOPSYS_UNCONNECTED_175, SYNOPSYS_UNCONNECTED_176,
         SYNOPSYS_UNCONNECTED_177, SYNOPSYS_UNCONNECTED_178,
         SYNOPSYS_UNCONNECTED_179, SYNOPSYS_UNCONNECTED_180,
         SYNOPSYS_UNCONNECTED_181, SYNOPSYS_UNCONNECTED_182,
         SYNOPSYS_UNCONNECTED_183, SYNOPSYS_UNCONNECTED_184,
         SYNOPSYS_UNCONNECTED_185, SYNOPSYS_UNCONNECTED_186,
         SYNOPSYS_UNCONNECTED_187, SYNOPSYS_UNCONNECTED_188,
         SYNOPSYS_UNCONNECTED_189, SYNOPSYS_UNCONNECTED_190,
         SYNOPSYS_UNCONNECTED_191, SYNOPSYS_UNCONNECTED_192,
         SYNOPSYS_UNCONNECTED_193, SYNOPSYS_UNCONNECTED_194,
         SYNOPSYS_UNCONNECTED_195, SYNOPSYS_UNCONNECTED_196,
         SYNOPSYS_UNCONNECTED_197, SYNOPSYS_UNCONNECTED_198,
         SYNOPSYS_UNCONNECTED_199, SYNOPSYS_UNCONNECTED_200,
         SYNOPSYS_UNCONNECTED_201, SYNOPSYS_UNCONNECTED_202,
         SYNOPSYS_UNCONNECTED_203, SYNOPSYS_UNCONNECTED_204,
         SYNOPSYS_UNCONNECTED_205, SYNOPSYS_UNCONNECTED_206,
         SYNOPSYS_UNCONNECTED_207, SYNOPSYS_UNCONNECTED_208,
         SYNOPSYS_UNCONNECTED_209, SYNOPSYS_UNCONNECTED_210,
         SYNOPSYS_UNCONNECTED_211, SYNOPSYS_UNCONNECTED_212,
         SYNOPSYS_UNCONNECTED_213, SYNOPSYS_UNCONNECTED_214,
         SYNOPSYS_UNCONNECTED_215, SYNOPSYS_UNCONNECTED_216,
         SYNOPSYS_UNCONNECTED_217, SYNOPSYS_UNCONNECTED_218,
         SYNOPSYS_UNCONNECTED_219, SYNOPSYS_UNCONNECTED_220;
  wire   [9:0] L1_comb_result;
  wire   [2:0] current_state;
  wire   [5:0] cnt;
  wire   [5:0] cnt_comb;
  wire   [52:0] img0;
  wire   [55:0] kernel;
  wire   [40:0] cnn_map0;
  wire   [5:2] ratio_result_cnn;
  wire   [31:0] nn_1;
  wire   [7:0] ratio_result_vec;
  wire   [31:0] nn_2;
  wire   [16:0] add_2_result;
  wire   [19:0] add_9_result;
  wire   [15:0] weight_sel;
  wire   [7:0] nn_a;
  wire   [7:0] nn_b;
  wire   [16:1] nn_comb;
  wire   [12:0] ratio_a;
  wire   [35:0] sub_comb_result;
  wire   [31:0] sub_comb_result_in;
  wire   [31:0] L1_partial_comb;

  DFFRX4 img0_reg_14__5_ ( .D(N336), .CK(clk), .RN(rst_n), .Q(img0[51]) );
  DFFRX4 img0_reg_6__2_ ( .D(N253), .CK(clk), .RN(rst_n), .Q(img0[10]) );
  DFFRX4 img0_reg_14__0_ ( .D(N331), .CK(clk), .RN(rst_n), .Q(img0[48]) );
  DFFRHQX4 kernel_reg_2__1__4_ ( .D(N455), .CK(clk), .RN(rst_n), .Q(kernel[44]) );
  DFFRHQX4 kernel_reg_2__1__3_ ( .D(N454), .CK(clk), .RN(rst_n), .Q(kernel[43]) );
  DFFRHQX4 kernel_reg_2__1__2_ ( .D(N453), .CK(clk), .RN(rst_n), .Q(kernel[42]) );
  DFFRHQX4 kernel_reg_2__2__7_ ( .D(N468), .CK(clk), .RN(rst_n), .Q(kernel[55]) );
  DFFRHQX4 kernel_reg_2__2__6_ ( .D(N467), .CK(clk), .RN(rst_n), .Q(kernel[54]) );
  DFFRHQX4 kernel_reg_2__2__5_ ( .D(N466), .CK(clk), .RN(rst_n), .Q(kernel[53]) );
  DFFRHQX4 kernel_reg_2__2__4_ ( .D(N465), .CK(clk), .RN(rst_n), .Q(kernel[52]) );
  DFFRHQX4 kernel_reg_2__2__3_ ( .D(N464), .CK(clk), .RN(rst_n), .Q(kernel[51]) );
  DFFRHQX4 kernel_reg_2__2__1_ ( .D(N462), .CK(clk), .RN(rst_n), .Q(kernel[49]) );
  DFFRHQX4 kernel_reg_2__2__0_ ( .D(N461), .CK(clk), .RN(rst_n), .Q(kernel[48]) );
  DFFRX4 cnn_map0_reg_7__7_ ( .D(N559), .CK(clk), .RN(rst_n), .Q(cnn_map0[40]), 
        .QN(n744) );
  DFFRX4 cnn_map0_reg_5__7_ ( .D(N539), .CK(clk), .RN(rst_n), .Q(cnn_map0[29]), 
        .QN(n728) );
  DFFRX4 cnn_map0_reg_5__6_ ( .D(N538), .CK(clk), .RN(rst_n), .Q(cnn_map0[28]), 
        .QN(n729) );
  DFFRX4 cnn_map0_reg_6__5_ ( .D(N547), .CK(clk), .RN(rst_n), .Q(cnn_map0[33]), 
        .QN(n738) );
  DFFRX4 cnn_map0_reg_2__5_ ( .D(N507), .CK(clk), .RN(rst_n), .Q(cnn_map0[14]), 
        .QN(n706) );
  DFFRX4 cnn_map0_reg_3__4_ ( .D(N516), .CK(clk), .RN(rst_n), .Q(cnn_map0[20]), 
        .QN(n715) );
  DFFRX4 cnn_map0_reg_2__4_ ( .D(N506), .CK(clk), .RN(rst_n), .Q(cnn_map0[13]), 
        .QN(n707) );
  DFFRHQX4 cnn_map0_reg_0__4_ ( .D(N486), .CK(clk), .RN(rst_n), .Q(cnn_map0[4]) );
  DFFRX4 cnn_map0_reg_4__3_ ( .D(N525), .CK(clk), .RN(rst_n), .Q(cnn_map0[24]), 
        .QN(n724) );
  DFFRX4 cnn_map0_reg_3__3_ ( .D(N515), .CK(clk), .RN(rst_n), .Q(cnn_map0[19]), 
        .QN(n716) );
  DFFRX4 cnn_map0_reg_2__3_ ( .D(N505), .CK(clk), .RN(rst_n), .Q(cnn_map0[12]), 
        .QN(n708) );
  DFFRX4 cnn_map0_reg_3__2_ ( .D(N514), .CK(clk), .RN(rst_n), .Q(cnn_map0[18]), 
        .QN(n717) );
  DFFRX4 cnn_map0_reg_3__1_ ( .D(N513), .CK(clk), .RN(rst_n), .Q(cnn_map0[17]), 
        .QN(n718) );
  DFFRX4 cnn_map0_reg_1__1_ ( .D(N493), .CK(clk), .RN(rst_n), .Q(cnn_map0[9]), 
        .QN(n702) );
  SNN_DW01_sub_0 sub_654 ( .A(nn_2[31:24]), .B(nn_1[31:24]), .CI(1'b0), .DIFF(
        sub_comb_result_in[31:24]) );
  SNN_DW01_sub_1 sub_653 ( .A(nn_2[23:16]), .B(nn_1[23:16]), .CI(1'b0), .DIFF(
        sub_comb_result_in[23:16]) );
  SNN_DW01_sub_2 sub_652 ( .A(nn_2[15:8]), .B(nn_1[15:8]), .CI(1'b0), .DIFF(
        sub_comb_result_in[15:8]) );
  SNN_DW01_sub_3 sub_651 ( .A(nn_2[7:0]), .B(nn_1[7:0]), .CI(1'b0), .DIFF(
        sub_comb_result_in[7:0]) );
  SNN_DW01_sub_4 sub_649 ( .A({1'b0, nn_1[31:24]}), .B({1'b0, nn_2[31:24]}), 
        .CI(1'b0), .DIFF(sub_comb_result[35:27]) );
  SNN_DW01_sub_5 sub_648 ( .A({1'b0, nn_1[23:16]}), .B({1'b0, nn_2[23:16]}), 
        .CI(1'b0), .DIFF(sub_comb_result[26:18]) );
  SNN_DW01_sub_6 sub_647 ( .A({1'b0, nn_1[15:8]}), .B({1'b0, nn_2[15:8]}), 
        .CI(1'b0), .DIFF(sub_comb_result[17:9]) );
  SNN_DW01_sub_7 sub_646 ( .A({1'b0, nn_1[7:0]}), .B({1'b0, nn_2[7:0]}), .CI(
        1'b0), .DIFF(sub_comb_result[8:0]) );
  SNN_DW01_add_29 add_2_root_add_0_root_add_666_3 ( .A({1'b0, 1'b0, 
        L1_partial_comb[7:0]}), .B({1'b0, 1'b0, L1_partial_comb[23:16]}), .CI(
        1'b0), .SUM({SYNOPSYS_UNCONNECTED_1, N728, N727, N726, N725, N724, 
        N723, N722, N721, N720}) );
  SNN_DW01_add_28_DW01_add_1 add_1_root_add_0_root_add_666_3 ( .A({1'b0, 1'b0, 
        L1_partial_comb[15:8]}), .B({1'b0, 1'b0, L1_partial_comb[31:24]}), 
        .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_2, n2152, n2151, n2150, n2149, 
        n2148, n2147, n2146, n2145, n2144}) );
  SNN_DW01_add_27_DW01_add_0 add_0_root_add_0_root_add_666_3 ( .A({1'b0, N728, 
        N727, N726, N725, N724, N723, N722, N721, N720}), .B({1'b0, n2152, 
        n2151, n2150, n2149, n2148, n2147, n2146, n2145, n2144}), .CI(1'b0), 
        .SUM(L1_comb_result) );
  SNN_DW_div_uns_3 div_632 ( .a({nn_comb, 1'b0}), .b({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .quotient({SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, ratio_result_vec}), 
        .remainder({SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20}) );
  SNN_DW_mult_uns_14 mult_626_2 ( .a(nn_b), .b(weight_sel[15:8]), .product({
        N694, N693, N692, N691, N690, N689, N688, N687, N686, N685, N684, N683, 
        N682, N681, N680, N679}) );
  SNN_DW_mult_uns_13 mult_626 ( .a(nn_a), .b(weight_sel[7:0]), .product({N678, 
        N677, N676, N675, N674, N673, N672, N671, N670, N669, N668, N667, N666, 
        N665, N664, N663}) );
  SNN_DW01_add_93 add_626 ( .A({1'b0, N678, N677, N676, N675, N674, N673, N672, 
        N671, N670, N669, N668, N667, N666, N665, N664, N663}), .B({1'b0, N694, 
        N693, N692, N691, N690, N689, N688, N687, N686, N685, N684, N683, N682, 
        N681, N680, N679}), .CI(1'b0), .SUM({nn_comb, SYNOPSYS_UNCONNECTED_21}) );
  SNN_DW01_add_100 div_631_u_div_u_add_PartRem_0_2 ( .A({
        div_631_u_div_PartRem_1__14_, n2012, n2061, n2050, 
        div_631_u_div_PartRem_1__10_, n2069, n2048, n2017, n2029, n2038, 
        div_631_u_div_PartRem_1__4_, n2073, ratio_a[2:0]}), .B({1'b1, 1'b1, 
        n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, 
        n1136, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_22, 
        SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24, 
        SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26, 
        SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28, 
        SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30, 
        SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32, 
        SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34, 
        SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36}), .CO(
        div_631_u_div_CryOut_2__0_) );
  SNN_DW01_add_120 div_631_u_div_u_add_PartRem_2_2 ( .A({
        div_631_u_div_PartRem_3__14_, n2028, n2068, n2045, 
        div_631_u_div_PartRem_3__10_, n2010, n2011, 
        div_631_u_div_PartRem_3__7_, n2060, n2040, n2052, n2057, ratio_a[8:6]}), .B({1'b1, 1'b1, n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 
        1'b0, 1'b0, n1134, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_37, 
        SYNOPSYS_UNCONNECTED_38, SYNOPSYS_UNCONNECTED_39, 
        div_631_u_div_SumTmp_2__2__11_, div_631_u_div_SumTmp_2__2__10_, 
        div_631_u_div_SumTmp_2__2__9_, div_631_u_div_SumTmp_2__2__8_, 
        div_631_u_div_SumTmp_2__2__7_, div_631_u_div_SumTmp_2__2__6_, 
        div_631_u_div_SumTmp_2__2__5_, div_631_u_div_SumTmp_2__2__4_, 
        div_631_u_div_SumTmp_2__2__3_, div_631_u_div_SumTmp_2__2__2_, 
        div_631_u_div_SumTmp_2__2__1_, div_631_u_div_SumTmp_2__2__0_}), .CO(
        div_631_u_div_CryOut_2__2_) );
  SNN_DW01_add_127 div_631_u_div_u_add_PartRem_1_2 ( .A({
        div_631_u_div_PartRem_2__14_, n2054, div_631_u_div_PartRem_2__12_, 
        n939, n2043, n2062, n2055, n2018, n2047, n2046, n2051, n2016, 
        ratio_a[5:3]}), .B({1'b1, 1'b1, n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 
        1'b0, 1'b0, n1131, 1'b0, 1'b0, n1135, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_40, SYNOPSYS_UNCONNECTED_41, 
        SYNOPSYS_UNCONNECTED_42, div_631_u_div_SumTmp_2__1__11_, 
        div_631_u_div_SumTmp_2__1__10_, div_631_u_div_SumTmp_2__1__9_, 
        div_631_u_div_SumTmp_2__1__8_, div_631_u_div_SumTmp_2__1__7_, 
        div_631_u_div_SumTmp_2__1__6_, div_631_u_div_SumTmp_2__1__5_, 
        div_631_u_div_SumTmp_2__1__4_, div_631_u_div_SumTmp_2__1__3_, 
        div_631_u_div_SumTmp_2__1__2_, div_631_u_div_SumTmp_2__1__1_, 
        div_631_u_div_SumTmp_2__1__0_}), .CO(div_631_u_div_CryOut_2__1_) );
  SNN_DW01_add_117 div_631_u_div_u_add_PartRem_2_7 ( .A({
        div_631_u_div_PartRem_3__14_, n2028, n2068, n2045, 
        div_631_u_div_PartRem_3__10_, div_631_u_div_PartRem_3__9_, n2033, 
        div_631_u_div_PartRem_3__7_, n2060, n2070, n2021, n2057, ratio_a[8:6]}), .B({1'b1, div_631_u_div_BInv_7__13_, div_631_u_div_BInv_7__12_, 1'b0, 1'b0, 
        div_631_u_div_BInv_7__9_, div_631_u_div_BInv_7__8_, 1'b0, 1'b0, n1122, 
        n1120, 1'b1, 1'b1, div_631_u_div_BInv_7__1_, n1139}), .CI(1'b1), .SUM(
        {SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44, 
        SYNOPSYS_UNCONNECTED_45, div_631_u_div_SumTmp_7__2__11_, 
        div_631_u_div_SumTmp_7__2__10_, div_631_u_div_SumTmp_7__2__9_, 
        div_631_u_div_SumTmp_7__2__8_, div_631_u_div_SumTmp_7__2__7_, 
        div_631_u_div_SumTmp_7__2__6_, div_631_u_div_SumTmp_7__2__5_, 
        div_631_u_div_SumTmp_7__2__4_, div_631_u_div_SumTmp_7__2__3_, 
        div_631_u_div_SumTmp_7__2__2_, div_631_u_div_SumTmp_7__2__1_, 
        div_631_u_div_SumTmp_7__2__0_}), .CO(div_631_u_div_CryOut_7__2_) );
  SNN_DW_mult_uns_27 mult_606 ( .a(img0[31:24]), .b(kernel[31:24]), .product({
        mult_comb_result_5__15_, mult_comb_result_5__14_, 
        mult_comb_result_5__13_, mult_comb_result_5__12_, 
        mult_comb_result_5__11_, mult_comb_result_5__10_, 
        mult_comb_result_5__9_, mult_comb_result_5__8_, mult_comb_result_5__7_, 
        mult_comb_result_5__6_, mult_comb_result_5__5_, mult_comb_result_5__4_, 
        mult_comb_result_5__3_, mult_comb_result_5__2_, mult_comb_result_5__1_, 
        mult_comb_result_5__0_}) );
  SNN_DW_mult_uns_26 mult_607 ( .a(img0[39:32]), .b(kernel[39:32]), .product({
        mult_comb_result_6__15_, mult_comb_result_6__14_, 
        mult_comb_result_6__13_, mult_comb_result_6__12_, 
        mult_comb_result_6__11_, mult_comb_result_6__10_, 
        mult_comb_result_6__9_, mult_comb_result_6__8_, mult_comb_result_6__7_, 
        mult_comb_result_6__6_, mult_comb_result_6__5_, mult_comb_result_6__4_, 
        mult_comb_result_6__3_, mult_comb_result_6__2_, mult_comb_result_6__1_, 
        mult_comb_result_6__0_}) );
  SNN_DW_mult_uns_28 mult_603 ( .a(img0[15:8]), .b(kernel[15:8]), .product({
        mult_comb_result_3__15_, mult_comb_result_3__14_, 
        mult_comb_result_3__13_, mult_comb_result_3__12_, 
        mult_comb_result_3__11_, mult_comb_result_3__10_, 
        mult_comb_result_3__9_, mult_comb_result_3__8_, mult_comb_result_3__7_, 
        mult_comb_result_3__6_, mult_comb_result_3__5_, mult_comb_result_3__4_, 
        mult_comb_result_3__3_, mult_comb_result_3__2_, mult_comb_result_3__1_, 
        mult_comb_result_3__0_}) );
  SNN_DW01_add_133 div_631_u_div_u_add_PartRem_2_1 ( .A({
        div_631_u_div_PartRem_3__14_, n2028, n2068, n2045, 
        div_631_u_div_PartRem_3__10_, n2010, n2011, 
        div_631_u_div_PartRem_3__7_, n2060, n2040, n2052, n2057, ratio_a[8:6]}), .B({1'b1, 1'b1, 1'b1, n1135, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, 
        n1131, 1'b0, 1'b0, n1135}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_46, 
        SYNOPSYS_UNCONNECTED_47, SYNOPSYS_UNCONNECTED_48, 
        div_631_u_div_SumTmp_1__2__11_, div_631_u_div_SumTmp_1__2__10_, 
        div_631_u_div_SumTmp_1__2__9_, div_631_u_div_SumTmp_1__2__8_, 
        div_631_u_div_SumTmp_1__2__7_, div_631_u_div_SumTmp_1__2__6_, 
        div_631_u_div_SumTmp_1__2__5_, div_631_u_div_SumTmp_1__2__4_, 
        div_631_u_div_SumTmp_1__2__3_, div_631_u_div_SumTmp_1__2__2_, 
        div_631_u_div_SumTmp_1__2__1_, div_631_u_div_SumTmp_1__2__0_}), .CO(
        div_631_u_div_CryOut_1__2_) );
  SNN_DW01_add_135 add_6_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 
        mult_comb_result_3__15_, mult_comb_result_3__14_, 
        mult_comb_result_3__13_, mult_comb_result_3__12_, 
        mult_comb_result_3__11_, mult_comb_result_3__10_, 
        mult_comb_result_3__9_, mult_comb_result_3__8_, mult_comb_result_3__7_, 
        mult_comb_result_3__6_, mult_comb_result_3__5_, mult_comb_result_3__4_, 
        mult_comb_result_3__3_, mult_comb_result_3__2_, mult_comb_result_3__1_, 
        mult_comb_result_3__0_}), .B({1'b0, 1'b0, mult_comb_result_5__15_, 
        mult_comb_result_5__14_, mult_comb_result_5__13_, 
        mult_comb_result_5__12_, mult_comb_result_5__11_, 
        mult_comb_result_5__10_, mult_comb_result_5__9_, 
        mult_comb_result_5__8_, mult_comb_result_5__7_, mult_comb_result_5__6_, 
        mult_comb_result_5__5_, mult_comb_result_5__4_, mult_comb_result_5__3_, 
        mult_comb_result_5__2_, mult_comb_result_5__1_, mult_comb_result_5__0_}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_49, N614, N613, N612, N611, N610, 
        N609, N608, N607, N606, N605, N604, N603, N602, N601, N600, N599, N598}) );
  SNN_DW01_add_128 div_631_u_div_u_add_PartRem_2_3 ( .A({
        div_631_u_div_PartRem_3__14_, n2028, n2068, 
        div_631_u_div_PartRem_3__11_, n2064, div_631_u_div_PartRem_3__9_, 
        n2033, div_631_u_div_PartRem_3__7_, div_631_u_div_PartRem_3__6_, n2039, 
        div_631_u_div_PartRem_3__4_, div_631_u_div_PartRem_3__3_, ratio_a[8:6]}), .B({1'b1, 1'b1, div_631_u_div_BInv_3__12_, n1127, n1070, n1065, n1069, 1'b0, 
        1'b0, 1'b0, n1067, n1075, div_631_u_div_BInv_3__2_, 
        div_631_u_div_BInv_3__1_, n1129}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_50, SYNOPSYS_UNCONNECTED_51, 
        SYNOPSYS_UNCONNECTED_52, div_631_u_div_SumTmp_3__2__11_, 
        div_631_u_div_SumTmp_3__2__10_, div_631_u_div_SumTmp_3__2__9_, 
        div_631_u_div_SumTmp_3__2__8_, div_631_u_div_SumTmp_3__2__7_, 
        div_631_u_div_SumTmp_3__2__6_, div_631_u_div_SumTmp_3__2__5_, 
        div_631_u_div_SumTmp_3__2__4_, div_631_u_div_SumTmp_3__2__3_, 
        div_631_u_div_SumTmp_3__2__2_, div_631_u_div_SumTmp_3__2__1_, 
        div_631_u_div_SumTmp_3__2__0_}), .CO(div_631_u_div_CryOut_3__2_) );
  SNN_DW01_add_124 div_631_u_div_u_add_PartRem_2_6 ( .A({
        div_631_u_div_PartRem_3__14_, n2077, div_631_u_div_PartRem_3__12_, 
        n2081, n2076, n2079, n2082, n2074, n2080, n2085, n2083, n2084, 
        ratio_a[8:6]}), .B({1'b1, div_631_u_div_BInv_6__13_, n1123, n1061, 
        n1059, n1077, 1'b0, 1'b0, 1'b0, n1063, n1072, div_631_u_div_BInv_6__3_, 
        div_631_u_div_BInv_6__2_, n1125, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_53, SYNOPSYS_UNCONNECTED_54, 
        SYNOPSYS_UNCONNECTED_55, div_631_u_div_SumTmp_6__2__11_, 
        div_631_u_div_SumTmp_6__2__10_, div_631_u_div_SumTmp_6__2__9_, 
        div_631_u_div_SumTmp_6__2__8_, div_631_u_div_SumTmp_6__2__7_, 
        div_631_u_div_SumTmp_6__2__6_, div_631_u_div_SumTmp_6__2__5_, 
        div_631_u_div_SumTmp_6__2__4_, div_631_u_div_SumTmp_6__2__3_, 
        div_631_u_div_SumTmp_6__2__2_, div_631_u_div_SumTmp_6__2__1_, 
        div_631_u_div_SumTmp_6__2__0_}), .CO(div_631_u_div_CryOut_6__2_) );
  SNN_DW01_add_130 div_631_u_div_u_add_PartRem_2_5 ( .A({
        div_631_u_div_PartRem_3__14_, div_631_u_div_PartRem_3__13_, n2068, 
        div_631_u_div_PartRem_3__11_, n2064, n2036, 
        div_631_u_div_PartRem_3__8_, n2074, div_631_u_div_PartRem_3__6_, 
        div_631_u_div_PartRem_3__5_, n2078, n2030, ratio_a[8:6]}), .B({1'b1, 
        div_631_u_div_BInv_5__13_, 1'b1, 1'b0, n1056, 1'b1, n1058, 1'b0, 1'b0, 
        n1074, 1'b0, 1'b1, div_631_u_div_BInv_5__2_, 1'b0, n1141}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_56, SYNOPSYS_UNCONNECTED_57, 
        SYNOPSYS_UNCONNECTED_58, div_631_u_div_SumTmp_5__2__11_, 
        div_631_u_div_SumTmp_5__2__10_, div_631_u_div_SumTmp_5__2__9_, 
        div_631_u_div_SumTmp_5__2__8_, div_631_u_div_SumTmp_5__2__7_, 
        div_631_u_div_SumTmp_5__2__6_, div_631_u_div_SumTmp_5__2__5_, 
        div_631_u_div_SumTmp_5__2__4_, div_631_u_div_SumTmp_5__2__3_, 
        div_631_u_div_SumTmp_5__2__2_, div_631_u_div_SumTmp_5__2__1_, 
        div_631_u_div_SumTmp_5__2__0_}), .CO(div_631_u_div_CryOut_5__2_) );
  SNN_DW_mult_uns_37 mult_605 ( .a(img0[23:16]), .b(kernel[23:16]), .product({
        mult_comb_result_4__15_, mult_comb_result_4__14_, 
        mult_comb_result_4__13_, mult_comb_result_4__12_, 
        mult_comb_result_4__11_, mult_comb_result_4__10_, 
        mult_comb_result_4__9_, mult_comb_result_4__8_, mult_comb_result_4__7_, 
        mult_comb_result_4__6_, mult_comb_result_4__5_, mult_comb_result_4__4_, 
        mult_comb_result_4__3_, mult_comb_result_4__2_, mult_comb_result_4__1_, 
        mult_comb_result_4__0_}) );
  SNN_DW_mult_uns_36 mult_602 ( .a(img0[7:0]), .b(kernel[7:0]), .product({
        mult_comb_result_2__15_, mult_comb_result_2__14_, 
        mult_comb_result_2__13_, mult_comb_result_2__12_, 
        mult_comb_result_2__11_, mult_comb_result_2__10_, 
        mult_comb_result_2__9_, mult_comb_result_2__8_, mult_comb_result_2__7_, 
        mult_comb_result_2__6_, mult_comb_result_2__5_, mult_comb_result_2__4_, 
        mult_comb_result_2__3_, mult_comb_result_2__2_, mult_comb_result_2__1_, 
        mult_comb_result_2__0_}) );
  SNN_DW01_add_172 add_4_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, mult_comb_result_4__15_, mult_comb_result_4__14_, 
        mult_comb_result_4__13_, mult_comb_result_4__12_, 
        mult_comb_result_4__11_, mult_comb_result_4__10_, 
        mult_comb_result_4__9_, mult_comb_result_4__8_, mult_comb_result_4__7_, 
        mult_comb_result_4__6_, mult_comb_result_4__5_, mult_comb_result_4__4_, 
        mult_comb_result_4__3_, mult_comb_result_4__2_, mult_comb_result_4__1_, 
        mult_comb_result_4__0_}), .B({1'b0, 1'b0, 1'b0, 1'b0, 
        mult_comb_result_2__15_, mult_comb_result_2__14_, 
        mult_comb_result_2__13_, mult_comb_result_2__12_, 
        mult_comb_result_2__11_, mult_comb_result_2__10_, 
        mult_comb_result_2__9_, mult_comb_result_2__8_, mult_comb_result_2__7_, 
        mult_comb_result_2__6_, mult_comb_result_2__5_, mult_comb_result_2__4_, 
        mult_comb_result_2__3_, mult_comb_result_2__2_, mult_comb_result_2__1_, 
        mult_comb_result_2__0_}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_59, 
        SYNOPSYS_UNCONNECTED_60, SYNOPSYS_UNCONNECTED_61, N651, N650, N649, 
        N648, N647, N646, N645, N644, N643, N642, N641, N640, N639, N638, N637, 
        N636, N635}) );
  SNN_DW_mult_uns_32 mult_609 ( .a({img0[52], n1163, img0[51], n888, 
        img0[50:49], n1171, img0[48]}), .b(kernel[55:48]), .product({
        mult_comb_result_8__15_, mult_comb_result_8__14_, 
        mult_comb_result_8__13_, mult_comb_result_8__12_, 
        mult_comb_result_8__11_, mult_comb_result_8__10_, 
        mult_comb_result_8__9_, mult_comb_result_8__8_, mult_comb_result_8__7_, 
        mult_comb_result_8__6_, mult_comb_result_8__5_, mult_comb_result_8__4_, 
        mult_comb_result_8__3_, mult_comb_result_8__2_, mult_comb_result_8__1_, 
        mult_comb_result_8__0_}) );
  SNN_DW01_add_183 add_1_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 1'b0, 
        N651, N650, N649, N648, N647, N646, N645, N644, N643, N642, N641, N640, 
        N639, N638, N637, N636, N635}), .B({1'b0, n2216, n2215, n2214, n2213, 
        n2212, n2211, n2210, n2209, n2208, n2207, n2206, n2205, n2204, n2203, 
        n2202, n2201, n2200, n2199, n2198}), .CI(1'b0), .SUM({n2236, n2235, 
        n2234, n2233, n2232, n2231, n2230, n2229, n2228, n2227, n2226, n2225, 
        n2224, n2223, n2222, n2221, n2220, n2219, n2218, n2217}) );
  SNN_DW01_add_182 add_3_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 1'b0, 
        mult_comb_result_6__15_, mult_comb_result_6__14_, 
        mult_comb_result_6__13_, mult_comb_result_6__12_, 
        mult_comb_result_6__11_, mult_comb_result_6__10_, 
        mult_comb_result_6__9_, mult_comb_result_6__8_, mult_comb_result_6__7_, 
        mult_comb_result_6__6_, mult_comb_result_6__5_, mult_comb_result_6__4_, 
        mult_comb_result_6__3_, mult_comb_result_6__2_, mult_comb_result_6__1_, 
        mult_comb_result_6__0_}), .B({1'b0, 1'b0, n2178, n2177, n2176, n2175, 
        n2174, n2173, n2172, n2171, n2170, n2169, n2168, n2167, n2166, n2165, 
        n2164, n2163, n2162}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_62, n2197, 
        n2196, n2195, n2194, n2193, n2192, n2191, n2190, n2189, n2188, n2187, 
        n2186, n2185, n2184, n2183, n2182, n2181, n2180}) );
  SNN_DW01_add_184 add_2_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 1'b0, 
        N614, N613, N612, N611, N610, N609, N608, N607, N606, N605, N604, N603, 
        N602, N601, N600, N599, N598}), .B({1'b0, 1'b0, n2197, n2196, n2195, 
        n2194, n2193, n2192, n2191, n2190, n2189, n2188, n2187, n2186, n2185, 
        n2184, n2183, n2182, n2181, n2180}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED_63, n2216, n2215, n2214, n2213, n2212, n2211, 
        n2210, n2209, n2208, n2207, n2206, n2205, n2204, n2203, n2202, n2201, 
        n2200, n2199, n2198}) );
  SNN_DW_mult_uns_40 mult_608 ( .a(img0[47:40]), .b(kernel[47:40]), .product({
        mult_comb_result_7__15_, mult_comb_result_7__14_, 
        mult_comb_result_7__13_, mult_comb_result_7__12_, 
        mult_comb_result_7__11_, mult_comb_result_7__10_, 
        mult_comb_result_7__9_, mult_comb_result_7__8_, mult_comb_result_7__7_, 
        mult_comb_result_7__6_, mult_comb_result_7__5_, mult_comb_result_7__4_, 
        mult_comb_result_7__3_, mult_comb_result_7__2_, mult_comb_result_7__1_, 
        mult_comb_result_7__0_}) );
  SNN_DW01_add_202 add_5_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 
        mult_comb_result_7__15_, mult_comb_result_7__14_, 
        mult_comb_result_7__13_, mult_comb_result_7__12_, 
        mult_comb_result_7__11_, mult_comb_result_7__10_, 
        mult_comb_result_7__9_, mult_comb_result_7__8_, mult_comb_result_7__7_, 
        mult_comb_result_7__6_, mult_comb_result_7__5_, mult_comb_result_7__4_, 
        mult_comb_result_7__3_, mult_comb_result_7__2_, mult_comb_result_7__1_, 
        mult_comb_result_7__0_}), .B({1'b0, 1'b0, mult_comb_result_8__15_, 
        mult_comb_result_8__14_, mult_comb_result_8__13_, 
        mult_comb_result_8__12_, mult_comb_result_8__11_, 
        mult_comb_result_8__10_, mult_comb_result_8__9_, 
        mult_comb_result_8__8_, mult_comb_result_8__7_, mult_comb_result_8__6_, 
        mult_comb_result_8__5_, mult_comb_result_8__4_, mult_comb_result_8__3_, 
        mult_comb_result_8__2_, mult_comb_result_8__1_, mult_comb_result_8__0_}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_64, n2178, n2177, n2176, n2175, n2174, 
        n2173, n2172, n2171, n2170, n2169, n2168, n2167, n2166, n2165, n2164, 
        n2163, n2162}) );
  SNN_DW01_add_216 div_631_u_div_u_add_PartRem_1_7 ( .A({
        div_631_u_div_PartRem_2__14_, n2054, div_631_u_div_PartRem_2__12_, 
        n938, n2043, div_631_u_div_PartRem_2__9_, n2027, 
        div_631_u_div_PartRem_2__7_, div_631_u_div_PartRem_2__6_, n2056, n2059, 
        n2075, ratio_a[5:3]}), .B({1'b1, div_631_u_div_BInv_7__13_, 
        div_631_u_div_BInv_7__12_, 1'b0, 1'b0, div_631_u_div_BInv_7__9_, 
        div_631_u_div_BInv_7__8_, 1'b0, 1'b0, n1122, n1120, 1'b1, 1'b1, 
        div_631_u_div_BInv_7__1_, n1139}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_65, SYNOPSYS_UNCONNECTED_66, 
        SYNOPSYS_UNCONNECTED_67, div_631_u_div_SumTmp_7__1__11_, 
        div_631_u_div_SumTmp_7__1__10_, div_631_u_div_SumTmp_7__1__9_, 
        div_631_u_div_SumTmp_7__1__8_, div_631_u_div_SumTmp_7__1__7_, 
        div_631_u_div_SumTmp_7__1__6_, div_631_u_div_SumTmp_7__1__5_, 
        div_631_u_div_SumTmp_7__1__4_, div_631_u_div_SumTmp_7__1__3_, 
        div_631_u_div_SumTmp_7__1__2_, div_631_u_div_SumTmp_7__1__1_, 
        div_631_u_div_SumTmp_7__1__0_}), .CO(div_631_u_div_CryOut_7__1_) );
  SNN_DW01_add_229 div_631_u_div_u_add_PartRem_1_1 ( .A({
        div_631_u_div_PartRem_2__14_, n2054, div_631_u_div_PartRem_2__12_, 
        div_631_u_div_PartRem_2__11_, n2043, n2062, n2055, n2018, n2047, n2046, 
        n2051, n2016, ratio_a[5:3]}), .B({1'b1, 1'b1, 1'b1, n1136, 1'b1, 1'b1, 
        n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1134}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_68, SYNOPSYS_UNCONNECTED_69, 
        SYNOPSYS_UNCONNECTED_70, div_631_u_div_SumTmp_1__1__11_, 
        div_631_u_div_SumTmp_1__1__10_, div_631_u_div_SumTmp_1__1__9_, 
        div_631_u_div_SumTmp_1__1__8_, div_631_u_div_SumTmp_1__1__7_, 
        div_631_u_div_SumTmp_1__1__6_, div_631_u_div_SumTmp_1__1__5_, 
        div_631_u_div_SumTmp_1__1__4_, div_631_u_div_SumTmp_1__1__3_, 
        div_631_u_div_SumTmp_1__1__2_, div_631_u_div_SumTmp_1__1__1_, 
        div_631_u_div_SumTmp_1__1__0_}), .CO(div_631_u_div_CryOut_1__1_) );
  SNN_DW01_add_224 div_631_u_div_u_add_PartRem_1_5 ( .A({
        div_631_u_div_PartRem_2__14_, div_631_u_div_PartRem_2__13_, 
        div_631_u_div_PartRem_2__12_, div_631_u_div_PartRem_2__11_, 
        div_631_u_div_PartRem_2__10_, n2062, div_631_u_div_PartRem_2__8_, 
        n2024, n2035, n2042, n2065, n2015, ratio_a[5:3]}), .B({1'b1, 
        div_631_u_div_BInv_5__13_, 1'b1, 1'b0, n1056, 1'b1, n1058, 1'b0, 1'b0, 
        n1074, 1'b0, 1'b1, div_631_u_div_BInv_5__2_, 1'b0, n1141}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_71, SYNOPSYS_UNCONNECTED_72, 
        SYNOPSYS_UNCONNECTED_73, div_631_u_div_SumTmp_5__1__11_, 
        div_631_u_div_SumTmp_5__1__10_, div_631_u_div_SumTmp_5__1__9_, 
        div_631_u_div_SumTmp_5__1__8_, div_631_u_div_SumTmp_5__1__7_, 
        div_631_u_div_SumTmp_5__1__6_, div_631_u_div_SumTmp_5__1__5_, 
        div_631_u_div_SumTmp_5__1__4_, div_631_u_div_SumTmp_5__1__3_, 
        div_631_u_div_SumTmp_5__1__2_, div_631_u_div_SumTmp_5__1__1_, 
        div_631_u_div_SumTmp_5__1__0_}), .CO(div_631_u_div_CryOut_5__1_) );
  SNN_DW01_add_231 div_631_u_div_u_add_PartRem_1_3 ( .A({
        div_631_u_div_PartRem_2__14_, n2054, div_631_u_div_PartRem_2__12_, 
        n2031, n2043, n2062, n2055, n2067, div_631_u_div_PartRem_2__6_, n2022, 
        n2072, n2075, ratio_a[5:3]}), .B({1'b1, 1'b1, 
        div_631_u_div_BInv_3__12_, n1127, n1070, n1065, n1069, 1'b0, 1'b0, 
        1'b0, n1067, n1075, div_631_u_div_BInv_3__2_, div_631_u_div_BInv_3__1_, 
        n1129}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_74, 
        SYNOPSYS_UNCONNECTED_75, SYNOPSYS_UNCONNECTED_76, 
        div_631_u_div_SumTmp_3__1__11_, div_631_u_div_SumTmp_3__1__10_, 
        div_631_u_div_SumTmp_3__1__9_, div_631_u_div_SumTmp_3__1__8_, 
        div_631_u_div_SumTmp_3__1__7_, div_631_u_div_SumTmp_3__1__6_, 
        div_631_u_div_SumTmp_3__1__5_, div_631_u_div_SumTmp_3__1__4_, 
        div_631_u_div_SumTmp_3__1__3_, div_631_u_div_SumTmp_3__1__2_, 
        div_631_u_div_SumTmp_3__1__1_, div_631_u_div_SumTmp_3__1__0_}), .CO(
        div_631_u_div_CryOut_3__1_) );
  SNN_DW01_add_220 div_631_u_div_u_add_PartRem_1_6 ( .A({
        div_631_u_div_PartRem_2__14_, div_631_u_div_PartRem_2__13_, 
        div_631_u_div_PartRem_2__12_, n938, div_631_u_div_PartRem_2__10_, 
        div_631_u_div_PartRem_2__9_, n2027, n2023, n2035, n2097, n2096, n2095, 
        ratio_a[5:3]}), .B({1'b1, div_631_u_div_BInv_6__13_, n1123, n1061, 
        n1059, n1077, 1'b0, 1'b0, 1'b0, n1063, n1072, div_631_u_div_BInv_6__3_, 
        div_631_u_div_BInv_6__2_, n1125, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_77, SYNOPSYS_UNCONNECTED_78, 
        SYNOPSYS_UNCONNECTED_79, div_631_u_div_SumTmp_6__1__11_, 
        div_631_u_div_SumTmp_6__1__10_, div_631_u_div_SumTmp_6__1__9_, 
        div_631_u_div_SumTmp_6__1__8_, div_631_u_div_SumTmp_6__1__7_, 
        div_631_u_div_SumTmp_6__1__6_, div_631_u_div_SumTmp_6__1__5_, 
        div_631_u_div_SumTmp_6__1__4_, div_631_u_div_SumTmp_6__1__3_, 
        div_631_u_div_SumTmp_6__1__2_, div_631_u_div_SumTmp_6__1__1_, 
        div_631_u_div_SumTmp_6__1__0_}), .CO(div_631_u_div_CryOut_6__1_) );
  SNN_DW01_add_251 div_631_u_div_u_add_PartRem_1_4 ( .A({
        div_631_u_div_PartRem_2__14_, n2054, div_631_u_div_PartRem_2__12_, 
        n2031, n2043, n2062, n2055, n2018, n2047, n2071, n2051, n2016, 
        ratio_a[5:3]}), .B({1'b1, n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 
        1'b0, n1131, 1'b0, 1'b0, n1135, 1'b1, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_80, SYNOPSYS_UNCONNECTED_81, 
        SYNOPSYS_UNCONNECTED_82, div_631_u_div_SumTmp_4__1__11_, 
        div_631_u_div_SumTmp_4__1__10_, div_631_u_div_SumTmp_4__1__9_, 
        div_631_u_div_SumTmp_4__1__8_, div_631_u_div_SumTmp_4__1__7_, 
        div_631_u_div_SumTmp_4__1__6_, div_631_u_div_SumTmp_4__1__5_, 
        div_631_u_div_SumTmp_4__1__4_, div_631_u_div_SumTmp_4__1__3_, 
        div_631_u_div_SumTmp_4__1__2_, div_631_u_div_SumTmp_4__1__1_, 
        div_631_u_div_SumTmp_4__1__0_}), .CO(ratio_result_cnn[5]) );
  SNN_DW01_add_244 div_631_u_div_u_add_PartRem_2_4 ( .A({
        div_631_u_div_PartRem_3__14_, n2028, n2068, n2045, 
        div_631_u_div_PartRem_3__10_, n2010, n2011, 
        div_631_u_div_PartRem_3__7_, n2060, n2039, n2052, n2030, ratio_a[8:6]}), .B({1'b1, n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 
        1'b0, n1134, 1'b1, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_83, 
        SYNOPSYS_UNCONNECTED_84, SYNOPSYS_UNCONNECTED_85, 
        div_631_u_div_SumTmp_4__2__11_, div_631_u_div_SumTmp_4__2__10_, 
        div_631_u_div_SumTmp_4__2__9_, div_631_u_div_SumTmp_4__2__8_, 
        div_631_u_div_SumTmp_4__2__7_, div_631_u_div_SumTmp_4__2__6_, 
        div_631_u_div_SumTmp_4__2__5_, div_631_u_div_SumTmp_4__2__4_, 
        div_631_u_div_SumTmp_4__2__3_, div_631_u_div_SumTmp_4__2__2_, 
        div_631_u_div_SumTmp_4__2__1_, div_631_u_div_SumTmp_4__2__0_}), .CO(
        div_631_quotient_8_) );
  SNN_DW01_add_242 div_631_u_div_u_add_PartRem_0_1 ( .A({
        div_631_u_div_PartRem_1__14_, n2012, n2061, n2044, 
        div_631_u_div_PartRem_1__10_, n2032, div_631_u_div_PartRem_1__8_, 
        n2017, n2034, n2038, div_631_u_div_PartRem_1__4_, n2073, ratio_a[2:0]}), .B({1'b1, 1'b1, 1'b1, n1136, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, 
        n1131, 1'b0, 1'b0, n1136}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_86, 
        SYNOPSYS_UNCONNECTED_87, SYNOPSYS_UNCONNECTED_88, 
        SYNOPSYS_UNCONNECTED_89, SYNOPSYS_UNCONNECTED_90, 
        SYNOPSYS_UNCONNECTED_91, SYNOPSYS_UNCONNECTED_92, 
        SYNOPSYS_UNCONNECTED_93, SYNOPSYS_UNCONNECTED_94, 
        SYNOPSYS_UNCONNECTED_95, SYNOPSYS_UNCONNECTED_96, 
        SYNOPSYS_UNCONNECTED_97, SYNOPSYS_UNCONNECTED_98, 
        SYNOPSYS_UNCONNECTED_99, SYNOPSYS_UNCONNECTED_100}), .CO(
        div_631_u_div_CryOut_1__0_) );
  SNN_DW01_add_254 div_631_u_div_u_add_PartRem_3_4 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, n1252, n2093, n2092, n2091, div_631_u_div_PartRem_5__3_, n1254, 
        n2090, n2088, ratio_a[11:9]}), .B({1'b1, n1136, 1'b1, 1'b1, n1131, 
        1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1135, 1'b1, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_101, SYNOPSYS_UNCONNECTED_102, 
        SYNOPSYS_UNCONNECTED_103, div_631_u_div_SumTmp_4__3__11_, 
        div_631_u_div_SumTmp_4__3__10_, div_631_u_div_SumTmp_4__3__9_, 
        div_631_u_div_SumTmp_4__3__8_, div_631_u_div_SumTmp_4__3__7_, 
        div_631_u_div_SumTmp_4__3__6_, div_631_u_div_SumTmp_4__3__5_, 
        div_631_u_div_SumTmp_4__3__4_, div_631_u_div_SumTmp_4__3__3_, 
        div_631_u_div_SumTmp_4__3__2_, div_631_u_div_SumTmp_4__3__1_, 
        div_631_u_div_SumTmp_4__3__0_}), .CO(div_631_quotient_11_) );
  SNN_DW01_add_262 div_631_u_div_u_add_PartRem_3_1 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, n1252, n2093, n2092, n2091, div_631_u_div_PartRem_5__3_, n1254, 
        n2090, n2087, ratio_a[11:9]}), .B({1'b1, 1'b1, 1'b1, n1136, 1'b1, 1'b1, 
        n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1134}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_104, SYNOPSYS_UNCONNECTED_105, 
        SYNOPSYS_UNCONNECTED_106, div_631_u_div_SumTmp_1__3__11_, 
        div_631_u_div_SumTmp_1__3__10_, div_631_u_div_SumTmp_1__3__9_, 
        div_631_u_div_SumTmp_1__3__8_, div_631_u_div_SumTmp_1__3__7_, 
        div_631_u_div_SumTmp_1__3__6_, div_631_u_div_SumTmp_1__3__5_, 
        div_631_u_div_SumTmp_1__3__4_, div_631_u_div_SumTmp_1__3__3_, 
        div_631_u_div_SumTmp_1__3__2_, div_631_u_div_SumTmp_1__3__1_, 
        div_631_u_div_SumTmp_1__3__0_}), .CO(div_631_u_div_CryOut_1__3_) );
  SNN_DW01_add_259 div_631_u_div_u_add_PartRem_3_2 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, n1252, n2093, n2092, n2091, div_631_u_div_PartRem_5__3_, n1254, 
        n2090, n2087, ratio_a[11:9]}), .B({1'b1, 1'b1, n1135, 1'b1, 1'b1, 
        n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1135, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_107, SYNOPSYS_UNCONNECTED_108, 
        SYNOPSYS_UNCONNECTED_109, div_631_u_div_SumTmp_2__3__11_, 
        div_631_u_div_SumTmp_2__3__10_, div_631_u_div_SumTmp_2__3__9_, 
        div_631_u_div_SumTmp_2__3__8_, div_631_u_div_SumTmp_2__3__7_, 
        div_631_u_div_SumTmp_2__3__6_, div_631_u_div_SumTmp_2__3__5_, 
        div_631_u_div_SumTmp_2__3__4_, div_631_u_div_SumTmp_2__3__3_, 
        div_631_u_div_SumTmp_2__3__2_, div_631_u_div_SumTmp_2__3__1_, 
        div_631_u_div_SumTmp_2__3__0_}), .CO(div_631_u_div_CryOut_2__3_) );
  SNN_DW01_add_266 div_631_u_div_u_add_PartRem_0_5 ( .A({
        div_631_u_div_PartRem_1__14_, n2026, n2061, n2044, 
        div_631_u_div_PartRem_1__10_, n2069, div_631_u_div_PartRem_1__8_, 
        n2066, n2034, n2049, n2041, n2073, ratio_a[2:0]}), .B({1'b1, 
        div_631_u_div_BInv_5__13_, 1'b1, 1'b0, n1056, 1'b1, n1058, 1'b0, 1'b0, 
        n1074, 1'b0, 1'b1, div_631_u_div_BInv_5__2_, 1'b0, n1141}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_110, SYNOPSYS_UNCONNECTED_111, 
        SYNOPSYS_UNCONNECTED_112, SYNOPSYS_UNCONNECTED_113, 
        SYNOPSYS_UNCONNECTED_114, SYNOPSYS_UNCONNECTED_115, 
        SYNOPSYS_UNCONNECTED_116, SYNOPSYS_UNCONNECTED_117, 
        SYNOPSYS_UNCONNECTED_118, SYNOPSYS_UNCONNECTED_119, 
        SYNOPSYS_UNCONNECTED_120, SYNOPSYS_UNCONNECTED_121, 
        SYNOPSYS_UNCONNECTED_122, SYNOPSYS_UNCONNECTED_123, 
        SYNOPSYS_UNCONNECTED_124}), .CO(div_631_u_div_CryOut_5__0_) );
  SNN_DW01_add_267 div_631_u_div_u_add_PartRem_0_7 ( .A({
        div_631_u_div_PartRem_1__14_, n2012, n2061, n2050, 
        div_631_u_div_PartRem_1__10_, n2032, div_631_u_div_PartRem_1__8_, 
        n1088, n2020, n2037, n2019, n2073, ratio_a[2:0]}), .B({1'b1, 
        div_631_u_div_BInv_7__13_, div_631_u_div_BInv_7__12_, 1'b0, 1'b0, 
        div_631_u_div_BInv_7__9_, div_631_u_div_BInv_7__8_, 1'b0, 1'b0, n1122, 
        n1120, 1'b1, 1'b1, div_631_u_div_BInv_7__1_, n1139}), .CI(1'b1), .SUM(
        {SYNOPSYS_UNCONNECTED_125, SYNOPSYS_UNCONNECTED_126, 
        SYNOPSYS_UNCONNECTED_127, SYNOPSYS_UNCONNECTED_128, 
        SYNOPSYS_UNCONNECTED_129, SYNOPSYS_UNCONNECTED_130, 
        SYNOPSYS_UNCONNECTED_131, SYNOPSYS_UNCONNECTED_132, 
        SYNOPSYS_UNCONNECTED_133, SYNOPSYS_UNCONNECTED_134, 
        SYNOPSYS_UNCONNECTED_135, SYNOPSYS_UNCONNECTED_136, 
        SYNOPSYS_UNCONNECTED_137, SYNOPSYS_UNCONNECTED_138, 
        SYNOPSYS_UNCONNECTED_139}), .CO(div_631_u_div_CryOut_7__0_) );
  SNN_DW01_add_271 div_631_u_div_u_add_PartRem_0_3 ( .A({
        div_631_u_div_PartRem_1__14_, n2063, div_631_u_div_PartRem_1__12_, 
        n2050, n2025, n2069, n2048, n2066, n2029, n2038, n2019, 
        div_631_u_div_PartRem_1__3_, ratio_a[2:0]}), .B({1'b1, 1'b1, 
        div_631_u_div_BInv_3__12_, n1127, n1070, n1065, n1069, 1'b0, 1'b0, 
        1'b0, n1067, n1075, div_631_u_div_BInv_3__2_, div_631_u_div_BInv_3__1_, 
        n1129}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_140, 
        SYNOPSYS_UNCONNECTED_141, SYNOPSYS_UNCONNECTED_142, 
        SYNOPSYS_UNCONNECTED_143, SYNOPSYS_UNCONNECTED_144, 
        SYNOPSYS_UNCONNECTED_145, SYNOPSYS_UNCONNECTED_146, 
        SYNOPSYS_UNCONNECTED_147, SYNOPSYS_UNCONNECTED_148, 
        SYNOPSYS_UNCONNECTED_149, SYNOPSYS_UNCONNECTED_150, 
        SYNOPSYS_UNCONNECTED_151, SYNOPSYS_UNCONNECTED_152, 
        SYNOPSYS_UNCONNECTED_153, SYNOPSYS_UNCONNECTED_154}), .CO(
        div_631_u_div_CryOut_3__0_) );
  SNN_DW01_add_295 div_631_u_div_u_add_PartRem_0_4 ( .A({
        div_631_u_div_PartRem_1__14_, n2013, n2061, n2050, 
        div_631_u_div_PartRem_1__10_, n2069, n2048, n2014, n2086, n2058, 
        div_631_u_div_PartRem_1__4_, n2073, ratio_a[2:0]}), .B({1'b1, n1135, 
        1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1136, 
        1'b1, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_155, 
        SYNOPSYS_UNCONNECTED_156, SYNOPSYS_UNCONNECTED_157, 
        SYNOPSYS_UNCONNECTED_158, SYNOPSYS_UNCONNECTED_159, 
        SYNOPSYS_UNCONNECTED_160, SYNOPSYS_UNCONNECTED_161, 
        SYNOPSYS_UNCONNECTED_162, SYNOPSYS_UNCONNECTED_163, 
        SYNOPSYS_UNCONNECTED_164, SYNOPSYS_UNCONNECTED_165, 
        SYNOPSYS_UNCONNECTED_166, SYNOPSYS_UNCONNECTED_167, 
        SYNOPSYS_UNCONNECTED_168, SYNOPSYS_UNCONNECTED_169}), .CO(
        ratio_result_cnn[2]) );
  SNN_DW_mult_uns_51 mult_599 ( .a({mult_a_1__7_, mult_a_1__6_, mult_a_1__5_, 
        mult_a_1__4_, mult_a_1__3_, mult_a_1__2_, mult_a_1__1_, mult_a_1__0_}), 
        .b({mult_b_1__7_, mult_b_1__6_, mult_b_1__5_, mult_b_1__4_, 
        mult_b_1__3_, mult_b_1__2_, mult_b_1__1_, mult_b_1__0_}), .product({
        mult_comb_result_1__15_, mult_comb_result_1__14_, 
        mult_comb_result_1__13_, mult_comb_result_1__12_, 
        mult_comb_result_1__11_, mult_comb_result_1__10_, 
        mult_comb_result_1__9_, mult_comb_result_1__8_, mult_comb_result_1__7_, 
        mult_comb_result_1__6_, mult_comb_result_1__5_, mult_comb_result_1__4_, 
        mult_comb_result_1__3_, mult_comb_result_1__2_, mult_comb_result_1__1_, 
        mult_comb_result_1__0_}) );
  SNN_DW01_add_293 add_611 ( .A({1'b0, mult_comb_result_0__15_, 
        mult_comb_result_0__14_, mult_comb_result_0__13_, 
        mult_comb_result_0__12_, mult_comb_result_0__11_, 
        mult_comb_result_0__10_, mult_comb_result_0__9_, 
        mult_comb_result_0__8_, mult_comb_result_0__7_, mult_comb_result_0__6_, 
        mult_comb_result_0__5_, mult_comb_result_0__4_, mult_comb_result_0__3_, 
        mult_comb_result_0__2_, mult_comb_result_0__1_, mult_comb_result_0__0_}), .B({1'b0, mult_comb_result_1__15_, mult_comb_result_1__14_, 
        mult_comb_result_1__13_, mult_comb_result_1__12_, 
        mult_comb_result_1__11_, mult_comb_result_1__10_, 
        mult_comb_result_1__9_, mult_comb_result_1__8_, mult_comb_result_1__7_, 
        mult_comb_result_1__6_, mult_comb_result_1__5_, mult_comb_result_1__4_, 
        mult_comb_result_1__3_, mult_comb_result_1__2_, mult_comb_result_1__1_, 
        mult_comb_result_1__0_}), .CI(1'b0), .SUM(add_2_result) );
  SNN_DW_mult_uns_52 mult_598 ( .a({mult_a_0__7_, mult_a_0__6_, mult_a_0__5_, 
        mult_a_0__4_, mult_a_0__3_, mult_a_0__2_, mult_a_0__1_, mult_a_0__0_}), 
        .b({mult_b_0__7_, mult_b_0__6_, mult_b_0__5_, mult_b_0__4_, 
        mult_b_0__3_, mult_b_0__2_, mult_b_0__1_, mult_b_0__0_}), .product({
        mult_comb_result_0__15_, mult_comb_result_0__14_, 
        mult_comb_result_0__13_, mult_comb_result_0__12_, 
        mult_comb_result_0__11_, mult_comb_result_0__10_, 
        mult_comb_result_0__9_, mult_comb_result_0__8_, mult_comb_result_0__7_, 
        mult_comb_result_0__6_, mult_comb_result_0__5_, mult_comb_result_0__4_, 
        mult_comb_result_0__3_, mult_comb_result_0__2_, mult_comb_result_0__1_, 
        mult_comb_result_0__0_}) );
  SNN_DW01_add_288 div_631_u_div_u_add_PartRem_0_6 ( .A({
        div_631_u_div_PartRem_1__14_, div_631_u_div_PartRem_1__13_, 
        div_631_u_div_PartRem_1__12_, div_631_u_div_PartRem_1__11_, n2053, 
        n2032, n2048, n2094, div_631_u_div_PartRem_1__6_, 
        div_631_u_div_PartRem_1__5_, n2041, div_631_u_div_PartRem_1__3_, 
        ratio_a[2:0]}), .B({1'b1, div_631_u_div_BInv_6__13_, n1123, n1061, 
        n1059, n1077, 1'b0, 1'b0, 1'b0, n1063, n1072, div_631_u_div_BInv_6__3_, 
        div_631_u_div_BInv_6__2_, n1125, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_170, SYNOPSYS_UNCONNECTED_171, 
        SYNOPSYS_UNCONNECTED_172, SYNOPSYS_UNCONNECTED_173, 
        SYNOPSYS_UNCONNECTED_174, SYNOPSYS_UNCONNECTED_175, 
        SYNOPSYS_UNCONNECTED_176, SYNOPSYS_UNCONNECTED_177, 
        SYNOPSYS_UNCONNECTED_178, SYNOPSYS_UNCONNECTED_179, 
        SYNOPSYS_UNCONNECTED_180, SYNOPSYS_UNCONNECTED_181, 
        SYNOPSYS_UNCONNECTED_182, SYNOPSYS_UNCONNECTED_183, 
        SYNOPSYS_UNCONNECTED_184}), .CO(div_631_u_div_CryOut_6__0_) );
  SNN_DW01_add_307 add_0_root_add_0_root_add_615_4 ( .A({1'b0, 1'b0, 1'b0, 
        add_2_result}), .B({n2236, n2235, n2234, n2233, n2232, n2231, n2230, 
        n2229, n2228, n2227, n2226, n2225, n2224, n2223, n2222, n2221, n2220, 
        n2219, n2218, n2217}), .CI(1'b0), .SUM(add_9_result) );
  SNN_DW01_add_318 div_631_u_div_u_add_PartRem_3_6 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, n1252, n2093, n2092, n2091, div_631_u_div_PartRem_5__3_, n1254, 
        n2089, n935, ratio_a[11:9]}), .B({1'b1, div_631_u_div_BInv_6__13_, 
        n1123, n1061, n1059, n1077, 1'b0, 1'b0, 1'b0, n1063, n1072, 
        div_631_u_div_BInv_6__3_, div_631_u_div_BInv_6__2_, n1125, 1'b1}), 
        .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_185, SYNOPSYS_UNCONNECTED_186, 
        SYNOPSYS_UNCONNECTED_187, div_631_u_div_SumTmp_6__3__11_, 
        div_631_u_div_SumTmp_6__3__10_, div_631_u_div_SumTmp_6__3__9_, 
        div_631_u_div_SumTmp_6__3__8_, div_631_u_div_SumTmp_6__3__7_, 
        div_631_u_div_SumTmp_6__3__6_, div_631_u_div_SumTmp_6__3__5_, 
        div_631_u_div_SumTmp_6__3__4_, div_631_u_div_SumTmp_6__3__3_, 
        div_631_u_div_SumTmp_6__3__2_, div_631_u_div_SumTmp_6__3__1_, 
        div_631_u_div_SumTmp_6__3__0_}), .CO(div_631_u_div_CryOut_6__3_) );
  SNN_DW01_add_316 div_631_u_div_u_add_PartRem_3_3 ( .A({1'b0, 1'b0, 1'b0, 
        1'b0, n1252, n2093, n2092, n2091, div_631_u_div_PartRem_5__3_, n1254, 
        n2090, n935, ratio_a[11:9]}), .B({1'b1, 1'b1, 
        div_631_u_div_BInv_3__12_, n1127, n1070, n1065, n1069, 1'b0, 1'b0, 
        1'b0, n1067, n1075, div_631_u_div_BInv_3__2_, div_631_u_div_BInv_3__1_, 
        n1129}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_188, 
        SYNOPSYS_UNCONNECTED_189, SYNOPSYS_UNCONNECTED_190, 
        div_631_u_div_SumTmp_3__3__11_, div_631_u_div_SumTmp_3__3__10_, 
        div_631_u_div_SumTmp_3__3__9_, div_631_u_div_SumTmp_3__3__8_, 
        div_631_u_div_SumTmp_3__3__7_, div_631_u_div_SumTmp_3__3__6_, 
        div_631_u_div_SumTmp_3__3__5_, div_631_u_div_SumTmp_3__3__4_, 
        div_631_u_div_SumTmp_3__3__3_, div_631_u_div_SumTmp_3__3__2_, 
        div_631_u_div_SumTmp_3__3__1_, div_631_u_div_SumTmp_3__3__0_}), .CO(
        div_631_u_div_CryOut_3__3_) );
  SNN_DW01_add_323 div_631_u_div_u_add_B6 ( .A({1'b1, n1246, 1'b1, 1'b1, n1132, 
        1'b0, 1'b0, 1'b0, 1'b0, n1132, 1'b0, 1'b0, n1246, 1'b1, 1'b1}), .B({
        1'b1, 1'b1, n1133, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, n1131, 
        1'b0, 1'b0, n1134, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_191, 
        div_631_u_div_BInv_6__13_, div_631_u_div_BInv_6__12_, 
        div_631_u_div_BInv_6__11_, div_631_u_div_BInv_6__10_, 
        div_631_u_div_BInv_6__9_, SYNOPSYS_UNCONNECTED_192, 
        SYNOPSYS_UNCONNECTED_193, SYNOPSYS_UNCONNECTED_194, 
        div_631_u_div_BInv_6__5_, div_631_u_div_BInv_6__4_, 
        div_631_u_div_BInv_6__3_, div_631_u_div_BInv_6__2_, 
        div_631_u_div_BInv_6__1_, SYNOPSYS_UNCONNECTED_195}) );
  SNN_DW01_add_324 div_631_u_div_u_add_B3 ( .A({1'b1, 1'b1, n1246, 1'b1, 1'b1, 
        n1132, 1'b0, 1'b0, 1'b0, 1'b0, n1132, 1'b0, 1'b0, n1246, 1'b1}), .B({
        1'b1, 1'b1, 1'b1, n1133, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, 
        n1131, 1'b0, 1'b0, n1133}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_196, 
        SYNOPSYS_UNCONNECTED_197, div_631_u_div_BInv_3__12_, 
        div_631_u_div_BInv_3__11_, div_631_u_div_BInv_3__10_, 
        div_631_u_div_BInv_3__9_, SYNOPSYS_UNCONNECTED_198, 
        SYNOPSYS_UNCONNECTED_199, SYNOPSYS_UNCONNECTED_200, 
        SYNOPSYS_UNCONNECTED_201, div_631_u_div_BInv_3__4_, 
        div_631_u_div_BInv_3__3_, div_631_u_div_BInv_3__2_, 
        div_631_u_div_BInv_3__1_, div_631_u_div_BInv_3__0_}) );
  SNN_DW01_sub_9 div_631_u_div_u_add_B7 ( .A({n1246, 1'b1, 1'b1, n1132, 1'b0, 
        1'b0, 1'b0, 1'b0, n1132, 1'b0, 1'b0, n1246, 1'b1, 1'b1, 1'b1}), .B({
        1'b1, 1'b1, 1'b1, n1134, 1'b1, 1'b1, n1132, 1'b0, 1'b0, 1'b0, 1'b0, 
        n1132, 1'b0, 1'b0, n1136}), .CI(1'b1), .DIFF({SYNOPSYS_UNCONNECTED_202, 
        div_631_u_div_BInv_7__13_, div_631_u_div_BInv_7__12_, 
        SYNOPSYS_UNCONNECTED_203, SYNOPSYS_UNCONNECTED_204, 
        div_631_u_div_BInv_7__9_, div_631_u_div_BInv_7__8_, 
        SYNOPSYS_UNCONNECTED_205, SYNOPSYS_UNCONNECTED_206, 
        SYNOPSYS_UNCONNECTED_207, div_631_u_div_BInv_7__4_, 
        SYNOPSYS_UNCONNECTED_208, SYNOPSYS_UNCONNECTED_209, 
        div_631_u_div_BInv_7__1_, div_631_u_div_BInv_7__0_}) );
  SNN_DW01_add_325 div_631_u_div_u_add_B5 ( .A({1'b1, n1246, 1'b1, 1'b1, n1132, 
        1'b0, 1'b0, 1'b0, 1'b0, n1131, 1'b0, 1'b0, n1246, 1'b1, 1'b1}), .B({
        1'b1, 1'b1, 1'b1, n1246, 1'b1, 1'b1, n1131, 1'b0, 1'b0, 1'b0, 1'b0, 
        n1132, 1'b0, 1'b0, n1136}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_210, 
        div_631_u_div_BInv_5__13_, SYNOPSYS_UNCONNECTED_211, 
        SYNOPSYS_UNCONNECTED_212, div_631_u_div_BInv_5__10_, 
        SYNOPSYS_UNCONNECTED_213, SYNOPSYS_UNCONNECTED_214, 
        SYNOPSYS_UNCONNECTED_215, SYNOPSYS_UNCONNECTED_216, 
        SYNOPSYS_UNCONNECTED_217, SYNOPSYS_UNCONNECTED_218, 
        SYNOPSYS_UNCONNECTED_219, div_631_u_div_BInv_5__2_, 
        SYNOPSYS_UNCONNECTED_220, div_631_u_div_BInv_5__0_}) );
  DFFRX4 cnn_map0_reg_0__6_ ( .D(N488), .CK(clk), .RN(rst_n), .Q(cnn_map0[6]), 
        .QN(n1226) );
  DFFRX4 cnn_map0_reg_0__7_ ( .D(N489), .CK(clk), .RN(rst_n), .Q(cnn_map0[7]), 
        .QN(n1242) );
  DFFRHQXL cnn_map0_reg_3__0_ ( .D(N512), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[16]) );
  DFFRXL nn_2_reg_2__0_ ( .D(n623), .CK(clk), .RN(rst_n), .Q(nn_2[16]), .QN(
        n1993) );
  DFFRXL nn_2_reg_2__1_ ( .D(n624), .CK(clk), .RN(rst_n), .Q(nn_2[17]) );
  DFFRHQX4 cnn_map0_reg_4__6_ ( .D(N528), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[26]) );
  DFFRX1 img0_reg_10__7_ ( .D(N298), .CK(clk), .RN(rst_n), .Q(n1176), .QN(
        n2138) );
  DFFRX1 img0_reg_4__7_ ( .D(N238), .CK(clk), .RN(rst_n), .Q(n1202), .QN(n2136) );
  DFFRX1 img0_reg_10__6_ ( .D(N297), .CK(clk), .RN(rst_n), .Q(n1179), .QN(
        n2134) );
  DFFRX1 img0_reg_4__6_ ( .D(N237), .CK(clk), .RN(rst_n), .Q(n1244), .QN(n2132) );
  DFFRX1 img0_reg_10__5_ ( .D(N296), .CK(clk), .RN(rst_n), .Q(n1182), .QN(
        n2130) );
  DFFRX1 img0_reg_4__5_ ( .D(N236), .CK(clk), .RN(rst_n), .Q(n1747), .QN(n2128) );
  DFFRX1 img0_reg_10__4_ ( .D(N295), .CK(clk), .RN(rst_n), .Q(n1185), .QN(
        n2125) );
  DFFRX1 img0_reg_4__4_ ( .D(N235), .CK(clk), .RN(rst_n), .Q(n1753), .QN(n2123) );
  DFFRX1 img0_reg_10__3_ ( .D(N294), .CK(clk), .RN(rst_n), .Q(n1188), .QN(
        n2121) );
  DFFRX1 img0_reg_4__3_ ( .D(N234), .CK(clk), .RN(rst_n), .Q(n1761), .QN(n2119) );
  DFFRX1 img0_reg_10__2_ ( .D(N293), .CK(clk), .RN(rst_n), .Q(n1191), .QN(
        n2117) );
  DFFRX1 img0_reg_4__2_ ( .D(N233), .CK(clk), .RN(rst_n), .Q(n1767), .QN(n2115) );
  DFFRX1 img0_reg_10__1_ ( .D(N292), .CK(clk), .RN(rst_n), .Q(n1194), .QN(
        n2113) );
  DFFRX1 img0_reg_4__1_ ( .D(N232), .CK(clk), .RN(rst_n), .Q(n1774), .QN(n2111) );
  DFFRX1 img0_reg_10__0_ ( .D(N291), .CK(clk), .RN(rst_n), .Q(n1197), .QN(
        n2109) );
  DFFRX1 img0_reg_4__0_ ( .D(N231), .CK(clk), .RN(rst_n), .Q(n1779), .QN(n2107) );
  DFFRX1 img0_reg_11__7_ ( .D(N308), .CK(clk), .RN(rst_n), .Q(n1162), .QN(
        n2139) );
  DFFRX1 img0_reg_5__7_ ( .D(N248), .CK(clk), .RN(rst_n), .Q(n1178), .QN(n2137) );
  DFFRX1 img0_reg_11__6_ ( .D(N307), .CK(clk), .RN(rst_n), .Q(n1164), .QN(
        n2135) );
  DFFRX1 img0_reg_5__6_ ( .D(N247), .CK(clk), .RN(rst_n), .Q(n1181), .QN(n2133) );
  DFFRX1 img0_reg_11__5_ ( .D(N306), .CK(clk), .RN(rst_n), .Q(n1166), .QN(
        n2131) );
  DFFRX1 img0_reg_5__5_ ( .D(N246), .CK(clk), .RN(rst_n), .Q(n1184), .QN(n2129) );
  DFFRX1 img0_reg_11__4_ ( .D(N305), .CK(clk), .RN(rst_n), .Q(n1167), .QN(
        n2126) );
  DFFRX1 img0_reg_5__4_ ( .D(N245), .CK(clk), .RN(rst_n), .Q(n1187), .QN(n2124) );
  DFFRX1 img0_reg_11__3_ ( .D(N304), .CK(clk), .RN(rst_n), .Q(n1169), .QN(
        n2122) );
  DFFRX1 img0_reg_5__3_ ( .D(N244), .CK(clk), .RN(rst_n), .Q(n1190), .QN(n2120) );
  DFFRX1 img0_reg_11__2_ ( .D(N303), .CK(clk), .RN(rst_n), .Q(n1170), .QN(
        n2118) );
  DFFRX1 img0_reg_5__2_ ( .D(N243), .CK(clk), .RN(rst_n), .Q(n1193), .QN(n2116) );
  DFFRX1 img0_reg_11__1_ ( .D(N302), .CK(clk), .RN(rst_n), .Q(n1173), .QN(
        n2114) );
  DFFRX1 img0_reg_5__1_ ( .D(N242), .CK(clk), .RN(rst_n), .Q(n1196), .QN(n2112) );
  DFFRX1 img0_reg_11__0_ ( .D(N301), .CK(clk), .RN(rst_n), .Q(n1175), .QN(
        n2110) );
  DFFRX1 img0_reg_5__0_ ( .D(N241), .CK(clk), .RN(rst_n), .Q(n1199), .QN(n2108) );
  DFFRX1 img0_reg_9__7_ ( .D(N288), .CK(clk), .RN(rst_n), .Q(n1177) );
  DFFRX1 img0_reg_3__7_ ( .D(N228), .CK(clk), .RN(rst_n), .Q(n1203) );
  DFFRX1 img0_reg_9__6_ ( .D(N287), .CK(clk), .RN(rst_n), .Q(n1180) );
  DFFRX1 img0_reg_3__6_ ( .D(N227), .CK(clk), .RN(rst_n), .Q(n1245) );
  DFFRX1 img0_reg_9__5_ ( .D(N286), .CK(clk), .RN(rst_n), .Q(n1183) );
  DFFRX1 img0_reg_3__5_ ( .D(N226), .CK(clk), .RN(rst_n), .Q(n1748) );
  DFFRX1 img0_reg_9__4_ ( .D(N285), .CK(clk), .RN(rst_n), .Q(n1186) );
  DFFRX1 img0_reg_3__4_ ( .D(N225), .CK(clk), .RN(rst_n), .Q(n1754) );
  DFFRX1 img0_reg_9__3_ ( .D(N284), .CK(clk), .RN(rst_n), .Q(n1189) );
  DFFRX1 img0_reg_3__3_ ( .D(N224), .CK(clk), .RN(rst_n), .Q(n1762) );
  DFFRX1 img0_reg_9__2_ ( .D(N283), .CK(clk), .RN(rst_n), .Q(n1192) );
  DFFRX1 img0_reg_3__2_ ( .D(N223), .CK(clk), .RN(rst_n), .Q(n1768) );
  DFFRX1 img0_reg_9__1_ ( .D(N282), .CK(clk), .RN(rst_n), .Q(n1195) );
  DFFRX1 img0_reg_3__1_ ( .D(N222), .CK(clk), .RN(rst_n), .Q(n1775) );
  DFFRX1 img0_reg_9__0_ ( .D(N281), .CK(clk), .RN(rst_n), .Q(n1198) );
  DFFRX1 img0_reg_3__0_ ( .D(N221), .CK(clk), .RN(rst_n), .Q(n1780) );
  DFFRHQXL nn_2_reg_3__7_ ( .D(n638), .CK(clk), .RN(rst_n), .Q(nn_2[31]) );
  DFFRHQXL nn_1_reg_3__7_ ( .D(n783), .CK(clk), .RN(rst_n), .Q(nn_1[31]) );
  DFFRHQXL nn_2_reg_1__7_ ( .D(n767), .CK(clk), .RN(rst_n), .Q(nn_2[15]) );
  DFFRHQX1 nn_2_reg_2__7_ ( .D(n630), .CK(clk), .RN(rst_n), .Q(nn_2[23]) );
  DFFRHQXL nn_1_reg_1__7_ ( .D(n799), .CK(clk), .RN(rst_n), .Q(nn_1[15]) );
  DFFRHQXL nn_1_reg_2__7_ ( .D(n775), .CK(clk), .RN(rst_n), .Q(nn_1[23]) );
  DFFRHQXL nn_2_reg_0__7_ ( .D(n759), .CK(clk), .RN(rst_n), .Q(nn_2[7]) );
  DFFRHQXL nn_1_reg_0__7_ ( .D(n791), .CK(clk), .RN(rst_n), .Q(nn_1[7]) );
  DFFRHQXL nn_2_reg_3__6_ ( .D(n637), .CK(clk), .RN(rst_n), .Q(nn_2[30]) );
  DFFRHQXL nn_1_reg_3__6_ ( .D(n782), .CK(clk), .RN(rst_n), .Q(nn_1[30]) );
  DFFRHQXL nn_2_reg_1__6_ ( .D(n766), .CK(clk), .RN(rst_n), .Q(nn_2[14]) );
  DFFRHQXL nn_1_reg_1__6_ ( .D(n798), .CK(clk), .RN(rst_n), .Q(nn_1[14]) );
  DFFRHQX1 nn_2_reg_2__6_ ( .D(n629), .CK(clk), .RN(rst_n), .Q(nn_2[22]) );
  DFFRHQXL nn_1_reg_2__6_ ( .D(n774), .CK(clk), .RN(rst_n), .Q(nn_1[22]) );
  DFFRHQXL nn_2_reg_0__6_ ( .D(n758), .CK(clk), .RN(rst_n), .Q(nn_2[6]) );
  DFFRHQXL nn_1_reg_0__6_ ( .D(n790), .CK(clk), .RN(rst_n), .Q(nn_1[6]) );
  DFFRHQXL nn_1_reg_3__5_ ( .D(n781), .CK(clk), .RN(rst_n), .Q(nn_1[29]) );
  DFFRHQXL nn_2_reg_3__5_ ( .D(n636), .CK(clk), .RN(rst_n), .Q(nn_2[29]) );
  DFFRHQXL nn_1_reg_1__5_ ( .D(n797), .CK(clk), .RN(rst_n), .Q(nn_1[13]) );
  DFFRHQXL nn_1_reg_2__5_ ( .D(n773), .CK(clk), .RN(rst_n), .Q(nn_1[21]) );
  DFFRHQXL nn_2_reg_1__5_ ( .D(n765), .CK(clk), .RN(rst_n), .Q(nn_2[13]) );
  DFFRHQXL nn_2_reg_2__5_ ( .D(n628), .CK(clk), .RN(rst_n), .Q(nn_2[21]) );
  DFFRHQXL nn_1_reg_0__5_ ( .D(n789), .CK(clk), .RN(rst_n), .Q(nn_1[5]) );
  DFFRHQXL nn_2_reg_0__5_ ( .D(n757), .CK(clk), .RN(rst_n), .Q(nn_2[5]) );
  DFFRHQXL nn_1_reg_3__4_ ( .D(n780), .CK(clk), .RN(rst_n), .Q(nn_1[28]) );
  DFFRHQXL nn_2_reg_3__4_ ( .D(n635), .CK(clk), .RN(rst_n), .Q(nn_2[28]) );
  DFFRHQXL nn_1_reg_1__4_ ( .D(n796), .CK(clk), .RN(rst_n), .Q(nn_1[12]) );
  DFFRHQXL nn_1_reg_2__4_ ( .D(n772), .CK(clk), .RN(rst_n), .Q(nn_1[20]) );
  DFFRHQXL nn_2_reg_1__4_ ( .D(n764), .CK(clk), .RN(rst_n), .Q(nn_2[12]) );
  DFFRHQXL nn_2_reg_2__4_ ( .D(n627), .CK(clk), .RN(rst_n), .Q(nn_2[20]) );
  DFFRHQXL nn_1_reg_0__4_ ( .D(n788), .CK(clk), .RN(rst_n), .Q(nn_1[4]) );
  DFFRHQXL nn_2_reg_0__4_ ( .D(n756), .CK(clk), .RN(rst_n), .Q(nn_2[4]) );
  DFFRHQXL nn_1_reg_3__3_ ( .D(n779), .CK(clk), .RN(rst_n), .Q(nn_1[27]) );
  DFFRHQXL nn_2_reg_3__3_ ( .D(n634), .CK(clk), .RN(rst_n), .Q(nn_2[27]) );
  DFFRHQXL nn_1_reg_1__3_ ( .D(n795), .CK(clk), .RN(rst_n), .Q(nn_1[11]) );
  DFFRHQXL nn_1_reg_2__3_ ( .D(n771), .CK(clk), .RN(rst_n), .Q(nn_1[19]) );
  DFFRHQXL nn_2_reg_1__3_ ( .D(n763), .CK(clk), .RN(rst_n), .Q(nn_2[11]) );
  DFFRHQXL nn_2_reg_2__3_ ( .D(n626), .CK(clk), .RN(rst_n), .Q(nn_2[19]) );
  DFFRHQXL nn_1_reg_0__3_ ( .D(n787), .CK(clk), .RN(rst_n), .Q(nn_1[3]) );
  DFFRHQXL nn_2_reg_0__3_ ( .D(n755), .CK(clk), .RN(rst_n), .Q(nn_2[3]) );
  DFFRHQXL nn_1_reg_3__2_ ( .D(n778), .CK(clk), .RN(rst_n), .Q(nn_1[26]) );
  DFFRHQXL nn_2_reg_3__2_ ( .D(n633), .CK(clk), .RN(rst_n), .Q(nn_2[26]) );
  DFFRHQXL nn_1_reg_1__2_ ( .D(n794), .CK(clk), .RN(rst_n), .Q(nn_1[10]) );
  DFFRHQXL nn_1_reg_2__2_ ( .D(n770), .CK(clk), .RN(rst_n), .Q(nn_1[18]) );
  DFFRHQXL nn_2_reg_1__2_ ( .D(n762), .CK(clk), .RN(rst_n), .Q(nn_2[10]) );
  DFFRHQXL nn_2_reg_2__2_ ( .D(n625), .CK(clk), .RN(rst_n), .Q(nn_2[18]) );
  DFFRHQXL nn_1_reg_0__2_ ( .D(n786), .CK(clk), .RN(rst_n), .Q(nn_1[2]) );
  DFFRHQXL nn_1_reg_3__0_ ( .D(n776), .CK(clk), .RN(rst_n), .Q(nn_1[24]) );
  DFFRHQXL nn_2_reg_0__2_ ( .D(n754), .CK(clk), .RN(rst_n), .Q(nn_2[2]) );
  DFFRHQXL nn_1_reg_3__1_ ( .D(n777), .CK(clk), .RN(rst_n), .Q(nn_1[25]) );
  DFFRHQXL nn_1_reg_1__0_ ( .D(n792), .CK(clk), .RN(rst_n), .Q(nn_1[8]) );
  DFFRHQXL nn_1_reg_2__0_ ( .D(n768), .CK(clk), .RN(rst_n), .Q(nn_1[16]) );
  DFFRHQXL nn_2_reg_3__1_ ( .D(n632), .CK(clk), .RN(rst_n), .Q(nn_2[25]) );
  DFFRHQXL nn_1_reg_1__1_ ( .D(n793), .CK(clk), .RN(rst_n), .Q(nn_1[9]) );
  DFFRHQXL nn_1_reg_2__1_ ( .D(n769), .CK(clk), .RN(rst_n), .Q(nn_1[17]) );
  DFFRHQXL nn_1_reg_0__0_ ( .D(n784), .CK(clk), .RN(rst_n), .Q(nn_1[0]) );
  DFFRHQXL nn_2_reg_1__1_ ( .D(n761), .CK(clk), .RN(rst_n), .Q(nn_2[9]) );
  DFFRHQXL nn_1_reg_0__1_ ( .D(n785), .CK(clk), .RN(rst_n), .Q(nn_1[1]) );
  DFFRHQXL nn_2_reg_3__0_ ( .D(n631), .CK(clk), .RN(rst_n), .Q(nn_2[24]) );
  DFFRHQXL nn_2_reg_0__1_ ( .D(n753), .CK(clk), .RN(rst_n), .Q(nn_2[1]) );
  DFFRHQXL nn_2_reg_1__0_ ( .D(n760), .CK(clk), .RN(rst_n), .Q(nn_2[8]) );
  DFFRHQXL nn_2_reg_0__0_ ( .D(n752), .CK(clk), .RN(rst_n), .Q(nn_2[0]) );
  DFFRX1 max_map_new_reg_1__6_ ( .D(N576), .CK(clk), .RN(rst_n), .Q(n1957) );
  DFFRX1 weight_map_reg_1__0__6_ ( .D(N357), .CK(clk), .RN(rst_n), .Q(n1942)
         );
  DFFRX1 max_map_new_reg_0__7_ ( .D(N569), .CK(clk), .RN(rst_n), .Q(n1919) );
  DFFRX1 weight_map_reg_1__1__6_ ( .D(N377), .CK(clk), .RN(rst_n), .Q(n1970)
         );
  DFFRX1 weight_map_reg_1__0__7_ ( .D(N358), .CK(clk), .RN(rst_n), .Q(n1940)
         );
  DFFRX1 max_map_new_reg_1__7_ ( .D(N577), .CK(clk), .RN(rst_n), .Q(n1955) );
  DFFRX1 weight_map_reg_1__1__7_ ( .D(N378), .CK(clk), .RN(rst_n), .Q(n1968)
         );
  DFFRX1 max_map_new_reg_0__6_ ( .D(N568), .CK(clk), .RN(rst_n), .Q(n1921) );
  DFFRX1 weight_map_reg_1__0__1_ ( .D(N352), .CK(clk), .RN(rst_n), .Q(n1952)
         );
  DFFRX1 weight_map_reg_1__1__1_ ( .D(N372), .CK(clk), .RN(rst_n), .Q(n1980)
         );
  DFFRX1 max_map_new_reg_1__4_ ( .D(N574), .CK(clk), .RN(rst_n), .Q(n1962) );
  DFFRX1 weight_map_reg_1__0__4_ ( .D(N355), .CK(clk), .RN(rst_n), .Q(n1946)
         );
  DFFRX1 weight_map_reg_1__1__4_ ( .D(N375), .CK(clk), .RN(rst_n), .Q(n1974)
         );
  DFFRX1 max_map_new_reg_0__5_ ( .D(N567), .CK(clk), .RN(rst_n), .Q(n1923) );
  DFFRX1 weight_map_reg_1__0__5_ ( .D(N356), .CK(clk), .RN(rst_n), .Q(n1944)
         );
  DFFRX1 max_map_new_reg_1__5_ ( .D(N575), .CK(clk), .RN(rst_n), .Q(n1961) );
  DFFRX1 weight_map_reg_1__1__5_ ( .D(N376), .CK(clk), .RN(rst_n), .Q(n1972)
         );
  DFFRX1 weight_map_reg_1__0__0_ ( .D(N351), .CK(clk), .RN(rst_n), .Q(n1954)
         );
  DFFRX1 weight_map_reg_1__1__0_ ( .D(N371), .CK(clk), .RN(rst_n), .Q(n1983)
         );
  DFFRX1 max_map_new_reg_0__2_ ( .D(N564), .CK(clk), .RN(rst_n), .Q(n1929) );
  DFFRX1 max_map_new_reg_0__4_ ( .D(N566), .CK(clk), .RN(rst_n), .Q(n1925) );
  DFFRX1 max_map_new_reg_1__2_ ( .D(N572), .CK(clk), .RN(rst_n), .Q(n1964) );
  DFFRX1 weight_map_reg_1__0__2_ ( .D(N353), .CK(clk), .RN(rst_n), .Q(n1950)
         );
  DFFRX1 weight_map_reg_1__1__2_ ( .D(N373), .CK(clk), .RN(rst_n), .Q(n1978)
         );
  DFFRX1 max_map_new_reg_0__3_ ( .D(N565), .CK(clk), .RN(rst_n), .Q(n1927) );
  DFFRX1 weight_map_reg_1__0__3_ ( .D(N354), .CK(clk), .RN(rst_n), .Q(n1948)
         );
  DFFRX1 weight_map_reg_1__1__3_ ( .D(N374), .CK(clk), .RN(rst_n), .Q(n1976)
         );
  DFFRX1 max_map_new_reg_0__0_ ( .D(N562), .CK(clk), .RN(rst_n), .Q(n1933) );
  DFFRX1 max_map_new_reg_1__0_ ( .D(N570), .CK(clk), .RN(rst_n), .Q(n1966) );
  DFFRX1 max_map_new_reg_0__1_ ( .D(N563), .CK(clk), .RN(rst_n), .Q(n1931) );
  DFFRX1 max_map_new_reg_1__1_ ( .D(N571), .CK(clk), .RN(rst_n), .Q(n1965) );
  DFFRHQX1 cnt_reg_5_ ( .D(cnt_comb[5]), .CK(clk), .RN(rst_n), .Q(cnt[5]) );
  DFFRHQX1 cnt_reg_2_ ( .D(cnt_comb[2]), .CK(clk), .RN(rst_n), .Q(cnt[2]) );
  DFFRX1 max_map_new_reg_1__3_ ( .D(N573), .CK(clk), .RN(rst_n), .Q(n1963) );
  DFFRHQX1 cnt_reg_4_ ( .D(cnt_comb[4]), .CK(clk), .RN(rst_n), .Q(cnt[4]) );
  DFFRHQX1 cnt_reg_3_ ( .D(cnt_comb[3]), .CK(clk), .RN(rst_n), .Q(cnt[3]) );
  DFFRHQX1 cnt_reg_1_ ( .D(cnt_comb[1]), .CK(clk), .RN(rst_n), .Q(cnt[1]) );
  DFFRHQX1 cnt_reg_0_ ( .D(cnt_comb[0]), .CK(clk), .RN(rst_n), .Q(cnt[0]) );
  DFFRX1 img0_reg_0__1_ ( .D(N192), .CK(clk), .RN(rst_n), .Q(n1778) );
  DFFRX1 img0_reg_0__0_ ( .D(N191), .CK(clk), .RN(rst_n), .Q(n1784) );
  DFFRXL cnn_map0_reg_7__0_ ( .D(N552), .CK(clk), .RN(rst_n), .Q(cnn_map0[35]), 
        .QN(n751) );
  DFFRX1 kernel_reg_0__0__0_ ( .D(N381), .CK(clk), .RN(rst_n), .Q(n1793) );
  DFFRX1 weight_map_reg_0__0__0_ ( .D(N341), .CK(clk), .RN(rst_n), .Q(n1953)
         );
  DFFRX1 kernel_reg_0__1__1_ ( .D(N392), .CK(clk), .RN(rst_n), .Q(n1893) );
  DFFRX1 weight_map_reg_0__1__1_ ( .D(N362), .CK(clk), .RN(rst_n), .Q(n1979)
         );
  DFFRX1 kernel_reg_0__1__0_ ( .D(N391), .CK(clk), .RN(rst_n), .Q(n1894) );
  DFFRX1 weight_map_reg_0__1__0_ ( .D(N361), .CK(clk), .RN(rst_n), .Q(n1982)
         );
  DFFRHQX1 out_valid_reg ( .D(n1024), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFRX1 img0_reg_1__0_ ( .D(N201), .CK(clk), .RN(rst_n), .Q(n1886) );
  DFFRX1 img0_reg_1__1_ ( .D(N202), .CK(clk), .RN(rst_n), .Q(n1881) );
  DFFRHQX1 out_data_reg_0_ ( .D(N97), .CK(clk), .RN(rst_n), .Q(out_data[0]) );
  DFFRHQX1 out_data_reg_9_ ( .D(N106), .CK(clk), .RN(rst_n), .Q(out_data[9])
         );
  DFFRHQX1 out_data_reg_8_ ( .D(N105), .CK(clk), .RN(rst_n), .Q(out_data[8])
         );
  DFFRHQX1 out_data_reg_7_ ( .D(N104), .CK(clk), .RN(rst_n), .Q(out_data[7])
         );
  DFFRHQX1 out_data_reg_2_ ( .D(N99), .CK(clk), .RN(rst_n), .Q(out_data[2]) );
  DFFRHQX1 out_data_reg_1_ ( .D(N98), .CK(clk), .RN(rst_n), .Q(out_data[1]) );
  DFFRHQX1 out_data_reg_3_ ( .D(N100), .CK(clk), .RN(rst_n), .Q(out_data[3])
         );
  DFFRHQX1 out_data_reg_6_ ( .D(N103), .CK(clk), .RN(rst_n), .Q(out_data[6])
         );
  DFFRHQX1 out_data_reg_5_ ( .D(N102), .CK(clk), .RN(rst_n), .Q(out_data[5])
         );
  DFFRHQX1 out_data_reg_4_ ( .D(N101), .CK(clk), .RN(rst_n), .Q(out_data[4])
         );
  DFFRX1 kernel_reg_0__0__7_ ( .D(N388), .CK(clk), .RN(rst_n), .Q(n1786) );
  DFFRX1 weight_map_reg_0__0__7_ ( .D(N348), .CK(clk), .RN(rst_n), .Q(n1939)
         );
  DFFRX1 img0_reg_1__2_ ( .D(N203), .CK(clk), .RN(rst_n), .Q(n1876) );
  DFFRX1 img0_reg_0__6_ ( .D(N197), .CK(clk), .RN(rst_n), .Q(n1746) );
  DFFRX1 kernel_reg_0__0__6_ ( .D(N387), .CK(clk), .RN(rst_n), .Q(n1787) );
  DFFRX1 weight_map_reg_0__0__6_ ( .D(N347), .CK(clk), .RN(rst_n), .Q(n1941)
         );
  DFFRX1 kernel_reg_0__1__7_ ( .D(N398), .CK(clk), .RN(rst_n), .Q(n1887) );
  DFFRX1 weight_map_reg_0__1__7_ ( .D(N368), .CK(clk), .RN(rst_n), .Q(n1967)
         );
  DFFRX1 kernel_reg_0__1__5_ ( .D(N396), .CK(clk), .RN(rst_n), .Q(n1889) );
  DFFRX1 kernel_reg_0__1__6_ ( .D(N397), .CK(clk), .RN(rst_n), .Q(n1888) );
  DFFRX1 weight_map_reg_0__1__5_ ( .D(N366), .CK(clk), .RN(rst_n), .Q(n1971)
         );
  DFFRX1 weight_map_reg_0__1__6_ ( .D(N367), .CK(clk), .RN(rst_n), .Q(n1969)
         );
  DFFRX1 img0_reg_0__3_ ( .D(N194), .CK(clk), .RN(rst_n), .Q(n1766) );
  DFFRX1 img0_reg_1__3_ ( .D(N204), .CK(clk), .RN(rst_n), .Q(n1873) );
  DFFRX1 img0_reg_0__2_ ( .D(N193), .CK(clk), .RN(rst_n), .Q(n1773) );
  DFFRX1 kernel_reg_0__0__5_ ( .D(N386), .CK(clk), .RN(rst_n), .Q(n1788) );
  DFFRX1 weight_map_reg_0__0__5_ ( .D(N346), .CK(clk), .RN(rst_n), .Q(n1943)
         );
  DFFRX1 img0_reg_1__4_ ( .D(N205), .CK(clk), .RN(rst_n), .Q(n1848) );
  DFFRX1 img0_reg_1__5_ ( .D(N206), .CK(clk), .RN(rst_n), .Q(n863), .QN(n2127)
         );
  DFFRX1 img0_reg_0__5_ ( .D(N196), .CK(clk), .RN(rst_n), .Q(n1752) );
  DFFRX1 img0_reg_0__7_ ( .D(N198), .CK(clk), .RN(rst_n), .Q(n1243) );
  DFFRX1 img0_reg_0__4_ ( .D(N195), .CK(clk), .RN(rst_n), .Q(n1760) );
  DFFRX1 kernel_reg_0__1__4_ ( .D(N395), .CK(clk), .RN(rst_n), .Q(n1890) );
  DFFRX4 img0_reg_13__4_ ( .D(N325), .CK(clk), .RN(rst_n), .Q(img0[44]) );
  DFFRX1 weight_map_reg_0__1__4_ ( .D(N365), .CK(clk), .RN(rst_n), .Q(n1973)
         );
  DFFRX1 kernel_reg_0__0__3_ ( .D(N384), .CK(clk), .RN(rst_n), .Q(n1790) );
  DFFRX1 weight_map_reg_0__0__3_ ( .D(N344), .CK(clk), .RN(rst_n), .Q(n1947)
         );
  DFFRX1 kernel_reg_0__0__4_ ( .D(N385), .CK(clk), .RN(rst_n), .Q(n1789) );
  DFFRX1 weight_map_reg_0__0__4_ ( .D(N345), .CK(clk), .RN(rst_n), .Q(n1945)
         );
  DFFRX1 kernel_reg_0__0__2_ ( .D(N383), .CK(clk), .RN(rst_n), .Q(n1791) );
  DFFRX1 kernel_reg_0__0__1_ ( .D(N382), .CK(clk), .RN(rst_n), .Q(n1792) );
  DFFRX1 weight_map_reg_0__0__2_ ( .D(N343), .CK(clk), .RN(rst_n), .Q(n1949)
         );
  DFFRX1 weight_map_reg_0__0__1_ ( .D(N342), .CK(clk), .RN(rst_n), .Q(n1951)
         );
  DFFRX1 kernel_reg_0__1__3_ ( .D(N394), .CK(clk), .RN(rst_n), .Q(n1891) );
  DFFRX1 kernel_reg_0__1__2_ ( .D(N393), .CK(clk), .RN(rst_n), .Q(n1892) );
  DFFRX1 weight_map_reg_0__1__3_ ( .D(N364), .CK(clk), .RN(rst_n), .Q(n1975)
         );
  DFFRX1 weight_map_reg_0__1__2_ ( .D(N363), .CK(clk), .RN(rst_n), .Q(n1977)
         );
  DFFRX1 img0_reg_1__6_ ( .D(N207), .CK(clk), .RN(rst_n), .Q(n1831) );
  DFFRHQX4 kernel_reg_2__2__2_ ( .D(N463), .CK(clk), .RN(rst_n), .Q(kernel[50]) );
  DFFRX4 cnn_map0_reg_7__1_ ( .D(N553), .CK(clk), .RN(rst_n), .Q(cnn_map0[36]), 
        .QN(n1029) );
  DFFRX4 img0_reg_13__3_ ( .D(N324), .CK(clk), .RN(rst_n), .Q(img0[43]), .QN(
        n684) );
  DFFRX4 img0_reg_14__3_ ( .D(N334), .CK(clk), .RN(rst_n), .Q(img0[50]) );
  DFFRX4 img0_reg_13__0_ ( .D(N321), .CK(clk), .RN(rst_n), .Q(img0[40]), .QN(
        n687) );
  DFFRX4 img0_reg_13__5_ ( .D(N326), .CK(clk), .RN(rst_n), .Q(img0[45]), .QN(
        n682) );
  DFFRX4 img0_reg_13__1_ ( .D(N322), .CK(clk), .RN(rst_n), .Q(img0[41]), .QN(
        n686) );
  DFFRX4 img0_reg_14__7_ ( .D(N338), .CK(clk), .RN(rst_n), .Q(img0[52]) );
  DFFRHQX4 cnn_map0_reg_1__5_ ( .D(N497), .CK(clk), .RN(rst_n), .Q(n922) );
  DFFRHQX4 cnn_map0_reg_4__5_ ( .D(N527), .CK(clk), .RN(rst_n), .Q(n917) );
  DFFRHQX4 cnn_map0_reg_1__6_ ( .D(N498), .CK(clk), .RN(rst_n), .Q(n915) );
  DFFRX4 cnn_map0_reg_7__2_ ( .D(N554), .CK(clk), .RN(rst_n), .Q(n914) );
  DFFRHQX1 cnn_map0_reg_5__0_ ( .D(N532), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[27]) );
  DFFRX4 img0_reg_13__7_ ( .D(N328), .CK(clk), .RN(rst_n), .Q(img0[47]) );
  DFFRX4 img0_reg_13__2_ ( .D(N323), .CK(clk), .RN(rst_n), .Q(img0[42]) );
  DFFRHQX4 cnn_map0_reg_5__5_ ( .D(N537), .CK(clk), .RN(rst_n), .Q(n908) );
  DFFRHQX4 cnn_map0_reg_4__7_ ( .D(N529), .CK(clk), .RN(rst_n), .Q(n904) );
  DFFRHQX4 cnn_map0_reg_5__3_ ( .D(N535), .CK(clk), .RN(rst_n), .Q(n899) );
  DFFRX2 cnn_map0_reg_1__0_ ( .D(N492), .CK(clk), .RN(rst_n), .Q(cnn_map0[8]), 
        .QN(n703) );
  DFFRX4 img0_reg_14__2_ ( .D(N333), .CK(clk), .RN(rst_n), .Q(img0[49]) );
  DFFRHQX4 kernel_reg_2__1__1_ ( .D(N452), .CK(clk), .RN(rst_n), .Q(kernel[41]) );
  DFFRHQX2 cnn_map0_reg_2__7_ ( .D(N509), .CK(clk), .RN(rst_n), .Q(n881) );
  DFFRX4 img0_reg_14__6_ ( .D(N337), .CK(clk), .RN(rst_n), .Q(n1163) );
  DFFRX4 img0_reg_14__1_ ( .D(N332), .CK(clk), .RN(rst_n), .Q(n1171) );
  DFFRX4 cnn_map0_reg_7__5_ ( .D(N557), .CK(clk), .RN(rst_n), .Q(n1834), .QN(
        n746) );
  DFFRHQXL kernel_reg_1__1__3_ ( .D(N424), .CK(clk), .RN(rst_n), .Q(kernel[19]) );
  DFFRHQX1 cnn_map0_reg_6__3_ ( .D(N545), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[32]) );
  DFFRHQXL img0_reg_7__6_ ( .D(N267), .CK(clk), .RN(rst_n), .Q(img0[22]) );
  DFFRX1 img0_reg_8__7_ ( .D(N278), .CK(clk), .RN(rst_n), .Q(img0[31]) );
  DFFRX1 img0_reg_8__5_ ( .D(N276), .CK(clk), .RN(rst_n), .Q(img0[29]) );
  DFFRX2 img0_reg_8__4_ ( .D(N275), .CK(clk), .RN(rst_n), .Q(img0[28]) );
  DFFRX2 img0_reg_8__3_ ( .D(N274), .CK(clk), .RN(rst_n), .Q(img0[27]) );
  DFFRX2 img0_reg_8__2_ ( .D(N273), .CK(clk), .RN(rst_n), .Q(img0[26]) );
  DFFRX1 img0_reg_8__1_ ( .D(N272), .CK(clk), .RN(rst_n), .Q(img0[25]) );
  DFFRX2 img0_reg_8__0_ ( .D(N271), .CK(clk), .RN(rst_n), .Q(img0[24]) );
  DFFRX1 img0_reg_8__6_ ( .D(N277), .CK(clk), .RN(rst_n), .Q(img0[30]) );
  DFFRX1 img0_reg_12__7_ ( .D(N318), .CK(clk), .RN(rst_n), .Q(img0[39]) );
  DFFRX1 img0_reg_6__7_ ( .D(N258), .CK(clk), .RN(rst_n), .Q(img0[15]) );
  DFFRX1 img0_reg_12__6_ ( .D(N317), .CK(clk), .RN(rst_n), .Q(img0[38]) );
  DFFRX2 img0_reg_6__6_ ( .D(N257), .CK(clk), .RN(rst_n), .Q(img0[14]) );
  DFFRX1 img0_reg_12__5_ ( .D(N316), .CK(clk), .RN(rst_n), .Q(img0[37]) );
  DFFRX1 img0_reg_6__5_ ( .D(N256), .CK(clk), .RN(rst_n), .Q(img0[13]) );
  DFFRX2 img0_reg_6__4_ ( .D(N255), .CK(clk), .RN(rst_n), .Q(img0[12]) );
  DFFRX1 img0_reg_12__3_ ( .D(N314), .CK(clk), .RN(rst_n), .Q(img0[35]) );
  DFFRX2 img0_reg_6__3_ ( .D(N254), .CK(clk), .RN(rst_n), .Q(img0[11]) );
  DFFRX1 img0_reg_12__2_ ( .D(N313), .CK(clk), .RN(rst_n), .Q(img0[34]) );
  DFFRX1 img0_reg_12__1_ ( .D(N312), .CK(clk), .RN(rst_n), .Q(img0[33]) );
  DFFRX2 img0_reg_6__1_ ( .D(N252), .CK(clk), .RN(rst_n), .Q(img0[9]) );
  DFFRX1 img0_reg_12__0_ ( .D(N311), .CK(clk), .RN(rst_n), .Q(img0[32]) );
  DFFRX2 img0_reg_6__0_ ( .D(N251), .CK(clk), .RN(rst_n), .Q(img0[8]) );
  DFFRX1 img0_reg_2__6_ ( .D(N217), .CK(clk), .RN(rst_n), .Q(img0[6]) );
  DFFRX1 img0_reg_2__7_ ( .D(N218), .CK(clk), .RN(rst_n), .Q(img0[7]) );
  DFFRX1 img0_reg_2__1_ ( .D(N212), .CK(clk), .RN(rst_n), .Q(img0[1]) );
  DFFRX1 img0_reg_2__0_ ( .D(N211), .CK(clk), .RN(rst_n), .Q(img0[0]) );
  DFFRX1 img0_reg_2__5_ ( .D(N216), .CK(clk), .RN(rst_n), .Q(img0[5]) );
  DFFRX1 img0_reg_2__4_ ( .D(N215), .CK(clk), .RN(rst_n), .Q(img0[4]) );
  DFFRX1 img0_reg_2__3_ ( .D(N214), .CK(clk), .RN(rst_n), .Q(img0[3]) );
  DFFRX1 img0_reg_2__2_ ( .D(N213), .CK(clk), .RN(rst_n), .Q(img0[2]) );
  DFFRHQX2 cnn_map0_reg_6__4_ ( .D(N546), .CK(clk), .RN(rst_n), .Q(n886) );
  DFFRHQX2 cnn_map0_reg_6__7_ ( .D(N549), .CK(clk), .RN(rst_n), .Q(n897) );
  DFFRHQX1 cnn_map0_reg_4__2_ ( .D(N524), .CK(clk), .RN(rst_n), .Q(n893) );
  DFFRX2 cnn_map0_reg_2__2_ ( .D(N504), .CK(clk), .RN(rst_n), .Q(n854), .QN(
        n709) );
  DFFRX1 img0_reg_7__2_ ( .D(N263), .CK(clk), .RN(rst_n), .Q(img0[18]) );
  DFFRX1 img0_reg_12__4_ ( .D(N315), .CK(clk), .RN(rst_n), .Q(img0[36]) );
  DFFRX1 img0_reg_7__7_ ( .D(N268), .CK(clk), .RN(rst_n), .Q(img0[23]) );
  DFFRX1 img0_reg_7__5_ ( .D(N266), .CK(clk), .RN(rst_n), .Q(img0[21]) );
  DFFRX1 img0_reg_7__4_ ( .D(N265), .CK(clk), .RN(rst_n), .Q(img0[20]) );
  DFFRX1 img0_reg_7__3_ ( .D(N264), .CK(clk), .RN(rst_n), .Q(img0[19]) );
  DFFRX1 img0_reg_7__1_ ( .D(N262), .CK(clk), .RN(rst_n), .Q(img0[17]) );
  DFFRX1 img0_reg_7__0_ ( .D(N261), .CK(clk), .RN(rst_n), .Q(img0[16]) );
  DFFRX1 cnn_map0_reg_6__0_ ( .D(N542), .CK(clk), .RN(rst_n), .Q(cnn_map0[30]), 
        .QN(n743) );
  DFFRX1 cnn_map0_reg_2__0_ ( .D(N502), .CK(clk), .RN(rst_n), .Q(cnn_map0[11]), 
        .QN(n853) );
  DFFRHQX1 current_state_reg_1_ ( .D(n2140), .CK(clk), .RN(rst_n), .Q(
        current_state[1]) );
  DFFRHQX1 current_state_reg_2_ ( .D(n2141), .CK(clk), .RN(rst_n), .Q(
        current_state[2]) );
  DFFRHQX1 current_state_reg_0_ ( .D(next_state_0_), .CK(clk), .RN(rst_n), .Q(
        current_state[0]) );
  DFFRHQX1 kernel_reg_0__2__7_ ( .D(N408), .CK(clk), .RN(rst_n), .Q(kernel[7])
         );
  DFFRHQX1 kernel_reg_0__2__6_ ( .D(N407), .CK(clk), .RN(rst_n), .Q(kernel[6])
         );
  DFFRHQX1 kernel_reg_0__2__5_ ( .D(N406), .CK(clk), .RN(rst_n), .Q(kernel[5])
         );
  DFFRHQX1 kernel_reg_0__2__4_ ( .D(N405), .CK(clk), .RN(rst_n), .Q(kernel[4])
         );
  DFFRHQX1 kernel_reg_0__2__3_ ( .D(N404), .CK(clk), .RN(rst_n), .Q(kernel[3])
         );
  DFFRHQX1 kernel_reg_0__2__2_ ( .D(N403), .CK(clk), .RN(rst_n), .Q(kernel[2])
         );
  DFFRHQX1 kernel_reg_0__2__1_ ( .D(N402), .CK(clk), .RN(rst_n), .Q(kernel[1])
         );
  DFFRHQX1 kernel_reg_0__2__0_ ( .D(N401), .CK(clk), .RN(rst_n), .Q(kernel[0])
         );
  DFFRHQX1 kernel_reg_1__0__7_ ( .D(N418), .CK(clk), .RN(rst_n), .Q(kernel[15]) );
  DFFRHQX1 kernel_reg_1__0__6_ ( .D(N417), .CK(clk), .RN(rst_n), .Q(kernel[14]) );
  DFFRHQX1 kernel_reg_1__0__5_ ( .D(N416), .CK(clk), .RN(rst_n), .Q(kernel[13]) );
  DFFRHQX1 kernel_reg_1__0__4_ ( .D(N415), .CK(clk), .RN(rst_n), .Q(kernel[12]) );
  DFFRHQX2 kernel_reg_1__0__3_ ( .D(N414), .CK(clk), .RN(rst_n), .Q(kernel[11]) );
  DFFRHQX2 kernel_reg_1__0__2_ ( .D(N413), .CK(clk), .RN(rst_n), .Q(kernel[10]) );
  DFFRHQX2 kernel_reg_1__0__1_ ( .D(N412), .CK(clk), .RN(rst_n), .Q(kernel[9])
         );
  DFFRHQX1 kernel_reg_1__0__0_ ( .D(N411), .CK(clk), .RN(rst_n), .Q(kernel[8])
         );
  DFFRHQX1 kernel_reg_1__1__7_ ( .D(N428), .CK(clk), .RN(rst_n), .Q(kernel[23]) );
  DFFRHQX1 kernel_reg_1__1__6_ ( .D(N427), .CK(clk), .RN(rst_n), .Q(kernel[22]) );
  DFFRHQX1 kernel_reg_1__1__5_ ( .D(N426), .CK(clk), .RN(rst_n), .Q(kernel[21]) );
  DFFRHQX1 kernel_reg_1__1__4_ ( .D(N425), .CK(clk), .RN(rst_n), .Q(kernel[20]) );
  DFFRHQX1 kernel_reg_1__1__2_ ( .D(N423), .CK(clk), .RN(rst_n), .Q(kernel[18]) );
  DFFRHQX1 kernel_reg_1__1__0_ ( .D(N421), .CK(clk), .RN(rst_n), .Q(kernel[16]) );
  DFFRHQX1 kernel_reg_1__2__7_ ( .D(N438), .CK(clk), .RN(rst_n), .Q(kernel[31]) );
  DFFRHQX1 kernel_reg_1__2__6_ ( .D(N437), .CK(clk), .RN(rst_n), .Q(kernel[30]) );
  DFFRHQX1 kernel_reg_1__2__5_ ( .D(N436), .CK(clk), .RN(rst_n), .Q(kernel[29]) );
  DFFRHQX1 kernel_reg_1__2__4_ ( .D(N435), .CK(clk), .RN(rst_n), .Q(kernel[28]) );
  DFFRHQX1 kernel_reg_1__2__3_ ( .D(N434), .CK(clk), .RN(rst_n), .Q(kernel[27]) );
  DFFRHQX1 kernel_reg_1__2__2_ ( .D(N433), .CK(clk), .RN(rst_n), .Q(kernel[26]) );
  DFFRHQX1 kernel_reg_1__2__1_ ( .D(N432), .CK(clk), .RN(rst_n), .Q(kernel[25]) );
  DFFRHQX1 kernel_reg_1__2__0_ ( .D(N431), .CK(clk), .RN(rst_n), .Q(kernel[24]) );
  DFFRHQX1 kernel_reg_2__0__7_ ( .D(N448), .CK(clk), .RN(rst_n), .Q(kernel[39]) );
  DFFRHQX1 kernel_reg_2__0__6_ ( .D(N447), .CK(clk), .RN(rst_n), .Q(kernel[38]) );
  DFFRHQX1 kernel_reg_2__0__5_ ( .D(N446), .CK(clk), .RN(rst_n), .Q(kernel[37]) );
  DFFRHQX1 kernel_reg_2__0__4_ ( .D(N445), .CK(clk), .RN(rst_n), .Q(kernel[36]) );
  DFFRHQX1 kernel_reg_2__0__3_ ( .D(N444), .CK(clk), .RN(rst_n), .Q(kernel[35]) );
  DFFRHQX1 kernel_reg_2__0__2_ ( .D(N443), .CK(clk), .RN(rst_n), .Q(kernel[34]) );
  DFFRHQX1 kernel_reg_2__0__1_ ( .D(N442), .CK(clk), .RN(rst_n), .Q(kernel[33]) );
  DFFRHQX1 kernel_reg_2__0__0_ ( .D(N441), .CK(clk), .RN(rst_n), .Q(kernel[32]) );
  DFFRHQX2 kernel_reg_2__1__7_ ( .D(N458), .CK(clk), .RN(rst_n), .Q(kernel[47]) );
  DFFRHQX2 kernel_reg_2__1__6_ ( .D(N457), .CK(clk), .RN(rst_n), .Q(kernel[46]) );
  DFFRHQX2 kernel_reg_2__1__5_ ( .D(N456), .CK(clk), .RN(rst_n), .Q(kernel[45]) );
  DFFRHQX2 kernel_reg_2__1__0_ ( .D(N451), .CK(clk), .RN(rst_n), .Q(kernel[40]) );
  DFFRX2 cnn_map0_reg_6__6_ ( .D(N548), .CK(clk), .RN(rst_n), .Q(cnn_map0[34]), 
        .QN(n737) );
  DFFRHQX2 cnn_map0_reg_0__3_ ( .D(N485), .CK(clk), .RN(rst_n), .Q(cnn_map0[3]) );
  DFFRHQX2 cnn_map0_reg_0__2_ ( .D(N484), .CK(clk), .RN(rst_n), .Q(cnn_map0[2]) );
  DFFRX2 cnn_map0_reg_2__1_ ( .D(N503), .CK(clk), .RN(rst_n), .QN(n710) );
  DFFRX1 kernel_reg_1__1__1_ ( .D(N422), .CK(clk), .RN(rst_n), .Q(kernel[17])
         );
  DFFRX2 cnn_map0_reg_0__1_ ( .D(N483), .CK(clk), .RN(rst_n), .Q(cnn_map0[1]), 
        .QN(n1221) );
  DFFRHQX2 cnn_map0_reg_4__4_ ( .D(N526), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[25]) );
  DFFRHQX2 cnn_map0_reg_1__4_ ( .D(N496), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[10]) );
  DFFRHQX1 cnn_map0_reg_7__3_ ( .D(N555), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[37]) );
  DFFRHQX2 cnn_map0_reg_7__4_ ( .D(N556), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[38]) );
  DFFRHQX2 cnn_map0_reg_7__6_ ( .D(N558), .CK(clk), .RN(rst_n), .Q(
        cnn_map0[39]) );
  DFFRHQX2 cnn_map0_reg_5__4_ ( .D(N536), .CK(clk), .RN(rst_n), .Q(n913) );
  DFFRHQX2 cnn_map0_reg_5__1_ ( .D(N533), .CK(clk), .RN(rst_n), .Q(n911) );
  DFFRHQX2 cnn_map0_reg_1__2_ ( .D(N494), .CK(clk), .RN(rst_n), .Q(n910) );
  DFFRHQX2 cnn_map0_reg_5__2_ ( .D(N534), .CK(clk), .RN(rst_n), .Q(n903) );
  DFFRX1 cnn_map0_reg_4__0_ ( .D(N522), .CK(clk), .RN(rst_n), .Q(cnn_map0[23]), 
        .QN(n727) );
  DFFRHQX2 cnn_map0_reg_1__3_ ( .D(N495), .CK(clk), .RN(rst_n), .Q(n894) );
  DFFRX1 cnn_map0_reg_0__0_ ( .D(N482), .CK(clk), .RN(rst_n), .Q(cnn_map0[0]), 
        .QN(n1220) );
  DFFRHQX2 cnn_map0_reg_1__7_ ( .D(N499), .CK(clk), .RN(rst_n), .Q(n892) );
  DFFRHQX2 img0_reg_14__4_ ( .D(N335), .CK(clk), .RN(rst_n), .Q(n888) );
  DFFRX2 cnn_map0_reg_4__1_ ( .D(N523), .CK(clk), .RN(rst_n), .Q(n1720), .QN(
        n726) );
  DFFRX1 img0_reg_1__7_ ( .D(N208), .CK(clk), .RN(rst_n), .Q(n1825) );
  DFFRHQX1 cnn_map0_reg_3__5_ ( .D(N517), .CK(clk), .RN(rst_n), .Q(n891) );
  DFFRX1 cnn_map0_reg_6__1_ ( .D(N543), .CK(clk), .RN(rst_n), .Q(cnn_map0[31]), 
        .QN(n858) );
  DFFRX4 img0_reg_13__6_ ( .D(N327), .CK(clk), .RN(rst_n), .Q(img0[46]) );
  DFFRHQX4 cnn_map0_reg_0__5_ ( .D(N487), .CK(clk), .RN(rst_n), .Q(cnn_map0[5]) );
  DFFRX2 cnn_map0_reg_6__2_ ( .D(N544), .CK(clk), .RN(rst_n), .Q(n862), .QN(
        n741) );
  DFFRX4 cnn_map0_reg_3__7_ ( .D(N519), .CK(clk), .RN(rst_n), .Q(cnn_map0[22]), 
        .QN(n712) );
  DFFRX2 cnn_map0_reg_3__6_ ( .D(N518), .CK(clk), .RN(rst_n), .Q(cnn_map0[21]), 
        .QN(n861) );
  DFFRX2 cnn_map0_reg_2__6_ ( .D(N508), .CK(clk), .RN(rst_n), .Q(cnn_map0[15]), 
        .QN(n705) );
  AND3XL U892 ( .A(n1117), .B(n1905), .C(div_631_u_div_SumTmp_6__3__9_), .Y(
        n873) );
  NAND2X2 U893 ( .A(n1361), .B(n1117), .Y(n1371) );
  OR2X4 U894 ( .A(n1117), .B(n1309), .Y(n1302) );
  INVX8 U895 ( .A(n1828), .Y(n1883) );
  INVX1 U896 ( .A(n1459), .Y(n1083) );
  OAI2BB1X1 U897 ( .A0N(div_631_u_div_SumTmp_3__2__3_), .A1N(n1478), .B0(n1477), .Y(n1479) );
  OAI33X2 U898 ( .A0(n801), .A1(n849), .A2(n802), .B0(n803), .B1(n804), .B2(
        n1481), .Y(n800) );
  CLKINVX20 U899 ( .A(div_631_u_div_CryOut_3__2_), .Y(n801) );
  CLKINVX20 U900 ( .A(div_631_u_div_SumTmp_3__2__2_), .Y(n802) );
  CLKINVX20 U901 ( .A(div_631_u_div_SumTmp_5__2__2_), .Y(n803) );
  CLKINVX20 U902 ( .A(div_631_u_div_CryOut_5__2_), .Y(n804) );
  INVX2 U903 ( .A(n1989), .Y(n805) );
  OR3X4 U904 ( .A(n1530), .B(n949), .C(n1499), .Y(n806) );
  OR2X4 U905 ( .A(n1498), .B(n806), .Y(n1621) );
  AND3X4 U906 ( .A(n1494), .B(n1510), .C(div_631_u_div_SumTmp_1__2__1_), .Y(
        n949) );
  INVX2 U907 ( .A(n1526), .Y(n1499) );
  NAND2X1 U908 ( .A(n1716), .B(n807), .Y(n808) );
  NAND2X1 U909 ( .A(n903), .B(n1012), .Y(n809) );
  NAND2X1 U910 ( .A(n808), .B(n809), .Y(n1771) );
  INVX1 U911 ( .A(n1012), .Y(n807) );
  MX2X4 U912 ( .A(n1772), .B(n1771), .S0(n1764), .Y(n1930) );
  OR2X1 U913 ( .A(n1287), .B(n1286), .Y(n810) );
  NAND2X1 U914 ( .A(n810), .B(n1285), .Y(n1379) );
  AOI33XL U915 ( .A0(n1254), .A1(n876), .A2(n1284), .B0(
        div_631_u_div_SumTmp_2__3__5_), .B1(n1282), .B2(n1316), .Y(n1285) );
  OR2X2 U916 ( .A(n1374), .B(n985), .Y(n811) );
  OR3X4 U917 ( .A(n1347), .B(n995), .C(n811), .Y(n2039) );
  NAND3X1 U918 ( .A(n1101), .B(div_631_u_div_SumTmp_2__3__0_), .C(n879), .Y(
        n812) );
  NAND2X2 U919 ( .A(n813), .B(n1316), .Y(n1354) );
  INVX2 U920 ( .A(n812), .Y(n813) );
  INVX1 U921 ( .A(n1114), .Y(n879) );
  INVX2 U922 ( .A(n1354), .Y(n1355) );
  NAND3XL U923 ( .A(div_631_u_div_SumTmp_2__3__7_), .B(n1101), .C(n1118), .Y(
        n814) );
  NAND2XL U924 ( .A(n815), .B(n1316), .Y(n1274) );
  INVX1 U925 ( .A(n814), .Y(n815) );
  INVX2 U926 ( .A(n1114), .Y(n1118) );
  OR2XL U927 ( .A(n1353), .B(div_631_u_div_CryOut_6__3_), .Y(n816) );
  NAND2X1 U928 ( .A(n816), .B(n1354), .Y(n1387) );
  OR4X1 U929 ( .A(n984), .B(n983), .C(n1387), .D(n1386), .Y(
        div_631_u_div_PartRem_3__3_) );
  NAND2XL U930 ( .A(add_2_result[12]), .B(n817), .Y(n818) );
  NAND2X2 U931 ( .A(add_9_result[12]), .B(n1132), .Y(n819) );
  NAND2X4 U932 ( .A(n818), .B(n819), .Y(ratio_a[12]) );
  CLKINVXL U933 ( .A(n1132), .Y(n817) );
  INVX4 U934 ( .A(ratio_a[12]), .Y(n1256) );
  AND2X2 U935 ( .A(n1727), .B(n1726), .Y(n820) );
  AND2X1 U936 ( .A(n1725), .B(n1772), .Y(n821) );
  NOR3X2 U937 ( .A(n820), .B(n821), .C(n1724), .Y(n1733) );
  OR2X1 U938 ( .A(n1723), .B(n1777), .Y(n1727) );
  CLKINVX2 U939 ( .A(n1771), .Y(n1725) );
  MX2X1 U940 ( .A(cnn_map0[2]), .B(n910), .S0(n1017), .Y(n1772) );
  OAI2BB1X4 U941 ( .A0N(n1777), .A1N(n1723), .B0(n1722), .Y(n1724) );
  NAND2XL U942 ( .A(add_2_result[9]), .B(n822), .Y(n823) );
  NAND2X2 U943 ( .A(add_9_result[9]), .B(n1132), .Y(n824) );
  NAND2X4 U944 ( .A(n823), .B(n824), .Y(ratio_a[9]) );
  CLKINVXL U945 ( .A(n1132), .Y(n822) );
  NAND2XL U946 ( .A(n1750), .B(n825), .Y(n826) );
  NAND2XL U947 ( .A(n1751), .B(n1013), .Y(n827) );
  NAND2X1 U948 ( .A(n826), .B(n827), .Y(n1924) );
  INVX1 U949 ( .A(n1013), .Y(n825) );
  MX2X1 U950 ( .A(n917), .B(n908), .S0(n1012), .Y(n1750) );
  NAND2X1 U951 ( .A(n1755), .B(n1756), .Y(n1013) );
  MX2X1 U952 ( .A(n1924), .B(n1923), .S0(n1131), .Y(nn_a[5]) );
  NAND2X2 U953 ( .A(n1924), .B(n828), .Y(n829) );
  NAND2X4 U954 ( .A(n1752), .B(n1132), .Y(n830) );
  NAND2X4 U955 ( .A(n829), .B(n830), .Y(mult_a_0__5_) );
  CLKINVX2 U956 ( .A(n1132), .Y(n828) );
  OR2X1 U957 ( .A(cnn_map0[15]), .B(n861), .Y(n831) );
  OR2X1 U958 ( .A(n881), .B(n712), .Y(n832) );
  NAND3X2 U959 ( .A(n831), .B(n832), .C(n1804), .Y(n1805) );
  OR2X1 U960 ( .A(cnn_map0[37]), .B(n1808), .Y(n833) );
  OR2X2 U961 ( .A(n914), .B(n741), .Y(n834) );
  OR2X2 U962 ( .A(cnn_map0[36]), .B(n858), .Y(n835) );
  NAND3X2 U963 ( .A(n833), .B(n834), .C(n835), .Y(n1815) );
  OR2X1 U964 ( .A(n987), .B(n997), .Y(n836) );
  OR2X1 U965 ( .A(n1352), .B(n836), .Y(n2083) );
  AND4X2 U966 ( .A(div_631_u_div_SumTmp_3__3__1_), .B(n1257), .C(
        div_631_u_div_CryOut_3__3_), .D(n1101), .Y(n997) );
  NAND2XL U967 ( .A(div_631_u_div_SumTmp_2__3__2_), .B(n1101), .Y(n837) );
  NAND3X1 U968 ( .A(n1118), .B(n838), .C(n1316), .Y(n1345) );
  INVX2 U969 ( .A(n837), .Y(n838) );
  BUFX12 U970 ( .A(div_631_u_div_CryOut_2__3_), .Y(n1101) );
  OR2X1 U971 ( .A(n1361), .B(n1360), .Y(n839) );
  OR2X2 U972 ( .A(n1358), .B(n1359), .Y(n840) );
  NAND3X1 U973 ( .A(n839), .B(n840), .C(n1357), .Y(n1362) );
  OAI22X1 U974 ( .A0(n1361), .A1(n1355), .B0(n1356), .B1(n1355), .Y(n1357) );
  NOR2XL U975 ( .A(cnn_map0[5]), .B(n1236), .Y(n841) );
  NOR2XL U976 ( .A(cnn_map0[4]), .B(n1224), .Y(n842) );
  OR2X2 U977 ( .A(n841), .B(n842), .Y(n1225) );
  CLKINVXL U978 ( .A(cnn_map0[10]), .Y(n1224) );
  AND2X4 U979 ( .A(div_631_u_div_SumTmp_7__2__8_), .B(n1545), .Y(n843) );
  AND2X2 U980 ( .A(div_631_u_div_SumTmp_1__2__8_), .B(n980), .Y(n844) );
  NOR3X4 U981 ( .A(n843), .B(n844), .C(n1441), .Y(n1442) );
  OR2XL U982 ( .A(n1429), .B(n1414), .Y(n845) );
  OR2X1 U983 ( .A(n1462), .B(n1413), .Y(n846) );
  NAND3X2 U984 ( .A(n845), .B(n846), .C(n1412), .Y(
        div_631_u_div_PartRem_2__14_) );
  INVX2 U985 ( .A(n1100), .Y(n1099) );
  NAND2X1 U986 ( .A(n896), .B(n928), .Y(n929) );
  AOI221X2 U987 ( .A0(cnn_map0[21]), .A1(n705), .B0(cnn_map0[22]), .B1(n1807), 
        .C0(n1795), .Y(n1798) );
  AOI221X2 U988 ( .A0(n915), .A1(n1226), .B0(n892), .B1(n1242), .C0(n1225), 
        .Y(n1230) );
  MX2X4 U989 ( .A(cnn_map0[34]), .B(cnn_map0[39]), .S0(n1009), .Y(n1841) );
  INVX2 U990 ( .A(cnn_map0[12]), .Y(n1794) );
  MX2X4 U991 ( .A(n1097), .B(n1886), .S0(n1132), .Y(mult_a_1__0_) );
  MXI2X2 U992 ( .A(n1884), .B(n1885), .S0(n1875), .Y(n1097) );
  OR2X2 U993 ( .A(n1540), .B(n975), .Y(n2059) );
  OR2X2 U994 ( .A(n1010), .B(n1958), .Y(n1838) );
  OR4X2 U995 ( .A(n1387), .B(n1386), .C(n984), .D(n983), .Y(n2057) );
  CLKINVXL U996 ( .A(n1018), .Y(n928) );
  CLKINVX8 U997 ( .A(n1248), .Y(n2092) );
  INVX4 U998 ( .A(n1817), .Y(n1833) );
  OR2X2 U999 ( .A(n1699), .B(n969), .Y(n2013) );
  INVX2 U1000 ( .A(n1536), .Y(n1546) );
  INVX2 U1001 ( .A(n1002), .Y(n889) );
  INVX2 U1002 ( .A(div_631_u_div_CryOut_1__3_), .Y(n1306) );
  OR2X2 U1003 ( .A(n991), .B(n1080), .Y(n2046) );
  OR2X1 U1004 ( .A(n1080), .B(n991), .Y(n2022) );
  OR2X2 U1005 ( .A(n1552), .B(n991), .Y(n2056) );
  INVX2 U1006 ( .A(n1000), .Y(n924) );
  OR2X2 U1007 ( .A(n1989), .B(n1433), .Y(n934) );
  AOI221X4 U1008 ( .A0(div_631_u_div_SumTmp_4__2__9_), .A1(n1474), .B0(
        div_631_u_div_SumTmp_6__2__9_), .B1(n1081), .C0(n1428), .Y(n1433) );
  INVX3 U1009 ( .A(n1623), .Y(n1989) );
  OR2X4 U1010 ( .A(n1103), .B(n1506), .Y(n1511) );
  NOR3X4 U1011 ( .A(n926), .B(n927), .C(n1484), .Y(n1524) );
  OAI2BB1X2 U1012 ( .A0N(div_631_u_div_SumTmp_2__2__2_), .A1N(n850), .B0(n1483), .Y(n1484) );
  NOR2BX2 U1013 ( .AN(div_631_u_div_CryOut_1__3_), .B(n887), .Y(n880) );
  NAND2X2 U1014 ( .A(n1844), .B(n1843), .Y(n1005) );
  CLKINVXL U1015 ( .A(n877), .Y(n2089) );
  OR4X1 U1016 ( .A(n1101), .B(div_631_u_div_CryOut_1__3_), .C(n877), .D(n1117), 
        .Y(n1290) );
  NOR2XL U1017 ( .A(div_631_u_div_CryOut_6__1_), .B(n1655), .Y(n966) );
  NOR2XL U1018 ( .A(div_631_u_div_CryOut_6__1_), .B(n1655), .Y(n965) );
  INVX2 U1019 ( .A(n1739), .Y(n1711) );
  OR2X2 U1020 ( .A(n1366), .B(n1082), .Y(n2064) );
  OR2X4 U1021 ( .A(n869), .B(n1520), .Y(n2043) );
  INVX2 U1022 ( .A(n1906), .Y(n876) );
  OR4XL U1023 ( .A(n1101), .B(n1248), .C(n1117), .D(n1906), .Y(n1269) );
  NAND2X2 U1024 ( .A(n1247), .B(add_9_result[17]), .Y(n1248) );
  OR4X2 U1025 ( .A(div_631_u_div_CryOut_2__0_), .B(n1911), .C(n1992), .D(
        ratio_result_cnn[2]), .Y(n1702) );
  AOI211X2 U1026 ( .A0(cnn_map0[9]), .A1(n1221), .B0(cnn_map0[8]), .C0(n1220), 
        .Y(n1232) );
  INVX3 U1027 ( .A(n1294), .Y(n1282) );
  INVX1 U1028 ( .A(n940), .Y(n1420) );
  INVX4 U1029 ( .A(n1215), .Y(n1714) );
  OR4X4 U1030 ( .A(n1911), .B(n1705), .C(div_631_u_div_CryOut_6__0_), .D(n1700), .Y(n1701) );
  OAI211X2 U1031 ( .A0(n751), .A1(n1703), .B0(n1702), .C0(n1701), .Y(n1708) );
  INVX3 U1032 ( .A(n1339), .Y(n1367) );
  OAI31X4 U1033 ( .A0(n1996), .A1(ratio_result_cnn[2]), .A2(n1995), .B0(n1991), 
        .Y(n624) );
  OR4X1 U1034 ( .A(n1105), .B(n1995), .C(ratio_result_cnn[2]), .D(n1994), .Y(
        n1706) );
  OR4XL U1035 ( .A(div_631_u_div_CryOut_2__0_), .B(n1996), .C(n1992), .D(
        ratio_result_cnn[2]), .Y(n2003) );
  AND2X2 U1036 ( .A(div_631_u_div_CryOut_5__2_), .B(n1103), .Y(n1389) );
  NAND2X4 U1037 ( .A(n900), .B(n1715), .Y(n1205) );
  NAND2BXL U1038 ( .AN(n948), .B(n1517), .Y(n1550) );
  AOI221X1 U1039 ( .A0(div_631_u_div_SumTmp_6__1__7_), .A1(n1637), .B0(
        div_631_u_div_SumTmp_4__1__7_), .B1(n965), .C0(n1593), .Y(n1598) );
  INVX3 U1040 ( .A(n1630), .Y(n1637) );
  OR2XL U1041 ( .A(n1363), .B(n1364), .Y(n2077) );
  OR2X4 U1042 ( .A(n1364), .B(n1363), .Y(n2028) );
  INVX3 U1043 ( .A(n1462), .Y(n1478) );
  OAI2BB2X2 U1044 ( .B0(cnn_map0[14]), .B1(n1803), .A0N(n707), .A1N(
        cnn_map0[20]), .Y(n1795) );
  AOI22X2 U1045 ( .A0(cnn_map0[14]), .A1(n1803), .B0(n715), .B1(cnn_map0[13]), 
        .Y(n1802) );
  INVX3 U1046 ( .A(n1429), .Y(n1446) );
  INVX1 U1047 ( .A(n1341), .Y(n847) );
  CLKINVX2 U1048 ( .A(n847), .Y(n848) );
  MXI2X4 U1049 ( .A(n907), .B(n2127), .S0(n1247), .Y(mult_a_1__5_) );
  INVX3 U1050 ( .A(n1481), .Y(n1487) );
  OR4X4 U1051 ( .A(n1342), .B(n848), .C(n1303), .D(n1339), .Y(n2060) );
  OR3X4 U1052 ( .A(n1655), .B(n1578), .C(div_631_u_div_CryOut_6__1_), .Y(n1573) );
  CLKINVX2 U1053 ( .A(n988), .Y(n849) );
  INVX3 U1054 ( .A(n849), .Y(n850) );
  NOR2XL U1055 ( .A(n1103), .B(n1507), .Y(n988) );
  OAI211X1 U1056 ( .A0(n1516), .A1(n1515), .B0(n1514), .C0(n1513), .Y(n1517)
         );
  AOI221X1 U1057 ( .A0(div_631_u_div_SumTmp_6__2__7_), .A1(n1081), .B0(
        div_631_u_div_SumTmp_4__2__7_), .B1(n1474), .C0(n1444), .Y(n1445) );
  INVX3 U1058 ( .A(n1405), .Y(n1474) );
  OR2X2 U1059 ( .A(n1378), .B(n1377), .Y(div_631_u_div_PartRem_3__9_) );
  INVXL U1060 ( .A(n1594), .Y(n1595) );
  CLKINVX4 U1061 ( .A(n877), .Y(n2090) );
  OAI31X1 U1062 ( .A0(n1535), .A1(n1534), .A2(n1533), .B0(n1532), .Y(n1536) );
  OR2X2 U1063 ( .A(n1523), .B(n1522), .Y(n1532) );
  MXI2X2 U1064 ( .A(add_2_result[14]), .B(add_9_result[14]), .S0(n1132), .Y(
        n996) );
  AOI221X2 U1065 ( .A0(n1512), .A1(n1511), .B0(div_631_u_div_CryOut_5__2_), 
        .B1(n1103), .C0(n1510), .Y(n1513) );
  OAI211X1 U1066 ( .A0(n1493), .A1(n1492), .B0(n1531), .C0(n1491), .Y(n1624)
         );
  NAND3X2 U1067 ( .A(div_631_u_div_SumTmp_3__3__3_), .B(n1119), .C(n1344), .Y(
        n1300) );
  NOR3X2 U1068 ( .A(n1316), .B(n1280), .C(n1294), .Y(n1332) );
  OR2X4 U1069 ( .A(n1116), .B(n1309), .Y(n1294) );
  OAI2BB1X2 U1070 ( .A0N(div_631_u_div_SumTmp_1__1__10_), .A1N(n1656), .B0(
        n1563), .Y(n1683) );
  AOI33X1 U1071 ( .A0(n979), .A1(n1657), .A2(div_631_u_div_SumTmp_5__1__10_), 
        .B0(div_631_u_div_SumTmp_7__1__10_), .B1(n1102), .B2(n1562), .Y(n1563)
         );
  NOR2X2 U1072 ( .A(n1990), .B(n1638), .Y(n946) );
  OAI2BB1X2 U1073 ( .A0N(div_631_u_div_SumTmp_5__2__7_), .A1N(n963), .B0(n1447), .Y(n1520) );
  OAI211X1 U1074 ( .A0(n1905), .A1(n1265), .B0(n1264), .C0(n1263), .Y(n1322)
         );
  AND2X2 U1075 ( .A(div_631_u_div_CryOut_6__1_), .B(div_631_u_div_CryOut_7__1_), .Y(n1562) );
  NOR2X2 U1076 ( .A(n1655), .B(n1578), .Y(n979) );
  BUFX3 U1077 ( .A(n957), .Y(n851) );
  NOR2XL U1078 ( .A(n1523), .B(n1522), .Y(n957) );
  OAI222X2 U1079 ( .A0(cnn_map0[19]), .A1(n1794), .B0(cnn_map0[18]), .B1(n709), 
        .C0(cnn_map0[17]), .C1(n710), .Y(n1799) );
  AOI222X1 U1080 ( .A0(div_631_u_div_SumTmp_5__2__11_), .A1(n963), .B0(n1411), 
        .B1(n805), .C0(div_631_u_div_SumTmp_7__2__11_), .C1(n1545), .Y(n1412)
         );
  OAI31X2 U1081 ( .A0(n1510), .A1(n1420), .A2(n1389), .B0(n1388), .Y(n1623) );
  OAI32X2 U1082 ( .A0(div_631_u_div_CryOut_3__3_), .A1(n1302), .A2(n1301), 
        .B0(n1300), .B1(n1316), .Y(n1339) );
  OAI2BB1X1 U1083 ( .A0N(div_631_u_div_CryOut_3__1_), .A1N(n1664), .B0(n1596), 
        .Y(n1584) );
  AND4X1 U1084 ( .A(div_631_u_div_CryOut_3__1_), .B(n1655), .C(
        div_631_u_div_SumTmp_3__1__2_), .D(n1646), .Y(n981) );
  INVX4 U1085 ( .A(div_631_u_div_CryOut_3__1_), .Y(n1599) );
  OR2X2 U1086 ( .A(n1336), .B(n1335), .Y(n2074) );
  OAI33X1 U1087 ( .A0(n1295), .A1(n1257), .A2(n1361), .B0(n1294), .B1(
        div_631_u_div_CryOut_3__3_), .B2(n1293), .Y(n1335) );
  INVX1 U1088 ( .A(n1522), .Y(n1388) );
  OAI222X2 U1089 ( .A0(n894), .A1(n1223), .B0(n910), .B1(n1222), .C0(
        cnn_map0[9]), .C1(n1221), .Y(n1231) );
  CLKINVXL U1090 ( .A(cnn_map0[2]), .Y(n1222) );
  INVX2 U1091 ( .A(n1256), .Y(n935) );
  OAI2BB1X2 U1092 ( .A0N(div_631_u_div_SumTmp_2__2__1_), .A1N(n850), .B0(n1490), .Y(n1535) );
  AND2X2 U1093 ( .A(div_631_u_div_SumTmp_1__3__1_), .B(n1906), .Y(n994) );
  NAND3XL U1094 ( .A(div_631_u_div_SumTmp_3__3__7_), .B(
        div_631_u_div_CryOut_3__3_), .C(n1282), .Y(n1325) );
  OR2X2 U1095 ( .A(n1273), .B(n1904), .Y(n1324) );
  INVX4 U1096 ( .A(n996), .Y(n1254) );
  OAI2BB1X1 U1097 ( .A0N(div_631_u_div_SumTmp_2__2__6_), .A1N(n850), .B0(n1449), .Y(n1450) );
  INVX2 U1098 ( .A(n1504), .Y(n1549) );
  OR2X1 U1099 ( .A(n1407), .B(n1485), .Y(n1408) );
  INVX2 U1100 ( .A(div_631_u_div_CryOut_5__2_), .Y(n1439) );
  OR2X2 U1101 ( .A(n1655), .B(n1657), .Y(n1630) );
  INVX4 U1102 ( .A(n1137), .Y(n1136) );
  NAND2XL U1103 ( .A(n1881), .B(n1132), .Y(n884) );
  NAND2X2 U1104 ( .A(n1091), .B(n882), .Y(n883) );
  INVX2 U1105 ( .A(div_631_u_div_SumTmp_4__3__2_), .Y(n925) );
  CLKINVX2 U1106 ( .A(n1256), .Y(n2088) );
  INVX2 U1107 ( .A(div_631_u_div_SumTmp_7__2__2_), .Y(n1486) );
  AND2X2 U1108 ( .A(div_631_u_div_SumTmp_6__2__2_), .B(n1079), .Y(n926) );
  NAND2X2 U1109 ( .A(n1321), .B(n1320), .Y(n1386) );
  NAND3XL U1110 ( .A(div_631_u_div_SumTmp_1__3__0_), .B(
        div_631_u_div_CryOut_1__3_), .C(n1319), .Y(n1320) );
  OR2X2 U1111 ( .A(n1376), .B(n1385), .Y(n2078) );
  NAND3XL U1112 ( .A(n1048), .B(n1350), .C(n1049), .Y(n1376) );
  OR2X2 U1113 ( .A(n1521), .B(n960), .Y(div_631_u_div_PartRem_2__9_) );
  OR3X2 U1114 ( .A(n964), .B(n1330), .C(n1272), .Y(n2076) );
  INVX1 U1115 ( .A(n1281), .Y(n1380) );
  NAND2X1 U1116 ( .A(n866), .B(n1854), .Y(n1862) );
  AOI221XL U1117 ( .A0(div_631_u_div_SumTmp_4__2__5_), .A1(n1474), .B0(
        div_631_u_div_SumTmp_6__2__5_), .B1(n1475), .C0(n1456), .Y(n1457) );
  OR2X2 U1118 ( .A(n855), .B(n1519), .Y(n938) );
  AOI222X1 U1119 ( .A0(n1666), .A1(div_631_u_div_SumTmp_6__1__0_), .B0(n1665), 
        .B1(ratio_a[3]), .C0(div_631_u_div_SumTmp_2__1__0_), .C1(n1664), .Y(
        n1667) );
  NAND4X1 U1120 ( .A(n1270), .B(n1269), .C(n1268), .D(n1267), .Y(n1365) );
  AOI211XL U1121 ( .A0(n1824), .A1(n1910), .B0(n737), .C0(cnn_map0[39]), .Y(
        n885) );
  AOI2BB1X2 U1122 ( .A0N(cnn_map0[33]), .A1N(n746), .B0(n1819), .Y(n1820) );
  INVX2 U1123 ( .A(n886), .Y(n1818) );
  AOI221XL U1124 ( .A0(div_631_u_div_SumTmp_4__2__10_), .A1(n1474), .B0(
        div_631_u_div_SumTmp_6__2__10_), .B1(n1475), .C0(n1424), .Y(n1425) );
  OR2X2 U1125 ( .A(n959), .B(n1551), .Y(n2018) );
  OR2X2 U1126 ( .A(n1695), .B(n1696), .Y(div_631_u_div_PartRem_1__3_) );
  NAND3X1 U1127 ( .A(n1571), .B(n1570), .C(n1569), .Y(n1688) );
  NAND2X1 U1128 ( .A(n1580), .B(n1579), .Y(n1689) );
  OR2X2 U1129 ( .A(n1605), .B(n1682), .Y(n1615) );
  INVX2 U1130 ( .A(n1801), .Y(n1836) );
  OR2X2 U1131 ( .A(n1830), .B(n1827), .Y(n1865) );
  OAI32X1 U1132 ( .A0(div_631_u_div_CryOut_7__2_), .A1(n1516), .A2(n1515), 
        .B0(div_631_u_div_CryOut_3__2_), .B1(n1528), .Y(n1522) );
  OR4X2 U1133 ( .A(n871), .B(n945), .C(n1692), .D(n946), .Y(n2086) );
  INVX2 U1134 ( .A(n1878), .Y(n1959) );
  NAND2X1 U1135 ( .A(n1829), .B(n1853), .Y(n1843) );
  OAI2BB1X2 U1136 ( .A0N(n1857), .A1N(n1856), .B0(n1865), .Y(n1844) );
  MX2X2 U1137 ( .A(n1960), .B(n1010), .S0(n1846), .Y(n907) );
  OR3X2 U1138 ( .A(n949), .B(n1547), .C(n1530), .Y(n1540) );
  INVX2 U1139 ( .A(add_9_result[16]), .Y(n1249) );
  OR2X1 U1140 ( .A(n1101), .B(n1116), .Y(n1344) );
  OR2X1 U1141 ( .A(n1380), .B(n1379), .Y(n2033) );
  OR2X1 U1142 ( .A(n994), .B(n997), .Y(n1385) );
  MX2X2 U1143 ( .A(n1982), .B(n1894), .S0(n1131), .Y(mult_b_1__0_) );
  MX2X2 U1144 ( .A(n1784), .B(n1934), .S0(n1133), .Y(mult_a_0__0_) );
  INVX2 U1145 ( .A(n1535), .Y(n1491) );
  OR2X1 U1146 ( .A(n1348), .B(n1347), .Y(n2085) );
  OR3X2 U1147 ( .A(n1351), .B(n1375), .C(n994), .Y(n1352) );
  OR2X1 U1148 ( .A(n1318), .B(n864), .Y(n1904) );
  INVX2 U1149 ( .A(n1115), .Y(n1116) );
  OAI2BB1X1 U1150 ( .A0N(div_631_u_div_SumTmp_1__3__7_), .A1N(n1906), .B0(
        n1274), .Y(n1326) );
  OR2X1 U1151 ( .A(n950), .B(n951), .Y(n1347) );
  NAND2X1 U1152 ( .A(div_631_u_div_SumTmp_4__3__1_), .B(n1053), .Y(n1314) );
  OR2X1 U1153 ( .A(n994), .B(n997), .Y(n1383) );
  OR2X2 U1154 ( .A(n1101), .B(n1116), .Y(n1299) );
  INVX2 U1155 ( .A(div_631_u_div_SumTmp_2__3__6_), .Y(n1278) );
  INVX2 U1156 ( .A(div_631_u_div_CryOut_7__2_), .Y(n1415) );
  OR2X1 U1157 ( .A(n1471), .B(n1485), .Y(n1472) );
  NAND2X2 U1158 ( .A(add_9_result[19]), .B(n1247), .Y(n998) );
  INVX4 U1159 ( .A(n1101), .Y(n1309) );
  OR2X2 U1160 ( .A(n1518), .B(n870), .Y(div_631_u_div_PartRem_2__13_) );
  INVX2 U1161 ( .A(div_631_u_div_CryOut_3__2_), .Y(n1529) );
  OR2X1 U1162 ( .A(n1528), .B(n1529), .Y(n1438) );
  AOI221XL U1163 ( .A0(div_631_u_div_SumTmp_6__2__6_), .A1(n1081), .B0(
        div_631_u_div_SumTmp_4__2__6_), .B1(n1474), .C0(n1450), .Y(n1451) );
  NAND2X1 U1164 ( .A(n1453), .B(n1452), .Y(n1521) );
  INVX2 U1165 ( .A(n1480), .Y(n1538) );
  AOI221XL U1166 ( .A0(div_631_u_div_SumTmp_7__2__3_), .A1(n1545), .B0(
        div_631_u_div_SumTmp_1__2__3_), .B1(n1083), .C0(n1479), .Y(n1480) );
  OR2X1 U1167 ( .A(n1378), .B(n1377), .Y(n2036) );
  INVX2 U1168 ( .A(div_631_u_div_CryOut_1__1_), .Y(n1556) );
  OR2X1 U1169 ( .A(n1550), .B(n1549), .Y(n2015) );
  OAI2BB1X1 U1170 ( .A0N(div_631_u_div_SumTmp_2__1__3_), .A1N(n1635), .B0(
        n1634), .Y(n1636) );
  OR2X1 U1171 ( .A(n1657), .B(n1586), .Y(n1660) );
  OAI2BB1X1 U1172 ( .A0N(div_631_u_div_SumTmp_2__1__8_), .A1N(n1635), .B0(
        n1582), .Y(n1583) );
  OR2X1 U1173 ( .A(n1581), .B(n1620), .Y(n1582) );
  OR2X2 U1174 ( .A(n852), .B(n1538), .Y(n2035) );
  OR2X1 U1175 ( .A(n1551), .B(n959), .Y(n2023) );
  NAND2X1 U1176 ( .A(n944), .B(n1052), .Y(n1364) );
  NOR2X1 U1177 ( .A(n1050), .B(n872), .Y(n944) );
  AOI22X1 U1178 ( .A0(n899), .A1(n1204), .B0(n1206), .B1(n903), .Y(n1213) );
  INVX2 U1179 ( .A(cnn_map0[24]), .Y(n1204) );
  AOI2BB2X2 U1180 ( .B0(n1207), .B1(cnn_map0[25]), .A0N(n918), .A1N(n908), .Y(
        n1216) );
  AOI221X1 U1181 ( .A0(cnn_map0[39]), .A1(n737), .B0(cnn_map0[40]), .B1(n1824), 
        .C0(n1810), .Y(n1814) );
  OAI2BB1X1 U1182 ( .A0N(n1857), .A1N(n1856), .B0(n1855), .Y(n1858) );
  OAI2BB1X1 U1183 ( .A0N(div_631_u_div_SumTmp_2__2__11_), .A1N(n850), .B0(
        n1408), .Y(n1409) );
  NOR2X1 U1184 ( .A(n1439), .B(n1405), .Y(n963) );
  AOI221XL U1185 ( .A0(div_631_u_div_SumTmp_4__2__8_), .A1(n1474), .B0(
        div_631_u_div_SumTmp_6__2__8_), .B1(n1081), .C0(n1436), .Y(n1437) );
  OR2X2 U1186 ( .A(n960), .B(n1521), .Y(n2062) );
  OR2X1 U1187 ( .A(n970), .B(n1656), .Y(n1681) );
  OR2XL U1188 ( .A(n1697), .B(n946), .Y(div_631_u_div_PartRem_1__6_) );
  NAND2BX1 U1189 ( .AN(n1679), .B(n1684), .Y(n1699) );
  AND2X1 U1190 ( .A(div_631_u_div_SumTmp_7__1__3_), .B(n1645), .Y(n871) );
  INVX4 U1191 ( .A(n1136), .Y(n1132) );
  NOR2X1 U1192 ( .A(n1616), .B(n1086), .Y(n942) );
  AOI221XL U1193 ( .A0(div_631_u_div_SumTmp_4__1__5_), .A1(n965), .B0(
        div_631_u_div_SumTmp_6__1__5_), .B1(n1637), .C0(n1614), .Y(n1616) );
  NAND3X1 U1194 ( .A(n1909), .B(n1908), .C(n1907), .Y(
        div_631_u_div_PartRem_3__14_) );
  NAND2X1 U1195 ( .A(div_631_u_div_SumTmp_2__3__11_), .B(n1051), .Y(n1909) );
  AOI32X1 U1196 ( .A0(n1117), .A1(n1905), .A2(div_631_u_div_SumTmp_6__3__11_), 
        .B0(div_631_u_div_SumTmp_4__3__11_), .B1(n1277), .Y(n1908) );
  OAI221X1 U1197 ( .A0(cnn_map0[34]), .A1(n1821), .B0(n897), .B1(n744), .C0(
        n1820), .Y(n1822) );
  INVX2 U1198 ( .A(n885), .Y(n1823) );
  INVX2 U1199 ( .A(n892), .Y(n1238) );
  MX2X2 U1200 ( .A(cnn_map0[3]), .B(n894), .S0(n1016), .Y(n1717) );
  NAND2BX1 U1201 ( .AN(n1711), .B(n1740), .Y(n1712) );
  NAND2X1 U1202 ( .A(n1744), .B(n1741), .Y(n1735) );
  MXI2X1 U1203 ( .A(n706), .B(n1803), .S0(n1019), .Y(n1958) );
  OR2X2 U1204 ( .A(n1871), .B(n1870), .Y(n1878) );
  INVX2 U1205 ( .A(n1738), .Y(n1740) );
  NOR2X1 U1206 ( .A(n1738), .B(n1711), .Y(n921) );
  MXI2X2 U1207 ( .A(cnn_map0[38]), .B(n886), .S0(n902), .Y(n1098) );
  INVX2 U1208 ( .A(n1883), .Y(n902) );
  OR2X2 U1209 ( .A(n1871), .B(n1870), .Y(n1846) );
  INVX2 U1210 ( .A(div_631_u_div_CryOut_7__1_), .Y(n1577) );
  INVX2 U1211 ( .A(n1596), .Y(n1656) );
  OR2X2 U1212 ( .A(n1680), .B(n956), .Y(n2053) );
  INVX2 U1213 ( .A(n1609), .Y(n1645) );
  INVX2 U1214 ( .A(n1611), .Y(n1648) );
  OR2X2 U1215 ( .A(n1689), .B(n865), .Y(n2044) );
  OR2X2 U1216 ( .A(n1680), .B(n956), .Y(div_631_u_div_PartRem_1__10_) );
  OR2X1 U1217 ( .A(n1691), .B(n976), .Y(n1088) );
  OAI2BB1X1 U1218 ( .A0N(current_state[0]), .A1N(current_state[2]), .B0(n1987), 
        .Y(div_631_b_3_) );
  MX2X2 U1219 ( .A(n1849), .B(n1850), .S0(n1099), .Y(n1854) );
  MXI2X1 U1220 ( .A(cnn_map0[32]), .B(cnn_map0[37]), .S0(n1883), .Y(n866) );
  NAND2X2 U1221 ( .A(n1879), .B(n1878), .Y(n1002) );
  NOR2X1 U1222 ( .A(n1714), .B(n1713), .Y(n1015) );
  NOR2X1 U1223 ( .A(n1758), .B(n1736), .Y(n1014) );
  AND2X2 U1224 ( .A(n1712), .B(n1735), .Y(n1003) );
  OR3X2 U1225 ( .A(n919), .B(n1749), .C(n921), .Y(n1756) );
  AND2X1 U1226 ( .A(n1744), .B(n1741), .Y(n919) );
  MXI2X1 U1227 ( .A(n1847), .B(n1098), .S0(n1846), .Y(n1011) );
  INVX2 U1228 ( .A(n1866), .Y(n1847) );
  MX2X2 U1229 ( .A(cnn_map0[7]), .B(n892), .S0(n1016), .Y(n1738) );
  INVX2 U1230 ( .A(n1709), .Y(n878) );
  OR2X2 U1231 ( .A(n970), .B(n1656), .Y(n1605) );
  INVX2 U1232 ( .A(div_631_u_div_CryOut_2__2_), .Y(n1507) );
  INVX2 U1233 ( .A(div_631_b_3_), .Y(n1137) );
  MXI2X1 U1234 ( .A(n866), .B(n1872), .S0(n1002), .Y(n1001) );
  INVX2 U1235 ( .A(n1854), .Y(n1872) );
  MXI2X2 U1236 ( .A(n1094), .B(n1093), .S0(n1875), .Y(n1095) );
  INVX2 U1237 ( .A(n702), .Y(n1721) );
  INVX2 U1238 ( .A(n710), .Y(n1861) );
  INVX2 U1239 ( .A(n718), .Y(n1860) );
  INVX2 U1240 ( .A(n1206), .Y(n1716) );
  INVX2 U1241 ( .A(n717), .Y(n1851) );
  INVX2 U1242 ( .A(n708), .Y(n1850) );
  INVX2 U1243 ( .A(n716), .Y(n1849) );
  INVX2 U1244 ( .A(n724), .Y(n1715) );
  INVX2 U1245 ( .A(n923), .Y(n1730) );
  INVX2 U1246 ( .A(n1803), .Y(n1837) );
  INVX2 U1247 ( .A(n729), .Y(n1710) );
  INVX2 U1248 ( .A(n744), .Y(n1910) );
  INVX2 U1249 ( .A(current_state[1]), .Y(n2009) );
  INVX4 U1250 ( .A(n1246), .Y(n1131) );
  INVX2 U1251 ( .A(n2140), .Y(n1200) );
  AOI2BB1X2 U1252 ( .A0N(cnn_map0[14]), .A1N(n1803), .B0(n1802), .Y(n1804) );
  INVX1 U1253 ( .A(ratio_result_cnn[2]), .Y(n1705) );
  OR2X2 U1254 ( .A(n1488), .B(n1458), .Y(n1429) );
  NAND2BX1 U1255 ( .AN(n1103), .B(div_631_u_div_CryOut_1__2_), .Y(n1458) );
  MXI2X2 U1256 ( .A(n862), .B(n914), .S0(n1883), .Y(n1030) );
  CLKINVX2 U1257 ( .A(n1644), .Y(n1674) );
  OAI221X1 U1258 ( .A0(n1643), .A1(n1642), .B0(n1641), .B1(n1646), .C0(n1640), 
        .Y(n1644) );
  MX2XL U1259 ( .A(img0[13]), .B(img0[21]), .S0(n1107), .Y(N256) );
  MX2XL U1260 ( .A(n1184), .B(img0[13]), .S0(n1108), .Y(N246) );
  NOR2X1 U1261 ( .A(n1672), .B(n1671), .Y(n974) );
  OAI211X2 U1262 ( .A0(n1597), .A1(n1599), .B0(n1595), .C0(n1596), .Y(n1671)
         );
  AOI32X1 U1263 ( .A0(div_631_u_div_SumTmp_5__1__0_), .A1(n1657), .A2(n979), 
        .B0(div_631_u_div_SumTmp_1__1__0_), .B1(n1656), .Y(n1658) );
  AOI32X1 U1264 ( .A0(n1474), .A1(div_631_u_div_CryOut_5__2_), .A2(
        div_631_u_div_SumTmp_5__2__6_), .B0(div_631_u_div_SumTmp_7__2__6_), 
        .B1(n1545), .Y(n1453) );
  INVX3 U1265 ( .A(n1496), .Y(n1545) );
  NOR2X1 U1266 ( .A(n1989), .B(n1476), .Y(n852) );
  INVX1 U1267 ( .A(div_631_u_div_PartRem_5__3_), .Y(n1253) );
  NOR2X1 U1268 ( .A(n851), .B(n1437), .Y(n855) );
  OR2XL U1269 ( .A(n1655), .B(n1578), .Y(n1561) );
  NOR2X1 U1270 ( .A(n1989), .B(n1457), .Y(n856) );
  INVX2 U1271 ( .A(n1256), .Y(n2087) );
  AND3X4 U1272 ( .A(div_631_u_div_SumTmp_6__3__6_), .B(n1117), .C(n1905), .Y(
        n857) );
  INVX1 U1273 ( .A(n1905), .Y(n1277) );
  MXI2X1 U1274 ( .A(n1830), .B(n1840), .S0(n1005), .Y(n859) );
  AND3X4 U1275 ( .A(n1494), .B(n1510), .C(div_631_u_div_SumTmp_1__2__2_), .Y(
        n860) );
  OR2X1 U1276 ( .A(n1132), .B(n999), .Y(n1250) );
  OAI2BB1X1 U1277 ( .A0N(div_631_u_div_SumTmp_3__3__8_), .A1N(n986), .B0(n1271), .Y(n1323) );
  INVX2 U1278 ( .A(n913), .Y(n1207) );
  NOR2X1 U1279 ( .A(n1101), .B(n1306), .Y(n864) );
  NOR2X1 U1280 ( .A(n1585), .B(n1663), .Y(n865) );
  INVX2 U1281 ( .A(n917), .Y(n918) );
  MX2X2 U1282 ( .A(n1873), .B(n1001), .S0(n1133), .Y(mult_a_1__3_) );
  NAND2BX2 U1283 ( .AN(n1101), .B(n880), .Y(n1283) );
  AND2X2 U1284 ( .A(div_631_u_div_SumTmp_4__3__6_), .B(n1277), .Y(n867) );
  AND3X2 U1285 ( .A(n1566), .B(n1565), .C(n1564), .Y(n868) );
  NOR2X1 U1286 ( .A(n1989), .B(n1445), .Y(n869) );
  INVX2 U1287 ( .A(n1458), .Y(n1510) );
  MX2X2 U1288 ( .A(n1095), .B(n1876), .S0(n1132), .Y(mult_a_1__2_) );
  NOR2X1 U1289 ( .A(n851), .B(n1425), .Y(n870) );
  OR2X1 U1290 ( .A(n1103), .B(n1507), .Y(n1514) );
  AND3X2 U1291 ( .A(div_631_u_div_SumTmp_4__3__10_), .B(n1117), .C(n1361), .Y(
        n872) );
  OR2X1 U1292 ( .A(n1416), .B(n1415), .Y(n1470) );
  INVX2 U1293 ( .A(n887), .Y(n1257) );
  OR2X1 U1294 ( .A(n1655), .B(n1578), .Y(n1647) );
  INVX2 U1295 ( .A(n893), .Y(n1206) );
  OR2X1 U1296 ( .A(div_631_u_div_CryOut_2__2_), .B(n1103), .Y(n1488) );
  INVX2 U1297 ( .A(n1717), .Y(n1092) );
  INVX2 U1298 ( .A(n891), .Y(n1803) );
  INVX2 U1299 ( .A(n899), .Y(n900) );
  INVX2 U1300 ( .A(n993), .Y(div_631_u_div_PartRem_3__7_) );
  NOR3X2 U1301 ( .A(cnt[2]), .B(n1898), .C(cnt[1]), .Y(n874) );
  NOR3X1 U1302 ( .A(cnt[1]), .B(n1918), .C(n1917), .Y(n875) );
  OR2X1 U1303 ( .A(n1340), .B(n1118), .Y(n1368) );
  OR2X4 U1304 ( .A(n1690), .B(n943), .Y(n2032) );
  AOI2BB2X2 U1305 ( .B0(div_631_u_div_SumTmp_2__2__0_), .B1(
        div_631_u_div_CryOut_2__2_), .A0N(div_631_u_div_CryOut_2__2_), .A1N(
        n1505), .Y(n1506) );
  AOI32X1 U1306 ( .A0(div_631_u_div_CryOut_3__3_), .A1(n1282), .A2(
        div_631_u_div_SumTmp_3__3__9_), .B0(n2093), .B1(n1262), .Y(n1263) );
  NAND2BX2 U1307 ( .AN(cnn_map0[7]), .B(n892), .Y(n937) );
  OR2X2 U1308 ( .A(n1514), .B(n1529), .Y(n1462) );
  OR2X2 U1309 ( .A(div_631_u_div_CryOut_6__2_), .B(n1516), .Y(n1481) );
  CLKINVX8 U1310 ( .A(n1040), .Y(n2093) );
  MX2X2 U1311 ( .A(cnn_map0[26]), .B(n1710), .S0(n1012), .Y(n1744) );
  OR2X1 U1312 ( .A(n1694), .B(n947), .Y(div_631_u_div_PartRem_1__4_) );
  OR2X1 U1313 ( .A(n1694), .B(n947), .Y(n2019) );
  OAI21X4 U1314 ( .A0(n1251), .A1(n999), .B0(n1250), .Y(
        div_631_u_div_PartRem_5__3_) );
  INVX4 U1315 ( .A(add_9_result[15]), .Y(n1251) );
  MXI2X2 U1316 ( .A(cnn_map0[33]), .B(n1834), .S0(n1009), .Y(n1010) );
  MX2X1 U1317 ( .A(n897), .B(n1910), .S0(n1009), .Y(n1857) );
  CLKINVX4 U1318 ( .A(n1115), .Y(n887) );
  NOR2XL U1319 ( .A(n1488), .B(n1458), .Y(n980) );
  OR2XL U1320 ( .A(n1458), .B(n1485), .Y(n1459) );
  OR2X1 U1321 ( .A(n1380), .B(n1379), .Y(div_631_u_div_PartRem_3__8_) );
  MXI2X1 U1322 ( .A(add_2_result[13]), .B(add_9_result[13]), .S0(n1132), .Y(
        n877) );
  OAI211X4 U1323 ( .A0(n1369), .A1(n1368), .B0(n982), .C0(n1367), .Y(
        div_631_u_div_PartRem_3__6_) );
  INVX2 U1324 ( .A(n1258), .Y(n1050) );
  OR2XL U1325 ( .A(n1739), .B(n1738), .Y(n1920) );
  OR2XL U1326 ( .A(n1322), .B(n873), .Y(div_631_u_div_PartRem_3__12_) );
  MXI2X2 U1327 ( .A(n878), .B(n728), .S0(n1012), .Y(n1739) );
  MXI2X1 U1328 ( .A(n1092), .B(n1718), .S0(n1764), .Y(n1928) );
  INVX8 U1329 ( .A(div_631_u_div_CryOut_6__3_), .Y(n1361) );
  CLKINVX2 U1330 ( .A(n1115), .Y(n1114) );
  OR2X4 U1331 ( .A(n950), .B(n951), .Y(n1382) );
  AND2X2 U1332 ( .A(n1308), .B(n1119), .Y(n951) );
  OR2X2 U1333 ( .A(n1027), .B(n1877), .Y(n1864) );
  INVX4 U1334 ( .A(div_631_quotient_11_), .Y(n1115) );
  OR2X2 U1335 ( .A(n1103), .B(n1507), .Y(n1528) );
  INVX2 U1336 ( .A(n881), .Y(n1807) );
  CLKINVX2 U1337 ( .A(n1862), .Y(n1855) );
  OAI2BB1X1 U1338 ( .A0N(n1877), .A1N(n1027), .B0(n1862), .Y(n1863) );
  OAI221XL U1339 ( .A0(n1361), .A1(n1370), .B0(n1284), .B1(n1346), .C0(n1345), 
        .Y(n1348) );
  OR2X4 U1340 ( .A(div_631_u_div_CryOut_6__3_), .B(n1119), .Y(n1296) );
  MX2X4 U1341 ( .A(add_2_result[10]), .B(add_9_result[10]), .S0(n1132), .Y(
        ratio_a[10]) );
  AOI2BB2X2 U1342 ( .B0(cnn_map0[5]), .B1(n1236), .A0N(cnn_map0[10]), .A1N(
        n1234), .Y(n1235) );
  INVX1 U1343 ( .A(cnn_map0[4]), .Y(n1234) );
  OAI33X1 U1344 ( .A0(n1316), .A1(n1266), .A2(n1261), .B0(n1260), .B1(n1117), 
        .B2(n1259), .Y(n1363) );
  NOR2X4 U1345 ( .A(n1833), .B(n1832), .Y(n1009) );
  INVX1 U1346 ( .A(n2016), .Y(n1633) );
  AOI221X1 U1347 ( .A0(div_631_u_div_SumTmp_6__1__1_), .A1(n972), .B0(
        div_631_u_div_SumTmp_4__1__1_), .B1(n971), .C0(n1653), .Y(n1654) );
  INVX1 U1348 ( .A(n2010), .Y(n1426) );
  CLKINVX1 U1349 ( .A(n1958), .Y(n1960) );
  OR4X1 U1350 ( .A(n949), .B(n1548), .C(n1546), .D(n1547), .Y(n2065) );
  OAI2BB1X1 U1351 ( .A0N(div_631_u_div_SumTmp_4__1__0_), .A1N(n966), .B0(n1667), .Y(n1668) );
  INVX1 U1352 ( .A(n1827), .Y(n1840) );
  AOI221X1 U1353 ( .A0(div_631_u_div_SumTmp_4__1__6_), .A1(n971), .B0(
        div_631_u_div_SumTmp_6__1__6_), .B1(n1637), .C0(n1604), .Y(n1606) );
  OAI211X2 U1354 ( .A0(n1731), .A1(n1759), .B0(n1737), .C0(n1735), .Y(n1732)
         );
  OR2X2 U1355 ( .A(n1516), .B(n1515), .Y(n1406) );
  BUFX16 U1356 ( .A(div_631_quotient_8_), .Y(n1103) );
  OR3X4 U1357 ( .A(n981), .B(n989), .C(n1673), .Y(n1693) );
  OAI2BB1X4 U1358 ( .A0N(div_631_u_div_SumTmp_1__1__2_), .A1N(n1656), .B0(
        n1639), .Y(n1673) );
  OR2X2 U1359 ( .A(n855), .B(n1519), .Y(div_631_u_div_PartRem_2__11_) );
  OR2X2 U1360 ( .A(n975), .B(n1621), .Y(n2072) );
  NAND2XL U1361 ( .A(n1102), .B(div_631_u_div_CryOut_7__1_), .Y(n1586) );
  INVX1 U1362 ( .A(n1620), .Y(n1665) );
  CLKINVX1 U1363 ( .A(n1646), .Y(n1662) );
  AOI221X2 U1364 ( .A0(div_631_u_div_SumTmp_4__1__3_), .A1(n965), .B0(
        div_631_u_div_SumTmp_6__1__3_), .B1(n1637), .C0(n1636), .Y(n1638) );
  OR3XL U1365 ( .A(n868), .B(n1682), .C(n1681), .Y(n1686) );
  NAND3XL U1366 ( .A(n1686), .B(n1685), .C(n1684), .Y(
        div_631_u_div_PartRem_1__13_) );
  OR2X1 U1367 ( .A(n1699), .B(n969), .Y(n2063) );
  OAI21X2 U1368 ( .A0(n1560), .A1(n1087), .B0(n1559), .Y(
        div_631_u_div_PartRem_1__14_) );
  MX2XL U1369 ( .A(n1990), .B(cnn_map0[37]), .S0(n1105), .Y(N555) );
  NAND2X4 U1370 ( .A(n883), .B(n884), .Y(mult_a_1__1_) );
  CLKINVXL U1371 ( .A(n1132), .Y(n882) );
  INVX1 U1372 ( .A(n1670), .Y(n1695) );
  CLKINVX2 U1373 ( .A(cnn_map0[39]), .Y(n1821) );
  MX2X2 U1374 ( .A(cnn_map0[13]), .B(cnn_map0[20]), .S0(n1019), .Y(n1866) );
  OR2X2 U1375 ( .A(n1489), .B(n1488), .Y(n1490) );
  AOI32X4 U1376 ( .A0(div_631_u_div_CryOut_3__2_), .A1(n850), .A2(
        div_631_u_div_SumTmp_3__2__4_), .B0(div_631_u_div_SumTmp_1__2__4_), 
        .B1(n980), .Y(n1468) );
  NOR2X1 U1377 ( .A(n1662), .B(n971), .Y(n958) );
  CLKINVXL U1378 ( .A(n2091), .Y(n1273) );
  AOI221X1 U1379 ( .A0(div_631_u_div_SumTmp_1__1__11_), .A1(n1648), .B0(
        div_631_u_div_SumTmp_7__1__11_), .B1(n1645), .C0(n1558), .Y(n1559) );
  INVX1 U1380 ( .A(n1557), .Y(n1558) );
  INVX1 U1381 ( .A(n1371), .Y(n1053) );
  INVX2 U1382 ( .A(n1371), .Y(n1304) );
  NOR2X2 U1383 ( .A(n925), .B(n1371), .Y(n950) );
  OR2X2 U1384 ( .A(n1102), .B(div_631_u_div_CryOut_2__1_), .Y(n1620) );
  OR3X2 U1385 ( .A(n1676), .B(n1675), .C(n943), .Y(n2069) );
  INVX2 U1386 ( .A(n1663), .Y(n1669) );
  NAND2X1 U1387 ( .A(n1843), .B(n1844), .Y(n1845) );
  AOI33XL U1388 ( .A0(div_631_u_div_SumTmp_3__1__4_), .A1(n1646), .A2(n990), 
        .B0(n979), .B1(n1657), .B2(div_631_u_div_SumTmp_5__1__4_), .Y(n1619)
         );
  NOR2X2 U1389 ( .A(n1598), .B(n1671), .Y(n956) );
  INVX3 U1390 ( .A(n1590), .Y(n1680) );
  OR2X4 U1391 ( .A(n1694), .B(n947), .Y(n2041) );
  AOI32X1 U1392 ( .A0(n1494), .A1(div_631_u_div_CryOut_1__2_), .A2(
        div_631_u_div_SumTmp_1__2__6_), .B0(div_631_u_div_SumTmp_3__2__6_), 
        .B1(n1478), .Y(n1452) );
  OAI2BB1X2 U1393 ( .A0N(div_631_u_div_SumTmp_5__1__3_), .A1N(n968), .B0(n1632), .Y(n1692) );
  OR3XL U1394 ( .A(n1679), .B(n1683), .C(n969), .Y(n2012) );
  INVX1 U1395 ( .A(n1573), .Y(n955) );
  OR2XL U1396 ( .A(n1542), .B(n856), .Y(div_631_u_div_PartRem_2__8_) );
  OR2X2 U1397 ( .A(n1542), .B(n856), .Y(n2027) );
  OR4X2 U1398 ( .A(n984), .B(n983), .C(n1387), .D(n1386), .Y(n2030) );
  NOR2X2 U1399 ( .A(n1654), .B(n1671), .Y(n947) );
  CLKINVX2 U1400 ( .A(n1326), .Y(n1275) );
  INVX4 U1401 ( .A(n1283), .Y(n1906) );
  OR2X4 U1402 ( .A(n1657), .B(n1567), .Y(n1609) );
  OR2X4 U1403 ( .A(n1655), .B(n1577), .Y(n1567) );
  AND2X2 U1404 ( .A(n1859), .B(n1858), .Y(n1869) );
  OR2X2 U1405 ( .A(n1696), .B(n1695), .Y(n2073) );
  OR2X2 U1406 ( .A(div_631_u_div_CryOut_2__2_), .B(n1103), .Y(n1485) );
  OR2X1 U1407 ( .A(n1365), .B(n1323), .Y(div_631_u_div_PartRem_3__11_) );
  OR2X2 U1408 ( .A(n1323), .B(n1365), .Y(n2081) );
  OR3X4 U1409 ( .A(n857), .B(n867), .C(n1334), .Y(n2079) );
  OAI211X1 U1410 ( .A0(n1516), .A1(n1439), .B0(n1458), .C0(n940), .Y(n1421) );
  OAI2BB2X4 U1411 ( .B0(n1000), .B1(n1249), .A0N(n1134), .A1N(n924), .Y(
        div_631_u_div_PartRem_5__4_) );
  OR4X4 U1412 ( .A(n1734), .B(n1733), .C(n1732), .D(n920), .Y(n1769) );
  MX2X4 U1413 ( .A(add_2_result[11]), .B(add_9_result[11]), .S0(n1132), .Y(
        ratio_a[11]) );
  CLKINVX2 U1414 ( .A(n1683), .Y(n1684) );
  AOI33XL U1415 ( .A0(div_631_u_div_SumTmp_7__2__0_), .A1(n1103), .A2(
        div_631_u_div_CryOut_7__2_), .B0(div_631_u_div_SumTmp_3__2__0_), .B1(
        n1516), .B2(div_631_u_div_CryOut_3__2_), .Y(n1503) );
  OR2X4 U1416 ( .A(n1272), .B(n964), .Y(n1366) );
  CLKINVXL U1417 ( .A(n1700), .Y(n890) );
  MXI2X1 U1418 ( .A(cnn_map0[31]), .B(cnn_map0[36]), .S0(n1883), .Y(n1027) );
  CLKINVXL U1419 ( .A(n894), .Y(n895) );
  CLKINVX2 U1420 ( .A(n1842), .Y(n1871) );
  INVX1 U1421 ( .A(n1845), .Y(n1870) );
  CLKINVXL U1422 ( .A(n1234), .Y(n896) );
  INVX2 U1423 ( .A(n751), .Y(n898) );
  INVX1 U1424 ( .A(n1960), .Y(n901) );
  INVX2 U1425 ( .A(n1877), .Y(n1880) );
  MX2X1 U1426 ( .A(n1861), .B(n1860), .S0(n1100), .Y(n1877) );
  OAI222X1 U1427 ( .A0(n866), .A1(n1854), .B0(n1874), .B1(n1030), .C0(n1853), 
        .C1(n1852), .Y(n1859) );
  AOI211X1 U1428 ( .A0(cnn_map0[36]), .A1(n858), .B0(cnn_map0[35]), .C0(n743), 
        .Y(n1816) );
  NAND2X2 U1429 ( .A(n929), .B(n930), .Y(n1759) );
  INVX3 U1430 ( .A(n904), .Y(n905) );
  OAI221X1 U1431 ( .A0(n1496), .A1(n1463), .B0(n1462), .B1(n1461), .C0(n1460), 
        .Y(n1542) );
  NAND2BX4 U1432 ( .AN(n906), .B(add_9_result[18]), .Y(n1040) );
  CLKINVX20 U1433 ( .A(n1247), .Y(n906) );
  INVX2 U1434 ( .A(n908), .Y(n909) );
  AOI21X2 U1435 ( .A0(n918), .A1(n908), .B0(n1216), .Y(n1217) );
  INVX1 U1436 ( .A(n910), .Y(n1227) );
  BUFX1 U1437 ( .A(n1011), .Y(n912) );
  OAI211X2 U1438 ( .A0(cnn_map0[7]), .A1(n1238), .B0(cnn_map0[6]), .C0(n1239), 
        .Y(n1241) );
  INVX3 U1439 ( .A(n897), .Y(n1824) );
  MX2X2 U1440 ( .A(cnn_map0[1]), .B(n1721), .S0(n1017), .Y(n1777) );
  INVX2 U1441 ( .A(n1138), .Y(n1133) );
  CLKINVXL U1442 ( .A(n915), .Y(n916) );
  MX2X1 U1443 ( .A(cnn_map0[15]), .B(cnn_map0[21]), .S0(n1019), .Y(n1827) );
  OAI2BB1X1 U1444 ( .A0N(n1014), .A1N(n1737), .B0(n1749), .Y(n1743) );
  NAND3XL U1445 ( .A(n1737), .B(n1014), .C(n1003), .Y(n1757) );
  OR2X4 U1446 ( .A(n1090), .B(n1751), .Y(n1737) );
  AND2X4 U1447 ( .A(n1770), .B(n1769), .Y(n1764) );
  AND3X4 U1448 ( .A(n1757), .B(n1756), .C(n1755), .Y(n952) );
  MXI2X1 U1449 ( .A(n1226), .B(n916), .S0(n1016), .Y(n1745) );
  OAI22X1 U1450 ( .A0(cnn_map0[25]), .A1(n1207), .B0(n917), .B1(n909), .Y(
        n1208) );
  CLKINVXL U1451 ( .A(n1712), .Y(n920) );
  MX2X1 U1452 ( .A(n1715), .B(n899), .S0(n1012), .Y(n1765) );
  CLKINVX1 U1453 ( .A(n1765), .Y(n1718) );
  NAND2BX1 U1454 ( .AN(n1750), .B(n1031), .Y(n1749) );
  MX2X2 U1455 ( .A(n1783), .B(n1782), .S0(n1004), .Y(n1934) );
  OAI211X2 U1456 ( .A0(n904), .A1(n728), .B0(cnn_map0[26]), .C0(n729), .Y(
        n1219) );
  AOI211X2 U1457 ( .A0(n911), .A1(n726), .B0(cnn_map0[27]), .C0(n727), .Y(
        n1212) );
  AOI2BB2X4 U1458 ( .B0(cnn_map0[33]), .B1(n746), .A0N(cnn_map0[38]), .A1N(
        n1818), .Y(n1819) );
  MX2X1 U1459 ( .A(n1777), .B(n1776), .S0(n1004), .Y(n1932) );
  MX2X2 U1460 ( .A(n1932), .B(n1778), .S0(n1132), .Y(mult_a_0__1_) );
  CLKINVXL U1461 ( .A(n922), .Y(n923) );
  INVX1 U1462 ( .A(n1410), .Y(n1411) );
  INVX3 U1463 ( .A(n1493), .Y(n1081) );
  OR2X2 U1464 ( .A(n1516), .B(n1515), .Y(n1493) );
  INVX3 U1465 ( .A(n1597), .Y(n1664) );
  OR2X4 U1466 ( .A(n1689), .B(n865), .Y(div_631_u_div_PartRem_1__11_) );
  INVX1 U1467 ( .A(n1406), .Y(n1079) );
  OR2X2 U1468 ( .A(n1693), .B(n978), .Y(div_631_u_div_PartRem_1__5_) );
  INVXL U1469 ( .A(n1826), .Y(n1856) );
  OAI221X4 U1470 ( .A0(n1089), .A1(n2062), .B0(div_631_u_div_SumTmp_2__1__9_), 
        .B1(n1572), .C0(n1655), .Y(n1575) );
  OR4X2 U1471 ( .A(n1101), .B(n1317), .C(n1117), .D(div_631_u_div_CryOut_1__3_), .Y(n1321) );
  INVX4 U1472 ( .A(n1115), .Y(n1117) );
  OR2X2 U1473 ( .A(n1102), .B(n1572), .Y(n1643) );
  INVX2 U1474 ( .A(n1318), .Y(n1319) );
  NOR2X1 U1475 ( .A(n1304), .B(n1370), .Y(n985) );
  MX2X2 U1476 ( .A(n1720), .B(n911), .S0(n1015), .Y(n1776) );
  INVX3 U1477 ( .A(n922), .Y(n1236) );
  INVX2 U1478 ( .A(n915), .Y(n1239) );
  AND2X2 U1479 ( .A(div_631_u_div_SumTmp_5__1__2_), .B(n967), .Y(n989) );
  OR2X2 U1480 ( .A(n1689), .B(n865), .Y(n2050) );
  AOI221X1 U1481 ( .A0(div_631_u_div_SumTmp_6__1__8_), .A1(n972), .B0(
        div_631_u_div_SumTmp_4__1__8_), .B1(n966), .C0(n1583), .Y(n1585) );
  OR2X1 U1482 ( .A(n852), .B(n1538), .Y(div_631_u_div_PartRem_2__6_) );
  OR2X2 U1483 ( .A(n1605), .B(n1682), .Y(n1086) );
  OR2X2 U1484 ( .A(n1677), .B(n942), .Y(n2048) );
  NOR2X2 U1485 ( .A(n1615), .B(n1606), .Y(n943) );
  INVX4 U1486 ( .A(n998), .Y(n1252) );
  OR2X2 U1487 ( .A(n1677), .B(n942), .Y(div_631_u_div_PartRem_1__8_) );
  MX2X4 U1488 ( .A(n1926), .B(n1760), .S0(n1132), .Y(mult_a_0__4_) );
  NAND2BX1 U1489 ( .AN(n948), .B(n1517), .Y(n1541) );
  NAND2X1 U1490 ( .A(div_631_u_div_SumTmp_2__3__10_), .B(n1051), .Y(n1052) );
  NAND2BX4 U1491 ( .AN(n1959), .B(n1879), .Y(n1875) );
  OR2X4 U1492 ( .A(n1605), .B(n1682), .Y(n1990) );
  MXI2X2 U1493 ( .A(n1880), .B(n1027), .S0(n889), .Y(n1091) );
  OR2XL U1494 ( .A(cnn_map0[6]), .B(n1239), .Y(n936) );
  INVX3 U1495 ( .A(n1497), .Y(n1530) );
  NAND2BX4 U1496 ( .AN(n1496), .B(div_631_u_div_SumTmp_7__2__1_), .Y(n1497) );
  NAND3X1 U1497 ( .A(n1314), .B(n1350), .C(n1313), .Y(n1384) );
  INVX1 U1498 ( .A(n1351), .Y(n1313) );
  NOR2X2 U1499 ( .A(n1358), .B(n1359), .Y(n984) );
  INVX8 U1500 ( .A(div_631_u_div_CryOut_3__3_), .Y(n1316) );
  OAI32X1 U1501 ( .A0(n1299), .A1(div_631_u_div_CryOut_1__3_), .A2(n1256), 
        .B0(n1117), .B1(n1298), .Y(n1341) );
  NAND3X1 U1502 ( .A(div_631_u_div_SumTmp_2__3__1_), .B(n1101), .C(n1257), .Y(
        n1311) );
  AOI32X1 U1503 ( .A0(n1866), .A1(n1098), .A2(n1838), .B0(n901), .B1(n1010), 
        .Y(n1839) );
  OR2X4 U1504 ( .A(n867), .B(n1085), .Y(n1378) );
  OAI33X1 U1505 ( .A0(div_631_u_div_CryOut_3__3_), .A1(n1294), .A2(n1278), 
        .B0(n1253), .B1(n1906), .B2(n1299), .Y(n1085) );
  AND3X2 U1506 ( .A(n1117), .B(n1296), .C(div_631_u_div_SumTmp_6__3__7_), .Y(
        n964) );
  OR2X1 U1507 ( .A(div_631_u_div_CryOut_6__2_), .B(n1516), .Y(n1405) );
  CLKINVX4 U1508 ( .A(div_631_u_div_CryOut_5__1_), .Y(n1578) );
  AOI33X1 U1509 ( .A0(n1369), .A1(n1343), .A2(n1367), .B0(n1367), .B1(n1368), 
        .B2(n982), .Y(n2080) );
  OR3X2 U1510 ( .A(n800), .B(n860), .C(n973), .Y(n1539) );
  OAI32X1 U1511 ( .A0(div_631_u_div_CryOut_1__3_), .A1(n1117), .A2(n1312), 
        .B0(div_631_u_div_CryOut_3__3_), .B1(n1311), .Y(n1351) );
  OR2X2 U1512 ( .A(n1101), .B(n1310), .Y(n1312) );
  OR2X4 U1513 ( .A(n869), .B(n1520), .Y(div_631_u_div_PartRem_2__10_) );
  OR2X4 U1514 ( .A(n1080), .B(n991), .Y(n2071) );
  NOR2X2 U1515 ( .A(n851), .B(n1524), .Y(n991) );
  NOR2XL U1516 ( .A(n1349), .B(n1371), .Y(n987) );
  OR2X4 U1517 ( .A(n887), .B(n1101), .Y(n1318) );
  NAND2BX2 U1518 ( .AN(n1524), .B(n1532), .Y(n1525) );
  MX2X4 U1519 ( .A(n1759), .B(n1758), .S0(n952), .Y(n1926) );
  OR2X4 U1520 ( .A(n1540), .B(n1546), .Y(n2096) );
  INVX1 U1521 ( .A(n1297), .Y(n1342) );
  INVX4 U1522 ( .A(div_631_u_div_PartRem_5__4_), .Y(n1255) );
  AOI32XL U1523 ( .A0(div_631_u_div_SumTmp_3__1__6_), .A1(n1620), .A2(n990), 
        .B0(div_631_u_div_SumTmp_7__1__6_), .B1(n1645), .Y(n1600) );
  OAI221X2 U1524 ( .A0(n1214), .A1(n1213), .B0(n1212), .B1(n1211), .C0(n1210), 
        .Y(n1215) );
  AOI221X1 U1525 ( .A0(cnn_map0[28]), .A1(n1209), .B0(cnn_map0[29]), .B1(n905), 
        .C0(n1208), .Y(n1210) );
  OR2XL U1526 ( .A(n1605), .B(n1682), .Y(n1087) );
  OAI2BB1X1 U1527 ( .A0N(div_631_u_div_SumTmp_2__2__8_), .A1N(n850), .B0(n1435), .Y(n1436) );
  OR2XL U1528 ( .A(n1464), .B(n1485), .Y(n1465) );
  OR2XL U1529 ( .A(n1426), .B(n1485), .Y(n1427) );
  INVXL U1530 ( .A(n1485), .Y(n1494) );
  NOR2X1 U1531 ( .A(n1836), .B(n1835), .Y(n1100) );
  OR2X2 U1532 ( .A(n1676), .B(n1675), .Y(n1690) );
  OR3X4 U1533 ( .A(n860), .B(n800), .C(n973), .Y(n1080) );
  OAI2BB1X2 U1534 ( .A0N(n1003), .A1N(n1743), .B0(n1755), .Y(n1763) );
  CLKINVX8 U1535 ( .A(n1255), .Y(n2091) );
  AOI221X2 U1536 ( .A0(div_631_u_div_SumTmp_4__2__11_), .A1(n1474), .B0(
        div_631_u_div_SumTmp_6__2__11_), .B1(n1081), .C0(n1409), .Y(n1410) );
  INVX2 U1537 ( .A(n1406), .Y(n1475) );
  OAI221X2 U1538 ( .A0(cnn_map0[26]), .A1(n729), .B0(n904), .B1(n728), .C0(
        n1217), .Y(n1218) );
  AOI2BB2X2 U1539 ( .B0(n941), .B1(div_631_u_div_CryOut_2__2_), .A0N(n1516), 
        .A1N(n1515), .Y(n940) );
  CLKINVX8 U1540 ( .A(div_631_u_div_CryOut_6__2_), .Y(n1515) );
  OR2X4 U1541 ( .A(n1833), .B(n1832), .Y(n1828) );
  OAI211X2 U1542 ( .A0(cnn_map0[40]), .A1(n1824), .B0(n1823), .C0(n1822), .Y(
        n1832) );
  OR4X2 U1543 ( .A(n860), .B(n1544), .C(n800), .D(n1543), .Y(n2042) );
  INVX1 U1544 ( .A(div_631_u_div_CryOut_1__0_), .Y(n1992) );
  OR2X4 U1545 ( .A(n1516), .B(n1515), .Y(n1416) );
  MX2XL U1546 ( .A(ratio_result_cnn[2]), .B(n914), .S0(n1104), .Y(N554) );
  AOI32XL U1547 ( .A0(ratio_result_cnn[2]), .A1(n1997), .A2(
        div_631_u_div_CryOut_6__0_), .B0(nn_2[17]), .B1(n1996), .Y(n1991) );
  OR4X1 U1548 ( .A(n1996), .B(n1995), .C(ratio_result_cnn[2]), .D(n1994), .Y(
        n2001) );
  AOI211XL U1549 ( .A0(n1337), .A1(n1361), .B0(n1340), .C0(n1257), .Y(n1303)
         );
  CLKINVX2 U1550 ( .A(cnn_map0[38]), .Y(n1809) );
  NAND3BX2 U1551 ( .AN(n1708), .B(n1707), .C(n1706), .Y(N552) );
  OR2X4 U1552 ( .A(n1584), .B(n1594), .Y(n1663) );
  OAI31X2 U1553 ( .A0(n1657), .A1(n1655), .A2(n1577), .B0(n1573), .Y(n1594) );
  NOR2BX2 U1554 ( .AN(n1624), .B(n851), .Y(n975) );
  OAI211X2 U1555 ( .A0(n1232), .A1(n1231), .B0(n1230), .C0(n1229), .Y(n1233)
         );
  NOR2X2 U1556 ( .A(n1729), .B(n1728), .Y(n1017) );
  INVX4 U1557 ( .A(n1233), .Y(n1729) );
  AND2X2 U1558 ( .A(div_631_u_div_SumTmp_4__2__2_), .B(n1487), .Y(n927) );
  NOR2X4 U1559 ( .A(n1729), .B(n1728), .Y(n1016) );
  NOR2X2 U1560 ( .A(n1729), .B(n1728), .Y(n1018) );
  NAND2XL U1561 ( .A(cnn_map0[10]), .B(n1018), .Y(n930) );
  INVX2 U1562 ( .A(n1759), .Y(n1736) );
  CLKINVX2 U1563 ( .A(n1431), .Y(n933) );
  CLKINVXL U1564 ( .A(n1660), .Y(n1589) );
  NAND2XL U1565 ( .A(div_631_u_div_SumTmp_3__2__9_), .B(n1478), .Y(n931) );
  NAND2XL U1566 ( .A(div_631_u_div_SumTmp_5__2__9_), .B(n963), .Y(n932) );
  AND3X4 U1567 ( .A(n931), .B(n932), .C(n933), .Y(n1432) );
  AND2X1 U1568 ( .A(n1722), .B(n1719), .Y(n1734) );
  NAND2XL U1569 ( .A(div_631_u_div_SumTmp_7__2__9_), .B(n1545), .Y(n1430) );
  CLKINVX8 U1570 ( .A(n1102), .Y(n1655) );
  INVX2 U1571 ( .A(div_631_u_div_CryOut_2__0_), .Y(n1995) );
  NAND2X4 U1572 ( .A(n934), .B(n1432), .Y(div_631_u_div_PartRem_2__12_) );
  OR2X4 U1573 ( .A(n1416), .B(n1415), .Y(n1496) );
  OAI2BB1X1 U1574 ( .A0N(div_631_u_div_SumTmp_1__2__9_), .A1N(n1446), .B0(
        n1430), .Y(n1431) );
  INVX1 U1575 ( .A(n1782), .Y(n1726) );
  NOR2X2 U1576 ( .A(n1315), .B(n1360), .Y(n983) );
  CLKINVXL U1577 ( .A(n1531), .Y(n1534) );
  CLKINVX2 U1578 ( .A(div_631_u_div_SumTmp_4__3__3_), .Y(n1337) );
  CLKINVX2 U1579 ( .A(div_631_u_div_SumTmp_4__3__1_), .Y(n1349) );
  OAI22XL U1580 ( .A0(n1718), .A1(n1717), .B0(n1725), .B1(n1772), .Y(n1719) );
  CLKINVXL U1581 ( .A(n1758), .Y(n1731) );
  INVX2 U1582 ( .A(cnn_map0[32]), .Y(n1808) );
  NAND3X1 U1583 ( .A(n936), .B(n937), .C(n1237), .Y(n1240) );
  OAI211X2 U1584 ( .A0(n892), .A1(n1242), .B0(n1241), .C0(n1240), .Y(n1728) );
  NAND2BX4 U1585 ( .AN(n1366), .B(n1276), .Y(div_631_u_div_PartRem_3__10_) );
  NAND2X1 U1586 ( .A(div_631_u_div_SumTmp_4__3__7_), .B(n1315), .Y(n1329) );
  INVX1 U1587 ( .A(div_631_u_div_SumTmp_3__2__10_), .Y(n1418) );
  INVX1 U1588 ( .A(div_631_u_div_SumTmp_1__2__10_), .Y(n1419) );
  INVX1 U1589 ( .A(div_631_u_div_SumTmp_7__2__4_), .Y(n1469) );
  OAI2BB1X2 U1590 ( .A0N(n1117), .A1N(n1361), .B0(n1344), .Y(n1358) );
  CLKINVX8 U1591 ( .A(n1103), .Y(n1516) );
  NOR2XL U1592 ( .A(n1836), .B(n1835), .Y(n953) );
  MX2X2 U1593 ( .A(n1979), .B(n1893), .S0(n1131), .Y(mult_b_1__1_) );
  OAI211X2 U1594 ( .A0(cnn_map0[22]), .A1(n1807), .B0(n1806), .C0(n1805), .Y(
        n1835) );
  OAI211XL U1595 ( .A0(n881), .A1(n712), .B0(cnn_map0[15]), .C0(n861), .Y(
        n1806) );
  NAND2XL U1596 ( .A(div_631_u_div_SumTmp_1__1__6_), .B(n1648), .Y(n1601) );
  NOR2X1 U1597 ( .A(n1989), .B(n1451), .Y(n960) );
  INVX1 U1598 ( .A(div_631_u_div_SumTmp_3__3__6_), .Y(n1280) );
  INVX2 U1599 ( .A(n1442), .Y(n1519) );
  INVX1 U1600 ( .A(n1279), .Y(n1333) );
  OAI2BB1X1 U1601 ( .A0N(div_631_u_div_SumTmp_2__2__7_), .A1N(n850), .B0(n1443), .Y(n1444) );
  OR2X2 U1602 ( .A(n1550), .B(n1549), .Y(n2095) );
  OR2X1 U1603 ( .A(n1385), .B(n1384), .Y(div_631_u_div_PartRem_3__4_) );
  OR3X2 U1604 ( .A(n1331), .B(n1332), .C(n1333), .Y(n1334) );
  NAND3XL U1605 ( .A(n1102), .B(n1657), .C(div_631_u_div_SumTmp_4__1__4_), .Y(
        n1627) );
  CLKINVXL U1606 ( .A(n1103), .Y(n941) );
  MX2X1 U1607 ( .A(add_2_result[0]), .B(add_9_result[0]), .S0(n1132), .Y(
        ratio_a[0]) );
  MX2X1 U1608 ( .A(n881), .B(cnn_map0[22]), .S0(n1019), .Y(n1826) );
  OAI211X2 U1609 ( .A0(cnn_map0[29]), .A1(n905), .B0(n1218), .C0(n1219), .Y(
        n1713) );
  OAI2BB1X1 U1610 ( .A0N(cnn_map0[3]), .A1N(n895), .B0(n1228), .Y(n1229) );
  MX2X1 U1611 ( .A(nn_1[21]), .B(ratio_result_vec[5]), .S0(n1025), .Y(n773) );
  MX2X1 U1612 ( .A(nn_1[23]), .B(ratio_result_vec[7]), .S0(n1025), .Y(n775) );
  MX2X1 U1613 ( .A(nn_1[29]), .B(ratio_result_vec[5]), .S0(n1035), .Y(n781) );
  MX2X1 U1614 ( .A(nn_1[31]), .B(ratio_result_vec[7]), .S0(n1035), .Y(n783) );
  MX2X1 U1615 ( .A(nn_1[22]), .B(ratio_result_vec[6]), .S0(n1025), .Y(n774) );
  MX2X1 U1616 ( .A(nn_1[30]), .B(ratio_result_vec[6]), .S0(n1035), .Y(n782) );
  MX2X1 U1617 ( .A(nn_1[19]), .B(ratio_result_vec[3]), .S0(n1025), .Y(n771) );
  MX2X1 U1618 ( .A(nn_1[27]), .B(ratio_result_vec[3]), .S0(n1035), .Y(n779) );
  MX2X1 U1619 ( .A(nn_1[20]), .B(ratio_result_vec[4]), .S0(n1025), .Y(n772) );
  MX2X1 U1620 ( .A(nn_1[28]), .B(ratio_result_vec[4]), .S0(n1035), .Y(n780) );
  MX2X1 U1621 ( .A(nn_2[29]), .B(ratio_result_vec[5]), .S0(n1997), .Y(n636) );
  MX2X1 U1622 ( .A(nn_2[31]), .B(ratio_result_vec[7]), .S0(n1997), .Y(n638) );
  MX2X1 U1623 ( .A(nn_2[30]), .B(ratio_result_vec[6]), .S0(n1997), .Y(n637) );
  MX2X1 U1624 ( .A(nn_2[27]), .B(ratio_result_vec[3]), .S0(n1997), .Y(n634) );
  MX2X1 U1625 ( .A(nn_2[28]), .B(ratio_result_vec[4]), .S0(n1997), .Y(n635) );
  OR2XL U1626 ( .A(n855), .B(n1519), .Y(n939) );
  OR2X1 U1627 ( .A(n1680), .B(n956), .Y(n2025) );
  OR2X4 U1628 ( .A(n1380), .B(n1379), .Y(n2011) );
  OR2XL U1629 ( .A(n855), .B(n1519), .Y(n2031) );
  AOI221X2 U1630 ( .A0(div_631_u_div_SumTmp_1__1__7_), .A1(n1648), .B0(
        div_631_u_div_SumTmp_7__1__7_), .B1(n1589), .C0(n1588), .Y(n1590) );
  OR2X4 U1631 ( .A(n1518), .B(n870), .Y(n2054) );
  CLKINVXL U1632 ( .A(n1329), .Y(n1272) );
  OR2X1 U1633 ( .A(n1698), .B(n977), .Y(n2058) );
  OR2XL U1634 ( .A(n1693), .B(n978), .Y(n2038) );
  OR2X1 U1635 ( .A(n1698), .B(n977), .Y(n2037) );
  OR2XL U1636 ( .A(n974), .B(n1691), .Y(n2017) );
  OR2X1 U1637 ( .A(n962), .B(n1551), .Y(n2024) );
  CLKINVXL U1638 ( .A(n987), .Y(n1048) );
  CLKINVXL U1639 ( .A(n848), .Y(n1343) );
  NOR2X1 U1640 ( .A(n1342), .B(n848), .Y(n982) );
  OR2X4 U1641 ( .A(n1378), .B(n1377), .Y(n2010) );
  AND2X1 U1642 ( .A(div_631_u_div_SumTmp_3__2__1_), .B(n1495), .Y(n1498) );
  OAI2BB1X2 U1643 ( .A0N(div_631_u_div_SumTmp_5__1__7_), .A1N(n968), .B0(n1587), .Y(n1588) );
  OR2X4 U1644 ( .A(n1549), .B(n1541), .Y(n2016) );
  INVX1 U1645 ( .A(n1600), .Y(n1676) );
  NAND2XL U1646 ( .A(div_631_u_div_SumTmp_5__2__3_), .B(n961), .Y(n1477) );
  OR3X4 U1647 ( .A(n995), .B(n1382), .C(n1381), .Y(n2040) );
  OR2XL U1648 ( .A(n1678), .B(n946), .Y(n2029) );
  NOR2X1 U1649 ( .A(n1597), .B(n1599), .Y(n970) );
  CLKINVXL U1650 ( .A(n1353), .Y(n1356) );
  CLKINVXL U1651 ( .A(n1370), .Y(n1372) );
  OR2X4 U1652 ( .A(n985), .B(n1374), .Y(n1381) );
  OAI2BB1X1 U1653 ( .A0N(div_631_u_div_SumTmp_2__1__5_), .A1N(n1635), .B0(
        n1613), .Y(n1614) );
  NOR2XL U1654 ( .A(n1302), .B(n1316), .Y(n986) );
  OAI221XL U1655 ( .A0(n1611), .A1(n1610), .B0(n1609), .B1(n1608), .C0(n1607), 
        .Y(n1677) );
  INVX1 U1656 ( .A(div_631_u_div_SumTmp_7__1__5_), .Y(n1608) );
  INVXL U1657 ( .A(div_631_u_div_SumTmp_1__1__5_), .Y(n1610) );
  AOI32XL U1658 ( .A0(n1617), .A1(div_631_u_div_CryOut_6__1_), .A2(
        div_631_u_div_SumTmp_7__1__8_), .B0(div_631_u_div_SumTmp_1__1__8_), 
        .B1(n1648), .Y(n1580) );
  INVX1 U1659 ( .A(n1361), .Y(n1340) );
  OR2XL U1660 ( .A(n1541), .B(n1549), .Y(n2075) );
  OR3XL U1661 ( .A(n1382), .B(n1381), .C(n995), .Y(n2070) );
  NAND2X1 U1662 ( .A(n1619), .B(n1618), .Y(n1691) );
  AND3X2 U1663 ( .A(div_631_u_div_SumTmp_3__1__3_), .B(n990), .C(n958), .Y(
        n945) );
  CLKINVXL U1664 ( .A(n1620), .Y(n1626) );
  CLKINVX2 U1665 ( .A(div_631_u_div_SumTmp_1__3__2_), .Y(n1307) );
  CLKINVX8 U1666 ( .A(div_631_u_div_CryOut_6__1_), .Y(n1657) );
  INVXL U1667 ( .A(div_631_u_div_SumTmp_2__3__3_), .Y(n1301) );
  INVXL U1668 ( .A(n1325), .Y(n1327) );
  AND2X2 U1669 ( .A(div_631_u_div_SumTmp_6__2__1_), .B(n1475), .Y(n1533) );
  CLKINVXL U1670 ( .A(ratio_a[6]), .Y(n1505) );
  CLKINVXL U1671 ( .A(ratio_a[8]), .Y(n1482) );
  NOR2X1 U1672 ( .A(n1336), .B(n1335), .Y(n993) );
  AND2X2 U1673 ( .A(n1509), .B(n1508), .Y(n948) );
  OAI2BB1X1 U1674 ( .A0N(div_631_u_div_SumTmp_2__2__10_), .A1N(n850), .B0(
        n1423), .Y(n1424) );
  CLKINVX4 U1675 ( .A(div_631_u_div_CryOut_2__1_), .Y(n1572) );
  INVX1 U1676 ( .A(div_631_u_div_SumTmp_3__3__10_), .Y(n1261) );
  INVX1 U1677 ( .A(n1631), .Y(n1672) );
  INVX1 U1678 ( .A(div_631_u_div_SumTmp_6__1__4_), .Y(n1629) );
  CLKINVXL U1679 ( .A(ratio_a[10]), .Y(n1310) );
  BUFX12 U1680 ( .A(ratio_result_cnn[5]), .Y(n1102) );
  CLKINVXL U1681 ( .A(ratio_a[7]), .Y(n1489) );
  NOR2BX4 U1682 ( .AN(n1769), .B(n1763), .Y(n1004) );
  CLKINVXL U1683 ( .A(n1138), .Y(n1134) );
  CLKINVXL U1684 ( .A(n1137), .Y(n1135) );
  MX2X4 U1685 ( .A(n1922), .B(n1746), .S0(n1132), .Y(mult_a_0__6_) );
  CLKINVXL U1686 ( .A(n1857), .Y(n1852) );
  NOR2X4 U1687 ( .A(n1836), .B(n1835), .Y(n1019) );
  MX2X2 U1688 ( .A(n1011), .B(n1848), .S0(n1132), .Y(mult_a_1__4_) );
  CLKINVXL U1689 ( .A(n1030), .Y(n1096) );
  MX2X2 U1690 ( .A(n1920), .B(n1243), .S0(n1132), .Y(mult_a_0__7_) );
  MX2X2 U1691 ( .A(n1953), .B(n1793), .S0(n1132), .Y(mult_b_0__0_) );
  MX2XL U1692 ( .A(n1968), .B(n1967), .S0(n1981), .Y(weight_sel[15]) );
  MX2XL U1693 ( .A(n1940), .B(n1939), .S0(n1981), .Y(weight_sel[7]) );
  MX2XL U1694 ( .A(n1980), .B(n1979), .S0(n1981), .Y(weight_sel[9]) );
  MX2XL U1695 ( .A(n1952), .B(n1951), .S0(n1981), .Y(weight_sel[1]) );
  MX2XL U1696 ( .A(n1944), .B(n1943), .S0(n1981), .Y(weight_sel[5]) );
  MX2XL U1697 ( .A(n1972), .B(n1971), .S0(n1981), .Y(weight_sel[13]) );
  MX2XL U1698 ( .A(n1983), .B(n1982), .S0(n1981), .Y(weight_sel[8]) );
  MX2XL U1699 ( .A(n1974), .B(n1973), .S0(n1981), .Y(weight_sel[12]) );
  MX2XL U1700 ( .A(n1976), .B(n1975), .S0(n1981), .Y(weight_sel[11]) );
  MX2XL U1701 ( .A(n1954), .B(n1953), .S0(n1981), .Y(weight_sel[0]) );
  MX2XL U1702 ( .A(n1948), .B(n1947), .S0(n1981), .Y(weight_sel[3]) );
  MX2XL U1703 ( .A(n1942), .B(n1941), .S0(n1981), .Y(weight_sel[6]) );
  MX2XL U1704 ( .A(n1970), .B(n1969), .S0(n1981), .Y(weight_sel[14]) );
  MX2XL U1705 ( .A(n1946), .B(n1945), .S0(n1981), .Y(weight_sel[4]) );
  MX2XL U1706 ( .A(n1978), .B(n1977), .S0(n1981), .Y(weight_sel[10]) );
  MX2XL U1707 ( .A(n1950), .B(n1949), .S0(n1981), .Y(weight_sel[2]) );
  MX2XL U1708 ( .A(n1766), .B(n1873), .S0(n1110), .Y(N194) );
  MX2XL U1709 ( .A(n1172), .B(n1171), .S0(n1108), .Y(N322) );
  MX2XL U1710 ( .A(n1773), .B(n1876), .S0(n1110), .Y(N193) );
  MX2XL U1711 ( .A(n1760), .B(n1848), .S0(n1110), .Y(N195) );
  MX2XL U1712 ( .A(n1876), .B(img0[2]), .S0(n1110), .Y(N203) );
  MX2XL U1713 ( .A(n1873), .B(img0[3]), .S0(n1110), .Y(N204) );
  MX2XL U1714 ( .A(n1848), .B(img0[4]), .S0(n1110), .Y(N205) );
  MX2XL U1715 ( .A(img0[46]), .B(n1163), .S0(n1110), .Y(N327) );
  MX2XL U1716 ( .A(n1746), .B(n1831), .S0(n1110), .Y(N197) );
  MX2XL U1717 ( .A(n1752), .B(n863), .S0(n1110), .Y(N196) );
  MX2XL U1718 ( .A(n863), .B(img0[5]), .S0(n1110), .Y(N206) );
  MX2XL U1719 ( .A(n1778), .B(n1881), .S0(n1111), .Y(N192) );
  MX2XL U1720 ( .A(n1784), .B(n1886), .S0(n1111), .Y(N191) );
  MX2XL U1721 ( .A(n1886), .B(img0[0]), .S0(n1111), .Y(N201) );
  MX2XL U1722 ( .A(n1881), .B(img0[1]), .S0(n1111), .Y(N202) );
  MX2XL U1723 ( .A(cnn_map0[11]), .B(n1781), .S0(n1911), .Y(N492) );
  MX2XL U1724 ( .A(n886), .B(n913), .S0(n1911), .Y(N536) );
  AOI2BB1XL U1725 ( .A0N(cnn_map0[5]), .A1N(n1236), .B0(n1235), .Y(n1237) );
  CLKINVX2 U1726 ( .A(cnn_map0[3]), .Y(n1223) );
  OAI22X1 U1727 ( .A0(cnn_map0[3]), .A1(n895), .B0(cnn_map0[2]), .B1(n1227), 
        .Y(n1228) );
  INVX1 U1728 ( .A(cnn_map0[37]), .Y(n1812) );
  MX2XL U1729 ( .A(nn_2[25]), .B(ratio_result_vec[1]), .S0(n1997), .Y(n632) );
  NOR3XL U1730 ( .A(n1657), .B(n1655), .C(n1577), .Y(n954) );
  OR2X4 U1731 ( .A(n954), .B(n955), .Y(n1682) );
  NOR3X2 U1732 ( .A(n868), .B(n1682), .C(n1681), .Y(n969) );
  CLKINVXL U1733 ( .A(n2055), .Y(n1581) );
  CLKINVXL U1734 ( .A(n2018), .Y(n1591) );
  OR2X1 U1735 ( .A(n1698), .B(n977), .Y(n2049) );
  OR2X1 U1736 ( .A(n974), .B(n1691), .Y(n2066) );
  NOR2X1 U1737 ( .A(n1989), .B(n1537), .Y(n959) );
  INVX2 U1738 ( .A(div_631_u_div_CryOut_7__0_), .Y(n1704) );
  OR2X1 U1739 ( .A(n1691), .B(n976), .Y(n2094) );
  NOR2X1 U1740 ( .A(n1439), .B(n1481), .Y(n961) );
  OR2X1 U1741 ( .A(n962), .B(n1551), .Y(div_631_u_div_PartRem_2__7_) );
  NOR2X1 U1742 ( .A(n1989), .B(n1537), .Y(n962) );
  INVX2 U1743 ( .A(div_631_u_div_SumTmp_7__2__5_), .Y(n1463) );
  INVX2 U1744 ( .A(div_631_u_div_SumTmp_3__2__5_), .Y(n1461) );
  AOI32XL U1745 ( .A0(n1474), .A1(div_631_u_div_CryOut_5__2_), .A2(
        div_631_u_div_SumTmp_5__2__5_), .B0(n1083), .B1(
        div_631_u_div_SumTmp_1__2__5_), .Y(n1460) );
  CLKINVXL U1746 ( .A(n1586), .Y(n1617) );
  INVX2 U1747 ( .A(n1438), .Y(n1495) );
  OR2X1 U1748 ( .A(n1551), .B(n959), .Y(n2067) );
  INVX2 U1749 ( .A(n1685), .Y(n1679) );
  OAI2BB1X1 U1750 ( .A0N(div_631_u_div_SumTmp_5__1__6_), .A1N(n968), .B0(n1601), .Y(n1675) );
  INVX2 U1751 ( .A(n1567), .Y(n1568) );
  INVX2 U1752 ( .A(n1296), .Y(n1315) );
  INVX2 U1753 ( .A(n1324), .Y(n1328) );
  OR2X1 U1754 ( .A(n1380), .B(n1379), .Y(n2082) );
  INVX2 U1755 ( .A(n1903), .Y(n1051) );
  CLKINVXL U1756 ( .A(n2052), .Y(n1464) );
  CLKINVXL U1757 ( .A(n1621), .Y(n1622) );
  INVX2 U1758 ( .A(n2060), .Y(n1448) );
  CLKINVXL U1759 ( .A(n2047), .Y(n1602) );
  CLKINVXL U1760 ( .A(n2045), .Y(n1407) );
  NOR2X1 U1761 ( .A(div_631_u_div_CryOut_6__1_), .B(n1647), .Y(n967) );
  AOI32X1 U1762 ( .A0(div_631_u_div_SumTmp_3__1__8_), .A1(n1620), .A2(n992), 
        .B0(div_631_u_div_SumTmp_5__1__8_), .B1(n967), .Y(n1579) );
  NOR2X1 U1763 ( .A(div_631_u_div_CryOut_6__1_), .B(n1561), .Y(n968) );
  INVX2 U1764 ( .A(div_631_u_div_CryOut_3__0_), .Y(n1994) );
  AOI32XL U1765 ( .A0(div_631_u_div_SumTmp_3__1__11_), .A1(n992), .A2(n1646), 
        .B0(div_631_u_div_SumTmp_5__1__11_), .B1(n968), .Y(n1557) );
  OR2X1 U1766 ( .A(n1688), .B(n1687), .Y(div_631_u_div_PartRem_1__12_) );
  OR2X1 U1767 ( .A(n1691), .B(n976), .Y(n2014) );
  OR3XL U1768 ( .A(n1679), .B(n1683), .C(n969), .Y(n2026) );
  NAND2X1 U1769 ( .A(n1669), .B(n1668), .Y(n1670) );
  NOR2X1 U1770 ( .A(div_631_u_div_CryOut_6__1_), .B(n1655), .Y(n971) );
  OR2X1 U1771 ( .A(n1678), .B(n946), .Y(n2034) );
  NOR2X1 U1772 ( .A(n1655), .B(n1657), .Y(n972) );
  OAI2BB1X1 U1773 ( .A0N(div_631_u_div_SumTmp_2__1__7_), .A1N(n1635), .B0(
        n1592), .Y(n1593) );
  OR2X1 U1774 ( .A(n1591), .B(n1646), .Y(n1592) );
  INVX2 U1775 ( .A(n1643), .Y(n1635) );
  AOI32XL U1776 ( .A0(div_631_u_div_SumTmp_3__1__5_), .A1(n1646), .A2(n990), 
        .B0(div_631_u_div_SumTmp_5__1__5_), .B1(n968), .Y(n1607) );
  NOR2X1 U1777 ( .A(n1496), .B(n1486), .Y(n973) );
  AOI32X1 U1778 ( .A0(n1089), .A1(n1655), .A2(div_631_u_div_SumTmp_2__1__4_), 
        .B0(n1626), .B1(n1625), .Y(n1628) );
  CLKINVXL U1779 ( .A(n2046), .Y(n1612) );
  NAND4XL U1780 ( .A(div_631_u_div_CryOut_3__1_), .B(n1655), .C(
        div_631_u_div_SumTmp_3__1__9_), .D(n1646), .Y(n1569) );
  AOI32XL U1781 ( .A0(div_631_u_div_SumTmp_5__1__9_), .A1(n1657), .A2(n979), 
        .B0(div_631_u_div_SumTmp_1__1__9_), .B1(n1648), .Y(n1571) );
  NOR2X1 U1782 ( .A(n1672), .B(n1671), .Y(n976) );
  OR2X2 U1783 ( .A(n1688), .B(n1687), .Y(n2061) );
  AND2X1 U1784 ( .A(div_631_u_div_SumTmp_7__2__2_), .B(n1545), .Y(n1544) );
  NOR2X1 U1785 ( .A(n1674), .B(n1663), .Y(n977) );
  NOR2X1 U1786 ( .A(n1674), .B(n1663), .Y(n978) );
  AND2X1 U1787 ( .A(div_631_u_div_SumTmp_7__2__1_), .B(n1545), .Y(n1548) );
  OR2XL U1788 ( .A(n1384), .B(n1383), .Y(n2021) );
  AOI221XL U1789 ( .A0(div_631_u_div_SumTmp_6__2__4_), .A1(n1475), .B0(
        div_631_u_div_SumTmp_4__2__4_), .B1(n1474), .C0(n1466), .Y(n1537) );
  NAND3XL U1790 ( .A(div_631_u_div_SumTmp_5__2__4_), .B(
        div_631_u_div_CryOut_5__2_), .C(n1474), .Y(n1467) );
  AOI32XL U1791 ( .A0(div_631_u_div_SumTmp_7__1__4_), .A1(
        div_631_u_div_CryOut_6__1_), .A2(n1617), .B0(
        div_631_u_div_SumTmp_1__1__4_), .B1(n1648), .Y(n1618) );
  OAI2BB1X1 U1792 ( .A0N(div_631_u_div_SumTmp_2__2__5_), .A1N(n850), .B0(n1455), .Y(n1456) );
  OR2X1 U1793 ( .A(n1454), .B(n1485), .Y(n1455) );
  INVX2 U1794 ( .A(n2040), .Y(n1454) );
  OAI2BB1X1 U1795 ( .A0N(div_631_u_div_SumTmp_2__1__6_), .A1N(n1635), .B0(
        n1603), .Y(n1604) );
  OR2X1 U1796 ( .A(n1602), .B(n1646), .Y(n1603) );
  OAI2BB1X2 U1797 ( .A0N(div_631_u_div_SumTmp_3__2__8_), .A1N(n1495), .B0(
        n1440), .Y(n1441) );
  NAND2XL U1798 ( .A(div_631_u_div_SumTmp_5__2__8_), .B(n961), .Y(n1440) );
  NAND3XL U1799 ( .A(div_631_u_div_SumTmp_3__1__10_), .B(n992), .C(n1646), .Y(
        n1685) );
  OAI31XL U1800 ( .A0(n1529), .A1(n1528), .A2(n1527), .B0(n1526), .Y(n1547) );
  INVX2 U1801 ( .A(div_631_u_div_SumTmp_3__2__1_), .Y(n1527) );
  CLKINVXL U1802 ( .A(n1276), .Y(n1082) );
  INVX2 U1803 ( .A(div_631_u_div_SumTmp_2__3__4_), .Y(n1293) );
  INVX2 U1804 ( .A(div_631_u_div_SumTmp_6__3__4_), .Y(n1295) );
  OAI22XL U1805 ( .A0(div_631_u_div_SumTmp_4__3__5_), .A1(
        div_631_u_div_CryOut_6__3_), .B0(n1117), .B1(
        div_631_u_div_CryOut_6__3_), .Y(n1286) );
  OAI22XL U1806 ( .A0(div_631_u_div_SumTmp_6__3__5_), .A1(n1361), .B0(n1117), 
        .B1(n1361), .Y(n1287) );
  INVX2 U1807 ( .A(div_631_u_div_SumTmp_4__3__9_), .Y(n1265) );
  AOI32XL U1808 ( .A0(div_631_u_div_SumTmp_2__3__9_), .A1(n1282), .A2(n1316), 
        .B0(div_631_u_div_SumTmp_1__3__9_), .B1(n1906), .Y(n1264) );
  INVX2 U1809 ( .A(n1904), .Y(n1262) );
  NAND2XL U1810 ( .A(div_631_u_div_SumTmp_1__3__8_), .B(n1906), .Y(n1271) );
  NAND3XL U1811 ( .A(div_631_u_div_SumTmp_3__3__2_), .B(n1119), .C(
        div_631_u_div_CryOut_3__3_), .Y(n1346) );
  OR2X1 U1812 ( .A(div_631_u_div_CryOut_3__3_), .B(n1294), .Y(n1903) );
  AND2X1 U1813 ( .A(n1372), .B(n1371), .Y(n1373) );
  NAND2XL U1814 ( .A(div_631_u_div_SumTmp_1__3__6_), .B(n1906), .Y(n1279) );
  AOI32XL U1815 ( .A0(div_631_u_div_CryOut_3__3_), .A1(n1282), .A2(
        div_631_u_div_SumTmp_3__3__5_), .B0(div_631_u_div_SumTmp_1__3__5_), 
        .B1(n1906), .Y(n1281) );
  NAND2XL U1816 ( .A(div_631_u_div_SumTmp_4__3__4_), .B(n1117), .Y(n1288) );
  NAND2BX1 U1817 ( .AN(div_631_u_div_CryOut_6__3_), .B(n1337), .Y(n1338) );
  INVX2 U1818 ( .A(div_631_u_div_SumTmp_1__2__11_), .Y(n1414) );
  INVX2 U1819 ( .A(div_631_u_div_SumTmp_3__2__11_), .Y(n1413) );
  AOI31XL U1820 ( .A0(n1576), .A1(n1575), .A2(n1574), .B0(n1663), .Y(n1687) );
  NAND3XL U1821 ( .A(div_631_u_div_SumTmp_4__1__9_), .B(n1102), .C(n1657), .Y(
        n1576) );
  OAI221XL U1822 ( .A0(n1089), .A1(n2043), .B0(div_631_u_div_SumTmp_2__1__10_), 
        .B1(n1572), .C0(n1655), .Y(n1565) );
  NAND3XL U1823 ( .A(div_631_u_div_SumTmp_4__1__10_), .B(n1102), .C(n1657), 
        .Y(n1566) );
  OR2X1 U1824 ( .A(n1633), .B(n1646), .Y(n1634) );
  OAI211XL U1825 ( .A0(n1630), .A1(n1629), .B0(n1628), .C0(n1627), .Y(n1631)
         );
  OR2X1 U1826 ( .A(n1482), .B(n1488), .Y(n1483) );
  INVX2 U1827 ( .A(n1525), .Y(n1543) );
  INVX2 U1828 ( .A(div_631_u_div_SumTmp_6__2__1_), .Y(n1492) );
  OAI33XL U1829 ( .A0(div_631_u_div_CryOut_3__2_), .A1(n1103), .A2(n1507), 
        .B0(div_631_u_div_CryOut_7__2_), .B1(n1516), .B2(n1515), .Y(n1508) );
  NOR2X1 U1830 ( .A(n1102), .B(n1599), .Y(n990) );
  NAND2X1 U1831 ( .A(n1650), .B(n1649), .Y(n1694) );
  AOI32XL U1832 ( .A0(n979), .A1(n1657), .A2(div_631_u_div_SumTmp_5__1__1_), 
        .B0(div_631_u_div_SumTmp_1__1__1_), .B1(n1648), .Y(n1649) );
  AOI32XL U1833 ( .A0(div_631_u_div_SumTmp_3__1__1_), .A1(n1646), .A2(n990), 
        .B0(div_631_u_div_SumTmp_7__1__1_), .B1(n1645), .Y(n1650) );
  NAND2XL U1834 ( .A(div_631_u_div_SumTmp_1__1__3_), .B(n1648), .Y(n1632) );
  OAI221XL U1835 ( .A0(n1665), .A1(n1661), .B0(n1660), .B1(n1659), .C0(n1658), 
        .Y(n1696) );
  INVX2 U1836 ( .A(div_631_u_div_SumTmp_7__1__0_), .Y(n1659) );
  NAND3XL U1837 ( .A(div_631_u_div_CryOut_3__1_), .B(n1655), .C(
        div_631_u_div_SumTmp_3__1__0_), .Y(n1661) );
  NAND2XL U1838 ( .A(div_631_u_div_SumTmp_4__2__1_), .B(n1487), .Y(n1531) );
  NOR2X1 U1839 ( .A(n1102), .B(n1599), .Y(n992) );
  INVX2 U1840 ( .A(ratio_a[5]), .Y(n1641) );
  INVX2 U1841 ( .A(div_631_u_div_SumTmp_2__1__2_), .Y(n1642) );
  OAI2BB1X1 U1842 ( .A0N(div_631_u_div_SumTmp_2__2__4_), .A1N(n850), .B0(n1465), .Y(n1466) );
  CLKINVXL U1843 ( .A(n1351), .Y(n1049) );
  OAI2BB1X1 U1844 ( .A0N(div_631_u_div_SumTmp_2__1__11_), .A1N(n1635), .B0(
        n1554), .Y(n1555) );
  OAI2BB1X1 U1845 ( .A0N(div_631_u_div_SumTmp_2__2__3_), .A1N(n850), .B0(n1472), .Y(n1473) );
  OAI2BB1X1 U1846 ( .A0N(div_631_u_div_SumTmp_2__2__9_), .A1N(n850), .B0(n1427), .Y(n1428) );
  NAND4XL U1847 ( .A(div_631_u_div_CryOut_5__2_), .B(n1515), .C(
        div_631_u_div_SumTmp_5__2__1_), .D(n1103), .Y(n1526) );
  OR2X2 U1848 ( .A(n1386), .B(n1362), .Y(n2084) );
  AOI22XL U1849 ( .A0(div_631_u_div_SumTmp_1__3__11_), .A1(n1906), .B0(
        div_631_u_div_SumTmp_3__3__11_), .B1(n986), .Y(n1907) );
  NAND3XL U1850 ( .A(div_631_u_div_SumTmp_2__3__8_), .B(n1282), .C(n1316), .Y(
        n1270) );
  NAND3XL U1851 ( .A(n1117), .B(n1905), .C(div_631_u_div_SumTmp_6__3__8_), .Y(
        n1267) );
  NAND2XL U1852 ( .A(div_631_u_div_SumTmp_4__3__8_), .B(n1315), .Y(n1268) );
  NAND3XL U1853 ( .A(n1117), .B(n1296), .C(div_631_u_div_SumTmp_6__3__3_), .Y(
        n1297) );
  INVX2 U1854 ( .A(n1345), .Y(n1374) );
  NAND2XL U1855 ( .A(div_631_u_div_SumTmp_6__3__2_), .B(n1117), .Y(n1370) );
  NOR2X1 U1856 ( .A(n1309), .B(n1346), .Y(n995) );
  INVX2 U1857 ( .A(n1299), .Y(n1284) );
  NAND2XL U1858 ( .A(div_631_u_div_SumTmp_6__3__0_), .B(n1117), .Y(n1360) );
  NAND3XL U1859 ( .A(div_631_u_div_CryOut_3__3_), .B(n1257), .C(
        div_631_u_div_SumTmp_3__3__0_), .Y(n1359) );
  INVX2 U1860 ( .A(n1112), .Y(n1111) );
  INVX2 U1861 ( .A(n1113), .Y(n1109) );
  INVX2 U1862 ( .A(n1113), .Y(n1108) );
  INVX2 U1863 ( .A(n1112), .Y(n1110) );
  INVX2 U1864 ( .A(n1113), .Y(n1107) );
  OAI2BB1X1 U1865 ( .A0N(div_631_u_div_SumTmp_2__1__1_), .A1N(n1664), .B0(
        n1652), .Y(n1653) );
  OR2XL U1866 ( .A(n1651), .B(n1620), .Y(n1652) );
  INVX2 U1867 ( .A(ratio_a[4]), .Y(n1651) );
  AOI33XL U1868 ( .A0(n1102), .A1(n1657), .A2(div_631_u_div_SumTmp_4__1__2_), 
        .B0(div_631_u_div_CryOut_6__1_), .B1(n1102), .B2(
        div_631_u_div_SumTmp_6__1__2_), .Y(n1640) );
  CLKINVXL U1869 ( .A(ratio_a[9]), .Y(n1317) );
  NAND4X1 U1870 ( .A(n1292), .B(n1291), .C(n1290), .D(n1289), .Y(n1336) );
  NAND4XL U1871 ( .A(div_631_u_div_SumTmp_3__3__4_), .B(n1118), .C(n1101), .D(
        div_631_u_div_CryOut_3__3_), .Y(n1291) );
  OR2XL U1872 ( .A(div_631_u_div_CryOut_6__3_), .B(n1288), .Y(n1289) );
  NAND3XL U1873 ( .A(n1117), .B(div_631_u_div_CryOut_6__3_), .C(
        div_631_u_div_SumTmp_6__3__1_), .Y(n1350) );
  OAI33XL U1874 ( .A0(n1307), .A1(n1101), .A2(n1306), .B0(n1101), .B1(
        div_631_u_div_CryOut_1__3_), .B2(n1305), .Y(n1308) );
  CLKINVXL U1875 ( .A(ratio_a[11]), .Y(n1305) );
  MX2XL U1876 ( .A(add_2_result[8]), .B(add_9_result[8]), .S0(n1132), .Y(
        ratio_a[8]) );
  MX2XL U1877 ( .A(add_2_result[7]), .B(add_9_result[7]), .S0(n1132), .Y(
        ratio_a[7]) );
  MX2XL U1878 ( .A(add_2_result[6]), .B(add_9_result[6]), .S0(n1132), .Y(
        ratio_a[6]) );
  MX2XL U1879 ( .A(add_2_result[5]), .B(add_9_result[5]), .S0(n1132), .Y(
        ratio_a[5]) );
  MX2XL U1880 ( .A(add_2_result[4]), .B(add_9_result[4]), .S0(n1132), .Y(
        ratio_a[4]) );
  MX2XL U1881 ( .A(add_2_result[3]), .B(add_9_result[3]), .S0(n1132), .Y(
        ratio_a[3]) );
  INVX2 U1882 ( .A(n1076), .Y(n1075) );
  INVX2 U1883 ( .A(div_631_u_div_BInv_3__3_), .Y(n1076) );
  INVX2 U1884 ( .A(n1068), .Y(n1067) );
  INVX2 U1885 ( .A(div_631_u_div_BInv_3__4_), .Y(n1068) );
  INVX2 U1886 ( .A(n1071), .Y(n1070) );
  INVX2 U1887 ( .A(div_631_u_div_BInv_3__10_), .Y(n1071) );
  INVX2 U1888 ( .A(div_631_u_div_BInv_3__12_), .Y(n1069) );
  INVX2 U1889 ( .A(n1066), .Y(n1065) );
  INVX2 U1890 ( .A(div_631_u_div_BInv_3__9_), .Y(n1066) );
  INVX2 U1891 ( .A(n1064), .Y(n1063) );
  INVX2 U1892 ( .A(div_631_u_div_BInv_6__5_), .Y(n1064) );
  INVX2 U1893 ( .A(n1073), .Y(n1072) );
  INVX2 U1894 ( .A(div_631_u_div_BInv_6__4_), .Y(n1073) );
  INVX2 U1895 ( .A(n1078), .Y(n1077) );
  INVX2 U1896 ( .A(div_631_u_div_BInv_6__9_), .Y(n1078) );
  INVX2 U1897 ( .A(n1060), .Y(n1059) );
  INVX2 U1898 ( .A(div_631_u_div_BInv_6__10_), .Y(n1060) );
  INVX2 U1899 ( .A(n1913), .Y(n1112) );
  INVX2 U1900 ( .A(n1062), .Y(n1061) );
  INVX2 U1901 ( .A(div_631_u_div_BInv_6__11_), .Y(n1062) );
  INVX2 U1902 ( .A(n1913), .Y(n1113) );
  INVX2 U1903 ( .A(div_631_u_div_BInv_5__13_), .Y(n1058) );
  MX2XL U1904 ( .A(add_2_result[2]), .B(add_9_result[2]), .S0(n1132), .Y(
        ratio_a[2]) );
  INVX2 U1905 ( .A(div_631_u_div_BInv_5__13_), .Y(n1074) );
  MX2XL U1906 ( .A(add_2_result[1]), .B(add_9_result[1]), .S0(n1132), .Y(
        ratio_a[1]) );
  INVX2 U1907 ( .A(n1057), .Y(n1056) );
  INVX2 U1908 ( .A(div_631_u_div_BInv_5__10_), .Y(n1057) );
  INVX2 U1909 ( .A(n1121), .Y(n1120) );
  INVX2 U1910 ( .A(div_631_u_div_BInv_7__4_), .Y(n1121) );
  INVX2 U1911 ( .A(n1121), .Y(n1122) );
  INVX2 U1912 ( .A(n1246), .Y(n1247) );
  NOR2BXL U1913 ( .AN(n1246), .B(add_2_result[15]), .Y(n999) );
  NOR2BXL U1914 ( .AN(n1246), .B(add_2_result[16]), .Y(n1000) );
  INVX2 U1915 ( .A(n1130), .Y(n1129) );
  INVX2 U1916 ( .A(div_631_u_div_BInv_3__0_), .Y(n1130) );
  INVX2 U1917 ( .A(n1126), .Y(n1125) );
  INVX2 U1918 ( .A(div_631_u_div_BInv_6__1_), .Y(n1126) );
  INVX2 U1919 ( .A(n2100), .Y(n1913) );
  INVX2 U1920 ( .A(n1128), .Y(n1127) );
  INVX2 U1921 ( .A(div_631_u_div_BInv_3__11_), .Y(n1128) );
  INVX2 U1922 ( .A(n1140), .Y(n1139) );
  INVX2 U1923 ( .A(div_631_u_div_BInv_7__0_), .Y(n1140) );
  INVX2 U1924 ( .A(n1142), .Y(n1141) );
  INVX2 U1925 ( .A(div_631_u_div_BInv_5__0_), .Y(n1142) );
  INVX2 U1926 ( .A(n1124), .Y(n1123) );
  INVX2 U1927 ( .A(div_631_u_div_BInv_6__12_), .Y(n1124) );
  INVX2 U1928 ( .A(n1106), .Y(n1104) );
  INVX2 U1929 ( .A(n1106), .Y(n1105) );
  INVX2 U1930 ( .A(n1776), .Y(n1723) );
  AND2X1 U1931 ( .A(ratio_result_cnn[2]), .B(n1997), .Y(n1998) );
  OR2X1 U1932 ( .A(n1826), .B(n1857), .Y(n1956) );
  INVX2 U1933 ( .A(n1137), .Y(n1246) );
  MXI2XL U1934 ( .A(n1010), .B(n1960), .S0(n1959), .Y(n1006) );
  INVX2 U1935 ( .A(n1938), .Y(n1981) );
  OAI2BB1X1 U1936 ( .A0N(n1937), .A1N(n1936), .B0(n1935), .Y(n1938) );
  INVX2 U1937 ( .A(n1936), .Y(n1398) );
  INVX2 U1938 ( .A(n2005), .Y(n1914) );
  NOR2X1 U1939 ( .A(n2141), .B(n1201), .Y(n1007) );
  INVX2 U1940 ( .A(n1007), .Y(n2100) );
  NOR2X1 U1941 ( .A(n1898), .B(n1897), .Y(n1008) );
  INVX2 U1942 ( .A(n1911), .Y(n1106) );
  CLKINVXL U1943 ( .A(n1874), .Y(n1093) );
  INVX2 U1944 ( .A(n1096), .Y(n1094) );
  INVX2 U1945 ( .A(n1745), .Y(n1741) );
  NOR2X4 U1946 ( .A(n1714), .B(n1713), .Y(n1012) );
  MX2X1 U1947 ( .A(n1745), .B(n1744), .S0(n1004), .Y(n1922) );
  MX2X1 U1948 ( .A(n881), .B(cnn_map0[22]), .S0(n1019), .Y(n1853) );
  MX2X1 U1949 ( .A(n1977), .B(n1892), .S0(n1131), .Y(mult_b_1__2_) );
  MX2X1 U1950 ( .A(n1951), .B(n1792), .S0(n1132), .Y(mult_b_0__1_) );
  MX2X1 U1951 ( .A(n1975), .B(n1891), .S0(n1132), .Y(mult_b_1__3_) );
  MX2XL U1952 ( .A(n1932), .B(n1931), .S0(n1131), .Y(nn_a[1]) );
  MX2X1 U1953 ( .A(n1949), .B(n1791), .S0(n1132), .Y(mult_b_0__2_) );
  MX2XL U1954 ( .A(n1091), .B(n1965), .S0(n1131), .Y(nn_b[1]) );
  MX2XL U1955 ( .A(n1097), .B(n1966), .S0(n1132), .Y(nn_b[0]) );
  MX2X1 U1956 ( .A(n1947), .B(n1790), .S0(n1132), .Y(mult_b_0__3_) );
  MX2XL U1957 ( .A(n1934), .B(n1933), .S0(n1131), .Y(nn_a[0]) );
  MX2X1 U1958 ( .A(n1945), .B(n1789), .S0(n1132), .Y(mult_b_0__4_) );
  MX2X1 U1959 ( .A(n1971), .B(n1889), .S0(n1132), .Y(mult_b_1__5_) );
  MX2X1 U1960 ( .A(n1973), .B(n1890), .S0(n1132), .Y(mult_b_1__4_) );
  MX2X1 U1961 ( .A(n1943), .B(n1788), .S0(n1132), .Y(mult_b_0__5_) );
  MX2XL U1962 ( .A(n1095), .B(n1964), .S0(n1131), .Y(nn_b[2]) );
  MX2X1 U1963 ( .A(n1969), .B(n1888), .S0(n1132), .Y(mult_b_1__6_) );
  MX2XL U1964 ( .A(n1928), .B(n1927), .S0(n1131), .Y(nn_a[3]) );
  MX2X1 U1965 ( .A(n1939), .B(n1786), .S0(n1132), .Y(mult_b_0__7_) );
  MX2X1 U1966 ( .A(n1941), .B(n1787), .S0(n1132), .Y(mult_b_0__6_) );
  MX2XL U1967 ( .A(n1930), .B(n1929), .S0(n1131), .Y(nn_a[2]) );
  MX2X1 U1968 ( .A(n1967), .B(n1887), .S0(n1132), .Y(mult_b_1__7_) );
  MX2X1 U1969 ( .A(n1006), .B(n1961), .S0(n1131), .Y(nn_b[5]) );
  CLKINVXL U1970 ( .A(div_631_b_3_), .Y(n1138) );
  MX2XL U1971 ( .A(n912), .B(n1962), .S0(n1131), .Y(nn_b[4]) );
  MX2XL U1972 ( .A(n1102), .B(n1834), .S0(n1911), .Y(N557) );
  MX2XL U1973 ( .A(n859), .B(n1957), .S0(n1131), .Y(nn_b[6]) );
  MX2XL U1974 ( .A(n1956), .B(n1955), .S0(n1131), .Y(nn_b[7]) );
  OR2X1 U1975 ( .A(n1984), .B(n2007), .Y(n1936) );
  INVX2 U1976 ( .A(n1392), .Y(n1935) );
  MX2XL U1977 ( .A(n1920), .B(n1919), .S0(n1131), .Y(nn_a[7]) );
  INVX2 U1978 ( .A(n1986), .Y(n1937) );
  OR2X1 U1979 ( .A(n1900), .B(n1393), .Y(n2005) );
  MX2XL U1980 ( .A(n1084), .B(n1910), .S0(n1105), .Y(N559) );
  OAI31XL U1981 ( .A0(n1143), .A1(n2006), .A2(n1159), .B0(n1987), .Y(n2141) );
  INVX2 U1982 ( .A(n1785), .Y(n1143) );
  MX2XL U1983 ( .A(n1965), .B(n1091), .S0(n875), .Y(N571) );
  MX2XL U1984 ( .A(n1966), .B(n1097), .S0(n875), .Y(N570) );
  MX2XL U1985 ( .A(n1964), .B(n1095), .S0(n875), .Y(N572) );
  MX2XL U1986 ( .A(n1933), .B(n1934), .S0(n875), .Y(N562) );
  MX2XL U1987 ( .A(n1931), .B(n1932), .S0(n875), .Y(N563) );
  MX2XL U1988 ( .A(n1929), .B(n1930), .S0(n875), .Y(N564) );
  MX2XL U1989 ( .A(n1927), .B(n1928), .S0(n875), .Y(N565) );
  MX2XL U1990 ( .A(n1923), .B(n1924), .S0(n875), .Y(N567) );
  MX2XL U1991 ( .A(n1919), .B(n1920), .S0(n875), .Y(N569) );
  MX2XL U1992 ( .A(n1955), .B(n1956), .S0(n875), .Y(N577) );
  MX2XL U1993 ( .A(n1961), .B(n1006), .S0(n875), .Y(N575) );
  MX2XL U1994 ( .A(n1957), .B(n859), .S0(n875), .Y(N576) );
  MX2XL U1995 ( .A(n1962), .B(n912), .S0(n875), .Y(N574) );
  INVX2 U1996 ( .A(next_state_0_), .Y(n1201) );
  NOR2X1 U1997 ( .A(n2004), .B(n1898), .Y(n1020) );
  NOR2X1 U1998 ( .A(n2004), .B(n1896), .Y(n1021) );
  NOR2X1 U1999 ( .A(n1897), .B(n1896), .Y(n1022) );
  INVX2 U2000 ( .A(n1148), .Y(n1158) );
  OAI31X1 U2001 ( .A0(n1986), .A1(n1390), .A2(n1936), .B0(n1111), .Y(n1148) );
  AND2X1 U2002 ( .A(n1158), .B(n2007), .Y(cnt_comb[0]) );
  AND2X1 U2003 ( .A(n1158), .B(n1157), .Y(cnt_comb[5]) );
  XOR2X1 U2004 ( .A(n1390), .B(n1156), .Y(n1157) );
  OR2X1 U2005 ( .A(n2005), .B(n1155), .Y(n1156) );
  MX2X2 U2006 ( .A(img0[8]), .B(img0[16]), .S0(n1109), .Y(N251) );
  MX2X2 U2007 ( .A(img0[16]), .B(img0[24]), .S0(n1109), .Y(N261) );
  MX2X2 U2008 ( .A(img0[24]), .B(n1198), .S0(n1109), .Y(N271) );
  MX2X2 U2009 ( .A(img0[32]), .B(n1174), .S0(n1107), .Y(N311) );
  MX2X2 U2010 ( .A(n1174), .B(img0[48]), .S0(n1107), .Y(N321) );
  MX2X2 U2011 ( .A(img0[9]), .B(img0[17]), .S0(n1109), .Y(N252) );
  MX2X2 U2012 ( .A(img0[17]), .B(img0[25]), .S0(n1109), .Y(N262) );
  MX2X2 U2013 ( .A(img0[25]), .B(n1195), .S0(n1109), .Y(N272) );
  MX2X2 U2014 ( .A(img0[33]), .B(n1172), .S0(n1107), .Y(N312) );
  MX2X2 U2015 ( .A(img0[2]), .B(n1768), .S0(n1110), .Y(N213) );
  MX2X2 U2016 ( .A(img0[10]), .B(img0[18]), .S0(n1109), .Y(N253) );
  MX2X2 U2017 ( .A(img0[18]), .B(img0[26]), .S0(n1108), .Y(N263) );
  MX2X2 U2018 ( .A(img0[26]), .B(n1192), .S0(n1108), .Y(N273) );
  MX2X2 U2019 ( .A(img0[34]), .B(img0[42]), .S0(n1109), .Y(N313) );
  MX2X2 U2020 ( .A(img0[42]), .B(img0[49]), .S0(n1109), .Y(N323) );
  MX2X2 U2021 ( .A(img0[3]), .B(n1762), .S0(n1109), .Y(N214) );
  MX2X2 U2022 ( .A(img0[11]), .B(img0[19]), .S0(n1108), .Y(N254) );
  MX2X2 U2023 ( .A(img0[19]), .B(img0[27]), .S0(n1108), .Y(N264) );
  MX2X2 U2024 ( .A(img0[27]), .B(n1189), .S0(n1108), .Y(N274) );
  MX2X2 U2025 ( .A(img0[35]), .B(n1168), .S0(n1108), .Y(N314) );
  MX2X2 U2026 ( .A(n1168), .B(img0[50]), .S0(n1109), .Y(N324) );
  MX2X2 U2027 ( .A(img0[4]), .B(n1754), .S0(n1110), .Y(N215) );
  MX2X2 U2028 ( .A(img0[12]), .B(img0[20]), .S0(n1108), .Y(N255) );
  MX2X2 U2029 ( .A(img0[20]), .B(img0[28]), .S0(n1108), .Y(N265) );
  MX2X2 U2030 ( .A(img0[28]), .B(n1186), .S0(n1109), .Y(N275) );
  MX2X2 U2031 ( .A(img0[36]), .B(img0[44]), .S0(n1108), .Y(N315) );
  MX2X2 U2032 ( .A(img0[44]), .B(n888), .S0(n1107), .Y(N325) );
  MX2X2 U2033 ( .A(img0[5]), .B(n1748), .S0(n1110), .Y(N216) );
  MX2X2 U2034 ( .A(img0[21]), .B(img0[29]), .S0(n1108), .Y(N266) );
  MX2X2 U2035 ( .A(img0[29]), .B(n1183), .S0(n1109), .Y(N276) );
  MX2X2 U2036 ( .A(img0[37]), .B(n1165), .S0(n1108), .Y(N316) );
  MX2X2 U2037 ( .A(n1165), .B(img0[51]), .S0(n1110), .Y(N326) );
  MX2X2 U2038 ( .A(n1831), .B(img0[6]), .S0(n1110), .Y(N207) );
  MX2X2 U2039 ( .A(img0[6]), .B(n1245), .S0(n1110), .Y(N217) );
  MX2X2 U2040 ( .A(img0[14]), .B(img0[22]), .S0(n1108), .Y(N257) );
  MX2X2 U2041 ( .A(img0[22]), .B(img0[30]), .S0(n1108), .Y(N267) );
  MX2X2 U2042 ( .A(img0[30]), .B(n1180), .S0(n1110), .Y(N277) );
  MX2X2 U2043 ( .A(img0[38]), .B(img0[46]), .S0(n1107), .Y(N317) );
  MX2XL U2044 ( .A(n1243), .B(n1825), .S0(n1110), .Y(N198) );
  MX2XL U2045 ( .A(n1825), .B(img0[7]), .S0(n1110), .Y(N208) );
  MX2X2 U2046 ( .A(img0[7]), .B(n1203), .S0(n1110), .Y(N218) );
  MX2X2 U2047 ( .A(img0[15]), .B(img0[23]), .S0(n1107), .Y(N258) );
  MX2X2 U2048 ( .A(img0[23]), .B(img0[31]), .S0(n1107), .Y(N268) );
  MX2X2 U2049 ( .A(img0[31]), .B(n1177), .S0(n1107), .Y(N278) );
  MX2X2 U2050 ( .A(img0[39]), .B(img0[47]), .S0(n1109), .Y(N318) );
  MX2X2 U2051 ( .A(img0[47]), .B(img0[52]), .S0(n1108), .Y(N328) );
  MX2X2 U2052 ( .A(img0[0]), .B(n1780), .S0(n1111), .Y(N211) );
  MX2X2 U2053 ( .A(img0[1]), .B(n1775), .S0(n1111), .Y(N212) );
  NOR3X1 U2054 ( .A(n2100), .B(n1785), .C(n2140), .Y(n1023) );
  NOR3BX1 U2055 ( .AN(n2141), .B(n1201), .C(n1200), .Y(n1024) );
  OR2X1 U2056 ( .A(n1937), .B(n1390), .Y(n1402) );
  INVX2 U2057 ( .A(n1395), .Y(n1401) );
  OAI211X1 U2058 ( .A0(n1901), .A1(n2005), .B0(n1935), .C0(n1394), .Y(n1395)
         );
  INVX2 U2059 ( .A(n1703), .Y(n1911) );
  INVX2 U2060 ( .A(n2006), .Y(n1916) );
  OR2X1 U2061 ( .A(n1936), .B(n1895), .Y(n1155) );
  OR2X1 U2062 ( .A(n1900), .B(n1155), .Y(n1153) );
  INVX2 U2063 ( .A(n1901), .Y(n1400) );
  MX2XL U2064 ( .A(n1861), .B(n1721), .S0(n1105), .Y(N493) );
  MX2XL U2065 ( .A(n1860), .B(n1861), .S0(n1911), .Y(N503) );
  MX2XL U2066 ( .A(n1720), .B(n1860), .S0(n1104), .Y(N513) );
  MX2XL U2067 ( .A(n854), .B(n910), .S0(n1911), .Y(N494) );
  MX2XL U2068 ( .A(n1851), .B(n854), .S0(n1104), .Y(N504) );
  MX2XL U2069 ( .A(n1716), .B(n1851), .S0(n1911), .Y(N514) );
  MX2XL U2070 ( .A(n1850), .B(n894), .S0(n1911), .Y(N495) );
  MX2XL U2071 ( .A(n1849), .B(n1850), .S0(n1105), .Y(N505) );
  MX2XL U2072 ( .A(n1715), .B(n1849), .S0(n1911), .Y(N515) );
  MX2XL U2073 ( .A(cnn_map0[20]), .B(cnn_map0[13]), .S0(n1105), .Y(N506) );
  MX2XL U2074 ( .A(n1837), .B(cnn_map0[14]), .S0(n1105), .Y(N507) );
  MX2XL U2075 ( .A(n917), .B(n1837), .S0(n1105), .Y(N517) );
  MX2XL U2076 ( .A(n881), .B(n892), .S0(n1105), .Y(N499) );
  MX2XL U2077 ( .A(cnn_map0[22]), .B(n881), .S0(n1105), .Y(N509) );
  MX2XL U2078 ( .A(n1709), .B(cnn_map0[22]), .S0(n1105), .Y(N519) );
  MX2XL U2079 ( .A(n1910), .B(n897), .S0(n1105), .Y(N549) );
  MX2XL U2080 ( .A(n903), .B(n1716), .S0(n1104), .Y(N524) );
  MX2XL U2081 ( .A(n862), .B(n903), .S0(n1911), .Y(N534) );
  MX2XL U2082 ( .A(n899), .B(n1715), .S0(n1911), .Y(N525) );
  MX2XL U2083 ( .A(cnn_map0[32]), .B(n899), .S0(n1104), .Y(N535) );
  MX2XL U2084 ( .A(cnn_map0[29]), .B(n1709), .S0(n1105), .Y(N529) );
  MX2XL U2085 ( .A(n908), .B(n917), .S0(n1911), .Y(N527) );
  MX2XL U2086 ( .A(cnn_map0[33]), .B(n908), .S0(n1911), .Y(N537) );
  MX2XL U2087 ( .A(n1834), .B(cnn_map0[33]), .S0(n1911), .Y(N547) );
  MX2XL U2088 ( .A(cnn_map0[15]), .B(n915), .S0(n1911), .Y(N498) );
  MX2XL U2089 ( .A(cnn_map0[21]), .B(cnn_map0[15]), .S0(n1911), .Y(N508) );
  MX2XL U2090 ( .A(n911), .B(n1720), .S0(n1104), .Y(N523) );
  MX2XL U2091 ( .A(cnn_map0[31]), .B(n911), .S0(n1104), .Y(N533) );
  MX2XL U2092 ( .A(cnn_map0[34]), .B(n1710), .S0(n1104), .Y(N538) );
  MX2XL U2093 ( .A(n897), .B(cnn_map0[29]), .S0(n1104), .Y(N539) );
  MX2XL U2094 ( .A(cnn_map0[14]), .B(n1730), .S0(n1911), .Y(N497) );
  NOR2X1 U2095 ( .A(n2007), .B(n1988), .Y(n1025) );
  NOR3XL U2096 ( .A(n2009), .B(n2007), .C(n2008), .Y(n1026) );
  INVX2 U2097 ( .A(n1912), .Y(n1915) );
  INVX2 U2098 ( .A(n1996), .Y(n1997) );
  OR2X1 U2099 ( .A(n1984), .B(n1895), .Y(n1897) );
  INVX2 U2100 ( .A(n1882), .Y(n1885) );
  MXI2X1 U2101 ( .A(n1028), .B(n1029), .S0(n1104), .Y(N553) );
  MXI2XL U2102 ( .A(div_631_u_div_CryOut_2__0_), .B(div_631_u_div_CryOut_6__0_), .S0(ratio_result_cnn[2]), .Y(n1028) );
  OAI2BB2X1 U2103 ( .B0(cnn_map0[32]), .B1(n1812), .A0N(n741), .A1N(n914), .Y(
        n1811) );
  MX2X1 U2104 ( .A(cnn_map0[0]), .B(n1781), .S0(n1018), .Y(n1783) );
  NAND4X1 U2105 ( .A(n2003), .B(n2002), .C(n2001), .D(n2000), .Y(n623) );
  OR2X1 U2106 ( .A(n1997), .B(n1993), .Y(n2002) );
  MX2X1 U2107 ( .A(cnn_map0[5]), .B(n1730), .S0(n1018), .Y(n1031) );
  MX2X2 U2108 ( .A(cnn_map0[5]), .B(n1730), .S0(n1018), .Y(n1751) );
  MX2XL U2109 ( .A(nn_2[18]), .B(ratio_result_cnn[2]), .S0(n1997), .Y(n625) );
  OAI211X1 U2110 ( .A0(n1800), .A1(n1799), .B0(n1798), .C0(n1797), .Y(n1801)
         );
  OAI2BB2X1 U2111 ( .B0(cnn_map0[12]), .B1(n716), .A0N(n709), .A1N(
        cnn_map0[18]), .Y(n1796) );
  MX2X1 U2112 ( .A(cnn_map0[11]), .B(cnn_map0[16]), .S0(n1019), .Y(n1882) );
  MX2XL U2113 ( .A(nn_2[5]), .B(ratio_result_vec[5]), .S0(n1036), .Y(n757) );
  MX2XL U2114 ( .A(nn_2[13]), .B(ratio_result_vec[5]), .S0(n1026), .Y(n765) );
  MX2XL U2115 ( .A(nn_1[5]), .B(ratio_result_vec[5]), .S0(n1037), .Y(n789) );
  MX2XL U2116 ( .A(nn_1[13]), .B(ratio_result_vec[5]), .S0(n1038), .Y(n797) );
  MX2XL U2117 ( .A(nn_2[7]), .B(ratio_result_vec[7]), .S0(n1036), .Y(n759) );
  MX2XL U2118 ( .A(nn_2[15]), .B(ratio_result_vec[7]), .S0(n1026), .Y(n767) );
  MX2XL U2119 ( .A(nn_1[7]), .B(ratio_result_vec[7]), .S0(n1037), .Y(n791) );
  MX2XL U2120 ( .A(nn_1[15]), .B(ratio_result_vec[7]), .S0(n1038), .Y(n799) );
  MX2XL U2121 ( .A(nn_2[6]), .B(ratio_result_vec[6]), .S0(n1036), .Y(n758) );
  MX2XL U2122 ( .A(nn_2[14]), .B(ratio_result_vec[6]), .S0(n1026), .Y(n766) );
  MX2XL U2123 ( .A(nn_1[6]), .B(ratio_result_vec[6]), .S0(n1037), .Y(n790) );
  MX2XL U2124 ( .A(nn_1[14]), .B(ratio_result_vec[6]), .S0(n1038), .Y(n798) );
  MX2XL U2125 ( .A(nn_2[3]), .B(ratio_result_vec[3]), .S0(n1036), .Y(n755) );
  MX2XL U2126 ( .A(nn_2[11]), .B(ratio_result_vec[3]), .S0(n1026), .Y(n763) );
  MX2XL U2127 ( .A(nn_1[3]), .B(ratio_result_vec[3]), .S0(n1037), .Y(n787) );
  MX2XL U2128 ( .A(nn_1[11]), .B(ratio_result_vec[3]), .S0(n1038), .Y(n795) );
  MX2XL U2129 ( .A(nn_2[4]), .B(ratio_result_vec[4]), .S0(n1036), .Y(n756) );
  MX2XL U2130 ( .A(nn_2[12]), .B(ratio_result_vec[4]), .S0(n1026), .Y(n764) );
  MX2XL U2131 ( .A(nn_1[4]), .B(ratio_result_vec[4]), .S0(n1037), .Y(n788) );
  MX2XL U2132 ( .A(nn_1[12]), .B(ratio_result_vec[4]), .S0(n1038), .Y(n796) );
  CLKINVXL U2133 ( .A(n905), .Y(n1709) );
  MX2XL U2134 ( .A(nn_2[1]), .B(ratio_result_vec[1]), .S0(n1036), .Y(n753) );
  MX2XL U2135 ( .A(nn_2[9]), .B(ratio_result_vec[1]), .S0(n1026), .Y(n761) );
  MX2XL U2136 ( .A(nn_1[17]), .B(ratio_result_vec[1]), .S0(n1025), .Y(n769) );
  MX2XL U2137 ( .A(nn_1[25]), .B(ratio_result_vec[1]), .S0(n1035), .Y(n777) );
  MX2XL U2138 ( .A(nn_1[1]), .B(ratio_result_vec[1]), .S0(n1037), .Y(n785) );
  MX2XL U2139 ( .A(nn_1[9]), .B(ratio_result_vec[1]), .S0(n1038), .Y(n793) );
  MX2X2 U2140 ( .A(nn_2[24]), .B(ratio_result_vec[0]), .S0(n1997), .Y(n631) );
  MX2XL U2141 ( .A(nn_2[0]), .B(ratio_result_vec[0]), .S0(n1036), .Y(n752) );
  MX2XL U2142 ( .A(nn_2[8]), .B(ratio_result_vec[0]), .S0(n1026), .Y(n760) );
  MX2XL U2143 ( .A(nn_1[16]), .B(ratio_result_vec[0]), .S0(n1025), .Y(n768) );
  MX2XL U2144 ( .A(nn_1[24]), .B(ratio_result_vec[0]), .S0(n1035), .Y(n776) );
  MX2XL U2145 ( .A(nn_1[0]), .B(ratio_result_vec[0]), .S0(n1037), .Y(n784) );
  MX2XL U2146 ( .A(nn_1[8]), .B(ratio_result_vec[0]), .S0(n1038), .Y(n792) );
  MX2X2 U2147 ( .A(nn_2[26]), .B(ratio_result_vec[2]), .S0(n1997), .Y(n633) );
  MX2XL U2148 ( .A(nn_2[2]), .B(ratio_result_vec[2]), .S0(n1036), .Y(n754) );
  MX2XL U2149 ( .A(nn_2[10]), .B(ratio_result_vec[2]), .S0(n1026), .Y(n762) );
  MX2XL U2150 ( .A(nn_1[18]), .B(ratio_result_vec[2]), .S0(n1025), .Y(n770) );
  MX2XL U2151 ( .A(nn_1[26]), .B(ratio_result_vec[2]), .S0(n1035), .Y(n778) );
  MX2XL U2152 ( .A(nn_1[2]), .B(ratio_result_vec[2]), .S0(n1037), .Y(n786) );
  MX2XL U2153 ( .A(nn_1[10]), .B(ratio_result_vec[2]), .S0(n1038), .Y(n794) );
  MX2XL U2154 ( .A(nn_2[19]), .B(n1086), .S0(n1997), .Y(n626) );
  MX2XL U2155 ( .A(nn_2[20]), .B(n958), .S0(n1997), .Y(n627) );
  MX2XL U2156 ( .A(n958), .B(cnn_map0[38]), .S0(n1911), .Y(N556) );
  MX2XL U2157 ( .A(nn_2[21]), .B(n1102), .S0(n1997), .Y(n628) );
  CLKINVX2 U2158 ( .A(n703), .Y(n1781) );
  OAI2BB1X1 U2159 ( .A0N(n1914), .A1N(n1391), .B0(n1390), .Y(n1392) );
  OR2X1 U2160 ( .A(cnt[2]), .B(n1398), .Y(n1391) );
  INVX2 U2161 ( .A(cnt[0]), .Y(n2007) );
  INVX2 U2162 ( .A(cnt[1]), .Y(n1984) );
  OR2X1 U2163 ( .A(cnt[4]), .B(cnt[3]), .Y(n1912) );
  OR2X1 U2164 ( .A(cnt[2]), .B(n1912), .Y(n1986) );
  INVX2 U2165 ( .A(cnt[4]), .Y(n1393) );
  INVX2 U2166 ( .A(cnt[3]), .Y(n1900) );
  MX2XL U2167 ( .A(nn_2[22]), .B(n1989), .S0(n1997), .Y(n629) );
  MX2XL U2168 ( .A(n1989), .B(cnn_map0[39]), .S0(n1911), .Y(N558) );
  INVX2 U2169 ( .A(cnt[5]), .Y(n1390) );
  MX2XL U2170 ( .A(nn_2[23]), .B(n1084), .S0(n1997), .Y(n630) );
  AOI32XL U2171 ( .A0(n1916), .A1(current_state[1]), .A2(n1915), .B0(n1914), 
        .B1(n1111), .Y(n1918) );
  NAND2BX1 U2172 ( .AN(in_valid), .B(n1402), .Y(n1159) );
  OAI2BB1X1 U2173 ( .A0N(n1916), .A1N(n1785), .B0(n1147), .Y(next_state_0_) );
  MX2XL U2174 ( .A(n1146), .B(n1987), .S0(current_state[2]), .Y(n1147) );
  OAI2BB1XL U2175 ( .A0N(n1145), .A1N(n1144), .B0(n2009), .Y(n1146) );
  INVX2 U2176 ( .A(in_valid), .Y(n1145) );
  MX2XL U2177 ( .A(n1894), .B(ker[0]), .S0(n874), .Y(N391) );
  MX2XL U2178 ( .A(n1893), .B(ker[1]), .S0(n874), .Y(N392) );
  MX2XL U2179 ( .A(n1892), .B(ker[2]), .S0(n874), .Y(N393) );
  MX2XL U2180 ( .A(n1891), .B(ker[3]), .S0(n874), .Y(N394) );
  MX2XL U2181 ( .A(n1890), .B(ker[4]), .S0(n874), .Y(N395) );
  MX2XL U2182 ( .A(n1889), .B(ker[5]), .S0(n874), .Y(N396) );
  MX2XL U2183 ( .A(n1888), .B(ker[6]), .S0(n874), .Y(N397) );
  MX2XL U2184 ( .A(n1887), .B(ker[7]), .S0(n874), .Y(N398) );
  MX2X2 U2185 ( .A(n1954), .B(weight[0]), .S0(n874), .Y(N351) );
  MX2X2 U2186 ( .A(n1952), .B(weight[1]), .S0(n874), .Y(N352) );
  MX2X2 U2187 ( .A(n1950), .B(weight[2]), .S0(n874), .Y(N353) );
  MX2X2 U2188 ( .A(n1948), .B(weight[3]), .S0(n874), .Y(N354) );
  MX2X2 U2189 ( .A(n1946), .B(weight[4]), .S0(n874), .Y(N355) );
  MX2X2 U2190 ( .A(n1944), .B(weight[5]), .S0(n874), .Y(N356) );
  MX2X2 U2191 ( .A(n1942), .B(weight[6]), .S0(n874), .Y(N357) );
  MX2X2 U2192 ( .A(n1940), .B(weight[7]), .S0(n874), .Y(N358) );
  NOR3X1 U2193 ( .A(cnt[4]), .B(cnt[2]), .C(n1902), .Y(n1032) );
  NOR3X1 U2194 ( .A(n1895), .B(n1896), .C(cnt[1]), .Y(n1033) );
  MX2XL U2195 ( .A(kernel[16]), .B(ker[0]), .S0(n1033), .Y(N421) );
  MX2XL U2196 ( .A(kernel[18]), .B(ker[2]), .S0(n1033), .Y(N423) );
  MX2XL U2197 ( .A(kernel[20]), .B(ker[4]), .S0(n1033), .Y(N425) );
  MX2XL U2198 ( .A(kernel[21]), .B(ker[5]), .S0(n1033), .Y(N426) );
  MX2XL U2199 ( .A(kernel[22]), .B(ker[6]), .S0(n1033), .Y(N427) );
  MX2XL U2200 ( .A(kernel[23]), .B(ker[7]), .S0(n1033), .Y(N428) );
  MX2XL U2201 ( .A(kernel[48]), .B(ker[0]), .S0(n1032), .Y(N461) );
  MX2XL U2202 ( .A(kernel[50]), .B(ker[2]), .S0(n1032), .Y(N463) );
  MX2XL U2203 ( .A(kernel[52]), .B(ker[4]), .S0(n1032), .Y(N465) );
  MX2XL U2204 ( .A(kernel[55]), .B(ker[7]), .S0(n1032), .Y(N468) );
  NOR3X1 U2205 ( .A(n1898), .B(n1895), .C(cnt[1]), .Y(n1034) );
  MX2XL U2206 ( .A(kernel[24]), .B(ker[0]), .S0(n1034), .Y(N431) );
  MX2XL U2207 ( .A(kernel[25]), .B(ker[1]), .S0(n1034), .Y(N432) );
  MX2XL U2208 ( .A(kernel[26]), .B(ker[2]), .S0(n1034), .Y(N433) );
  MX2XL U2209 ( .A(kernel[27]), .B(ker[3]), .S0(n1034), .Y(N434) );
  MX2XL U2210 ( .A(kernel[28]), .B(ker[4]), .S0(n1034), .Y(N435) );
  MX2XL U2211 ( .A(kernel[29]), .B(ker[5]), .S0(n1034), .Y(N436) );
  MX2XL U2212 ( .A(kernel[30]), .B(ker[6]), .S0(n1034), .Y(N437) );
  MX2XL U2213 ( .A(kernel[31]), .B(ker[7]), .S0(n1034), .Y(N438) );
  MX2XL U2214 ( .A(kernel[8]), .B(ker[0]), .S0(n1020), .Y(N411) );
  MX2XL U2215 ( .A(kernel[9]), .B(ker[1]), .S0(n1020), .Y(N412) );
  MX2XL U2216 ( .A(kernel[10]), .B(ker[2]), .S0(n1020), .Y(N413) );
  MX2XL U2217 ( .A(kernel[11]), .B(ker[3]), .S0(n1020), .Y(N414) );
  MX2XL U2218 ( .A(kernel[12]), .B(ker[4]), .S0(n1020), .Y(N415) );
  MX2XL U2219 ( .A(kernel[13]), .B(ker[5]), .S0(n1020), .Y(N416) );
  MX2XL U2220 ( .A(kernel[14]), .B(ker[6]), .S0(n1020), .Y(N417) );
  MX2XL U2221 ( .A(kernel[15]), .B(ker[7]), .S0(n1020), .Y(N418) );
  MX2XL U2222 ( .A(kernel[0]), .B(ker[0]), .S0(n1021), .Y(N401) );
  MX2XL U2223 ( .A(kernel[1]), .B(ker[1]), .S0(n1021), .Y(N402) );
  MX2XL U2224 ( .A(kernel[2]), .B(ker[2]), .S0(n1021), .Y(N403) );
  MX2XL U2225 ( .A(kernel[3]), .B(ker[3]), .S0(n1021), .Y(N404) );
  MX2XL U2226 ( .A(kernel[4]), .B(ker[4]), .S0(n1021), .Y(N405) );
  MX2XL U2227 ( .A(kernel[5]), .B(ker[5]), .S0(n1021), .Y(N406) );
  MX2XL U2228 ( .A(kernel[6]), .B(ker[6]), .S0(n1021), .Y(N407) );
  MX2XL U2229 ( .A(kernel[7]), .B(ker[7]), .S0(n1021), .Y(N408) );
  MX2X2 U2230 ( .A(n1983), .B(weight[0]), .S0(n1020), .Y(N371) );
  MX2X2 U2231 ( .A(n1980), .B(weight[1]), .S0(n1020), .Y(N372) );
  MX2X2 U2232 ( .A(n1978), .B(weight[2]), .S0(n1020), .Y(N373) );
  MX2X2 U2233 ( .A(n1976), .B(weight[3]), .S0(n1020), .Y(N374) );
  MX2X2 U2234 ( .A(n1974), .B(weight[4]), .S0(n1020), .Y(N375) );
  MX2X2 U2235 ( .A(n1972), .B(weight[5]), .S0(n1020), .Y(N376) );
  MX2X2 U2236 ( .A(n1970), .B(weight[6]), .S0(n1020), .Y(N377) );
  MX2X2 U2237 ( .A(n1968), .B(weight[7]), .S0(n1020), .Y(N378) );
  MX2XL U2238 ( .A(n1982), .B(weight[0]), .S0(n1021), .Y(N361) );
  MX2XL U2239 ( .A(n1979), .B(weight[1]), .S0(n1021), .Y(N362) );
  MX2XL U2240 ( .A(n1977), .B(weight[2]), .S0(n1021), .Y(N363) );
  MX2XL U2241 ( .A(n1975), .B(weight[3]), .S0(n1021), .Y(N364) );
  MX2XL U2242 ( .A(n1973), .B(weight[4]), .S0(n1021), .Y(N365) );
  MX2XL U2243 ( .A(n1971), .B(weight[5]), .S0(n1021), .Y(N366) );
  MX2XL U2244 ( .A(n1969), .B(weight[6]), .S0(n1021), .Y(N367) );
  MX2XL U2245 ( .A(n1967), .B(weight[7]), .S0(n1021), .Y(N368) );
  MX2XL U2246 ( .A(kernel[32]), .B(ker[0]), .S0(n1022), .Y(N441) );
  MX2XL U2247 ( .A(kernel[33]), .B(ker[1]), .S0(n1022), .Y(N442) );
  MX2XL U2248 ( .A(kernel[34]), .B(ker[2]), .S0(n1022), .Y(N443) );
  MX2XL U2249 ( .A(kernel[35]), .B(ker[3]), .S0(n1022), .Y(N444) );
  MX2XL U2250 ( .A(kernel[36]), .B(ker[4]), .S0(n1022), .Y(N445) );
  MX2XL U2251 ( .A(kernel[37]), .B(ker[5]), .S0(n1022), .Y(N446) );
  MX2XL U2252 ( .A(kernel[38]), .B(ker[6]), .S0(n1022), .Y(N447) );
  MX2XL U2253 ( .A(kernel[39]), .B(ker[7]), .S0(n1022), .Y(N448) );
  AND2X1 U2254 ( .A(n1152), .B(n1158), .Y(cnt_comb[3]) );
  XOR2X1 U2255 ( .A(cnt[3]), .B(n1151), .Y(n1152) );
  INVX2 U2256 ( .A(n1155), .Y(n1151) );
  AND2X1 U2257 ( .A(n1150), .B(n1158), .Y(cnt_comb[2]) );
  XOR2X1 U2258 ( .A(cnt[2]), .B(n1398), .Y(n1150) );
  MX2XL U2259 ( .A(kernel[40]), .B(ker[0]), .S0(n1008), .Y(N451) );
  MX2XL U2260 ( .A(kernel[44]), .B(ker[4]), .S0(n1008), .Y(N455) );
  MX2XL U2261 ( .A(kernel[46]), .B(ker[6]), .S0(n1008), .Y(N457) );
  MX2XL U2262 ( .A(kernel[47]), .B(ker[7]), .S0(n1008), .Y(N458) );
  AND2X1 U2263 ( .A(n1158), .B(n1154), .Y(cnt_comb[4]) );
  OAI2BB1X1 U2264 ( .A0N(cnt[4]), .A1N(n1153), .B0(n1396), .Y(n1154) );
  AND2X1 U2265 ( .A(n1158), .B(n1149), .Y(cnt_comb[1]) );
  XOR2X1 U2266 ( .A(cnt[1]), .B(cnt[0]), .Y(n1149) );
  OAI211XL U2267 ( .A0(n2006), .A1(n1785), .B0(n1161), .C0(n1987), .Y(n2140)
         );
  INVX2 U2268 ( .A(n1159), .Y(n1160) );
  MX2X2 U2269 ( .A(n1199), .B(img0[8]), .S0(n1109), .Y(N241) );
  MX2X2 U2270 ( .A(n1198), .B(n1197), .S0(n1109), .Y(N281) );
  MX2X2 U2271 ( .A(n1175), .B(img0[32]), .S0(n1107), .Y(N301) );
  MX2X2 U2272 ( .A(img0[48]), .B(img[0]), .S0(n1107), .Y(N331) );
  MX2X2 U2273 ( .A(n1196), .B(img0[9]), .S0(n1109), .Y(N242) );
  MX2X2 U2274 ( .A(n1195), .B(n1194), .S0(n1109), .Y(N282) );
  MX2X2 U2275 ( .A(n1173), .B(img0[33]), .S0(n1107), .Y(N302) );
  MX2XL U2276 ( .A(n1171), .B(img[1]), .S0(n1107), .Y(N332) );
  MX2X2 U2277 ( .A(n1768), .B(n1767), .S0(n1108), .Y(N223) );
  MX2X2 U2278 ( .A(n1193), .B(img0[10]), .S0(n1109), .Y(N243) );
  MX2X2 U2279 ( .A(n1192), .B(n1191), .S0(n1108), .Y(N283) );
  MX2X2 U2280 ( .A(n1170), .B(img0[34]), .S0(n1109), .Y(N303) );
  MX2X2 U2281 ( .A(img0[49]), .B(img[2]), .S0(n1110), .Y(N333) );
  MX2X2 U2282 ( .A(n1762), .B(n1761), .S0(n1107), .Y(N224) );
  MX2X2 U2283 ( .A(n1190), .B(img0[11]), .S0(n1108), .Y(N244) );
  MX2X2 U2284 ( .A(n1189), .B(n1188), .S0(n1108), .Y(N284) );
  MX2X2 U2285 ( .A(n1169), .B(img0[35]), .S0(n1109), .Y(N304) );
  MX2X2 U2286 ( .A(img0[50]), .B(img[3]), .S0(n1108), .Y(N334) );
  MX2X2 U2287 ( .A(n1754), .B(n1753), .S0(n1110), .Y(N225) );
  MX2X2 U2288 ( .A(n1187), .B(img0[12]), .S0(n1108), .Y(N245) );
  MX2X2 U2289 ( .A(n1186), .B(n1185), .S0(n1107), .Y(N285) );
  MX2X2 U2290 ( .A(n1167), .B(img0[36]), .S0(n1107), .Y(N305) );
  MX2X2 U2291 ( .A(n888), .B(img[4]), .S0(n1108), .Y(N335) );
  MX2X2 U2292 ( .A(n1748), .B(n1747), .S0(n1110), .Y(N226) );
  MX2X2 U2293 ( .A(n1183), .B(n1182), .S0(n1109), .Y(N286) );
  MX2X2 U2294 ( .A(n1166), .B(img0[37]), .S0(n1109), .Y(N306) );
  MX2X2 U2295 ( .A(img0[51]), .B(img[5]), .S0(n1107), .Y(N336) );
  MX2X2 U2296 ( .A(n1245), .B(n1244), .S0(n1110), .Y(N227) );
  MX2X2 U2297 ( .A(n1181), .B(img0[14]), .S0(n1110), .Y(N247) );
  MX2X2 U2298 ( .A(n1180), .B(n1179), .S0(n1107), .Y(N287) );
  MX2X2 U2299 ( .A(n1164), .B(img0[38]), .S0(n1107), .Y(N307) );
  MX2XL U2300 ( .A(n1163), .B(img[6]), .S0(n1107), .Y(N337) );
  MX2X2 U2301 ( .A(n1203), .B(n1202), .S0(n1110), .Y(N228) );
  MX2X2 U2302 ( .A(n1178), .B(img0[15]), .S0(n1107), .Y(N248) );
  MX2X2 U2303 ( .A(n1177), .B(n1176), .S0(n1107), .Y(N288) );
  MX2X2 U2304 ( .A(n1162), .B(img0[39]), .S0(n1107), .Y(N308) );
  MX2X2 U2305 ( .A(img0[52]), .B(img[7]), .S0(n1109), .Y(N338) );
  MX2X2 U2306 ( .A(n1780), .B(n1779), .S0(n1111), .Y(N221) );
  MX2X2 U2307 ( .A(n1775), .B(n1774), .S0(n1111), .Y(N222) );
  MX2XL U2308 ( .A(n1793), .B(ker[0]), .S0(n1023), .Y(N381) );
  MX2XL U2309 ( .A(n1792), .B(ker[1]), .S0(n1023), .Y(N382) );
  MX2XL U2310 ( .A(n1791), .B(ker[2]), .S0(n1023), .Y(N383) );
  MX2XL U2311 ( .A(n1790), .B(ker[3]), .S0(n1023), .Y(N384) );
  MX2XL U2312 ( .A(n1789), .B(ker[4]), .S0(n1023), .Y(N385) );
  MX2XL U2313 ( .A(n1788), .B(ker[5]), .S0(n1023), .Y(N386) );
  MX2XL U2314 ( .A(n1787), .B(ker[6]), .S0(n1023), .Y(N387) );
  MX2XL U2315 ( .A(n1786), .B(ker[7]), .S0(n1023), .Y(N388) );
  MX2XL U2316 ( .A(n1953), .B(weight[0]), .S0(n1023), .Y(N341) );
  MX2XL U2317 ( .A(n1951), .B(weight[1]), .S0(n1023), .Y(N342) );
  MX2XL U2318 ( .A(n1949), .B(weight[2]), .S0(n1023), .Y(N343) );
  MX2XL U2319 ( .A(n1947), .B(weight[3]), .S0(n1023), .Y(N344) );
  MX2XL U2320 ( .A(n1945), .B(weight[4]), .S0(n1023), .Y(N345) );
  MX2XL U2321 ( .A(n1943), .B(weight[5]), .S0(n1023), .Y(N346) );
  MX2XL U2322 ( .A(n1941), .B(weight[6]), .S0(n1023), .Y(N347) );
  MX2XL U2323 ( .A(n1939), .B(weight[7]), .S0(n1023), .Y(N348) );
  OR2X1 U2324 ( .A(cnt[1]), .B(cnt[0]), .Y(n1901) );
  OR2XL U2325 ( .A(current_state[2]), .B(n1144), .Y(n2006) );
  CLKINVXL U2326 ( .A(current_state[0]), .Y(n1144) );
  NAND4X1 U2327 ( .A(n1404), .B(n1785), .C(n1403), .D(n1402), .Y(n1703) );
  OAI2BB1X1 U2328 ( .A0N(n1400), .A1N(cnt[5]), .B0(n1399), .Y(n1404) );
  OAI221X1 U2329 ( .A0(n1398), .A1(n1397), .B0(cnt[3]), .B1(n1401), .C0(n1396), 
        .Y(n1399) );
  AOI31X1 U2330 ( .A0(cnt[4]), .A1(n1895), .A2(n1900), .B0(n1392), .Y(n1397)
         );
  OR2X1 U2331 ( .A(cnt[4]), .B(n1153), .Y(n1396) );
  MX2XL U2332 ( .A(n910), .B(cnn_map0[2]), .S0(n1105), .Y(N484) );
  MX2XL U2333 ( .A(n894), .B(cnn_map0[3]), .S0(n1105), .Y(N485) );
  MX2XL U2334 ( .A(cnn_map0[10]), .B(n896), .S0(n1105), .Y(N486) );
  MX2XL U2335 ( .A(n1730), .B(cnn_map0[5]), .S0(n1105), .Y(N487) );
  MX2XL U2336 ( .A(cnn_map0[13]), .B(cnn_map0[10]), .S0(n1105), .Y(N496) );
  MX2XL U2337 ( .A(n913), .B(cnn_map0[25]), .S0(n1104), .Y(N526) );
  MX2XL U2338 ( .A(cnn_map0[23]), .B(cnn_map0[16]), .S0(n1911), .Y(N512) );
  MX2XL U2339 ( .A(cnn_map0[30]), .B(cnn_map0[27]), .S0(n1104), .Y(N532) );
  MX2XL U2340 ( .A(cnn_map0[38]), .B(n886), .S0(n1104), .Y(N546) );
  MX2XL U2341 ( .A(n892), .B(cnn_map0[7]), .S0(n1105), .Y(N489) );
  MX2XL U2342 ( .A(n1721), .B(cnn_map0[1]), .S0(n1911), .Y(N483) );
  MX2XL U2343 ( .A(n1781), .B(cnn_map0[0]), .S0(n1105), .Y(N482) );
  MX2XL U2344 ( .A(cnn_map0[25]), .B(cnn_map0[20]), .S0(n1105), .Y(N516) );
  MX2XL U2345 ( .A(cnn_map0[37]), .B(cnn_map0[32]), .S0(n1104), .Y(N545) );
  MX2XL U2346 ( .A(n914), .B(n862), .S0(n1911), .Y(N544) );
  MX2XL U2347 ( .A(n915), .B(cnn_map0[6]), .S0(n1911), .Y(N488) );
  MX2XL U2348 ( .A(cnn_map0[16]), .B(cnn_map0[11]), .S0(n1911), .Y(N502) );
  MX2XL U2349 ( .A(cnn_map0[39]), .B(cnn_map0[34]), .S0(n1104), .Y(N548) );
  MX2XL U2350 ( .A(cnn_map0[27]), .B(cnn_map0[23]), .S0(n1104), .Y(N522) );
  MX2XL U2351 ( .A(n898), .B(cnn_map0[30]), .S0(n1104), .Y(N542) );
  MX2XL U2352 ( .A(cnn_map0[36]), .B(cnn_map0[31]), .S0(n1104), .Y(N543) );
  INVX2 U2353 ( .A(cnt[2]), .Y(n1895) );
  NOR2X1 U2354 ( .A(cnt[0]), .B(n1988), .Y(n1035) );
  OR2X1 U2355 ( .A(cnt[2]), .B(n1984), .Y(n2004) );
  NOR3XL U2356 ( .A(n2009), .B(n2008), .C(cnt[0]), .Y(n1036) );
  NOR3XL U2357 ( .A(cnt[0]), .B(n2008), .C(current_state[1]), .Y(n1037) );
  NOR3XL U2358 ( .A(n2008), .B(n2007), .C(current_state[1]), .Y(n1038) );
  OR2X1 U2359 ( .A(current_state[2]), .B(n1987), .Y(n1996) );
  INVX2 U2360 ( .A(n687), .Y(n1174) );
  INVX2 U2361 ( .A(n686), .Y(n1172) );
  INVX2 U2362 ( .A(n684), .Y(n1168) );
  INVX2 U2363 ( .A(n682), .Y(n1165) );
  MX2XL U2364 ( .A(n1710), .B(cnn_map0[26]), .S0(n1104), .Y(N528) );
  MX2XL U2365 ( .A(cnn_map0[26]), .B(cnn_map0[21]), .S0(n1911), .Y(N518) );
  INVX2 U2366 ( .A(cnn_map0[26]), .Y(n1209) );
  OAI33X1 U2377 ( .A0(div_631_u_div_CryOut_3__3_), .A1(n1294), .A2(n1278), 
        .B0(n1253), .B1(n1906), .B2(n1299), .Y(n1331) );
  INVX2 U2378 ( .A(n1350), .Y(n1375) );
  INVX1 U2379 ( .A(div_631_u_div_CryOut_6__0_), .Y(n1999) );
  CLKINVXL U2380 ( .A(n2011), .Y(n1434) );
  NAND3XL U2381 ( .A(div_631_u_div_CryOut_1__3_), .B(n1309), .C(
        div_631_u_div_SumTmp_1__3__3_), .Y(n1298) );
  NOR2BXL U2382 ( .AN(div_631_u_div_CryOut_1__3_), .B(
        div_631_u_div_SumTmp_1__3__10_), .Y(n1259) );
  NAND3XL U2383 ( .A(n1568), .B(div_631_u_div_CryOut_6__1_), .C(
        div_631_u_div_SumTmp_7__1__9_), .Y(n1570) );
  NAND3XL U2384 ( .A(div_631_u_div_SumTmp_6__1__9_), .B(n1102), .C(
        div_631_u_div_CryOut_6__1_), .Y(n1574) );
  NAND4XL U2385 ( .A(div_631_u_div_SumTmp_7__1__2_), .B(n1102), .C(
        div_631_u_div_CryOut_7__1_), .D(div_631_u_div_CryOut_6__1_), .Y(n1639)
         );
  NAND3XL U2386 ( .A(div_631_u_div_SumTmp_6__1__10_), .B(n1102), .C(
        div_631_u_div_CryOut_6__1_), .Y(n1564) );
  AND2X1 U2387 ( .A(div_631_u_div_CryOut_6__1_), .B(n1102), .Y(n1666) );
  CLKINVXL U2388 ( .A(n939), .Y(n1553) );
  OAI221X1 U2389 ( .A0(n1429), .A1(n1419), .B0(n1438), .B1(n1418), .C0(n1417), 
        .Y(n1518) );
  AOI32XL U2390 ( .A0(n1474), .A1(div_631_u_div_CryOut_5__2_), .A2(
        div_631_u_div_SumTmp_5__2__10_), .B0(div_631_u_div_SumTmp_7__2__10_), 
        .B1(n1545), .Y(n1417) );
  INVX2 U2391 ( .A(n1338), .Y(n1369) );
  CLKINVXL U2392 ( .A(div_631_u_div_PartRem_3__10_), .Y(n1422) );
  INVX2 U2393 ( .A(n1114), .Y(n1119) );
  MXI2XL U2394 ( .A(n1507), .B(n1515), .S0(n1103), .Y(n1084) );
  NAND3X1 U2395 ( .A(n1117), .B(n1296), .C(div_631_u_div_SumTmp_6__3__10_), 
        .Y(n1258) );
  CLKINVXL U2396 ( .A(n2057), .Y(n1471) );
  AOI221XL U2397 ( .A0(div_631_u_div_SumTmp_6__2__3_), .A1(n1475), .B0(
        div_631_u_div_SumTmp_4__2__3_), .B1(n1474), .C0(n1473), .Y(n1476) );
  INVX1 U2398 ( .A(n1572), .Y(n1089) );
  NAND4XL U2399 ( .A(div_631_u_div_CryOut_3__1_), .B(n1655), .C(
        div_631_u_div_SumTmp_3__1__7_), .D(n1646), .Y(n1587) );
  OAI2BB1X1 U2400 ( .A0N(div_631_u_div_SumTmp_6__2__0_), .A1N(n1103), .B0(
        n1511), .Y(n1509) );
  NAND2XL U2401 ( .A(div_631_u_div_SumTmp_4__2__0_), .B(n1103), .Y(n1512) );
  NAND4XL U2402 ( .A(div_631_u_div_SumTmp_1__3__4_), .B(n1309), .C(
        div_631_u_div_CryOut_1__3_), .D(n1257), .Y(n1292) );
  OAI211XL U2403 ( .A0(n1103), .A1(n1507), .B0(n1501), .C0(n1500), .Y(n1502)
         );
  AOI32XL U2404 ( .A0(div_631_u_div_SumTmp_5__2__0_), .A1(n1103), .A2(
        div_631_u_div_CryOut_5__2_), .B0(div_631_u_div_CryOut_6__2_), .B1(
        n1103), .Y(n1500) );
  MX2XL U2405 ( .A(n1963), .B(n1001), .S0(n875), .Y(N573) );
  MX2XL U2406 ( .A(n1001), .B(n1963), .S0(n1131), .Y(nn_b[3]) );
  OR3XL U2407 ( .A(n1328), .B(n1327), .C(n1326), .Y(n1330) );
  MXI2XL U2408 ( .A(n917), .B(n908), .S0(n1012), .Y(n1090) );
  MX2X1 U2409 ( .A(n1922), .B(n1921), .S0(n1131), .Y(nn_a[6]) );
  MX2XL U2410 ( .A(n1921), .B(n1922), .S0(n875), .Y(N568) );
  MX2XL U2411 ( .A(kernel[54]), .B(ker[6]), .S0(n1032), .Y(N467) );
  INVX2 U2412 ( .A(n1742), .Y(n1755) );
  MX2XL U2413 ( .A(kernel[45]), .B(ker[5]), .S0(n1008), .Y(N456) );
  MX2X4 U2414 ( .A(n1773), .B(n1930), .S0(n1133), .Y(mult_a_0__2_) );
  MX2X2 U2415 ( .A(n854), .B(n1851), .S0(n953), .Y(n1874) );
  MX2XL U2416 ( .A(kernel[43]), .B(ker[3]), .S0(n1008), .Y(N454) );
  AOI211XL U2417 ( .A0(cnn_map0[17]), .A1(n710), .B0(cnn_map0[16]), .C0(n853), 
        .Y(n1800) );
  CLKINVXL U2418 ( .A(n1205), .Y(n1214) );
  CLKINVX2 U2419 ( .A(n1763), .Y(n1770) );
  OAI2BB2XL U2420 ( .B0(n886), .B1(n1809), .A0N(n738), .A1N(n1834), .Y(n1810)
         );
  MX2XL U2421 ( .A(kernel[19]), .B(ker[3]), .S0(n1033), .Y(N424) );
  MX2X1 U2422 ( .A(cnn_map0[25]), .B(n913), .S0(n1012), .Y(n1758) );
  MX2X1 U2423 ( .A(cnn_map0[23]), .B(cnn_map0[27]), .S0(n1012), .Y(n1782) );
  OAI2BB1X1 U2424 ( .A0N(cnn_map0[12]), .A1N(n716), .B0(n1796), .Y(n1797) );
  MX2XL U2425 ( .A(kernel[51]), .B(ker[3]), .S0(n1032), .Y(N464) );
  INVX3 U2426 ( .A(n1841), .Y(n1830) );
  MX2XL U2427 ( .A(kernel[53]), .B(ker[5]), .S0(n1032), .Y(N466) );
  OR3X4 U2428 ( .A(n1869), .B(n1868), .C(n1867), .Y(n1879) );
  AOI221X2 U2429 ( .A0(n1864), .A1(n1882), .B0(n1030), .B1(n1874), .C0(n1863), 
        .Y(n1868) );
  OAI221XL U2430 ( .A0(n1010), .A1(n901), .B0(n1098), .B1(n1866), .C0(n1865), 
        .Y(n1867) );
  OAI2BB1X1 U2431 ( .A0N(cnn_map0[32]), .A1N(n1812), .B0(n1811), .Y(n1813) );
  OAI32X1 U2432 ( .A0(n921), .A1(n1741), .A2(n1744), .B0(n1740), .B1(n1739), 
        .Y(n1742) );
  OAI2BB1X2 U2433 ( .A0N(n1503), .A1N(n1084), .B0(n1502), .Y(n1504) );
  AOI222X2 U2434 ( .A0(div_631_u_div_SumTmp_7__2__7_), .A1(n1545), .B0(
        div_631_u_div_SumTmp_1__2__7_), .B1(n1446), .C0(
        div_631_u_div_SumTmp_3__2__7_), .C1(n1478), .Y(n1447) );
  OR2X1 U2435 ( .A(n1697), .B(n946), .Y(n2020) );
  OR4X4 U2436 ( .A(n1374), .B(n1373), .C(n995), .D(n1382), .Y(
        div_631_u_div_PartRem_3__5_) );
  INVX2 U2437 ( .A(div_631_u_div_CryOut_5__0_), .Y(n1700) );
  MX2XL U2438 ( .A(n1925), .B(n1926), .S0(n875), .Y(N566) );
  MX2XL U2439 ( .A(n1926), .B(n1925), .S0(n1131), .Y(nn_a[4]) );
  OR3X4 U2440 ( .A(n857), .B(n1332), .C(n1333), .Y(n1377) );
  MX2XL U2441 ( .A(kernel[49]), .B(ker[1]), .S0(n1032), .Y(N462) );
  OAI2BB1X1 U2442 ( .A0N(n998), .A1N(n1306), .B0(n1309), .Y(n1260) );
  OR2X1 U2443 ( .A(n993), .B(n1485), .Y(n1443) );
  OR2X1 U2444 ( .A(n1422), .B(n1485), .Y(n1423) );
  OR2X1 U2445 ( .A(n1448), .B(n1485), .Y(n1449) );
  OR2X1 U2446 ( .A(n1434), .B(n1485), .Y(n1435) );
  MX2XL U2447 ( .A(kernel[17]), .B(ker[1]), .S0(n1033), .Y(N422) );
  OR3X1 U2448 ( .A(n1102), .B(div_631_u_div_CryOut_2__1_), .C(n1556), .Y(n1611) );
  OR3X2 U2449 ( .A(n1102), .B(div_631_u_div_CryOut_2__1_), .C(n1556), .Y(n1596) );
  OR2X1 U2450 ( .A(n1364), .B(n1363), .Y(div_631_u_div_PartRem_3__13_) );
  INVX2 U2451 ( .A(n1421), .Y(n1523) );
  OAI221X1 U2452 ( .A0(div_631_u_div_CryOut_7__0_), .A1(n1999), .B0(n890), 
        .B1(div_631_u_div_CryOut_6__0_), .C0(n1998), .Y(n2000) );
  OAI2BB1X1 U2453 ( .A0N(n1624), .A1N(n1623), .B0(n1622), .Y(n1625) );
  MX2X1 U2454 ( .A(n743), .B(n751), .S0(n1883), .Y(n1884) );
  MXI2XL U2455 ( .A(n897), .B(n1910), .S0(n1883), .Y(n1829) );
  OAI211X1 U2456 ( .A0(n1840), .A1(n1841), .B0(n1843), .C0(n1839), .Y(n1842)
         );
  AOI221XL U2457 ( .A0(div_631_u_div_SumTmp_4__1__11_), .A1(n965), .B0(
        div_631_u_div_SumTmp_6__1__11_), .B1(n1637), .C0(n1555), .Y(n1560) );
  MX2XL U2458 ( .A(kernel[42]), .B(ker[2]), .S0(n1008), .Y(N453) );
  OR2X1 U2459 ( .A(n1553), .B(n1620), .Y(n1554) );
  OR2X1 U2460 ( .A(n1612), .B(n1620), .Y(n1613) );
  OR2X1 U2461 ( .A(n1117), .B(n1309), .Y(n1266) );
  NAND2XL U2462 ( .A(div_631_u_div_SumTmp_4__3__0_), .B(n1117), .Y(n1353) );
  NAND3XL U2463 ( .A(div_631_u_div_CryOut_1__2_), .B(n1516), .C(
        div_631_u_div_SumTmp_1__2__0_), .Y(n1501) );
  MX2XL U2464 ( .A(kernel[41]), .B(ker[1]), .S0(n1008), .Y(N452) );
  OR3X2 U2465 ( .A(n1901), .B(n1986), .C(cnt[5]), .Y(n1785) );
  OR2X4 U2466 ( .A(current_state[0]), .B(n2009), .Y(n1987) );
  OR3X2 U2467 ( .A(current_state[2]), .B(n2009), .C(n1160), .Y(n1161) );
  OAI221X2 U2468 ( .A0(n903), .A1(n1206), .B0(n911), .B1(n726), .C0(n1205), 
        .Y(n1211) );
  OR2X4 U2469 ( .A(div_631_u_div_CryOut_6__3_), .B(n1119), .Y(n1905) );
  OR2X4 U2470 ( .A(n1322), .B(n873), .Y(n2068) );
  OR2X4 U2471 ( .A(n1365), .B(n1323), .Y(n2045) );
  AND3X4 U2472 ( .A(n1325), .B(n1324), .C(n1275), .Y(n1276) );
  OR2X4 U2473 ( .A(n1384), .B(n1383), .Y(n2052) );
  OR3X2 U2474 ( .A(n1393), .B(n1895), .C(n1400), .Y(n1394) );
  OR3X2 U2475 ( .A(cnt[2]), .B(cnt[5]), .C(n1401), .Y(n1403) );
  OR2X4 U2476 ( .A(n856), .B(n1542), .Y(n2055) );
  OAI211X2 U2477 ( .A0(n1470), .A1(n1469), .B0(n1468), .C0(n1467), .Y(n1551)
         );
  OR2X4 U2478 ( .A(n852), .B(n1538), .Y(n2047) );
  OR3X2 U2479 ( .A(n860), .B(n800), .C(n973), .Y(n1552) );
  OR2X4 U2480 ( .A(n975), .B(n1621), .Y(n2051) );
  OR2X4 U2481 ( .A(n1539), .B(n1543), .Y(n2097) );
  OR2X4 U2482 ( .A(n1102), .B(n1572), .Y(n1597) );
  OR2X4 U2483 ( .A(n1102), .B(div_631_u_div_CryOut_2__1_), .Y(n1646) );
  OR3X2 U2484 ( .A(n981), .B(n989), .C(n1673), .Y(n1698) );
  OR3X2 U2485 ( .A(n871), .B(n945), .C(n1692), .Y(n1678) );
  OR3X2 U2486 ( .A(n871), .B(n945), .C(n1692), .Y(n1697) );
  OR4X2 U2487 ( .A(n1911), .B(n1705), .C(n1999), .D(n1704), .Y(n1707) );
  OR2X4 U2488 ( .A(n1092), .B(n1765), .Y(n1722) );
  MX2X4 U2489 ( .A(n1928), .B(n1766), .S0(n1132), .Y(mult_a_0__3_) );
  OAI211X2 U2490 ( .A0(n1816), .A1(n1815), .B0(n1814), .C0(n1813), .Y(n1817)
         );
  MX2X4 U2491 ( .A(n1956), .B(n1825), .S0(n1132), .Y(mult_a_1__7_) );
  MX2X4 U2492 ( .A(n859), .B(n1831), .S0(n1132), .Y(mult_a_1__6_) );
  OR3X2 U2493 ( .A(n2140), .B(n2100), .C(cnt[5]), .Y(n1899) );
  OR3X2 U2494 ( .A(n2007), .B(n1899), .C(n1912), .Y(n1898) );
  OR3X2 U2495 ( .A(n1912), .B(n1899), .C(cnt[0]), .Y(n1896) );
  OR3X2 U2496 ( .A(n1901), .B(n1900), .C(n1899), .Y(n1902) );
  OR3X2 U2497 ( .A(cnt[2]), .B(n2007), .C(cnt[5]), .Y(n1917) );
  OR3X2 U2498 ( .A(n2009), .B(n1984), .C(n2006), .Y(n1985) );
  OR3X2 U2499 ( .A(cnt[5]), .B(n1986), .C(n1985), .Y(n1988) );
  OR4X2 U2500 ( .A(n2006), .B(n2005), .C(cnt[5]), .D(n2004), .Y(n2008) );
  AND2X1 U2504 ( .A(L1_comb_result[2]), .B(n2099), .Y(N99) );
  AND2X1 U2505 ( .A(L1_comb_result[1]), .B(n2099), .Y(N98) );
  AND2X1 U2506 ( .A(L1_comb_result[0]), .B(n2099), .Y(N97) );
  MXI2X1 U2507 ( .A(n2139), .B(n2138), .S0(n2100), .Y(N298) );
  MXI2X1 U2508 ( .A(n2135), .B(n2134), .S0(n2100), .Y(N297) );
  MXI2X1 U2509 ( .A(n2131), .B(n2130), .S0(n2100), .Y(N296) );
  MXI2X1 U2510 ( .A(n2126), .B(n2125), .S0(n2100), .Y(N295) );
  MXI2X1 U2511 ( .A(n2122), .B(n2121), .S0(n2100), .Y(N294) );
  MXI2X1 U2512 ( .A(n2118), .B(n2117), .S0(n2100), .Y(N293) );
  MXI2X1 U2513 ( .A(n2114), .B(n2113), .S0(n2100), .Y(N292) );
  MXI2X1 U2514 ( .A(n2110), .B(n2109), .S0(n2100), .Y(N291) );
  MXI2X1 U2515 ( .A(n2137), .B(n2136), .S0(n2100), .Y(N238) );
  MXI2X1 U2516 ( .A(n2133), .B(n2132), .S0(n2100), .Y(N237) );
  MXI2X1 U2517 ( .A(n2129), .B(n2128), .S0(n2100), .Y(N236) );
  MXI2X1 U2518 ( .A(n2124), .B(n2123), .S0(n2100), .Y(N235) );
  MXI2X1 U2519 ( .A(n2120), .B(n2119), .S0(n2100), .Y(N234) );
  MXI2X1 U2520 ( .A(n2116), .B(n2115), .S0(n2100), .Y(N233) );
  MXI2X1 U2521 ( .A(n2112), .B(n2111), .S0(n2100), .Y(N232) );
  MXI2X1 U2522 ( .A(n2108), .B(n2107), .S0(n2100), .Y(N231) );
  AND2X1 U2523 ( .A(n2099), .B(L1_comb_result[9]), .Y(N106) );
  AND2X1 U2524 ( .A(n2099), .B(L1_comb_result[8]), .Y(N105) );
  AND2X1 U2525 ( .A(n2099), .B(L1_comb_result[7]), .Y(N104) );
  NOR2X1 U2526 ( .A(n2101), .B(n2102), .Y(N103) );
  NOR2X1 U2527 ( .A(n2101), .B(n2103), .Y(N102) );
  NOR2X1 U2528 ( .A(n2101), .B(n2104), .Y(N101) );
  AND2X1 U2529 ( .A(L1_comb_result[3]), .B(n2099), .Y(N100) );
  CLKINVX1 U2530 ( .A(n2101), .Y(n2099) );
  NAND2X1 U2531 ( .A(n1024), .B(n2105), .Y(n2101) );
  NAND4X1 U2532 ( .A(n2103), .B(n2102), .C(n2104), .D(n2106), .Y(n2105) );
  NOR3X1 U2533 ( .A(L1_comb_result[7]), .B(L1_comb_result[9]), .C(
        L1_comb_result[8]), .Y(n2106) );
  CLKINVX1 U2534 ( .A(L1_comb_result[4]), .Y(n2104) );
  CLKINVX1 U2535 ( .A(L1_comb_result[6]), .Y(n2102) );
  CLKINVX1 U2536 ( .A(L1_comb_result[5]), .Y(n2103) );
  MX2X1 U2537 ( .A(sub_comb_result[34]), .B(sub_comb_result_in[31]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[31]) );
  MX2X1 U2538 ( .A(sub_comb_result[33]), .B(sub_comb_result_in[30]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[30]) );
  MX2X1 U2539 ( .A(sub_comb_result[32]), .B(sub_comb_result_in[29]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[29]) );
  MX2X1 U2540 ( .A(sub_comb_result[31]), .B(sub_comb_result_in[28]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[28]) );
  MX2X1 U2541 ( .A(sub_comb_result[30]), .B(sub_comb_result_in[27]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[27]) );
  MX2X1 U2542 ( .A(sub_comb_result[29]), .B(sub_comb_result_in[26]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[26]) );
  MX2X1 U2543 ( .A(sub_comb_result[28]), .B(sub_comb_result_in[25]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[25]) );
  MX2X1 U2544 ( .A(sub_comb_result[27]), .B(sub_comb_result_in[24]), .S0(
        sub_comb_result[35]), .Y(L1_partial_comb[24]) );
  MX2X1 U2545 ( .A(sub_comb_result[25]), .B(sub_comb_result_in[23]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[23]) );
  MX2X1 U2546 ( .A(sub_comb_result[24]), .B(sub_comb_result_in[22]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[22]) );
  MX2X1 U2547 ( .A(sub_comb_result[23]), .B(sub_comb_result_in[21]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[21]) );
  MX2X1 U2548 ( .A(sub_comb_result[22]), .B(sub_comb_result_in[20]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[20]) );
  MX2X1 U2549 ( .A(sub_comb_result[21]), .B(sub_comb_result_in[19]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[19]) );
  MX2X1 U2550 ( .A(sub_comb_result[20]), .B(sub_comb_result_in[18]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[18]) );
  MX2X1 U2551 ( .A(sub_comb_result[19]), .B(sub_comb_result_in[17]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[17]) );
  MX2X1 U2552 ( .A(sub_comb_result[18]), .B(sub_comb_result_in[16]), .S0(
        sub_comb_result[26]), .Y(L1_partial_comb[16]) );
  MX2X1 U2553 ( .A(sub_comb_result[16]), .B(sub_comb_result_in[15]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[15]) );
  MX2X1 U2554 ( .A(sub_comb_result[15]), .B(sub_comb_result_in[14]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[14]) );
  MX2X1 U2555 ( .A(sub_comb_result[14]), .B(sub_comb_result_in[13]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[13]) );
  MX2X1 U2556 ( .A(sub_comb_result[13]), .B(sub_comb_result_in[12]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[12]) );
  MX2X1 U2557 ( .A(sub_comb_result[12]), .B(sub_comb_result_in[11]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[11]) );
  MX2X1 U2558 ( .A(sub_comb_result[11]), .B(sub_comb_result_in[10]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[10]) );
  MX2X1 U2559 ( .A(sub_comb_result[10]), .B(sub_comb_result_in[9]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[9]) );
  MX2X1 U2560 ( .A(sub_comb_result[9]), .B(sub_comb_result_in[8]), .S0(
        sub_comb_result[17]), .Y(L1_partial_comb[8]) );
  MX2X1 U2561 ( .A(sub_comb_result[7]), .B(sub_comb_result_in[7]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[7]) );
  MX2X1 U2562 ( .A(sub_comb_result[6]), .B(sub_comb_result_in[6]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[6]) );
  MX2X1 U2563 ( .A(sub_comb_result[5]), .B(sub_comb_result_in[5]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[5]) );
  MX2X1 U2564 ( .A(sub_comb_result[4]), .B(sub_comb_result_in[4]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[4]) );
  MX2X1 U2565 ( .A(sub_comb_result[3]), .B(sub_comb_result_in[3]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[3]) );
  MX2X1 U2566 ( .A(sub_comb_result[2]), .B(sub_comb_result_in[2]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[2]) );
  MX2X1 U2567 ( .A(sub_comb_result[1]), .B(sub_comb_result_in[1]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[1]) );
  MX2X1 U2568 ( .A(sub_comb_result[0]), .B(sub_comb_result_in[0]), .S0(
        sub_comb_result[8]), .Y(L1_partial_comb[0]) );
endmodule


module SNN_DW01_add_325 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;


  CLKINVXL U7 ( .A(A[2]), .Y(SUM[2]) );
  INVX2 U8 ( .A(A[10]), .Y(SUM[10]) );
  BUFX2 U9 ( .A(B[0]), .Y(SUM[0]) );
  BUFX1 U10 ( .A(A[13]), .Y(SUM[13]) );
endmodule


module SNN_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] DIFF;
  input CI;
  output CO;
  wire   n45;

  CLKINVXL U12 ( .A(A[3]), .Y(n45) );
  INVX2 U13 ( .A(DIFF[9]), .Y(DIFF[8]) );
  BUFX2 U14 ( .A(DIFF[13]), .Y(DIFF[12]) );
  BUFX2 U15 ( .A(n45), .Y(DIFF[4]) );
  INVX2 U16 ( .A(B[8]), .Y(DIFF[9]) );
  INVX2 U17 ( .A(A[11]), .Y(DIFF[13]) );
  INVX2 U18 ( .A(B[0]), .Y(DIFF[1]) );
  BUFX1 U19 ( .A(B[0]), .Y(DIFF[0]) );
endmodule


module SNN_DW01_add_324 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2;

  CLKINVXL U12 ( .A(A[1]), .Y(SUM[1]) );
  BUFX1 U13 ( .A(A[12]), .Y(SUM[12]) );
  BUFX2 U14 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2 U15 ( .A(A[9]), .Y(SUM[10]) );
  BUFX2 U16 ( .A(n2), .Y(SUM[2]) );
  INVX2 U17 ( .A(SUM[1]), .Y(n2) );
  INVX2 U18 ( .A(A[9]), .Y(SUM[9]) );
  BUFX2 U19 ( .A(B[11]), .Y(SUM[11]) );
  BUFX2 U20 ( .A(B[0]), .Y(SUM[0]) );
  BUFX2 U21 ( .A(B[3]), .Y(SUM[3]) );
endmodule


module SNN_DW01_add_323 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n47, n49;

  CLKINVXL U12 ( .A(A[2]), .Y(SUM[2]) );
  BUFX1 U13 ( .A(A[13]), .Y(SUM[13]) );
  BUFX2 U14 ( .A(A[5]), .Y(SUM[5]) );
  INVX2 U15 ( .A(A[10]), .Y(SUM[10]) );
  BUFX2 U16 ( .A(A[10]), .Y(SUM[11]) );
  BUFX2 U17 ( .A(n2), .Y(SUM[3]) );
  INVX2 U18 ( .A(SUM[2]), .Y(n2) );
  BUFX2 U19 ( .A(B[1]), .Y(SUM[1]) );
  BUFX2 U20 ( .A(B[12]), .Y(SUM[12]) );
  INVX2 U21 ( .A(n47), .Y(SUM[9]) );
  INVX2 U22 ( .A(B[9]), .Y(n47) );
  INVX2 U23 ( .A(n49), .Y(SUM[4]) );
  INVX2 U24 ( .A(B[4]), .Y(n49) );
endmodule


module SNN_DW01_add_316 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n9, n10, n22, n23, n24, n25, n26, n27, n29, n30, n31, n32,
         n35, n36, n37, n38, n40, n43, n44, n45, n47, n48, n49, n50, n51, n54,
         n56, n57, n59, n60, n61, n62, n65, n67, n69, n71, n72, n73, n75, n77,
         n78, n79, n83, n84, n85, n87, n144, n145, n146, n147, n148;

  NAND2X4 U3 ( .A(n22), .B(B[12]), .Y(n10) );
  AOI21X1 U28 ( .A0(n30), .A1(n50), .B0(n31), .Y(n29) );
  AOI21X1 U38 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X2 U47 ( .A(A[9]), .B(B[9]), .Y(n43) );
  AOI21X1 U84 ( .A0(n72), .A1(n144), .B0(n69), .Y(n67) );
  OAI21X2 U109 ( .A0(n23), .A1(n51), .B0(n24), .Y(n22) );
  AOI21X2 U110 ( .A0(n50), .A1(n85), .B0(n47), .Y(n45) );
  AOI21X4 U111 ( .A0(n147), .A1(n78), .B0(n75), .Y(n73) );
  NOR2XL U112 ( .A(A[8]), .B(B[8]), .Y(n48) );
  NAND2X2 U113 ( .A(A[8]), .B(B[8]), .Y(n49) );
  NAND2XL U114 ( .A(A[5]), .B(n144), .Y(n61) );
  XNOR2XL U115 ( .A(n56), .B(n54), .Y(SUM[7]) );
  NAND2X2 U116 ( .A(n145), .B(n60), .Y(n51) );
  AOI21X1 U117 ( .A0(n25), .A1(n38), .B0(n26), .Y(n24) );
  NOR2X1 U118 ( .A(n27), .B(n35), .Y(n26) );
  OR2X1 U119 ( .A(A[4]), .B(B[4]), .Y(n144) );
  INVX2 U120 ( .A(n51), .Y(n50) );
  NAND2X2 U121 ( .A(n37), .B(n25), .Y(n23) );
  CLKINVXL U122 ( .A(A[5]), .Y(n65) );
  NAND2X1 U123 ( .A(A[10]), .B(B[10]), .Y(n35) );
  INVX2 U124 ( .A(A[7]), .Y(n54) );
  NAND2X2 U125 ( .A(A[3]), .B(B[3]), .Y(n77) );
  OR2X4 U126 ( .A(A[3]), .B(B[3]), .Y(n147) );
  CLKINVXL U127 ( .A(n60), .Y(n59) );
  NOR2XL U128 ( .A(n59), .B(n57), .Y(n56) );
  OR2X4 U129 ( .A(A[0]), .B(B[0]), .Y(n148) );
  ADDFHX4 U130 ( .A(A[2]), .B(B[2]), .CI(n79), .CO(n78), .S(SUM[2]) );
  CLKINVX2 U131 ( .A(n77), .Y(n75) );
  OAI21XL U132 ( .A0(n40), .A1(n32), .B0(n35), .Y(n31) );
  NOR2X2 U133 ( .A(A[10]), .B(B[10]), .Y(n32) );
  ADDFHX2 U134 ( .A(n148), .B(B[1]), .CI(A[1]), .CO(n79), .S(SUM[1]) );
  NOR2X4 U135 ( .A(n27), .B(n32), .Y(n25) );
  INVX8 U136 ( .A(n10), .Y(CO) );
  NAND2X1 U137 ( .A(A[4]), .B(B[4]), .Y(n71) );
  OAI21X2 U138 ( .A0(n49), .A1(n43), .B0(n44), .Y(n38) );
  NOR2X2 U139 ( .A(n54), .B(n57), .Y(n145) );
  CLKINVXL U140 ( .A(n57), .Y(n87) );
  XNOR2X1 U141 ( .A(n59), .B(n87), .Y(SUM[6]) );
  NOR2X2 U142 ( .A(n48), .B(n43), .Y(n37) );
  NAND2XL U143 ( .A(A[5]), .B(n69), .Y(n62) );
  CLKINVXL U144 ( .A(n32), .Y(n83) );
  CLKINVXL U145 ( .A(n48), .Y(n85) );
  NAND2XL U146 ( .A(A[9]), .B(B[9]), .Y(n44) );
  XOR2X1 U147 ( .A(n29), .B(n27), .Y(SUM[11]) );
  CLKINVXL U148 ( .A(n73), .Y(n72) );
  XOR2X1 U149 ( .A(n36), .B(n2), .Y(SUM[10]) );
  NAND2XL U150 ( .A(n83), .B(n35), .Y(n2) );
  INVX2 U151 ( .A(n71), .Y(n69) );
  XOR2X1 U152 ( .A(n45), .B(n3), .Y(SUM[9]) );
  NAND2X1 U153 ( .A(n84), .B(n44), .Y(n3) );
  XNOR2X1 U154 ( .A(n50), .B(n4), .Y(SUM[8]) );
  NAND2X1 U155 ( .A(n85), .B(n49), .Y(n4) );
  XOR2X1 U156 ( .A(n67), .B(n65), .Y(SUM[5]) );
  INVX2 U157 ( .A(A[6]), .Y(n57) );
  NOR2BXL U158 ( .AN(n37), .B(n32), .Y(n30) );
  CLKINVXL U159 ( .A(n38), .Y(n40) );
  INVX2 U160 ( .A(n49), .Y(n47) );
  XNOR2XL U161 ( .A(n9), .B(n78), .Y(SUM[3]) );
  XOR2X1 U162 ( .A(n72), .B(n146), .Y(SUM[4]) );
  AND2X1 U163 ( .A(n144), .B(n71), .Y(n146) );
  XNOR2X1 U164 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  INVX2 U165 ( .A(B[11]), .Y(n27) );
  CLKINVXL U166 ( .A(n43), .Y(n84) );
  NAND2XL U167 ( .A(n147), .B(n77), .Y(n9) );
  OAI21X2 U168 ( .A0(n73), .A1(n61), .B0(n62), .Y(n60) );
endmodule


module SNN_DW01_add_318 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n6, n7, n9, n10, n17, n22, n23, n24, n25, n26, n27, n29, n30, n31,
         n32, n35, n36, n37, n38, n43, n44, n45, n48, n50, n51, n54, n56, n57,
         n59, n60, n61, n62, n64, n66, n67, n69, n71, n72, n73, n75, n77, n78,
         n79, n83, n84, n87, n144, n145, n146, n147, n148, n149;

  AOI21X1 U28 ( .A0(n30), .A1(n50), .B0(n31), .Y(n29) );
  AOI21X1 U38 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  AOI21X1 U84 ( .A0(n72), .A1(n149), .B0(n69), .Y(n67) );
  AOI21X2 U109 ( .A0(n144), .A1(n78), .B0(n75), .Y(n73) );
  OR2X4 U110 ( .A(A[5]), .B(B[5]), .Y(n148) );
  CLKINVXL U111 ( .A(n60), .Y(n59) );
  AOI21X2 U112 ( .A0(n25), .A1(n38), .B0(n26), .Y(n24) );
  NOR2X2 U113 ( .A(n27), .B(n32), .Y(n25) );
  NAND2X2 U114 ( .A(n148), .B(n149), .Y(n61) );
  OAI21X4 U115 ( .A0(n23), .A1(n51), .B0(n24), .Y(n22) );
  XOR2XL U116 ( .A(n50), .B(A[8]), .Y(SUM[8]) );
  CLKINVXL U117 ( .A(A[8]), .Y(n48) );
  XNOR2X1 U118 ( .A(n45), .B(n146), .Y(SUM[9]) );
  INVX2 U119 ( .A(n77), .Y(n75) );
  NAND2X1 U120 ( .A(A[3]), .B(B[3]), .Y(n77) );
  OR2X1 U121 ( .A(B[1]), .B(A[1]), .Y(n79) );
  OR2X1 U122 ( .A(A[4]), .B(B[4]), .Y(n149) );
  NOR2X1 U123 ( .A(n27), .B(n35), .Y(n26) );
  OR2X2 U124 ( .A(n54), .B(n57), .Y(n145) );
  NOR2X1 U125 ( .A(n48), .B(n43), .Y(n37) );
  NOR2X1 U126 ( .A(A[10]), .B(B[10]), .Y(n32) );
  OR2X1 U127 ( .A(A[3]), .B(B[3]), .Y(n144) );
  INVX3 U128 ( .A(A[7]), .Y(n54) );
  NOR2X1 U129 ( .A(A[9]), .B(B[9]), .Y(n43) );
  NAND2XL U130 ( .A(A[9]), .B(B[9]), .Y(n44) );
  ADDFHX4 U131 ( .A(A[2]), .B(B[2]), .CI(n79), .CO(n78), .S(SUM[2]) );
  AOI21X1 U132 ( .A0(n148), .A1(n69), .B0(n64), .Y(n62) );
  INVX2 U133 ( .A(n71), .Y(n69) );
  INVX8 U134 ( .A(n10), .Y(CO) );
  NAND2X1 U135 ( .A(n25), .B(n37), .Y(n23) );
  NAND2X4 U136 ( .A(n22), .B(n17), .Y(n10) );
  XNOR2X1 U137 ( .A(n56), .B(n54), .Y(SUM[7]) );
  OAI21X2 U138 ( .A0(n61), .A1(n73), .B0(n62), .Y(n60) );
  NAND2BX4 U139 ( .AN(n145), .B(n60), .Y(n51) );
  NAND2X1 U140 ( .A(A[4]), .B(B[4]), .Y(n71) );
  INVX1 U141 ( .A(n66), .Y(n64) );
  NOR2XL U142 ( .A(n59), .B(n57), .Y(n56) );
  CLKINVXL U143 ( .A(n57), .Y(n87) );
  CLKINVXL U144 ( .A(n32), .Y(n83) );
  NAND2XL U145 ( .A(n148), .B(n66), .Y(n7) );
  XOR2X1 U146 ( .A(n67), .B(n7), .Y(SUM[5]) );
  XOR2X1 U147 ( .A(n29), .B(n27), .Y(SUM[11]) );
  NAND2XL U148 ( .A(n144), .B(n77), .Y(n9) );
  BUFX1 U149 ( .A(A[0]), .Y(SUM[0]) );
  NAND2XL U150 ( .A(A[5]), .B(B[5]), .Y(n66) );
  INVX2 U151 ( .A(n51), .Y(n50) );
  XOR2X1 U152 ( .A(n59), .B(n6), .Y(SUM[6]) );
  INVX2 U153 ( .A(n87), .Y(n6) );
  NAND2XL U154 ( .A(n50), .B(A[8]), .Y(n45) );
  XOR2X1 U155 ( .A(n36), .B(n2), .Y(SUM[10]) );
  NAND2XL U156 ( .A(n83), .B(n35), .Y(n2) );
  AND2X1 U157 ( .A(n84), .B(n44), .Y(n146) );
  INVX2 U158 ( .A(A[6]), .Y(n57) );
  NOR2BXL U159 ( .AN(n37), .B(n32), .Y(n30) );
  INVX2 U160 ( .A(n44), .Y(n38) );
  CLKINVXL U161 ( .A(n73), .Y(n72) );
  XOR2X1 U162 ( .A(n72), .B(n147), .Y(SUM[4]) );
  AND2X1 U163 ( .A(n149), .B(n71), .Y(n147) );
  INVX2 U164 ( .A(n43), .Y(n84) );
  XNOR2XL U165 ( .A(n9), .B(n78), .Y(SUM[3]) );
  INVX2 U166 ( .A(B[11]), .Y(n27) );
  XNOR2XL U167 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NOR2X1 U168 ( .A(B[9]), .B(B[9]), .Y(n17) );
  OAI21XL U169 ( .A0(n44), .A1(n32), .B0(n35), .Y(n31) );
  NAND2X1 U170 ( .A(A[10]), .B(B[10]), .Y(n35) );
endmodule


module SNN_DW01_add_307 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n9, n10, n12, n14, n15, n23, n24, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n40, n41, n42, n43, n45,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n63, n64, n65, n66, n67, n69, n71, n72, n74, n76, n77, n78, n80, n82,
         n83, n84, n85, n86, n88, n90, n91, n92, n93, n94, n96, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n108, n110, n111, n113, n114,
         n115, n116, n118, n123, n125, n127, n128, n198, n199, n200, n201,
         n202, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226;

  AOI21X1 U138 ( .A0(n223), .A1(n111), .B0(n108), .Y(n106) );
  NAND2XL U154 ( .A(n50), .B(n199), .Y(n200) );
  NAND2X2 U155 ( .A(n198), .B(n3), .Y(n201) );
  NAND2X2 U156 ( .A(n200), .B(n201), .Y(SUM[14]) );
  INVX1 U157 ( .A(n50), .Y(n198) );
  CLKINVXL U158 ( .A(n3), .Y(n199) );
  NAND2X1 U159 ( .A(n116), .B(n49), .Y(n3) );
  XOR2X2 U160 ( .A(n61), .B(n224), .Y(SUM[12]) );
  NOR2BX2 U161 ( .AN(n42), .B(n37), .Y(n35) );
  INVX2 U162 ( .A(n71), .Y(n69) );
  NOR2X2 U163 ( .A(A[7]), .B(B[7]), .Y(n84) );
  OAI21X2 U164 ( .A0(n45), .A1(n37), .B0(n40), .Y(n36) );
  INVX3 U165 ( .A(n78), .Y(n77) );
  XNOR2X2 U166 ( .A(n55), .B(n4), .Y(SUM[13]) );
  NAND2X1 U167 ( .A(A[9]), .B(B[9]), .Y(n76) );
  NAND2X2 U168 ( .A(A[13]), .B(B[13]), .Y(n54) );
  XOR2X1 U169 ( .A(n72), .B(n7), .Y(SUM[10]) );
  NAND2X1 U170 ( .A(n51), .B(n54), .Y(n4) );
  AND2X2 U171 ( .A(n202), .B(n76), .Y(n215) );
  NAND2X1 U172 ( .A(n115), .B(n40), .Y(n2) );
  AND2X2 U173 ( .A(n207), .B(n208), .Y(n41) );
  XOR2X1 U174 ( .A(n34), .B(n1), .Y(SUM[16]) );
  AOI21X1 U175 ( .A0(n55), .A1(n51), .B0(n52), .Y(n50) );
  INVX2 U176 ( .A(n24), .Y(n211) );
  INVX2 U177 ( .A(B[19]), .Y(n209) );
  OR2X4 U178 ( .A(A[8]), .B(B[8]), .Y(n205) );
  OR2X4 U179 ( .A(A[9]), .B(B[9]), .Y(n202) );
  AND2X1 U180 ( .A(n206), .B(n113), .Y(SUM[0]) );
  OR2X2 U181 ( .A(A[11]), .B(B[11]), .Y(n204) );
  OR2X1 U182 ( .A(A[0]), .B(B[0]), .Y(n206) );
  AOI21XL U183 ( .A0(n77), .A1(n202), .B0(n74), .Y(n72) );
  NOR2X2 U184 ( .A(A[13]), .B(B[13]), .Y(n53) );
  XOR2X2 U185 ( .A(n64), .B(n6), .Y(SUM[11]) );
  NAND2X2 U186 ( .A(n204), .B(n63), .Y(n6) );
  NAND2X1 U187 ( .A(n55), .B(n42), .Y(n207) );
  XOR2X1 U188 ( .A(n226), .B(B[17]), .Y(SUM[17]) );
  NAND2X2 U189 ( .A(n226), .B(B[17]), .Y(n24) );
  INVX4 U190 ( .A(n225), .Y(n226) );
  AOI21X4 U191 ( .A0(n220), .A1(n74), .B0(n69), .Y(n67) );
  INVX2 U192 ( .A(n27), .Y(n225) );
  XOR2X2 U193 ( .A(n77), .B(n215), .Y(SUM[9]) );
  NOR2X2 U194 ( .A(n48), .B(n53), .Y(n42) );
  INVX1 U195 ( .A(n59), .Y(n118) );
  OAI21X2 U196 ( .A0(n64), .A1(n214), .B0(n63), .Y(n61) );
  INVX4 U197 ( .A(n65), .Y(n64) );
  INVXL U198 ( .A(n43), .Y(n208) );
  XOR2X4 U199 ( .A(n41), .B(n2), .Y(SUM[15]) );
  XOR2X4 U200 ( .A(n210), .B(n209), .Y(SUM[19]) );
  NAND2X2 U201 ( .A(n226), .B(n222), .Y(n210) );
  NOR2X2 U202 ( .A(A[11]), .B(B[11]), .Y(n214) );
  NOR2X4 U203 ( .A(n32), .B(n37), .Y(n30) );
  INVX2 U204 ( .A(n43), .Y(n45) );
  OAI21X2 U205 ( .A0(n92), .A1(n94), .B0(n93), .Y(n91) );
  NAND2X2 U206 ( .A(A[15]), .B(B[15]), .Y(n40) );
  OAI21X2 U207 ( .A0(n48), .A1(n54), .B0(n49), .Y(n43) );
  OAI21X4 U208 ( .A0(n59), .A1(n63), .B0(n60), .Y(n58) );
  CLKINVX2 U209 ( .A(n54), .Y(n52) );
  NAND2X2 U210 ( .A(n220), .B(n202), .Y(n66) );
  NAND2X2 U211 ( .A(n24), .B(B[18]), .Y(n212) );
  NAND2X4 U212 ( .A(n211), .B(n23), .Y(n213) );
  NAND2X4 U213 ( .A(n212), .B(n213), .Y(SUM[18]) );
  CLKINVX2 U214 ( .A(B[18]), .Y(n23) );
  NOR2X4 U215 ( .A(A[14]), .B(B[14]), .Y(n48) );
  NAND2XL U216 ( .A(A[10]), .B(B[10]), .Y(n71) );
  OAI21X4 U217 ( .A0(n84), .A1(n86), .B0(n85), .Y(n83) );
  AND2X2 U218 ( .A(n118), .B(n60), .Y(n224) );
  INVX4 U219 ( .A(n56), .Y(n55) );
  AOI21X4 U220 ( .A0(n83), .A1(n205), .B0(n80), .Y(n78) );
  OAI21X4 U221 ( .A0(n66), .A1(n78), .B0(n67), .Y(n65) );
  INVX2 U222 ( .A(n76), .Y(n74) );
  CLKINVX2 U223 ( .A(n90), .Y(n88) );
  CLKINVX2 U224 ( .A(n82), .Y(n80) );
  AOI21X1 U225 ( .A0(n35), .A1(n55), .B0(n36), .Y(n34) );
  AOI21X2 U226 ( .A0(n219), .A1(n99), .B0(n96), .Y(n94) );
  NAND2X2 U227 ( .A(A[12]), .B(B[12]), .Y(n60) );
  OR2X4 U228 ( .A(A[10]), .B(B[10]), .Y(n220) );
  AOI21X1 U229 ( .A0(n43), .A1(n30), .B0(n31), .Y(n29) );
  NAND2X1 U230 ( .A(A[16]), .B(B[16]), .Y(n33) );
  NAND2XL U231 ( .A(A[6]), .B(B[6]), .Y(n90) );
  OAI21X1 U232 ( .A0(n56), .A1(n28), .B0(n29), .Y(n27) );
  NAND2XL U233 ( .A(n42), .B(n30), .Y(n28) );
  NAND2X1 U234 ( .A(A[8]), .B(B[8]), .Y(n82) );
  OR2X2 U235 ( .A(A[4]), .B(B[4]), .Y(n219) );
  OR2X2 U236 ( .A(A[6]), .B(B[6]), .Y(n221) );
  NAND2X1 U237 ( .A(A[14]), .B(B[14]), .Y(n49) );
  NAND2XL U238 ( .A(A[5]), .B(B[5]), .Y(n93) );
  NAND2XL U239 ( .A(A[4]), .B(B[4]), .Y(n98) );
  INVX1 U240 ( .A(n103), .Y(n102) );
  OAI21X1 U241 ( .A0(n104), .A1(n106), .B0(n105), .Y(n103) );
  AND2X4 U242 ( .A(B[18]), .B(B[17]), .Y(n222) );
  NAND2XL U243 ( .A(A[2]), .B(B[2]), .Y(n105) );
  NAND2XL U244 ( .A(A[1]), .B(B[1]), .Y(n110) );
  CLKINVX2 U245 ( .A(n113), .Y(n111) );
  XOR2XL U246 ( .A(n216), .B(n91), .Y(SUM[6]) );
  AND2X1 U247 ( .A(n221), .B(n90), .Y(n216) );
  XOR2XL U248 ( .A(n217), .B(n99), .Y(SUM[4]) );
  AND2X1 U249 ( .A(n219), .B(n98), .Y(n217) );
  XOR2XL U250 ( .A(n218), .B(n111), .Y(SUM[1]) );
  AND2X1 U251 ( .A(n223), .B(n110), .Y(n218) );
  INVX2 U252 ( .A(n98), .Y(n96) );
  OAI21X1 U253 ( .A0(n100), .A1(n102), .B0(n101), .Y(n99) );
  NOR2X1 U254 ( .A(A[5]), .B(B[5]), .Y(n92) );
  NAND2XL U255 ( .A(A[7]), .B(B[7]), .Y(n85) );
  NAND2X1 U256 ( .A(n114), .B(n33), .Y(n1) );
  CLKINVXL U257 ( .A(n37), .Y(n115) );
  CLKINVXL U258 ( .A(n32), .Y(n114) );
  NOR2X1 U259 ( .A(A[3]), .B(B[3]), .Y(n100) );
  NAND2XL U260 ( .A(A[3]), .B(B[3]), .Y(n101) );
  NOR2X1 U261 ( .A(A[2]), .B(B[2]), .Y(n104) );
  INVX2 U262 ( .A(n110), .Y(n108) );
  OR2X1 U263 ( .A(A[1]), .B(B[1]), .Y(n223) );
  XNOR2XL U264 ( .A(n9), .B(n83), .Y(SUM[8]) );
  NAND2XL U265 ( .A(n205), .B(n82), .Y(n9) );
  NAND2XL U266 ( .A(n123), .B(n85), .Y(n10) );
  CLKINVXL U267 ( .A(n84), .Y(n123) );
  XOR2XL U268 ( .A(n12), .B(n94), .Y(SUM[5]) );
  NAND2XL U269 ( .A(n125), .B(n93), .Y(n12) );
  CLKINVXL U270 ( .A(n92), .Y(n125) );
  XOR2XL U271 ( .A(n14), .B(n102), .Y(SUM[3]) );
  NAND2XL U272 ( .A(n127), .B(n101), .Y(n14) );
  CLKINVXL U273 ( .A(n100), .Y(n127) );
  NAND2XL U274 ( .A(n128), .B(n105), .Y(n15) );
  CLKINVXL U275 ( .A(n104), .Y(n128) );
  NAND2X1 U276 ( .A(A[0]), .B(B[0]), .Y(n113) );
  OAI21X1 U277 ( .A0(n32), .A1(n40), .B0(n33), .Y(n31) );
  INVX2 U278 ( .A(n53), .Y(n51) );
  INVX2 U279 ( .A(n48), .Y(n116) );
  NAND2X2 U280 ( .A(A[11]), .B(B[11]), .Y(n63) );
  NOR2X2 U281 ( .A(n59), .B(n214), .Y(n57) );
  AOI21X4 U282 ( .A0(n57), .A1(n65), .B0(n58), .Y(n56) );
  XOR2XL U283 ( .A(n15), .B(n106), .Y(SUM[2]) );
  XOR2XL U284 ( .A(n10), .B(n86), .Y(SUM[7]) );
  NAND2XL U285 ( .A(n220), .B(n71), .Y(n7) );
  NOR2X4 U286 ( .A(A[15]), .B(B[15]), .Y(n37) );
  NOR2X4 U287 ( .A(A[12]), .B(B[12]), .Y(n59) );
  AOI21X4 U288 ( .A0(n91), .A1(n221), .B0(n88), .Y(n86) );
  NOR2X4 U289 ( .A(A[16]), .B(B[16]), .Y(n32) );
endmodule


module SNN_DW01_add_288 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n14, n16, n20, n23, n24, n25, n26, n27, n31, n32, n36, n37, n38,
         n39, n41, n42, n44, n45, n47, n49, n52, n55, n57, n62, n65, n66, n67,
         n68, n69, n71, n72, n74, n75, n76, n77, n78, n145, n146, n147, n148;

  AOI21X1 U15 ( .A0(n24), .A1(n37), .B0(n25), .Y(n23) );
  AOI21X1 U81 ( .A0(n66), .A1(n74), .B0(n67), .Y(n65) );
  ADDFX2 U102 ( .A(n78), .B(B[2]), .CI(A[2]), .CO(n77) );
  INVX3 U110 ( .A(n14), .Y(CO) );
  AOI21X2 U111 ( .A0(n44), .A1(n146), .B0(n16), .Y(n14) );
  NAND2X1 U112 ( .A(A[10]), .B(B[10]), .Y(n42) );
  NOR2X1 U113 ( .A(A[4]), .B(B[4]), .Y(n71) );
  NAND2X1 U114 ( .A(A[4]), .B(B[4]), .Y(n72) );
  NAND2X1 U115 ( .A(A[9]), .B(B[9]), .Y(n145) );
  AND2XL U116 ( .A(n24), .B(n36), .Y(n146) );
  NOR2X2 U117 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NOR2X2 U118 ( .A(A[9]), .B(B[9]), .Y(n49) );
  NOR2X2 U119 ( .A(A[5]), .B(B[5]), .Y(n68) );
  NAND2XL U120 ( .A(A[3]), .B(B[3]), .Y(n76) );
  CLKINVX1 U121 ( .A(A[14]), .Y(n20) );
  OAI21XL U122 ( .A0(n75), .A1(n1), .B0(n76), .Y(n74) );
  OAI21X1 U123 ( .A0(n45), .A1(n65), .B0(n145), .Y(n44) );
  CLKINVXL U124 ( .A(A[8]), .Y(n52) );
  CLKINVX2 U125 ( .A(A[7]), .Y(n57) );
  OAI21XL U126 ( .A0(n32), .A1(n26), .B0(n27), .Y(n25) );
  NAND2XL U127 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NOR2X1 U128 ( .A(n52), .B(n49), .Y(n47) );
  CLKINVX2 U129 ( .A(A[6]), .Y(n62) );
  NAND2XL U130 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2X1 U131 ( .A(n20), .B(n23), .Y(n16) );
  NOR2X1 U132 ( .A(A[3]), .B(B[3]), .Y(n75) );
  NOR2X1 U133 ( .A(n41), .B(n38), .Y(n36) );
  NOR2X1 U134 ( .A(A[10]), .B(B[10]), .Y(n41) );
  NAND2XL U135 ( .A(A[5]), .B(B[5]), .Y(n69) );
  INVX2 U136 ( .A(A[1]), .Y(n148) );
  NOR2X1 U137 ( .A(n31), .B(n26), .Y(n24) );
  NOR2X1 U138 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NOR2X1 U139 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NAND2XL U140 ( .A(A[13]), .B(B[13]), .Y(n27) );
  INVX2 U141 ( .A(n77), .Y(n1) );
  NAND2X1 U142 ( .A(n147), .B(n148), .Y(n78) );
  INVX2 U143 ( .A(B[1]), .Y(n147) );
  NOR2X1 U144 ( .A(n71), .B(n68), .Y(n66) );
  OAI21X1 U145 ( .A0(n68), .A1(n72), .B0(n69), .Y(n67) );
  OAI21X1 U146 ( .A0(n42), .A1(n38), .B0(n39), .Y(n37) );
  NAND2X1 U147 ( .A(n47), .B(n55), .Y(n45) );
  NOR2X1 U148 ( .A(n62), .B(n57), .Y(n55) );
endmodule


module SNN_DW_mult_uns_52 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n4, n6, n8, n9, n10, n11, n13, n19, n21, n23, n24, n25,
         n26, n27, n28, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n47, n48, n49, n50, n52, n55, n56, n57, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n85, n86, n87, n88, n90, n92, n93, n94, n95, n97, n98,
         n99, n103, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n314, n315, n316,
         n317, n318, n319, n321, n322, n323, n324, n325;

  AOI21X1 U7 ( .A0(n26), .A1(n324), .B0(n21), .Y(n19) );
  NAND2X4 U69 ( .A(n136), .B(n147), .Y(n61) );
  ADDFHX4 U123 ( .A(n121), .B(n114), .CI(n119), .CO(n111), .S(n112) );
  ADDFHX4 U126 ( .A(n129), .B(n120), .CI(n127), .CO(n117), .S(n118) );
  ADDFHX4 U127 ( .A(n124), .B(n131), .CI(n122), .CO(n119), .S(n120) );
  ADDFHX4 U129 ( .A(n221), .B(n207), .CI(n200), .CO(n123), .S(n124) );
  ADDFHX4 U130 ( .A(n139), .B(n137), .CI(n128), .CO(n125), .S(n126) );
  ADDFHX4 U135 ( .A(n140), .B(n149), .CI(n138), .CO(n135), .S(n136) );
  NOR2X4 U182 ( .A(n256), .B(n262), .Y(n209) );
  NOR2X4 U200 ( .A(n258), .B(n264), .Y(n227) );
  NOR2X4 U219 ( .A(n253), .B(n267), .Y(n246) );
  NOR2X1 U244 ( .A(n304), .B(n305), .Y(n306) );
  NOR2X1 U245 ( .A(n306), .B(n43), .Y(n41) );
  CLKINVX2 U246 ( .A(n42), .Y(n304) );
  CLKINVX1 U247 ( .A(n62), .Y(n305) );
  NOR2BX2 U248 ( .AN(n49), .B(n44), .Y(n42) );
  INVX4 U249 ( .A(n63), .Y(n62) );
  OAI21X1 U250 ( .A0(n52), .A1(n44), .B0(n47), .Y(n43) );
  AND2X2 U251 ( .A(a[5]), .B(b[1]), .Y(n239) );
  NAND2XL U252 ( .A(n62), .B(n49), .Y(n307) );
  INVXL U253 ( .A(n50), .Y(n308) );
  AND2X4 U254 ( .A(n307), .B(n308), .Y(n48) );
  XOR2X4 U255 ( .A(n48), .B(n317), .Y(product[10]) );
  NAND2X2 U256 ( .A(n309), .B(n310), .Y(n311) );
  NAND2X2 U257 ( .A(n311), .B(n70), .Y(n68) );
  CLKINVX2 U258 ( .A(n71), .Y(n309) );
  CLKINVXL U259 ( .A(n69), .Y(n310) );
  INVX3 U260 ( .A(n72), .Y(n71) );
  NAND2X2 U261 ( .A(n160), .B(n169), .Y(n70) );
  XNOR2X4 U262 ( .A(n68), .B(n8), .Y(product[7]) );
  BUFX4 U263 ( .A(n185), .Y(n312) );
  NOR2X4 U264 ( .A(n254), .B(n267), .Y(n247) );
  ADDHX1 U265 ( .A(n249), .B(n242), .CO(n185), .S(n186) );
  NOR2X2 U266 ( .A(n325), .B(n266), .Y(n242) );
  OR2X2 U267 ( .A(n35), .B(n63), .Y(n315) );
  ADDFHX2 U268 ( .A(n153), .B(n142), .CI(n151), .CO(n137), .S(n138) );
  ADDFHX4 U269 ( .A(n167), .B(n210), .CI(n196), .CO(n153), .S(n154) );
  INVX8 U270 ( .A(a[2]), .Y(n325) );
  INVX4 U271 ( .A(n60), .Y(n97) );
  NOR2X4 U272 ( .A(n136), .B(n147), .Y(n60) );
  XOR2X2 U273 ( .A(n75), .B(n10), .Y(product[5]) );
  NOR2X1 U274 ( .A(n66), .B(n69), .Y(n64) );
  INVX1 U275 ( .A(n69), .Y(n99) );
  NOR2X2 U276 ( .A(n253), .B(n266), .Y(n238) );
  XOR2X4 U277 ( .A(n24), .B(n1), .Y(product[14]) );
  NOR2X2 U278 ( .A(n255), .B(n263), .Y(n216) );
  INVX4 U279 ( .A(a[4]), .Y(n255) );
  NOR2X2 U280 ( .A(n255), .B(n266), .Y(n240) );
  OAI21X2 U281 ( .A0(n75), .A1(n73), .B0(n74), .Y(n72) );
  NOR2X4 U282 ( .A(n257), .B(n262), .Y(n210) );
  NOR2X1 U283 ( .A(n254), .B(n265), .Y(n231) );
  NAND2X1 U284 ( .A(n93), .B(n33), .Y(n3) );
  NAND2X1 U285 ( .A(n92), .B(n28), .Y(n2) );
  AND2X2 U286 ( .A(a[3]), .B(b[4]), .Y(n217) );
  NOR2X1 U287 ( .A(n253), .B(n264), .Y(n222) );
  ADDFHXL U288 ( .A(n213), .B(n199), .CI(n192), .CO(n115), .S(n116) );
  NOR2X2 U289 ( .A(n325), .B(n264), .Y(n226) );
  NOR2X2 U290 ( .A(n256), .B(n267), .Y(n249) );
  NAND2X1 U291 ( .A(n324), .B(n23), .Y(n1) );
  ADDFHX1 U292 ( .A(n145), .B(n201), .CI(n194), .CO(n131), .S(n132) );
  NOR2X2 U293 ( .A(n256), .B(n261), .Y(n201) );
  NOR2X1 U294 ( .A(n325), .B(n263), .Y(n218) );
  ADDFHX1 U295 ( .A(n132), .B(n141), .CI(n130), .CO(n127), .S(n128) );
  INVX4 U296 ( .A(a[5]), .Y(n254) );
  NOR2X1 U297 ( .A(n258), .B(n260), .Y(n195) );
  ADDFHX1 U298 ( .A(n206), .B(n123), .CI(n116), .CO(n113), .S(n114) );
  ADDFX2 U299 ( .A(n219), .B(n212), .CI(n181), .CO(n171), .S(n172) );
  NOR2X1 U300 ( .A(n111), .B(n108), .Y(n32) );
  ADDFX2 U301 ( .A(n115), .B(n110), .CI(n113), .CO(n107), .S(n108) );
  ADDFX2 U302 ( .A(n197), .B(n190), .CI(n109), .CO(n105), .S(n106) );
  NOR2X1 U303 ( .A(n253), .B(n260), .Y(n190) );
  NAND2X1 U304 ( .A(n94), .B(n40), .Y(n4) );
  NAND2X1 U305 ( .A(n95), .B(n47), .Y(n317) );
  INVX2 U306 ( .A(n44), .Y(n95) );
  ADDFX2 U307 ( .A(n174), .B(n179), .CI(n172), .CO(n169), .S(n170) );
  INVX2 U308 ( .A(b[3]), .Y(n264) );
  NOR2X1 U309 ( .A(n32), .B(n27), .Y(n25) );
  OR2X1 U310 ( .A(n105), .B(n189), .Y(n324) );
  NOR2X1 U311 ( .A(n107), .B(n106), .Y(n27) );
  OAI21X1 U312 ( .A0(n39), .A1(n47), .B0(n40), .Y(n38) );
  NOR2X2 U313 ( .A(n170), .B(n177), .Y(n73) );
  NAND2X1 U314 ( .A(n170), .B(n177), .Y(n74) );
  INVX2 U315 ( .A(b[2]), .Y(n265) );
  INVX2 U316 ( .A(a[2]), .Y(n257) );
  OAI2BB1X2 U317 ( .A0N(n86), .A1N(n322), .B0(n85), .Y(n321) );
  AND2X1 U318 ( .A(n322), .B(n85), .Y(n318) );
  INVX4 U319 ( .A(a[0]), .Y(n259) );
  INVX2 U320 ( .A(b[0]), .Y(n267) );
  NOR2X1 U321 ( .A(n188), .B(n236), .Y(n87) );
  AND2X1 U322 ( .A(n319), .B(n90), .Y(product[1]) );
  AND2X1 U323 ( .A(n25), .B(n324), .Y(n314) );
  INVX2 U324 ( .A(b[1]), .Y(n266) );
  INVX2 U325 ( .A(b[4]), .Y(n263) );
  NOR2X1 U326 ( .A(n257), .B(n267), .Y(n250) );
  NOR2X2 U327 ( .A(n254), .B(n264), .Y(n223) );
  NOR2X2 U328 ( .A(n254), .B(n263), .Y(n215) );
  NOR2X1 U329 ( .A(n255), .B(n262), .Y(n208) );
  AOI21X4 U330 ( .A0(n34), .A1(n93), .B0(n31), .Y(n29) );
  NOR2X4 U331 ( .A(n253), .B(n263), .Y(n214) );
  ADDFHX2 U332 ( .A(n164), .B(n171), .CI(n162), .CO(n159), .S(n160) );
  ADDHX2 U333 ( .A(n237), .B(n223), .CO(n145), .S(n146) );
  NAND2BX1 U334 ( .AN(n55), .B(n56), .Y(n6) );
  ADDFHX2 U335 ( .A(n229), .B(n215), .CI(n208), .CO(n133), .S(n134) );
  NOR2X2 U336 ( .A(n55), .B(n60), .Y(n49) );
  XOR2X4 U337 ( .A(n57), .B(n6), .Y(product[9]) );
  NAND2X2 U338 ( .A(n148), .B(n159), .Y(n67) );
  NAND2X2 U339 ( .A(n98), .B(n67), .Y(n8) );
  INVX1 U340 ( .A(n87), .Y(n103) );
  XNOR2X4 U341 ( .A(n62), .B(n316), .Y(product[8]) );
  NAND2X4 U342 ( .A(n97), .B(n61), .Y(n316) );
  ADDFHX4 U343 ( .A(n176), .B(n226), .CI(n233), .CO(n173), .S(n174) );
  NOR2XL U344 ( .A(n255), .B(n260), .Y(n192) );
  NOR2XL U345 ( .A(n255), .B(n261), .Y(n200) );
  NOR2XL U346 ( .A(n255), .B(n267), .Y(n248) );
  NOR2X1 U347 ( .A(n255), .B(n264), .Y(n224) );
  NOR2XL U348 ( .A(n258), .B(n267), .Y(n251) );
  NOR2XL U349 ( .A(n258), .B(n262), .Y(n211) );
  NOR2XL U350 ( .A(n258), .B(n266), .Y(n243) );
  NOR2X2 U351 ( .A(n258), .B(n265), .Y(n235) );
  NOR2X2 U352 ( .A(n160), .B(n169), .Y(n69) );
  NOR2X4 U353 ( .A(n256), .B(n264), .Y(n225) );
  OR2X4 U354 ( .A(n184), .B(n187), .Y(n322) );
  XOR2X1 U355 ( .A(n9), .B(n71), .Y(product[6]) );
  NOR2X4 U356 ( .A(n325), .B(n265), .Y(n234) );
  ADDHX2 U357 ( .A(n245), .B(n231), .CO(n157), .S(n158) );
  NAND2X1 U358 ( .A(n178), .B(n183), .Y(n79) );
  ADDFHX2 U359 ( .A(n225), .B(n246), .CI(n211), .CO(n163), .S(n164) );
  INVX1 U360 ( .A(n50), .Y(n52) );
  AOI21X2 U361 ( .A0(n34), .A1(n25), .B0(n26), .Y(n24) );
  ADDHX2 U362 ( .A(n247), .B(n240), .CO(n175), .S(n176) );
  NOR2X2 U363 ( .A(n258), .B(n261), .Y(n203) );
  AOI21X2 U364 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  AOI21X4 U365 ( .A0(n321), .A1(n323), .B0(n77), .Y(n75) );
  NOR2X2 U366 ( .A(n256), .B(n266), .Y(n241) );
  NAND2X4 U367 ( .A(n315), .B(n36), .Y(n34) );
  XOR2X4 U368 ( .A(n29), .B(n2), .Y(product[13]) );
  ADDFHX2 U369 ( .A(n238), .B(n203), .CI(n156), .CO(n151), .S(n152) );
  XNOR2X1 U370 ( .A(n11), .B(n321), .Y(product[4]) );
  INVX3 U371 ( .A(a[1]), .Y(n258) );
  ADDFHX2 U372 ( .A(n234), .B(n227), .CI(n220), .CO(n179), .S(n180) );
  XNOR2X4 U373 ( .A(n34), .B(n3), .Y(product[12]) );
  ADDFHX1 U374 ( .A(n222), .B(n134), .CI(n143), .CO(n129), .S(n130) );
  NOR2X4 U375 ( .A(n255), .B(n265), .Y(n232) );
  ADDFHX2 U376 ( .A(n224), .B(n158), .CI(n217), .CO(n155), .S(n156) );
  OAI21X2 U377 ( .A0(n55), .A1(n61), .B0(n56), .Y(n50) );
  NAND2X2 U378 ( .A(n126), .B(n135), .Y(n56) );
  ADDFHX2 U379 ( .A(n235), .B(n228), .CI(n186), .CO(n183), .S(n184) );
  ADDFHX4 U380 ( .A(n152), .B(n161), .CI(n150), .CO(n147), .S(n148) );
  ADDHX2 U381 ( .A(n239), .B(n232), .CO(n167), .S(n168) );
  ADDFHX2 U382 ( .A(n182), .B(n312), .CI(n180), .CO(n177), .S(n178) );
  ADDFHX4 U383 ( .A(n204), .B(n173), .CI(n166), .CO(n161), .S(n162) );
  AOI21X2 U384 ( .A0(n62), .A1(n97), .B0(n59), .Y(n57) );
  OAI2BB1X1 U385 ( .A0N(n34), .A1N(n314), .B0(n19), .Y(product[15]) );
  CLKINVXL U386 ( .A(n27), .Y(n92) );
  NOR2X2 U387 ( .A(n252), .B(n267), .Y(n245) );
  AOI21X2 U388 ( .A0(n64), .A1(n72), .B0(n65), .Y(n63) );
  NAND2X2 U389 ( .A(n118), .B(n125), .Y(n47) );
  NOR2X4 U390 ( .A(n259), .B(n264), .Y(n228) );
  INVX2 U391 ( .A(n32), .Y(n93) );
  OR2X4 U392 ( .A(n178), .B(n183), .Y(n323) );
  INVX4 U393 ( .A(a[7]), .Y(n252) );
  INVX2 U394 ( .A(b[7]), .Y(n260) );
  NAND2BX1 U395 ( .AN(n73), .B(n74), .Y(n10) );
  CLKINVXL U396 ( .A(n33), .Y(n31) );
  XOR2X1 U397 ( .A(n318), .B(n86), .Y(product[3]) );
  OAI21XL U398 ( .A0(n33), .A1(n27), .B0(n28), .Y(n26) );
  ADDFHX2 U399 ( .A(n165), .B(n154), .CI(n163), .CO(n149), .S(n150) );
  NAND2XL U400 ( .A(n188), .B(n236), .Y(n88) );
  OR2XL U401 ( .A(n251), .B(n244), .Y(n319) );
  NAND2X1 U402 ( .A(n105), .B(n189), .Y(n23) );
  NOR2X1 U403 ( .A(n259), .B(n263), .Y(n220) );
  NOR2X1 U404 ( .A(n259), .B(n260), .Y(n196) );
  INVX3 U405 ( .A(b[5]), .Y(n262) );
  INVX3 U406 ( .A(b[6]), .Y(n261) );
  CLKINVXL U407 ( .A(n66), .Y(n98) );
  NAND2XL U408 ( .A(n99), .B(n70), .Y(n9) );
  XOR2X2 U409 ( .A(n41), .B(n4), .Y(product[11]) );
  CLKINVXL U410 ( .A(n39), .Y(n94) );
  INVX2 U411 ( .A(n79), .Y(n77) );
  NAND2X1 U412 ( .A(n323), .B(n79), .Y(n11) );
  XOR2X1 U413 ( .A(n13), .B(n90), .Y(product[2]) );
  NAND2X1 U414 ( .A(n103), .B(n88), .Y(n13) );
  OAI21X1 U415 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  NAND2X1 U416 ( .A(n117), .B(n112), .Y(n40) );
  INVX2 U417 ( .A(n23), .Y(n21) );
  NAND2X1 U418 ( .A(n111), .B(n108), .Y(n33) );
  NAND2X1 U419 ( .A(n184), .B(n187), .Y(n85) );
  NAND2X1 U420 ( .A(n251), .B(n244), .Y(n90) );
  NAND2XL U421 ( .A(n107), .B(n106), .Y(n28) );
  NOR2X1 U422 ( .A(n256), .B(n265), .Y(n233) );
  NOR2X1 U423 ( .A(n259), .B(n261), .Y(n204) );
  NOR2X1 U424 ( .A(n259), .B(n266), .Y(n244) );
  ADDHX1 U425 ( .A(n250), .B(n243), .CO(n187), .S(n188) );
  NOR2X1 U426 ( .A(n259), .B(n262), .Y(n212) );
  NOR2X1 U427 ( .A(n258), .B(n263), .Y(n219) );
  ADDHX1 U428 ( .A(n248), .B(n241), .CO(n181), .S(n182) );
  NOR2X1 U429 ( .A(n252), .B(n266), .Y(n237) );
  NOR2X1 U430 ( .A(n252), .B(n265), .Y(n229) );
  ADDFHX1 U431 ( .A(n195), .B(n155), .CI(n144), .CO(n139), .S(n140) );
  NOR2X1 U432 ( .A(n259), .B(n265), .Y(n236) );
  NOR2X1 U433 ( .A(n256), .B(n260), .Y(n193) );
  NOR2X1 U434 ( .A(n252), .B(n264), .Y(n221) );
  NOR2X1 U435 ( .A(n254), .B(n262), .Y(n207) );
  NOR2X1 U436 ( .A(n259), .B(n267), .Y(product[0]) );
  NOR2X1 U437 ( .A(n253), .B(n262), .Y(n206) );
  NOR2X1 U438 ( .A(n252), .B(n263), .Y(n213) );
  NOR2X1 U439 ( .A(n254), .B(n261), .Y(n199) );
  ADDFX2 U440 ( .A(n205), .B(n191), .CI(n198), .CO(n109), .S(n110) );
  NOR2X1 U441 ( .A(n252), .B(n262), .Y(n205) );
  NOR2X1 U442 ( .A(n254), .B(n260), .Y(n191) );
  NOR2X1 U443 ( .A(n253), .B(n261), .Y(n198) );
  NOR2X1 U444 ( .A(n252), .B(n261), .Y(n197) );
  NOR2X1 U445 ( .A(n252), .B(n260), .Y(n189) );
  NOR2X2 U446 ( .A(n44), .B(n39), .Y(n37) );
  NOR2X4 U447 ( .A(n118), .B(n125), .Y(n44) );
  ADDFHX2 U448 ( .A(n202), .B(n209), .CI(n230), .CO(n141), .S(n142) );
  NOR2X2 U449 ( .A(n253), .B(n265), .Y(n230) );
  NOR2X4 U450 ( .A(n325), .B(n261), .Y(n202) );
  NOR2X1 U451 ( .A(n325), .B(n260), .Y(n194) );
  NAND2XL U452 ( .A(n49), .B(n37), .Y(n35) );
  INVX8 U453 ( .A(a[3]), .Y(n256) );
  ADDFHX2 U454 ( .A(n168), .B(n175), .CI(n218), .CO(n165), .S(n166) );
  INVX2 U455 ( .A(n61), .Y(n59) );
  INVX8 U456 ( .A(a[6]), .Y(n253) );
  ADDFHX2 U457 ( .A(n193), .B(n214), .CI(n133), .CO(n121), .S(n122) );
  NOR2X4 U458 ( .A(n117), .B(n112), .Y(n39) );
  OAI21X2 U459 ( .A0(n66), .A1(n70), .B0(n67), .Y(n65) );
  NOR2X4 U460 ( .A(n126), .B(n135), .Y(n55) );
  ADDFHX2 U461 ( .A(n216), .B(n146), .CI(n157), .CO(n143), .S(n144) );
  NOR2X4 U462 ( .A(n148), .B(n159), .Y(n66) );
endmodule


module SNN_DW01_add_293 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n7, n10, n11, n12, n13, n14, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n35, n36, n37, n38, n39, n40, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n64, n66, n67, n69, n71, n72, n73, n75, n77, n78,
         n79, n80, n81, n83, n85, n86, n87, n88, n89, n90, n91, n92, n93, n95,
         n97, n98, n100, n103, n104, n106, n107, n111, n113, n114, n175, n176,
         n177, n178, n179, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n192, n193, n194, n195, n196;

  OAI21X4 U60 ( .A0(n59), .A1(n57), .B0(n58), .Y(n56) );
  AOI21X1 U121 ( .A0(n196), .A1(n98), .B0(n95), .Y(n93) );
  NOR2X4 U137 ( .A(n175), .B(n176), .Y(n177) );
  NOR2X4 U138 ( .A(n177), .B(n38), .Y(n36) );
  INVX4 U139 ( .A(n50), .Y(n175) );
  INVX4 U140 ( .A(n37), .Y(n176) );
  NAND2X1 U141 ( .A(A[5]), .B(B[5]), .Y(n80) );
  INVX8 U142 ( .A(n51), .Y(n50) );
  NOR2X2 U143 ( .A(B[5]), .B(A[5]), .Y(n79) );
  NAND2X2 U144 ( .A(n106), .B(n55), .Y(n186) );
  NAND2X1 U145 ( .A(n104), .B(n44), .Y(n185) );
  INVX2 U146 ( .A(n37), .Y(n39) );
  INVX3 U147 ( .A(n57), .Y(n107) );
  NAND2X2 U148 ( .A(n25), .B(n37), .Y(n23) );
  INVXL U149 ( .A(n79), .Y(n111) );
  INVX3 U150 ( .A(n32), .Y(n103) );
  NOR2X2 U151 ( .A(n182), .B(n32), .Y(n25) );
  OAI21X2 U152 ( .A0(n40), .A1(n32), .B0(n35), .Y(n31) );
  NOR2X4 U153 ( .A(B[13]), .B(A[13]), .Y(n32) );
  XOR2X4 U154 ( .A(n22), .B(n183), .Y(SUM[15]) );
  NAND2X4 U155 ( .A(n192), .B(n181), .Y(n61) );
  INVX4 U156 ( .A(n48), .Y(n46) );
  NOR2X4 U157 ( .A(B[11]), .B(A[11]), .Y(n48) );
  OAI2BB1X4 U158 ( .A0N(n22), .A1N(n194), .B0(n21), .Y(SUM[16]) );
  OAI21X2 U159 ( .A0(n23), .A1(n51), .B0(n24), .Y(n22) );
  INVX1 U160 ( .A(n3), .Y(n178) );
  CLKINVX4 U161 ( .A(n178), .Y(n179) );
  INVX2 U162 ( .A(n54), .Y(n106) );
  NAND2XL U163 ( .A(n103), .B(n35), .Y(n3) );
  NAND2X2 U164 ( .A(B[7]), .B(A[7]), .Y(n71) );
  INVXL U165 ( .A(n43), .Y(n104) );
  OR2X2 U166 ( .A(B[6]), .B(A[6]), .Y(n193) );
  OR2X1 U167 ( .A(B[15]), .B(A[15]), .Y(n194) );
  AOI21X2 U168 ( .A0(n72), .A1(n181), .B0(n69), .Y(n67) );
  AOI21X1 U169 ( .A0(n195), .A1(n86), .B0(n83), .Y(n81) );
  NOR2X1 U170 ( .A(B[3]), .B(A[3]), .Y(n87) );
  OAI21X1 U171 ( .A0(n87), .A1(n89), .B0(n88), .Y(n86) );
  AND2X1 U172 ( .A(n188), .B(n100), .Y(SUM[0]) );
  OR2X4 U173 ( .A(B[7]), .B(A[7]), .Y(n181) );
  NAND2X2 U174 ( .A(B[13]), .B(A[13]), .Y(n35) );
  INVX2 U175 ( .A(n38), .Y(n40) );
  INVX1 U176 ( .A(n49), .Y(n47) );
  NAND2X4 U177 ( .A(B[11]), .B(A[11]), .Y(n49) );
  XOR2X4 U178 ( .A(n36), .B(n179), .Y(SUM[13]) );
  INVX3 U179 ( .A(n71), .Y(n69) );
  XOR2X4 U180 ( .A(n29), .B(n2), .Y(SUM[14]) );
  AOI21X2 U181 ( .A0(n50), .A1(n30), .B0(n31), .Y(n29) );
  OAI21X4 U182 ( .A0(n43), .A1(n49), .B0(n44), .Y(n38) );
  NOR2X2 U183 ( .A(B[14]), .B(A[14]), .Y(n182) );
  NOR2XL U184 ( .A(B[14]), .B(A[14]), .Y(n27) );
  NAND2XL U185 ( .A(B[14]), .B(A[14]), .Y(n28) );
  XOR2X2 U186 ( .A(n59), .B(n7), .Y(SUM[9]) );
  NAND2X2 U187 ( .A(n107), .B(n58), .Y(n7) );
  AOI21X1 U188 ( .A0(n25), .A1(n38), .B0(n26), .Y(n24) );
  OAI21X1 U189 ( .A0(n27), .A1(n35), .B0(n28), .Y(n26) );
  AOI21X4 U190 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  NOR2X2 U191 ( .A(n54), .B(n57), .Y(n52) );
  AOI21X4 U192 ( .A0(n192), .A1(n69), .B0(n64), .Y(n62) );
  XNOR2X2 U193 ( .A(n67), .B(n190), .Y(SUM[8]) );
  NAND2XL U194 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U195 ( .A(B[4]), .B(A[4]), .Y(n195) );
  INVX4 U196 ( .A(n73), .Y(n72) );
  XNOR2X4 U197 ( .A(n56), .B(n186), .Y(SUM[10]) );
  AND2X4 U198 ( .A(n181), .B(n71), .Y(n184) );
  OAI21X2 U199 ( .A0(n54), .A1(n58), .B0(n55), .Y(n53) );
  AOI21X4 U200 ( .A0(n50), .A1(n46), .B0(n47), .Y(n45) );
  NOR2X4 U201 ( .A(n48), .B(n43), .Y(n37) );
  XOR2X1 U202 ( .A(n11), .B(n81), .Y(SUM[5]) );
  XOR2X2 U203 ( .A(n50), .B(n189), .Y(SUM[11]) );
  XOR2X4 U204 ( .A(n45), .B(n185), .Y(SUM[12]) );
  NAND2X2 U205 ( .A(A[12]), .B(B[12]), .Y(n44) );
  NOR2X1 U206 ( .A(n39), .B(n32), .Y(n30) );
  XOR2X2 U207 ( .A(n72), .B(n184), .Y(SUM[7]) );
  OAI21X4 U208 ( .A0(n61), .A1(n73), .B0(n62), .Y(n60) );
  NAND2XL U209 ( .A(B[6]), .B(A[6]), .Y(n77) );
  OR2X1 U210 ( .A(B[0]), .B(A[0]), .Y(n188) );
  AND2X1 U211 ( .A(n194), .B(n21), .Y(n183) );
  OAI21X2 U212 ( .A0(n79), .A1(n81), .B0(n80), .Y(n78) );
  OR2X4 U213 ( .A(B[8]), .B(A[8]), .Y(n192) );
  NAND2BX1 U214 ( .AN(n182), .B(n28), .Y(n2) );
  NAND2XL U215 ( .A(B[8]), .B(A[8]), .Y(n66) );
  CLKINVX2 U216 ( .A(n85), .Y(n83) );
  INVX1 U217 ( .A(n90), .Y(n89) );
  OAI21X1 U218 ( .A0(n91), .A1(n93), .B0(n92), .Y(n90) );
  XNOR2XL U219 ( .A(n12), .B(n86), .Y(SUM[4]) );
  XOR2X1 U220 ( .A(n14), .B(n93), .Y(SUM[2]) );
  CLKINVXL U221 ( .A(n91), .Y(n114) );
  NAND2XL U222 ( .A(B[15]), .B(A[15]), .Y(n21) );
  NAND2XL U223 ( .A(B[2]), .B(A[2]), .Y(n92) );
  NAND2XL U224 ( .A(B[3]), .B(A[3]), .Y(n88) );
  XOR2X1 U225 ( .A(n187), .B(n98), .Y(SUM[1]) );
  AND2X1 U226 ( .A(n196), .B(n97), .Y(n187) );
  NAND2XL U227 ( .A(B[1]), .B(A[1]), .Y(n97) );
  CLKINVX2 U228 ( .A(n100), .Y(n98) );
  INVX2 U229 ( .A(n66), .Y(n64) );
  INVX2 U230 ( .A(n77), .Y(n75) );
  AND2X4 U231 ( .A(n46), .B(n49), .Y(n189) );
  AND2X1 U232 ( .A(n192), .B(n66), .Y(n190) );
  XNOR2X1 U233 ( .A(n10), .B(n78), .Y(SUM[6]) );
  NAND2X1 U234 ( .A(n193), .B(n77), .Y(n10) );
  NAND2X1 U235 ( .A(n111), .B(n80), .Y(n11) );
  NAND2X2 U236 ( .A(B[10]), .B(A[10]), .Y(n55) );
  XOR2XL U237 ( .A(n13), .B(n89), .Y(SUM[3]) );
  NAND2X1 U238 ( .A(n113), .B(n88), .Y(n13) );
  NAND2X1 U239 ( .A(n114), .B(n92), .Y(n14) );
  NOR2X1 U240 ( .A(B[2]), .B(A[2]), .Y(n91) );
  INVX2 U241 ( .A(n97), .Y(n95) );
  OR2X1 U242 ( .A(B[1]), .B(A[1]), .Y(n196) );
  NAND2X1 U243 ( .A(B[0]), .B(A[0]), .Y(n100) );
  NAND2XL U244 ( .A(n195), .B(n85), .Y(n12) );
  NOR2X4 U245 ( .A(A[12]), .B(B[12]), .Y(n43) );
  NAND2X4 U246 ( .A(B[9]), .B(A[9]), .Y(n58) );
  NOR2X4 U247 ( .A(B[10]), .B(A[10]), .Y(n54) );
  INVX4 U248 ( .A(n60), .Y(n59) );
  NOR2X4 U249 ( .A(B[9]), .B(A[9]), .Y(n57) );
  INVX1 U250 ( .A(n87), .Y(n113) );
  AOI21X4 U251 ( .A0(n193), .A1(n78), .B0(n75), .Y(n73) );
endmodule


module SNN_DW_mult_uns_51 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n3, n4, n5, n8, n9, n10, n11, n12, n13, n19, n21, n23, n24, n25,
         n26, n27, n28, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n47, n48, n49, n50, n52, n55, n56, n57, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n80, n81, n82, n83, n85, n87, n88, n90, n92, n93, n96,
         n97, n98, n99, n100, n102, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n325,
         n327, n328, n329, n330, n331;

  AOI21X1 U7 ( .A0(n26), .A1(n329), .B0(n21), .Y(n19) );
  OAI21X4 U87 ( .A0(n75), .A1(n73), .B0(n74), .Y(n72) );
  ADDFHX4 U126 ( .A(n129), .B(n120), .CI(n127), .CO(n117), .S(n118) );
  ADDFHX4 U127 ( .A(n124), .B(n131), .CI(n122), .CO(n119), .S(n120) );
  ADDFHX4 U136 ( .A(n142), .B(n153), .CI(n151), .CO(n137), .S(n138) );
  ADDFHX4 U147 ( .A(n164), .B(n171), .CI(n162), .CO(n159), .S(n160) );
  NOR2X4 U207 ( .A(n257), .B(n265), .Y(n234) );
  NAND2XL U244 ( .A(n11), .B(n80), .Y(n306) );
  NAND2X2 U245 ( .A(n304), .B(n305), .Y(n307) );
  NAND2X2 U246 ( .A(n306), .B(n307), .Y(product[4]) );
  INVX2 U247 ( .A(n11), .Y(n304) );
  CLKINVX2 U248 ( .A(n80), .Y(n305) );
  NAND2XL U249 ( .A(n62), .B(n49), .Y(n308) );
  CLKINVXL U250 ( .A(n50), .Y(n309) );
  AND2X4 U251 ( .A(n308), .B(n309), .Y(n48) );
  XOR2X4 U252 ( .A(n48), .B(n5), .Y(product[10]) );
  NAND2X2 U253 ( .A(n62), .B(n97), .Y(n310) );
  INVX2 U254 ( .A(n59), .Y(n311) );
  AND2X4 U255 ( .A(n310), .B(n311), .Y(n57) );
  XOR3X2 U256 ( .A(n114), .B(n121), .C(n119), .Y(n112) );
  NAND2X1 U257 ( .A(n119), .B(n114), .Y(n312) );
  NAND2XL U258 ( .A(n121), .B(n114), .Y(n313) );
  NAND2X1 U259 ( .A(n121), .B(n119), .Y(n314) );
  NAND3X1 U260 ( .A(n313), .B(n314), .C(n312), .Y(n111) );
  ADDFHX1 U261 ( .A(n207), .B(n200), .CI(n193), .CO(n121), .S(n122) );
  NAND2X2 U262 ( .A(n315), .B(n316), .Y(n317) );
  NAND2X2 U263 ( .A(n317), .B(n70), .Y(n68) );
  INVX3 U264 ( .A(n71), .Y(n315) );
  CLKINVXL U265 ( .A(n69), .Y(n316) );
  INVX4 U266 ( .A(n72), .Y(n71) );
  NAND2X2 U267 ( .A(n160), .B(n169), .Y(n70) );
  XNOR2X4 U268 ( .A(n68), .B(n8), .Y(product[7]) );
  ADDFHX4 U269 ( .A(n232), .B(n168), .CI(n225), .CO(n165), .S(n166) );
  XNOR2X4 U270 ( .A(n57), .B(n327), .Y(product[9]) );
  INVX4 U271 ( .A(a[0]), .Y(n259) );
  BUFX4 U272 ( .A(n185), .Y(n318) );
  ADDFHX4 U273 ( .A(n132), .B(n141), .CI(n130), .CO(n127), .S(n128) );
  ADDFHX1 U274 ( .A(n201), .B(n143), .CI(n194), .CO(n129), .S(n130) );
  NOR2BX4 U275 ( .AN(a[5]), .B(n266), .Y(n239) );
  NOR2X2 U276 ( .A(n257), .B(n262), .Y(n210) );
  OR2X4 U277 ( .A(n35), .B(n63), .Y(n322) );
  NOR2X2 U278 ( .A(n255), .B(n265), .Y(n232) );
  ADDHX2 U279 ( .A(n237), .B(n230), .CO(n145), .S(n146) );
  ADDHX1 U280 ( .A(n248), .B(n241), .CO(n181), .S(n182) );
  ADDFHX2 U281 ( .A(n174), .B(n179), .CI(n172), .CO(n169), .S(n170) );
  XOR2X4 U282 ( .A(n41), .B(n4), .Y(product[11]) );
  AOI21X1 U283 ( .A0(n42), .A1(n62), .B0(n43), .Y(n41) );
  NOR2X2 U284 ( .A(n330), .B(n263), .Y(n217) );
  NOR2X2 U285 ( .A(n258), .B(n263), .Y(n219) );
  AOI21X2 U286 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X2 U287 ( .A(n44), .B(n39), .Y(n37) );
  ADDFHX2 U288 ( .A(n204), .B(n166), .CI(n173), .CO(n161), .S(n162) );
  NOR2BX2 U289 ( .AN(n49), .B(n44), .Y(n42) );
  OAI21X1 U290 ( .A0(n52), .A1(n44), .B0(n47), .Y(n43) );
  ADDFHX4 U291 ( .A(n217), .B(n167), .CI(n203), .CO(n153), .S(n154) );
  NAND2XL U292 ( .A(n49), .B(n37), .Y(n35) );
  NOR2X2 U293 ( .A(n60), .B(n55), .Y(n49) );
  ADDHX2 U294 ( .A(n246), .B(n239), .CO(n167), .S(n168) );
  NOR2X1 U295 ( .A(n255), .B(n263), .Y(n216) );
  NOR2X1 U296 ( .A(n330), .B(n262), .Y(n209) );
  NOR2X2 U297 ( .A(n258), .B(n260), .Y(n195) );
  NOR2X1 U298 ( .A(n258), .B(n262), .Y(n211) );
  CLKINVXL U299 ( .A(n27), .Y(n92) );
  INVX2 U300 ( .A(b[7]), .Y(n260) );
  INVX4 U301 ( .A(a[7]), .Y(n252) );
  NOR2X2 U302 ( .A(n117), .B(n112), .Y(n39) );
  AOI21X2 U303 ( .A0(n328), .A1(n88), .B0(n85), .Y(n83) );
  NOR2X1 U304 ( .A(n253), .B(n267), .Y(n246) );
  NOR2X1 U305 ( .A(n257), .B(n260), .Y(n194) );
  NOR2X1 U306 ( .A(n257), .B(n261), .Y(n202) );
  INVX2 U307 ( .A(b[5]), .Y(n262) );
  ADDFX2 U308 ( .A(n192), .B(n123), .CI(n116), .CO(n113), .S(n114) );
  NOR2X1 U309 ( .A(n255), .B(n260), .Y(n192) );
  INVX2 U310 ( .A(b[4]), .Y(n263) );
  NOR2X1 U311 ( .A(n111), .B(n108), .Y(n32) );
  ADDFX2 U312 ( .A(n115), .B(n110), .CI(n113), .CO(n107), .S(n108) );
  NOR2X1 U313 ( .A(n252), .B(n261), .Y(n197) );
  AND2X1 U314 ( .A(n96), .B(n56), .Y(n327) );
  XOR2X1 U315 ( .A(n71), .B(n9), .Y(product[6]) );
  NAND2X1 U316 ( .A(n99), .B(n70), .Y(n9) );
  NOR2X1 U317 ( .A(n255), .B(n267), .Y(n248) );
  NOR2X1 U318 ( .A(n32), .B(n27), .Y(n25) );
  OR2X1 U319 ( .A(n105), .B(n189), .Y(n329) );
  NOR2X1 U320 ( .A(n107), .B(n106), .Y(n27) );
  NOR2X2 U321 ( .A(n170), .B(n177), .Y(n73) );
  NAND2X1 U322 ( .A(n170), .B(n177), .Y(n74) );
  ADDFHX1 U323 ( .A(n242), .B(n228), .CI(n186), .CO(n183), .S(n184) );
  NOR2X1 U324 ( .A(n259), .B(n264), .Y(n228) );
  INVX2 U325 ( .A(b[2]), .Y(n265) );
  XOR2X1 U326 ( .A(n12), .B(n83), .Y(product[3]) );
  ADDHXL U327 ( .A(n243), .B(n250), .CO(n187), .S(n188) );
  INVX2 U328 ( .A(b[0]), .Y(n267) );
  OR2X2 U329 ( .A(n188), .B(n236), .Y(n328) );
  OR2X4 U330 ( .A(n178), .B(n183), .Y(n319) );
  OR2X1 U331 ( .A(n244), .B(n251), .Y(n320) );
  AND2X1 U332 ( .A(n25), .B(n329), .Y(n321) );
  CLKINVX2 U333 ( .A(n66), .Y(n98) );
  OAI21X2 U334 ( .A0(n66), .A1(n70), .B0(n67), .Y(n65) );
  AOI21X4 U335 ( .A0(n34), .A1(n93), .B0(n31), .Y(n29) );
  AOI21X2 U336 ( .A0(n34), .A1(n25), .B0(n26), .Y(n24) );
  ADDFHX2 U337 ( .A(n140), .B(n149), .CI(n138), .CO(n135), .S(n136) );
  ADDFHX2 U338 ( .A(n152), .B(n161), .CI(n150), .CO(n147), .S(n148) );
  ADDFHX4 U339 ( .A(n134), .B(n215), .CI(n208), .CO(n131), .S(n132) );
  NOR2X4 U340 ( .A(n331), .B(n135), .Y(n55) );
  NAND2X4 U341 ( .A(n322), .B(n36), .Y(n34) );
  NOR2X2 U342 ( .A(n254), .B(n263), .Y(n215) );
  INVX4 U343 ( .A(a[5]), .Y(n254) );
  INVX1 U344 ( .A(n81), .Y(n102) );
  INVX1 U345 ( .A(n69), .Y(n99) );
  INVX4 U346 ( .A(a[4]), .Y(n255) );
  OAI21X2 U347 ( .A0(n55), .A1(n61), .B0(n56), .Y(n50) );
  XOR2X4 U348 ( .A(n29), .B(n323), .Y(product[13]) );
  ADDHX2 U349 ( .A(n245), .B(n238), .CO(n157), .S(n158) );
  NOR2X2 U350 ( .A(n259), .B(n263), .Y(n220) );
  OAI2BB1X1 U351 ( .A0N(n34), .A1N(n321), .B0(n19), .Y(product[15]) );
  XNOR2X4 U352 ( .A(n34), .B(n3), .Y(product[12]) );
  NOR2XL U353 ( .A(n254), .B(n260), .Y(n191) );
  NOR2XL U354 ( .A(n254), .B(n261), .Y(n199) );
  NOR2XL U355 ( .A(n254), .B(n262), .Y(n207) );
  NOR2X2 U356 ( .A(n254), .B(n267), .Y(n247) );
  INVX4 U357 ( .A(a[2]), .Y(n257) );
  NOR2XL U358 ( .A(n257), .B(n263), .Y(n218) );
  NOR2X4 U359 ( .A(n253), .B(n265), .Y(n230) );
  CLKINVXL U360 ( .A(n55), .Y(n96) );
  NOR2X2 U361 ( .A(n136), .B(n147), .Y(n60) );
  NAND2X2 U362 ( .A(n136), .B(n147), .Y(n61) );
  ADDFHX2 U363 ( .A(n144), .B(n202), .CI(n155), .CO(n139), .S(n140) );
  NOR2XL U364 ( .A(n255), .B(n261), .Y(n200) );
  NOR2XL U365 ( .A(n255), .B(n262), .Y(n208) );
  NOR2XL U366 ( .A(n255), .B(n264), .Y(n224) );
  ADDFHX2 U367 ( .A(n146), .B(n157), .CI(n223), .CO(n143), .S(n144) );
  NOR2X2 U368 ( .A(n253), .B(n266), .Y(n238) );
  AND2X4 U369 ( .A(a[0]), .B(b[7]), .Y(n196) );
  CLKINVX2 U370 ( .A(n79), .Y(n77) );
  NAND2X1 U371 ( .A(n178), .B(n183), .Y(n79) );
  NOR2X4 U372 ( .A(n160), .B(n169), .Y(n69) );
  ADDFHX2 U373 ( .A(n211), .B(n175), .CI(n218), .CO(n163), .S(n164) );
  ADDFHX2 U374 ( .A(n226), .B(n212), .CI(n181), .CO(n171), .S(n172) );
  NOR2X2 U375 ( .A(n259), .B(n262), .Y(n212) );
  NOR2X2 U376 ( .A(n184), .B(n187), .Y(n81) );
  ADDFHX2 U377 ( .A(n165), .B(n154), .CI(n163), .CO(n149), .S(n150) );
  NOR2X2 U378 ( .A(n254), .B(n265), .Y(n231) );
  XOR2X1 U379 ( .A(n75), .B(n10), .Y(product[5]) );
  NOR2X2 U380 ( .A(n330), .B(n265), .Y(n233) );
  XOR2X4 U381 ( .A(n62), .B(n325), .Y(product[8]) );
  OAI21X2 U382 ( .A0(n81), .A1(n83), .B0(n82), .Y(n80) );
  NAND2X2 U383 ( .A(n98), .B(n67), .Y(n8) );
  NAND2X1 U384 ( .A(n319), .B(n79), .Y(n11) );
  ADDFHX2 U385 ( .A(n229), .B(n222), .CI(n145), .CO(n133), .S(n134) );
  ADDFHX2 U386 ( .A(n139), .B(n137), .CI(n128), .CO(n125), .S(n126) );
  INVX2 U387 ( .A(n60), .Y(n97) );
  ADDHX2 U388 ( .A(n247), .B(n240), .CO(n175), .S(n176) );
  NAND2X1 U389 ( .A(n126), .B(n135), .Y(n56) );
  ADDFHX2 U390 ( .A(n182), .B(n318), .CI(n180), .CO(n177), .S(n178) );
  ADDFHX2 U391 ( .A(n227), .B(n234), .CI(n220), .CO(n179), .S(n180) );
  ADDHX1 U392 ( .A(n249), .B(n235), .CO(n185), .S(n186) );
  CLKINVX2 U393 ( .A(n50), .Y(n52) );
  NOR2X1 U394 ( .A(n257), .B(n267), .Y(n250) );
  NOR2X1 U395 ( .A(n257), .B(n266), .Y(n242) );
  NAND2X1 U396 ( .A(n92), .B(n28), .Y(n323) );
  INVX3 U397 ( .A(b[3]), .Y(n264) );
  NAND2X2 U398 ( .A(n93), .B(n33), .Y(n3) );
  INVX1 U399 ( .A(n73), .Y(n100) );
  NAND2BX1 U400 ( .AN(n39), .B(n40), .Y(n4) );
  NAND2BX1 U401 ( .AN(n44), .B(n47), .Y(n5) );
  INVX2 U402 ( .A(n32), .Y(n93) );
  CLKINVXL U403 ( .A(n33), .Y(n31) );
  OAI21XL U404 ( .A0(n33), .A1(n27), .B0(n28), .Y(n26) );
  NAND2XL U405 ( .A(n188), .B(n236), .Y(n87) );
  AND2X1 U406 ( .A(n320), .B(n90), .Y(product[1]) );
  NAND2XL U407 ( .A(n105), .B(n189), .Y(n23) );
  NOR2X1 U408 ( .A(n252), .B(n265), .Y(n229) );
  NOR2X2 U409 ( .A(n253), .B(n264), .Y(n222) );
  ADDFHX2 U410 ( .A(n219), .B(n233), .CI(n176), .CO(n173), .S(n174) );
  INVX4 U411 ( .A(a[3]), .Y(n330) );
  CMPR32X1 U412 ( .A(n197), .B(n190), .C(n109), .CO(n105), .S(n106) );
  INVX2 U413 ( .A(b[6]), .Y(n261) );
  AND2X4 U414 ( .A(n97), .B(n61), .Y(n325) );
  NAND2X1 U415 ( .A(n100), .B(n74), .Y(n10) );
  CLKINVXL U416 ( .A(n61), .Y(n59) );
  XNOR2X1 U417 ( .A(n13), .B(n88), .Y(product[2]) );
  NAND2X1 U418 ( .A(n328), .B(n87), .Y(n13) );
  NAND2X2 U419 ( .A(n148), .B(n159), .Y(n67) );
  INVX2 U420 ( .A(n87), .Y(n85) );
  NAND2X1 U421 ( .A(n102), .B(n82), .Y(n12) );
  NAND2X1 U422 ( .A(n329), .B(n23), .Y(n1) );
  INVX2 U423 ( .A(n90), .Y(n88) );
  INVX2 U424 ( .A(n23), .Y(n21) );
  NAND2X1 U425 ( .A(n111), .B(n108), .Y(n33) );
  NAND2X1 U426 ( .A(n184), .B(n187), .Y(n82) );
  NAND2X1 U427 ( .A(n244), .B(n251), .Y(n90) );
  NAND2XL U428 ( .A(n107), .B(n106), .Y(n28) );
  NOR2X1 U429 ( .A(n259), .B(n261), .Y(n204) );
  NOR2X1 U430 ( .A(n330), .B(n264), .Y(n225) );
  NOR2X1 U431 ( .A(n255), .B(n266), .Y(n240) );
  NOR2X1 U432 ( .A(n259), .B(n265), .Y(n236) );
  NOR2X1 U433 ( .A(n258), .B(n261), .Y(n203) );
  NOR2X1 U434 ( .A(n258), .B(n265), .Y(n235) );
  NOR2X1 U435 ( .A(n330), .B(n267), .Y(n249) );
  NOR2X1 U436 ( .A(n330), .B(n266), .Y(n241) );
  NOR2X1 U437 ( .A(n257), .B(n264), .Y(n226) );
  ADDFHX1 U438 ( .A(n158), .B(n231), .CI(n224), .CO(n155), .S(n156) );
  NOR2X1 U439 ( .A(n258), .B(n266), .Y(n243) );
  NOR2X1 U440 ( .A(n259), .B(n266), .Y(n244) );
  NOR2X2 U441 ( .A(n252), .B(n266), .Y(n237) );
  NOR2X1 U442 ( .A(n258), .B(n267), .Y(n251) );
  NOR2X2 U443 ( .A(n252), .B(n267), .Y(n245) );
  NOR2X1 U444 ( .A(n259), .B(n267), .Y(product[0]) );
  NOR2X1 U445 ( .A(n330), .B(n260), .Y(n193) );
  NOR2X1 U446 ( .A(n252), .B(n264), .Y(n221) );
  ADDFHX1 U447 ( .A(n213), .B(n206), .CI(n199), .CO(n115), .S(n116) );
  NOR2X1 U448 ( .A(n252), .B(n263), .Y(n213) );
  NOR2X1 U449 ( .A(n253), .B(n262), .Y(n206) );
  ADDFX2 U450 ( .A(n205), .B(n198), .CI(n191), .CO(n109), .S(n110) );
  NOR2X1 U451 ( .A(n252), .B(n262), .Y(n205) );
  NOR2X1 U452 ( .A(n253), .B(n261), .Y(n198) );
  NOR2X1 U453 ( .A(n253), .B(n260), .Y(n190) );
  NOR2X1 U454 ( .A(n252), .B(n260), .Y(n189) );
  INVX4 U455 ( .A(b[1]), .Y(n266) );
  XOR2X2 U456 ( .A(n24), .B(n1), .Y(product[14]) );
  INVX4 U457 ( .A(n63), .Y(n62) );
  NOR2X1 U458 ( .A(n253), .B(n263), .Y(n214) );
  ADDFHX2 U459 ( .A(n221), .B(n214), .CI(n133), .CO(n123), .S(n124) );
  NOR2X1 U460 ( .A(n254), .B(n264), .Y(n223) );
  ADDFHX2 U461 ( .A(n216), .B(n195), .CI(n209), .CO(n141), .S(n142) );
  XOR3X2 U462 ( .A(n139), .B(n137), .C(n128), .Y(n331) );
  NOR2X1 U463 ( .A(n330), .B(n261), .Y(n201) );
  NAND2X1 U464 ( .A(n117), .B(n112), .Y(n40) );
  NAND2X2 U465 ( .A(n125), .B(n118), .Y(n47) );
  OAI21XL U466 ( .A0(n47), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X2 U467 ( .A(n258), .B(n264), .Y(n227) );
  NOR2X2 U468 ( .A(n66), .B(n69), .Y(n64) );
  NOR2X4 U469 ( .A(n148), .B(n159), .Y(n66) );
  INVX8 U470 ( .A(a[6]), .Y(n253) );
  ADDFHX2 U471 ( .A(n210), .B(n196), .CI(n156), .CO(n151), .S(n152) );
  INVX8 U472 ( .A(a[1]), .Y(n258) );
  NOR2X4 U473 ( .A(n125), .B(n118), .Y(n44) );
  AOI21X2 U474 ( .A0(n319), .A1(n80), .B0(n77), .Y(n75) );
  AOI21X4 U475 ( .A0(n64), .A1(n72), .B0(n65), .Y(n63) );
endmodule


module SNN_DW01_add_295 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n9, n10, n11, n12, n13, n14, n21, n23, n26, n35, n37, n41, n48, n49,
         n50, n51, n58, n59, n61, n62, n63, n121, n122;

  NOR2X2 U21 ( .A(A[13]), .B(B[13]), .Y(n13) );
  AOI21X4 U88 ( .A0(n49), .A1(n61), .B0(n50), .Y(n48) );
  NAND2X2 U89 ( .A(A[6]), .B(A[7]), .Y(n51) );
  NAND2X2 U90 ( .A(A[13]), .B(B[13]), .Y(n23) );
  NOR2X1 U91 ( .A(n51), .B(n59), .Y(n50) );
  NOR2X1 U92 ( .A(n63), .B(n62), .Y(n61) );
  OAI21X1 U93 ( .A0(n26), .A1(n13), .B0(n14), .Y(n12) );
  NOR2X2 U94 ( .A(A[14]), .B(n21), .Y(n14) );
  INVX2 U95 ( .A(n23), .Y(n21) );
  AND2X1 U96 ( .A(A[10]), .B(B[10]), .Y(n122) );
  INVX2 U97 ( .A(n13), .Y(n11) );
  OAI21X4 U98 ( .A0(n48), .A1(n9), .B0(n10), .Y(CO) );
  OR2X1 U99 ( .A(A[2]), .B(B[2]), .Y(n121) );
  NAND2X1 U100 ( .A(A[9]), .B(A[8]), .Y(n41) );
  AOI21X2 U101 ( .A0(n11), .A1(n122), .B0(n12), .Y(n10) );
  NOR2X2 U102 ( .A(n51), .B(n58), .Y(n49) );
  INVX1 U103 ( .A(A[4]), .Y(n62) );
  NAND2X1 U104 ( .A(n35), .B(n11), .Y(n9) );
  NOR2X1 U105 ( .A(A[12]), .B(A[11]), .Y(n26) );
  NOR2X1 U106 ( .A(A[5]), .B(B[5]), .Y(n58) );
  NAND2XL U107 ( .A(A[5]), .B(B[5]), .Y(n59) );
  NAND2X1 U108 ( .A(A[3]), .B(n121), .Y(n63) );
  NOR2X1 U109 ( .A(n41), .B(n37), .Y(n35) );
  NOR2X1 U110 ( .A(A[10]), .B(B[10]), .Y(n37) );
endmodule


module SNN_DW01_add_271 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n14, n16, n20, n23, n25, n27, n32, n36, n37, n38, n39, n41, n42, n44,
         n45, n46, n47, n48, n49, n50, n52, n53, n55, n65, n66, n67, n68, n71,
         n72, n74, n76, n77, n78, n145, n146, n147, n148;

  AOI21X1 U81 ( .A0(n66), .A1(n74), .B0(n67), .Y(n65) );
  ADDFX2 U102 ( .A(n78), .B(B[2]), .CI(A[2]), .CO(n77) );
  ADDFX2 U103 ( .A(n148), .B(B[1]), .CI(A[1]), .CO(n78) );
  NOR2X2 U110 ( .A(A[9]), .B(B[9]), .Y(n49) );
  NOR2X1 U111 ( .A(A[11]), .B(B[11]), .Y(n38) );
  OAI2BB1X1 U112 ( .A0N(n146), .A1N(n77), .B0(n76), .Y(n74) );
  OR2X1 U113 ( .A(A[3]), .B(B[3]), .Y(n146) );
  OAI21X1 U114 ( .A0(n38), .A1(n42), .B0(n39), .Y(n37) );
  OR2X1 U115 ( .A(A[12]), .B(B[12]), .Y(n147) );
  AND2X1 U116 ( .A(n36), .B(n147), .Y(n145) );
  AOI21X1 U117 ( .A0(n44), .A1(n145), .B0(n16), .Y(n14) );
  INVX1 U118 ( .A(A[14]), .Y(n20) );
  NAND2XL U119 ( .A(n23), .B(n20), .Y(n16) );
  CLKINVX2 U120 ( .A(n14), .Y(CO) );
  NAND2XL U121 ( .A(A[8]), .B(B[8]), .Y(n53) );
  NAND2X1 U122 ( .A(n32), .B(n27), .Y(n25) );
  NAND2XL U123 ( .A(A[10]), .B(B[10]), .Y(n42) );
  INVX2 U124 ( .A(A[5]), .Y(n68) );
  AND2X1 U125 ( .A(A[6]), .B(A[7]), .Y(n55) );
  INVX2 U126 ( .A(A[13]), .Y(n27) );
  OAI21X1 U127 ( .A0(n65), .A1(n45), .B0(n46), .Y(n44) );
  INVX2 U128 ( .A(n48), .Y(n46) );
  NAND2X1 U129 ( .A(n47), .B(n55), .Y(n45) );
  NAND2XL U130 ( .A(A[3]), .B(B[3]), .Y(n76) );
  NOR2X1 U131 ( .A(n49), .B(n52), .Y(n47) );
  NOR2X1 U132 ( .A(A[8]), .B(B[8]), .Y(n52) );
  OAI21X1 U133 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  NAND2XL U134 ( .A(A[9]), .B(B[9]), .Y(n50) );
  NOR2X1 U135 ( .A(n71), .B(n68), .Y(n66) );
  NOR2X1 U136 ( .A(A[4]), .B(B[4]), .Y(n71) );
  NOR2X1 U137 ( .A(n41), .B(n38), .Y(n36) );
  NOR2X1 U138 ( .A(A[10]), .B(B[10]), .Y(n41) );
  NOR2X1 U139 ( .A(n68), .B(n72), .Y(n67) );
  NAND2XL U140 ( .A(A[4]), .B(B[4]), .Y(n72) );
  NAND2XL U141 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2XL U142 ( .A(A[12]), .B(B[12]), .Y(n32) );
  OR2X1 U143 ( .A(A[0]), .B(B[0]), .Y(n148) );
  AOI21XL U144 ( .A0(n37), .A1(n147), .B0(n25), .Y(n23) );
endmodule


module SNN_DW01_add_267 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n20, n24, n26, n31, n32, n36, n38, n41, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n55, n65, n66, n67, n68, n69, n71, n72, n74, n77, n78,
         n145, n146, n148, n149, n150, n151, n152;

  AOI21X1 U81 ( .A0(n74), .A1(n66), .B0(n67), .Y(n65) );
  ADDFX2 U103 ( .A(n146), .B(B[1]), .CI(A[1]), .CO(n78) );
  NOR2X1 U110 ( .A(A[4]), .B(B[4]), .Y(n71) );
  AND2X1 U111 ( .A(n36), .B(n24), .Y(n145) );
  OR2X1 U112 ( .A(A[0]), .B(B[0]), .Y(n146) );
  INVXL U113 ( .A(A[14]), .Y(n20) );
  CLKINVXL U114 ( .A(A[11]), .Y(n38) );
  OAI2BB1X1 U115 ( .A0N(n44), .A1N(n145), .B0(n148), .Y(CO) );
  AND2X1 U116 ( .A(n149), .B(n20), .Y(n148) );
  NAND2XL U117 ( .A(A[8]), .B(B[8]), .Y(n53) );
  OAI21X1 U118 ( .A0(n68), .A1(n72), .B0(n69), .Y(n67) );
  AOI2BB1XL U119 ( .A0N(n26), .A1N(n32), .B0(n150), .Y(n149) );
  INVX2 U120 ( .A(A[10]), .Y(n41) );
  AND2X1 U121 ( .A(A[7]), .B(A[6]), .Y(n55) );
  OAI21X1 U122 ( .A0(n65), .A1(n45), .B0(n46), .Y(n44) );
  INVX2 U123 ( .A(n48), .Y(n46) );
  NAND2X1 U124 ( .A(n47), .B(n55), .Y(n45) );
  NOR2X1 U125 ( .A(A[9]), .B(B[9]), .Y(n49) );
  NOR2X1 U126 ( .A(n52), .B(n49), .Y(n47) );
  NOR2X1 U127 ( .A(A[8]), .B(B[8]), .Y(n52) );
  OAI21X1 U128 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  NAND2XL U129 ( .A(A[9]), .B(B[9]), .Y(n50) );
  NOR2X1 U130 ( .A(n31), .B(n26), .Y(n24) );
  NOR2X1 U131 ( .A(n41), .B(n38), .Y(n36) );
  NOR2X1 U132 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NOR2X1 U133 ( .A(A[5]), .B(B[5]), .Y(n68) );
  NOR2X1 U134 ( .A(n71), .B(n68), .Y(n66) );
  NAND2XL U135 ( .A(A[5]), .B(B[5]), .Y(n69) );
  NAND2XL U136 ( .A(A[4]), .B(B[4]), .Y(n72) );
  AND2X1 U137 ( .A(A[13]), .B(B[13]), .Y(n150) );
  OR2X1 U138 ( .A(n77), .B(A[3]), .Y(n74) );
  NAND2X1 U139 ( .A(n151), .B(n152), .Y(n77) );
  NOR2X1 U140 ( .A(A[13]), .B(B[13]), .Y(n26) );
  INVX2 U141 ( .A(A[2]), .Y(n152) );
  INVX2 U142 ( .A(n78), .Y(n151) );
  NAND2XL U143 ( .A(A[12]), .B(B[12]), .Y(n32) );
endmodule


module SNN_DW01_add_266 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n14, n16, n20, n23, n24, n25, n26, n27, n32, n36, n37, n38, n41,
         n42, n44, n45, n47, n52, n55, n57, n65, n66, n68, n71, n74, n76, n77,
         n145, n146, n147, n148, n149, n150;

  AOI21X1 U15 ( .A0(n24), .A1(n37), .B0(n25), .Y(n23) );
  ADDFX2 U102 ( .A(n147), .B(B[2]), .CI(A[2]), .CO(n77) );
  AOI21X1 U110 ( .A0(n44), .A1(n146), .B0(n16), .Y(n14) );
  NOR2X1 U111 ( .A(n149), .B(A[9]), .Y(n148) );
  AND2X1 U112 ( .A(A[5]), .B(B[5]), .Y(n145) );
  AND2X1 U113 ( .A(n24), .B(n36), .Y(n146) );
  AND2X1 U114 ( .A(n150), .B(A[1]), .Y(n147) );
  NOR2X2 U115 ( .A(A[13]), .B(B[13]), .Y(n26) );
  INVX2 U116 ( .A(A[11]), .Y(n38) );
  AOI21X1 U117 ( .A0(n74), .A1(n66), .B0(n145), .Y(n65) );
  CLKINVX1 U118 ( .A(A[14]), .Y(n20) );
  NOR2BX2 U119 ( .AN(A[6]), .B(n57), .Y(n55) );
  INVX1 U120 ( .A(A[7]), .Y(n57) );
  CLKINVX2 U121 ( .A(n52), .Y(n47) );
  NAND2XL U122 ( .A(A[13]), .B(B[13]), .Y(n27) );
  INVX2 U123 ( .A(A[3]), .Y(n76) );
  INVX2 U124 ( .A(A[4]), .Y(n71) );
  INVX2 U125 ( .A(A[12]), .Y(n32) );
  NAND2X1 U126 ( .A(n23), .B(n20), .Y(n16) );
  OAI21X1 U127 ( .A0(n32), .A1(n26), .B0(n27), .Y(n25) );
  NOR2X1 U128 ( .A(n38), .B(n42), .Y(n37) );
  NAND2XL U129 ( .A(A[10]), .B(B[10]), .Y(n42) );
  NOR2X1 U130 ( .A(n41), .B(n38), .Y(n36) );
  NOR2X1 U131 ( .A(A[10]), .B(B[10]), .Y(n41) );
  NOR2X1 U132 ( .A(A[8]), .B(B[8]), .Y(n52) );
  INVX2 U133 ( .A(n26), .Y(n24) );
  NAND2X1 U134 ( .A(n1), .B(n76), .Y(n74) );
  NOR2X1 U135 ( .A(A[5]), .B(B[5]), .Y(n68) );
  AND2X1 U136 ( .A(A[8]), .B(B[8]), .Y(n149) );
  INVX2 U137 ( .A(n77), .Y(n1) );
  OR2X1 U138 ( .A(A[0]), .B(B[0]), .Y(n150) );
  NOR2X1 U139 ( .A(n71), .B(n68), .Y(n66) );
  NAND2X1 U140 ( .A(n47), .B(n55), .Y(n45) );
  CLKINVX2 U141 ( .A(n14), .Y(CO) );
  OAI21X1 U142 ( .A0(n45), .A1(n65), .B0(n148), .Y(n44) );
endmodule


module SNN_DW01_add_259 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n4, n7, n8, n13, n17, n19, n22, n23, n24, n26, n30, n31, n32, n35,
         n36, n40, n41, n48, n49, n50, n51, n52, n53, n55, n56, n59, n111,
         n112, n113, n114, n116, n117;

  NAND2X4 U36 ( .A(n31), .B(n50), .Y(n30) );
  NAND2X4 U38 ( .A(A[8]), .B(A[7]), .Y(n32) );
  BUFX1 U77 ( .A(A[0]), .Y(SUM[0]) );
  ADDHX2 U78 ( .A(n113), .B(A[2]), .CO(n56), .S(SUM[2]) );
  OAI21XL U79 ( .A0(n30), .A1(n23), .B0(n19), .Y(n17) );
  INVX3 U80 ( .A(n23), .Y(n59) );
  NAND2BX2 U81 ( .AN(A[10]), .B(n24), .Y(n13) );
  NAND2X4 U82 ( .A(n59), .B(B[12]), .Y(n7) );
  NAND2X2 U83 ( .A(n13), .B(B[12]), .Y(n8) );
  OAI21X4 U84 ( .A0(n30), .A1(n7), .B0(n8), .Y(CO) );
  NAND2X4 U85 ( .A(A[3]), .B(n56), .Y(n53) );
  INVX3 U86 ( .A(n50), .Y(n49) );
  OAI21X4 U87 ( .A0(n51), .A1(n53), .B0(n52), .Y(n50) );
  NOR2X1 U88 ( .A(A[4]), .B(B[4]), .Y(n51) );
  NAND2X2 U89 ( .A(A[6]), .B(A[5]), .Y(n40) );
  NOR2X2 U90 ( .A(A[9]), .B(B[9]), .Y(n23) );
  NAND2X2 U91 ( .A(A[9]), .B(B[9]), .Y(n24) );
  NAND2XL U92 ( .A(n59), .B(n24), .Y(n112) );
  OR2X4 U93 ( .A(A[1]), .B(n116), .Y(n113) );
  INVX1 U94 ( .A(n40), .Y(n41) );
  CLKINVX2 U95 ( .A(A[3]), .Y(n55) );
  NOR2XL U96 ( .A(A[10]), .B(n26), .Y(n19) );
  OR2XL U97 ( .A(n49), .B(n40), .Y(n114) );
  NOR2X4 U98 ( .A(n32), .B(n40), .Y(n31) );
  NOR2X1 U99 ( .A(n49), .B(n48), .Y(n111) );
  XOR2XL U100 ( .A(n111), .B(A[6]), .Y(SUM[6]) );
  CLKINVXL U101 ( .A(A[5]), .Y(n48) );
  XOR2XL U102 ( .A(n35), .B(A[8]), .Y(SUM[8]) );
  XOR2X1 U103 ( .A(n30), .B(n112), .Y(SUM[9]) );
  NAND2XL U104 ( .A(A[4]), .B(B[4]), .Y(n52) );
  XNOR2XL U105 ( .A(n114), .B(A[7]), .Y(SUM[7]) );
  XOR2X1 U106 ( .A(n49), .B(n48), .Y(SUM[5]) );
  XOR2XL U107 ( .A(n4), .B(n53), .Y(SUM[4]) );
  NOR2X1 U108 ( .A(n36), .B(n49), .Y(n35) );
  NAND2XL U109 ( .A(n41), .B(A[7]), .Y(n36) );
  XNOR2XL U110 ( .A(n55), .B(n56), .Y(SUM[3]) );
  OAI21XL U111 ( .A0(n30), .A1(n23), .B0(n24), .Y(n22) );
  NAND2BX1 U112 ( .AN(n51), .B(n52), .Y(n4) );
  INVX2 U113 ( .A(n17), .Y(SUM[11]) );
  CLKINVXL U114 ( .A(n24), .Y(n26) );
  XNOR2X1 U115 ( .A(A[1]), .B(n116), .Y(SUM[1]) );
  INVX2 U116 ( .A(n117), .Y(n116) );
  INVX2 U117 ( .A(B[1]), .Y(n117) );
  XNOR2XL U118 ( .A(n22), .B(A[10]), .Y(SUM[10]) );
endmodule


module SNN_DW01_add_262 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n6, n7, n10, n11, n16, n18, n20, n21, n24, n26, n29, n30, n31,
         n33, n37, n38, n40, n41, n42, n44, n45, n46, n47, n50, n51, n54, n55,
         n56, n58, n59, n60, n64, n116, n117, n118, n119;

  OAI21X4 U5 ( .A0(n1), .A1(n10), .B0(n11), .Y(CO) );
  NAND2X4 U6 ( .A(n64), .B(B[11]), .Y(n10) );
  NAND2X2 U81 ( .A(n21), .B(n31), .Y(n20) );
  NAND2X2 U82 ( .A(A[8]), .B(B[8]), .Y(n31) );
  NAND2X1 U83 ( .A(A[7]), .B(A[6]), .Y(n38) );
  NAND2XL U84 ( .A(n47), .B(A[6]), .Y(n42) );
  NOR2X2 U85 ( .A(A[8]), .B(B[8]), .Y(n30) );
  CLKINVXL U86 ( .A(n31), .Y(n33) );
  INVX2 U87 ( .A(n30), .Y(n64) );
  NOR2X1 U88 ( .A(A[9]), .B(n33), .Y(n26) );
  NAND2X2 U89 ( .A(n20), .B(B[11]), .Y(n11) );
  OR2X2 U90 ( .A(A[3]), .B(B[3]), .Y(n116) );
  NAND2X1 U91 ( .A(A[4]), .B(A[5]), .Y(n46) );
  NOR2X1 U92 ( .A(A[9]), .B(A[10]), .Y(n21) );
  NOR2X4 U93 ( .A(n38), .B(n46), .Y(n37) );
  NAND2X4 U94 ( .A(n37), .B(n56), .Y(n1) );
  XNOR2X1 U95 ( .A(n51), .B(n50), .Y(SUM[5]) );
  XNOR2X2 U96 ( .A(n45), .B(n44), .Y(SUM[6]) );
  OAI2BB1X4 U97 ( .A0N(n116), .A1N(n59), .B0(n58), .Y(n56) );
  NAND2XL U98 ( .A(n116), .B(n58), .Y(n7) );
  XNOR2XL U99 ( .A(n7), .B(n59), .Y(SUM[3]) );
  OR2XL U100 ( .A(A[0]), .B(n118), .Y(n117) );
  CLKINVXL U101 ( .A(A[5]), .Y(n50) );
  XNOR2X1 U102 ( .A(n41), .B(n40), .Y(SUM[7]) );
  XOR2X1 U103 ( .A(n16), .B(B[11]), .Y(SUM[11]) );
  NOR2X1 U104 ( .A(n55), .B(n46), .Y(n45) );
  NOR2X1 U105 ( .A(n55), .B(n54), .Y(n51) );
  XOR2X1 U106 ( .A(n55), .B(n54), .Y(SUM[4]) );
  NOR2X1 U107 ( .A(n42), .B(n55), .Y(n41) );
  CLKINVXL U108 ( .A(n46), .Y(n47) );
  INVX2 U109 ( .A(n56), .Y(n55) );
  INVX2 U110 ( .A(A[4]), .Y(n54) );
  ADDHXL U111 ( .A(n60), .B(A[2]), .CO(n59), .S(SUM[2]) );
  OAI21XL U112 ( .A0(n1), .A1(n30), .B0(n26), .Y(n24) );
  XNOR2XL U113 ( .A(n29), .B(A[9]), .Y(SUM[9]) );
  OAI21XL U114 ( .A0(n1), .A1(n30), .B0(n31), .Y(n29) );
  XOR2X1 U115 ( .A(n1), .B(n6), .Y(SUM[8]) );
  NAND2XL U116 ( .A(n64), .B(n31), .Y(n6) );
  ADDHXL U117 ( .A(A[1]), .B(n117), .CO(n60), .S(SUM[1]) );
  CLKINVXL U118 ( .A(A[7]), .Y(n40) );
  NAND2XL U119 ( .A(A[3]), .B(B[3]), .Y(n58) );
  OAI21XL U120 ( .A0(n1), .A1(n30), .B0(n18), .Y(n16) );
  CLKINVXL U121 ( .A(n20), .Y(n18) );
  XNOR2X1 U122 ( .A(A[0]), .B(n118), .Y(SUM[0]) );
  INVX2 U123 ( .A(n119), .Y(n118) );
  INVX2 U124 ( .A(B[0]), .Y(n119) );
  INVX2 U125 ( .A(A[6]), .Y(n44) );
  XNOR2XL U126 ( .A(n24), .B(A[10]), .Y(SUM[10]) );
endmodule


module SNN_DW01_add_254 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n17, n18, n19, n20, n22, n25, n26, n30, n31, n34, n35, n38,
         n39, n40, n41, n42, n43, n46, n47, n48, n49, n50, n101, n102, n103,
         n104, n107, n108, n109, n110;

  OAI21X4 U3 ( .A0(n20), .A1(n101), .B0(n102), .Y(CO) );
  NOR2X2 U23 ( .A(A[10]), .B(B[10]), .Y(n18) );
  NOR2X2 U53 ( .A(A[5]), .B(n107), .Y(n41) );
  NOR2X2 U68 ( .A(n47), .B(n48), .Y(n46) );
  NOR2XL U69 ( .A(n39), .B(n30), .Y(n104) );
  OAI21X4 U70 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  NAND2X2 U71 ( .A(A[4]), .B(n46), .Y(n43) );
  XOR2XL U72 ( .A(n104), .B(A[8]), .Y(SUM[8]) );
  INVX2 U73 ( .A(A[3]), .Y(n47) );
  NAND2X2 U74 ( .A(A[7]), .B(A[6]), .Y(n30) );
  NOR2X1 U75 ( .A(n39), .B(n38), .Y(n35) );
  NOR2X1 U76 ( .A(A[2]), .B(n109), .Y(n48) );
  NAND2X1 U77 ( .A(A[10]), .B(B[10]), .Y(n19) );
  OR2X4 U78 ( .A(n18), .B(n107), .Y(n101) );
  OR2X4 U79 ( .A(n19), .B(n107), .Y(n102) );
  NAND2X2 U80 ( .A(A[8]), .B(A[9]), .Y(n22) );
  BUFX1 U81 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2X1 U82 ( .A(n35), .B(n34), .Y(SUM[7]) );
  NAND2XL U83 ( .A(n50), .B(n42), .Y(n3) );
  NOR2X4 U84 ( .A(n22), .B(n30), .Y(n103) );
  CLKINVXL U85 ( .A(n40), .Y(n39) );
  CLKINVXL U86 ( .A(n30), .Y(n31) );
  XOR2XL U87 ( .A(A[4]), .B(n46), .Y(SUM[4]) );
  NAND2X4 U88 ( .A(n103), .B(n40), .Y(n20) );
  CLKINVXL U89 ( .A(A[7]), .Y(n34) );
  XOR2XL U90 ( .A(n25), .B(A[9]), .Y(SUM[9]) );
  XOR2X1 U91 ( .A(n39), .B(n38), .Y(SUM[6]) );
  NOR2X1 U92 ( .A(n26), .B(n39), .Y(n25) );
  NAND2XL U93 ( .A(n31), .B(A[8]), .Y(n26) );
  XOR2X1 U94 ( .A(n43), .B(n3), .Y(SUM[5]) );
  CLKINVXL U95 ( .A(n41), .Y(n50) );
  INVX2 U96 ( .A(A[6]), .Y(n38) );
  NAND2X1 U97 ( .A(A[5]), .B(n107), .Y(n42) );
  XOR2X1 U98 ( .A(n20), .B(n2), .Y(SUM[10]) );
  NAND2XL U99 ( .A(n49), .B(n19), .Y(n2) );
  INVXL U100 ( .A(n17), .Y(SUM[11]) );
  CLKINVXL U101 ( .A(n18), .Y(n49) );
  XOR2X1 U102 ( .A(n47), .B(n48), .Y(SUM[3]) );
  XNOR2X1 U103 ( .A(A[2]), .B(n109), .Y(SUM[2]) );
  INVX2 U104 ( .A(n108), .Y(n107) );
  INVX2 U105 ( .A(B[5]), .Y(n108) );
  INVX2 U106 ( .A(n110), .Y(n109) );
  INVX2 U107 ( .A(B[2]), .Y(n110) );
  BUFX1 U108 ( .A(A[1]), .Y(SUM[1]) );
  OAI21XL U109 ( .A0(n20), .A1(n18), .B0(n19), .Y(n17) );
endmodule


module SNN_DW01_add_242 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n13, n14, n15, n17, n18, n26, n29, n30, n41, n43, n44, n45, n52, n60,
         n61, n62, n64, n123, n125, n126, n127;

  AOI21X1 U10 ( .A0(n29), .A1(n127), .B0(n17), .Y(n15) );
  OAI21X1 U88 ( .A0(n43), .A1(n14), .B0(n15), .Y(n13) );
  NAND2X1 U89 ( .A(n64), .B(A[2]), .Y(n123) );
  NAND2XL U90 ( .A(A[5]), .B(A[4]), .Y(n52) );
  NOR2X1 U91 ( .A(A[3]), .B(B[3]), .Y(n61) );
  NAND2X1 U92 ( .A(n44), .B(n60), .Y(n43) );
  OR2XL U93 ( .A(A[8]), .B(B[8]), .Y(n125) );
  OR2X1 U94 ( .A(n13), .B(A[14]), .Y(CO) );
  NAND2X1 U95 ( .A(n125), .B(n127), .Y(n14) );
  NAND2XL U96 ( .A(A[3]), .B(B[3]), .Y(n62) );
  OR2X1 U97 ( .A(A[0]), .B(B[0]), .Y(n126) );
  NOR2X1 U98 ( .A(A[10]), .B(A[9]), .Y(n30) );
  NOR2X1 U99 ( .A(A[12]), .B(A[13]), .Y(n18) );
  OAI21X1 U100 ( .A0(n61), .A1(n123), .B0(n62), .Y(n60) );
  NOR2X1 U101 ( .A(n45), .B(n52), .Y(n44) );
  NAND2XL U102 ( .A(A[8]), .B(B[8]), .Y(n41) );
  NAND2X1 U103 ( .A(n30), .B(n41), .Y(n29) );
  NAND2XL U104 ( .A(A[11]), .B(B[11]), .Y(n26) );
  OR2X1 U105 ( .A(A[11]), .B(B[11]), .Y(n127) );
  AND2X1 U106 ( .A(n126), .B(A[1]), .Y(n64) );
  NAND2XL U107 ( .A(A[6]), .B(A[7]), .Y(n45) );
  NAND2XL U108 ( .A(n18), .B(n26), .Y(n17) );
endmodule


module SNN_DW01_add_244 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n5, n6, n8, n9, n11, n12, n15, n18, n19, n25, n26, n27, n28, n29, n30,
         n31, n33, n34, n35, n37, n38, n39, n40, n43, n44, n47, n48, n49, n50,
         n51, n52, n54, n55, n56, n57, n59, n112, n113, n114, n115;

  OR2X4 U79 ( .A(A[13]), .B(B[13]), .Y(n115) );
  NOR2X2 U80 ( .A(A[5]), .B(B[5]), .Y(n50) );
  NAND2XL U81 ( .A(A[10]), .B(B[10]), .Y(n27) );
  INVX2 U82 ( .A(A[3]), .Y(n56) );
  NOR2X1 U83 ( .A(n56), .B(n57), .Y(n55) );
  NAND2X2 U84 ( .A(n55), .B(A[4]), .Y(n52) );
  XNOR2X1 U85 ( .A(n34), .B(n33), .Y(SUM[9]) );
  NOR2X2 U86 ( .A(n31), .B(n39), .Y(n30) );
  NAND2X1 U87 ( .A(A[8]), .B(A[9]), .Y(n31) );
  NOR2X1 U88 ( .A(A[12]), .B(A[11]), .Y(n19) );
  CLKINVXL U89 ( .A(A[9]), .Y(n33) );
  BUFX1 U90 ( .A(n27), .Y(n112) );
  BUFX1 U91 ( .A(n49), .Y(n113) );
  NOR2X1 U92 ( .A(n48), .B(n39), .Y(n38) );
  OAI21X2 U93 ( .A0(n52), .A1(n50), .B0(n51), .Y(n49) );
  NAND2BXL U94 ( .AN(n50), .B(n51), .Y(n6) );
  NAND2X1 U95 ( .A(A[5]), .B(B[5]), .Y(n51) );
  OAI21X4 U96 ( .A0(n29), .A1(n8), .B0(n9), .Y(CO) );
  NAND2XL U97 ( .A(n30), .B(n113), .Y(n114) );
  NAND2X4 U98 ( .A(n30), .B(n49), .Y(n29) );
  NAND2X2 U99 ( .A(A[6]), .B(A[7]), .Y(n39) );
  XOR2X1 U100 ( .A(n48), .B(n47), .Y(SUM[6]) );
  XNOR2X1 U101 ( .A(n28), .B(n5), .Y(SUM[10]) );
  XNOR2X1 U102 ( .A(n44), .B(n43), .Y(SUM[7]) );
  XNOR2X1 U103 ( .A(n38), .B(n37), .Y(SUM[8]) );
  CLKINVXL U104 ( .A(n114), .Y(n28) );
  NOR2X1 U105 ( .A(n48), .B(n47), .Y(n44) );
  NOR2X1 U106 ( .A(n48), .B(n35), .Y(n34) );
  CLKINVXL U107 ( .A(n39), .Y(n40) );
  CLKINVXL U108 ( .A(A[4]), .Y(n54) );
  INVX2 U109 ( .A(A[6]), .Y(n47) );
  XOR2X1 U110 ( .A(n52), .B(n6), .Y(SUM[5]) );
  XNOR2XL U111 ( .A(n54), .B(n55), .Y(SUM[4]) );
  CLKINVXL U112 ( .A(n113), .Y(n48) );
  INVX2 U113 ( .A(A[7]), .Y(n43) );
  XOR2X1 U114 ( .A(n56), .B(n57), .Y(SUM[3]) );
  NAND2X2 U115 ( .A(n19), .B(n27), .Y(n18) );
  XNOR2X1 U116 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  NOR2X1 U117 ( .A(A[2]), .B(B[2]), .Y(n57) );
  NAND2X1 U118 ( .A(n12), .B(n15), .Y(n11) );
  CLKINVX2 U119 ( .A(A[14]), .Y(n12) );
  BUFX2 U120 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2 U121 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVXL U122 ( .A(A[8]), .Y(n37) );
  NAND2X2 U123 ( .A(n59), .B(n115), .Y(n8) );
  INVX2 U124 ( .A(n26), .Y(n59) );
  OAI21XL U125 ( .A0(n114), .A1(n26), .B0(n112), .Y(n25) );
  NOR2X2 U126 ( .A(A[10]), .B(B[10]), .Y(n26) );
  NAND2XL U127 ( .A(A[13]), .B(B[13]), .Y(n15) );
  NAND2XL U128 ( .A(n59), .B(n112), .Y(n5) );
  XNOR2XL U129 ( .A(n25), .B(A[11]), .Y(SUM[11]) );
  AOI21X4 U130 ( .A0(n18), .A1(n115), .B0(n11), .Y(n9) );
  NAND2XL U131 ( .A(n40), .B(A[8]), .Y(n35) );
endmodule


module SNN_DW01_add_251 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n8, n9, n11, n12, n15, n18, n19, n25, n26, n27, n29, n30, n31, n33,
         n39, n40, n41, n42, n43, n46, n48, n50, n51, n52, n55, n56, n57, n59,
         n112, n113, n114, n115, n116, n117;

  OAI21X4 U3 ( .A0(n29), .A1(n8), .B0(n9), .Y(CO) );
  NAND2X4 U4 ( .A(n112), .B(n59), .Y(n8) );
  NOR2X2 U38 ( .A(n33), .B(n31), .Y(n30) );
  OAI21X4 U52 ( .A0(n52), .A1(n42), .B0(n43), .Y(n41) );
  CLKINVX2 U79 ( .A(A[14]), .Y(n12) );
  NAND2X2 U80 ( .A(n19), .B(n27), .Y(n18) );
  NAND2X1 U81 ( .A(A[5]), .B(B[5]), .Y(n50) );
  NAND2X2 U82 ( .A(n55), .B(A[4]), .Y(n52) );
  XOR2XL U83 ( .A(n55), .B(A[4]), .Y(SUM[4]) );
  NOR2X4 U84 ( .A(n56), .B(n57), .Y(n55) );
  OR2X2 U85 ( .A(A[5]), .B(B[5]), .Y(n117) );
  INVX2 U86 ( .A(A[3]), .Y(n56) );
  INVX2 U87 ( .A(n50), .Y(n48) );
  NAND2X1 U88 ( .A(A[10]), .B(B[10]), .Y(n27) );
  NOR2X1 U89 ( .A(A[10]), .B(B[10]), .Y(n26) );
  NOR2X1 U90 ( .A(A[12]), .B(A[11]), .Y(n19) );
  OR2X2 U91 ( .A(A[13]), .B(B[13]), .Y(n112) );
  CLKINVX2 U92 ( .A(n52), .Y(n51) );
  NAND2X1 U93 ( .A(A[7]), .B(A[8]), .Y(n33) );
  AOI21XL U94 ( .A0(n51), .A1(n117), .B0(n48), .Y(n46) );
  CLKINVX2 U95 ( .A(A[9]), .Y(n31) );
  NAND2X1 U96 ( .A(A[6]), .B(n48), .Y(n43) );
  NAND2X4 U97 ( .A(A[6]), .B(n117), .Y(n42) );
  INVX2 U98 ( .A(n26), .Y(n59) );
  XOR2X1 U99 ( .A(n40), .B(n39), .Y(SUM[7]) );
  XOR2XL U100 ( .A(n113), .B(A[8]), .Y(SUM[8]) );
  NOR2X1 U101 ( .A(n40), .B(n39), .Y(n113) );
  XOR2X1 U102 ( .A(n29), .B(n114), .Y(SUM[10]) );
  NAND2XL U103 ( .A(n59), .B(n27), .Y(n114) );
  CLKINVXL U104 ( .A(A[7]), .Y(n39) );
  XOR2XL U105 ( .A(n115), .B(n31), .Y(SUM[9]) );
  OR2X1 U106 ( .A(n40), .B(n33), .Y(n115) );
  CLKINVXL U107 ( .A(n41), .Y(n40) );
  XNOR2XL U108 ( .A(n46), .B(A[6]), .Y(SUM[6]) );
  XOR2X1 U109 ( .A(n51), .B(n116), .Y(SUM[5]) );
  AND2X1 U110 ( .A(n117), .B(n50), .Y(n116) );
  XNOR2X1 U111 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  NOR2X1 U112 ( .A(A[2]), .B(B[2]), .Y(n57) );
  NAND2XL U113 ( .A(A[13]), .B(B[13]), .Y(n15) );
  BUFX2 U114 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2 U115 ( .A(A[0]), .Y(SUM[0]) );
  NAND2X4 U116 ( .A(n41), .B(n30), .Y(n29) );
  XNOR2XL U117 ( .A(n25), .B(A[11]), .Y(SUM[11]) );
  XOR2X1 U118 ( .A(n56), .B(n57), .Y(SUM[3]) );
  OAI21XL U119 ( .A0(n29), .A1(n26), .B0(n27), .Y(n25) );
  AOI21X4 U120 ( .A0(n112), .A1(n18), .B0(n11), .Y(n9) );
  NAND2X2 U121 ( .A(n12), .B(n15), .Y(n11) );
endmodule


module SNN_DW01_add_220 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n7, n8, n11, n12, n20, n23, n24, n25, n26, n27, n31, n32, n36,
         n37, n38, n39, n40, n42, n43, n44, n46, n47, n49, n51, n52, n53, n54,
         n56, n60, n61, n67, n72, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n94, n95, n96, n99, n101, n102, n155,
         n156, n157, n158, n160;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U41 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  XOR2X4 U59 ( .A(n60), .B(n8), .Y(SUM[8]) );
  ADDFX2 U112 ( .A(A[2]), .B(B[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  NAND2X2 U120 ( .A(n61), .B(n49), .Y(n47) );
  NOR2X2 U121 ( .A(n51), .B(n56), .Y(n49) );
  NOR2X1 U122 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2X1 U123 ( .A(n31), .B(n26), .Y(n24) );
  OAI21X1 U124 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  NOR2X1 U125 ( .A(A[3]), .B(B[3]), .Y(n85) );
  INVX2 U126 ( .A(A[6]), .Y(n72) );
  NOR2X1 U127 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NAND2X1 U128 ( .A(A[10]), .B(B[10]), .Y(n44) );
  AND2X2 U129 ( .A(n23), .B(n20), .Y(n160) );
  AND2X1 U130 ( .A(n24), .B(n36), .Y(n155) );
  OAI21X1 U131 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NAND2X1 U132 ( .A(A[11]), .B(B[11]), .Y(n39) );
  OAI21X2 U133 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X4 U134 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NAND2X4 U135 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NAND2X2 U136 ( .A(A[5]), .B(B[5]), .Y(n79) );
  AOI21X2 U137 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  NOR2X2 U138 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NAND2XL U139 ( .A(A[12]), .B(B[12]), .Y(n32) );
  OAI21X2 U140 ( .A0(n47), .A1(n75), .B0(n52), .Y(n46) );
  OAI21XL U141 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  XOR2XL U142 ( .A(n156), .B(n67), .Y(SUM[7]) );
  NAND2X1 U143 ( .A(n74), .B(n99), .Y(n156) );
  CLKINVX2 U144 ( .A(A[8]), .Y(n8) );
  XOR2X1 U145 ( .A(n74), .B(n99), .Y(SUM[6]) );
  NOR2BXL U146 ( .AN(n61), .B(n56), .Y(n54) );
  NOR2X4 U147 ( .A(n72), .B(n67), .Y(n61) );
  INVX2 U148 ( .A(n75), .Y(n74) );
  NAND2XL U149 ( .A(n96), .B(n52), .Y(n7) );
  CLKINVXL U150 ( .A(n51), .Y(n96) );
  CLKINVXL U151 ( .A(n84), .Y(n83) );
  NAND2XL U152 ( .A(n101), .B(n82), .Y(n12) );
  CLKINVXL U153 ( .A(n44), .Y(n42) );
  NAND2XL U154 ( .A(A[3]), .B(B[3]), .Y(n86) );
  XOR2X1 U155 ( .A(n157), .B(n87), .Y(SUM[3]) );
  AND2X1 U156 ( .A(n102), .B(n86), .Y(n157) );
  INVX2 U157 ( .A(A[8]), .Y(n56) );
  NAND2XL U158 ( .A(n74), .B(n61), .Y(n60) );
  INVX2 U159 ( .A(n72), .Y(n99) );
  INVX2 U160 ( .A(A[7]), .Y(n67) );
  XNOR2X1 U161 ( .A(n80), .B(n11), .Y(SUM[5]) );
  CLKINVXL U162 ( .A(A[14]), .Y(n20) );
  XOR2X1 U163 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NAND2X1 U164 ( .A(n94), .B(n39), .Y(n5) );
  INVX2 U165 ( .A(n38), .Y(n94) );
  XOR2X1 U166 ( .A(n46), .B(n158), .Y(SUM[10]) );
  AND2X1 U167 ( .A(n95), .B(n44), .Y(n158) );
  XOR2X1 U168 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NAND2XL U169 ( .A(n54), .B(n74), .Y(n53) );
  INVX2 U170 ( .A(n43), .Y(n95) );
  OAI21XL U171 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  NAND2BX1 U172 ( .AN(n78), .B(n79), .Y(n11) );
  XOR2X1 U173 ( .A(n83), .B(n12), .Y(SUM[4]) );
  CLKINVXL U174 ( .A(n81), .Y(n101) );
  OAI2BB1X4 U175 ( .A0N(n155), .A1N(n46), .B0(n160), .Y(CO) );
  INVX2 U176 ( .A(n87), .Y(n1) );
  NOR2X1 U177 ( .A(n38), .B(n43), .Y(n36) );
  NAND2XL U178 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NAND2XL U179 ( .A(A[13]), .B(B[13]), .Y(n27) );
  OR2X1 U180 ( .A(B[1]), .B(A[1]), .Y(n88) );
  XNOR2X1 U181 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  BUFX2 U182 ( .A(A[0]), .Y(SUM[0]) );
  NOR2X2 U183 ( .A(n78), .B(n81), .Y(n76) );
  CLKINVXL U184 ( .A(n85), .Y(n102) );
  NOR2X4 U185 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NOR2X1 U186 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NOR2X4 U187 ( .A(A[5]), .B(B[5]), .Y(n78) );
endmodule


module SNN_DW01_add_231 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n6, n7, n8, n12, n13, n20, n23, n25, n27, n32, n36, n37, n38,
         n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n59, n60, n61, n67, n72, n74, n75, n76, n77, n78, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n95, n96, n97, n99, n101,
         n102, n155, n156, n158, n159, n160;

  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  ADDFX2 U112 ( .A(A[2]), .B(B[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  ADDFX2 U113 ( .A(n160), .B(B[1]), .CI(A[1]), .CO(n88), .S(SUM[1]) );
  OAI2BB1X2 U120 ( .A0N(n155), .A1N(n46), .B0(n158), .Y(CO) );
  NOR2X2 U121 ( .A(n78), .B(n82), .Y(n77) );
  NOR2X2 U122 ( .A(n78), .B(n81), .Y(n76) );
  NOR2X2 U123 ( .A(A[4]), .B(B[4]), .Y(n81) );
  AOI21X1 U124 ( .A0(n37), .A1(n159), .B0(n25), .Y(n23) );
  OAI21X1 U125 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  NOR2X1 U126 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NOR2X1 U127 ( .A(A[3]), .B(B[3]), .Y(n85) );
  AND2X1 U128 ( .A(n23), .B(n20), .Y(n158) );
  NOR2X1 U129 ( .A(n38), .B(n43), .Y(n36) );
  INVX2 U130 ( .A(n75), .Y(n74) );
  CLKINVXL U131 ( .A(n72), .Y(n99) );
  INVXL U132 ( .A(A[6]), .Y(n72) );
  AND2X1 U133 ( .A(n159), .B(n36), .Y(n155) );
  NAND2XL U134 ( .A(A[9]), .B(B[9]), .Y(n52) );
  OR2XL U135 ( .A(A[12]), .B(B[12]), .Y(n159) );
  CLKINVX2 U136 ( .A(A[5]), .Y(n78) );
  NAND2X1 U137 ( .A(A[4]), .B(B[4]), .Y(n82) );
  INVX1 U138 ( .A(A[7]), .Y(n67) );
  NAND2XL U139 ( .A(n102), .B(n86), .Y(n13) );
  XOR2X1 U140 ( .A(n156), .B(n67), .Y(SUM[7]) );
  NAND2X1 U141 ( .A(n74), .B(n99), .Y(n156) );
  CLKINVXL U142 ( .A(n84), .Y(n83) );
  CLKINVX2 U143 ( .A(n50), .Y(n48) );
  CLKINVXL U144 ( .A(n56), .Y(n97) );
  CLKINVXL U145 ( .A(n43), .Y(n95) );
  XOR2X1 U146 ( .A(n80), .B(A[5]), .Y(SUM[5]) );
  NAND2XL U147 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2XL U148 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2BX1 U149 ( .AN(n38), .B(n39), .Y(n5) );
  NAND2X1 U150 ( .A(n32), .B(n27), .Y(n25) );
  NAND2XL U151 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NOR2X1 U152 ( .A(n72), .B(n67), .Y(n61) );
  INVX2 U153 ( .A(A[13]), .Y(n27) );
  XOR2X1 U154 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NOR2X1 U155 ( .A(n51), .B(n56), .Y(n49) );
  XNOR2X1 U156 ( .A(n74), .B(n72), .Y(SUM[6]) );
  XNOR2X1 U157 ( .A(n13), .B(n87), .Y(SUM[3]) );
  INVX2 U158 ( .A(n44), .Y(n42) );
  INVX2 U159 ( .A(n87), .Y(n1) );
  XOR2X1 U160 ( .A(n45), .B(n6), .Y(SUM[10]) );
  NAND2X1 U161 ( .A(n95), .B(n44), .Y(n6) );
  CLKINVXL U162 ( .A(A[14]), .Y(n20) );
  XOR2X1 U163 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NAND2XL U164 ( .A(n96), .B(n52), .Y(n7) );
  XOR2X1 U165 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2XL U166 ( .A(n97), .B(n59), .Y(n8) );
  NAND2XL U167 ( .A(n74), .B(n61), .Y(n60) );
  OAI21XL U168 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  NOR2BXL U169 ( .AN(n61), .B(n56), .Y(n54) );
  CLKINVXL U170 ( .A(n59), .Y(n55) );
  CLKINVXL U171 ( .A(n85), .Y(n102) );
  XOR2X1 U172 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NAND2X1 U173 ( .A(n101), .B(n82), .Y(n12) );
  CLKINVXL U174 ( .A(n81), .Y(n101) );
  NOR2X1 U175 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NOR2X1 U176 ( .A(A[8]), .B(B[8]), .Y(n56) );
  XNOR2X1 U177 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NOR2X1 U178 ( .A(A[11]), .B(B[11]), .Y(n38) );
  OR2X1 U179 ( .A(A[0]), .B(B[0]), .Y(n160) );
  NAND2XL U180 ( .A(A[11]), .B(B[11]), .Y(n39) );
  AOI21XL U181 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  CLKINVXL U182 ( .A(n46), .Y(n45) );
  OAI21XL U183 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  INVX1 U184 ( .A(n51), .Y(n96) );
  NAND2X1 U185 ( .A(A[8]), .B(B[8]), .Y(n59) );
  OAI21X1 U186 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NAND2XL U187 ( .A(n61), .B(n49), .Y(n47) );
  OAI21X2 U188 ( .A0(n47), .A1(n75), .B0(n48), .Y(n46) );
  AOI21X4 U189 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
endmodule


module SNN_DW01_add_224 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n8, n11, n20, n23, n24, n25, n26, n27, n32, n37, n38, n40, n42, n43,
         n44, n46, n47, n49, n52, n53, n54, n55, n56, n59, n60, n61, n67, n69,
         n72, n74, n75, n76, n77, n78, n79, n81, n83, n84, n86, n87, n95, n100,
         n155, n156, n157, n159, n160, n161, n162, n163;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  NOR2X2 U46 ( .A(A[10]), .B(B[10]), .Y(n43) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  ADDFX2 U112 ( .A(A[2]), .B(B[2]), .CI(n163), .CO(n87), .S(SUM[2]) );
  NOR2X1 U120 ( .A(n72), .B(n67), .Y(n61) );
  AND2X1 U121 ( .A(n24), .B(n155), .Y(n157) );
  AND2X1 U122 ( .A(n23), .B(n20), .Y(n159) );
  CLKINVX2 U123 ( .A(n56), .Y(n49) );
  INVX2 U124 ( .A(A[6]), .Y(n72) );
  NAND2XL U125 ( .A(n49), .B(n59), .Y(n8) );
  NOR2X1 U126 ( .A(A[8]), .B(B[8]), .Y(n56) );
  INVX1 U127 ( .A(A[11]), .Y(n38) );
  NOR2X2 U128 ( .A(n78), .B(n81), .Y(n76) );
  AOI21X4 U129 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  NOR2XL U130 ( .A(A[13]), .B(B[13]), .Y(n26) );
  CLKINVX2 U131 ( .A(A[9]), .Y(n52) );
  OAI21X2 U132 ( .A0(n47), .A1(n75), .B0(n160), .Y(n46) );
  NOR2X2 U133 ( .A(A[5]), .B(B[5]), .Y(n78) );
  CLKINVX2 U134 ( .A(n78), .Y(n100) );
  INVXL U135 ( .A(A[12]), .Y(n32) );
  NAND2X1 U136 ( .A(A[8]), .B(B[8]), .Y(n59) );
  NAND2BX1 U137 ( .AN(n87), .B(n86), .Y(n84) );
  XOR2X1 U138 ( .A(n74), .B(A[6]), .Y(SUM[6]) );
  XOR2XL U139 ( .A(n83), .B(n81), .Y(SUM[4]) );
  XNOR2X1 U140 ( .A(n53), .B(n52), .Y(SUM[9]) );
  CLKINVXL U141 ( .A(n75), .Y(n74) );
  INVX1 U142 ( .A(A[7]), .Y(n67) );
  NAND2X1 U143 ( .A(n61), .B(n49), .Y(n47) );
  CLKINVX2 U144 ( .A(A[4]), .Y(n81) );
  NOR2X1 U145 ( .A(n38), .B(n43), .Y(n155) );
  XOR2X1 U146 ( .A(n156), .B(n11), .Y(SUM[5]) );
  OR2X1 U147 ( .A(n83), .B(n81), .Y(n156) );
  NAND2XL U148 ( .A(A[5]), .B(B[5]), .Y(n79) );
  XOR2X1 U149 ( .A(n86), .B(n87), .Y(SUM[3]) );
  INVX1 U150 ( .A(n26), .Y(n24) );
  NAND2XL U151 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2X1 U152 ( .A(n74), .B(A[6]), .Y(n69) );
  XOR2X1 U153 ( .A(n69), .B(n67), .Y(SUM[7]) );
  XOR2X1 U154 ( .A(n40), .B(n38), .Y(SUM[11]) );
  OAI2BB1X4 U155 ( .A0N(n157), .A1N(n46), .B0(n159), .Y(CO) );
  AND2X2 U156 ( .A(n59), .B(n52), .Y(n160) );
  INVX2 U157 ( .A(n79), .Y(n77) );
  CLKINVXL U158 ( .A(A[14]), .Y(n20) );
  INVX2 U159 ( .A(n59), .Y(n55) );
  INVX2 U160 ( .A(n44), .Y(n42) );
  XOR2X1 U161 ( .A(n46), .B(n161), .Y(SUM[10]) );
  AND2X1 U162 ( .A(n95), .B(n44), .Y(n161) );
  INVX2 U163 ( .A(A[3]), .Y(n86) );
  XOR2X1 U164 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2XL U165 ( .A(n74), .B(n61), .Y(n60) );
  CLKINVXL U166 ( .A(n43), .Y(n95) );
  NOR2BXL U167 ( .AN(n61), .B(n56), .Y(n54) );
  NAND2X1 U168 ( .A(n100), .B(n79), .Y(n11) );
  INVX2 U169 ( .A(n84), .Y(n83) );
  NOR2X1 U170 ( .A(n38), .B(n44), .Y(n37) );
  OAI21XL U171 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  XOR2X1 U172 ( .A(n162), .B(A[1]), .Y(SUM[1]) );
  OR2X1 U173 ( .A(A[0]), .B(B[0]), .Y(n162) );
  XNOR2X1 U174 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NAND2XL U175 ( .A(A[13]), .B(B[13]), .Y(n27) );
  AND2X1 U176 ( .A(n162), .B(A[1]), .Y(n163) );
  AOI21XL U177 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
endmodule


module SNN_DW01_add_229 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n8, n9, n13, n14, n15, n17, n18, n26, n27, n29, n30, n33, n35,
         n36, n39, n41, n43, n48, n49, n50, n51, n53, n54, n55, n59, n60, n67,
         n68, n69, n70, n71, n72, n73, n78, n132, n133, n134, n136, n137;

  AOI21X1 U10 ( .A0(n137), .A1(n29), .B0(n17), .Y(n15) );
  AOI21X1 U29 ( .A0(n48), .A1(n136), .B0(n29), .Y(n27) );
  AOI21X1 U37 ( .A0(n48), .A1(n136), .B0(n35), .Y(n33) );
  AOI21X1 U45 ( .A0(n48), .A1(n136), .B0(n41), .Y(n39) );
  OAI21X1 U97 ( .A0(n70), .A1(n1), .B0(n71), .Y(n69) );
  NOR2X1 U98 ( .A(A[3]), .B(B[3]), .Y(n70) );
  NAND2X1 U99 ( .A(A[5]), .B(A[4]), .Y(n59) );
  NAND2X1 U100 ( .A(A[8]), .B(B[8]), .Y(n43) );
  NAND2X1 U101 ( .A(n50), .B(n69), .Y(n49) );
  NOR2X1 U102 ( .A(n51), .B(n59), .Y(n50) );
  NAND2X1 U103 ( .A(A[6]), .B(A[7]), .Y(n51) );
  NAND2X1 U104 ( .A(n30), .B(n43), .Y(n29) );
  NOR2X1 U105 ( .A(A[10]), .B(A[9]), .Y(n30) );
  OR2X1 U106 ( .A(A[11]), .B(B[11]), .Y(n137) );
  OR2X2 U107 ( .A(n13), .B(A[14]), .Y(CO) );
  OR2X1 U108 ( .A(A[0]), .B(B[0]), .Y(n132) );
  INVX1 U109 ( .A(n49), .Y(n48) );
  NAND2XL U110 ( .A(A[11]), .B(B[11]), .Y(n26) );
  NAND2XL U111 ( .A(n137), .B(n136), .Y(n14) );
  NOR2X1 U112 ( .A(A[12]), .B(A[13]), .Y(n18) );
  OAI21X1 U113 ( .A0(n49), .A1(n14), .B0(n15), .Y(n13) );
  OR2X2 U114 ( .A(A[8]), .B(B[8]), .Y(n136) );
  XNOR2X1 U115 ( .A(n54), .B(n53), .Y(SUM[7]) );
  NOR2X1 U116 ( .A(n55), .B(n68), .Y(n54) );
  XOR2XL U117 ( .A(n133), .B(A[6]), .Y(SUM[6]) );
  NOR2X1 U118 ( .A(n68), .B(n59), .Y(n133) );
  XOR2XL U119 ( .A(n134), .B(A[5]), .Y(SUM[5]) );
  NOR2X1 U120 ( .A(n68), .B(n67), .Y(n134) );
  XOR2X1 U121 ( .A(n68), .B(n67), .Y(SUM[4]) );
  CLKINVXL U122 ( .A(n43), .Y(n41) );
  NAND2XL U123 ( .A(n43), .B(n36), .Y(n35) );
  NAND2XL U124 ( .A(n136), .B(n43), .Y(n8) );
  NAND2XL U125 ( .A(A[3]), .B(B[3]), .Y(n71) );
  CLKINVXL U126 ( .A(A[7]), .Y(n53) );
  CLKINVXL U127 ( .A(A[4]), .Y(n67) );
  CLKINVXL U128 ( .A(n59), .Y(n60) );
  XNOR2X1 U129 ( .A(n48), .B(n8), .Y(SUM[8]) );
  CLKINVXL U130 ( .A(n69), .Y(n68) );
  INVX2 U131 ( .A(n72), .Y(n1) );
  XOR2XL U132 ( .A(n33), .B(A[10]), .Y(SUM[10]) );
  XNOR2X1 U133 ( .A(n9), .B(n72), .Y(SUM[3]) );
  NAND2X1 U134 ( .A(n78), .B(n71), .Y(n9) );
  CLKINVXL U135 ( .A(n70), .Y(n78) );
  ADDHXL U136 ( .A(n73), .B(A[2]), .CO(n72), .S(SUM[2]) );
  NAND2X1 U137 ( .A(n18), .B(n26), .Y(n17) );
  XOR2X1 U138 ( .A(n27), .B(n5), .Y(SUM[11]) );
  NAND2XL U139 ( .A(n137), .B(n26), .Y(n5) );
  ADDHXL U140 ( .A(n132), .B(A[1]), .CO(n73), .S(SUM[1]) );
  XNOR2X1 U141 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  XOR2XL U142 ( .A(n39), .B(A[9]), .Y(SUM[9]) );
  CLKINVXL U143 ( .A(A[9]), .Y(n36) );
  NAND2XL U144 ( .A(n60), .B(A[6]), .Y(n55) );
endmodule


module SNN_DW01_add_216 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n7, n8, n11, n12, n20, n24, n26, n31, n32, n36, n38, n43, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n59, n60, n61, n67, n69,
         n72, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n86, n87,
         n88, n95, n96, n97, n100, n155, n156, n158, n159, n160, n161;

  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  NOR2X2 U92 ( .A(n78), .B(n81), .Y(n76) );
  ADDFX2 U113 ( .A(n161), .B(B[1]), .CI(A[1]), .CO(n88), .S(SUM[1]) );
  NAND2X2 U120 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NOR2X2 U121 ( .A(A[5]), .B(B[5]), .Y(n78) );
  NOR2X1 U122 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NOR2X1 U123 ( .A(n43), .B(n38), .Y(n36) );
  NAND2X1 U124 ( .A(n61), .B(n49), .Y(n47) );
  INVX1 U125 ( .A(A[6]), .Y(n72) );
  AND2X1 U126 ( .A(n36), .B(n24), .Y(n155) );
  NAND2BXL U127 ( .AN(n81), .B(n82), .Y(n12) );
  NOR2X2 U128 ( .A(n72), .B(n67), .Y(n61) );
  CLKINVX2 U129 ( .A(n84), .Y(n83) );
  AOI21X2 U130 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  OAI21X2 U131 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  OAI21X2 U132 ( .A0(n75), .A1(n47), .B0(n48), .Y(n46) );
  NAND2X2 U133 ( .A(A[8]), .B(B[8]), .Y(n59) );
  INVX2 U134 ( .A(n50), .Y(n48) );
  NOR2X1 U135 ( .A(A[12]), .B(B[12]), .Y(n31) );
  AOI2BB1X1 U136 ( .A0N(n26), .A1N(n32), .B0(n160), .Y(n159) );
  NAND2XL U137 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NOR2X1 U138 ( .A(n56), .B(n51), .Y(n49) );
  NAND2X1 U139 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NAND2BX1 U140 ( .AN(n87), .B(n86), .Y(n84) );
  CLKINVXL U141 ( .A(n43), .Y(n95) );
  NAND2XL U142 ( .A(n74), .B(A[6]), .Y(n69) );
  XOR2XL U143 ( .A(n156), .B(n38), .Y(SUM[11]) );
  NAND2XL U144 ( .A(n46), .B(n95), .Y(n156) );
  XOR2X1 U145 ( .A(n69), .B(n67), .Y(SUM[7]) );
  INVX1 U146 ( .A(A[7]), .Y(n67) );
  CLKINVXL U147 ( .A(n75), .Y(n74) );
  CLKINVXL U148 ( .A(n56), .Y(n97) );
  XOR2X1 U149 ( .A(n86), .B(n87), .Y(SUM[3]) );
  CLKINVXL U150 ( .A(A[10]), .Y(n43) );
  XOR2X1 U151 ( .A(n46), .B(n95), .Y(SUM[10]) );
  INVX2 U152 ( .A(A[11]), .Y(n38) );
  INVX2 U153 ( .A(A[3]), .Y(n86) );
  XOR2X1 U154 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NAND2XL U155 ( .A(n96), .B(n52), .Y(n7) );
  XOR2X1 U156 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2X1 U157 ( .A(n97), .B(n59), .Y(n8) );
  NAND2XL U158 ( .A(n74), .B(n61), .Y(n60) );
  NOR2BXL U159 ( .AN(n61), .B(n56), .Y(n54) );
  INVX2 U160 ( .A(n59), .Y(n55) );
  XNOR2X1 U161 ( .A(n74), .B(n72), .Y(SUM[6]) );
  OAI2BB1X4 U162 ( .A0N(n46), .A1N(n155), .B0(n158), .Y(CO) );
  AND2X1 U163 ( .A(n159), .B(n20), .Y(n158) );
  XOR2X1 U164 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NOR2X1 U165 ( .A(n26), .B(n31), .Y(n24) );
  NOR2X1 U166 ( .A(A[8]), .B(B[8]), .Y(n56) );
  CLKINVXL U167 ( .A(A[14]), .Y(n20) );
  XNOR2X1 U168 ( .A(n80), .B(n11), .Y(SUM[5]) );
  NAND2X1 U169 ( .A(n100), .B(n79), .Y(n11) );
  OAI21XL U170 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  CLKINVXL U171 ( .A(n78), .Y(n100) );
  NOR2X1 U172 ( .A(A[13]), .B(B[13]), .Y(n26) );
  AND2X1 U173 ( .A(A[13]), .B(B[13]), .Y(n160) );
  XNOR2X1 U174 ( .A(A[2]), .B(n88), .Y(SUM[2]) );
  OR2X1 U175 ( .A(A[2]), .B(n88), .Y(n87) );
  XNOR2X1 U176 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OR2X1 U177 ( .A(A[0]), .B(B[0]), .Y(n161) );
  OAI21XL U178 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  INVX1 U179 ( .A(n51), .Y(n96) );
  NOR2X1 U180 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NAND2XL U181 ( .A(A[9]), .B(B[9]), .Y(n52) );
endmodule


module SNN_DW01_add_202 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n53, n55, n57, n58, n60, n62, n64, n66, n68, n69, n70,
         n71, n72, n74, n76, n77, n78, n79, n80, n82, n84, n85, n86, n87, n88,
         n90, n92, n93, n95, n96, n97, n98, n99, n100, n101, n105, n107, n109,
         n173, n174, n175, n176, n177, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190;

  XNOR2X4 U39 ( .A(n47), .B(n6), .Y(SUM[11]) );
  NAND2X4 U52 ( .A(A[10]), .B(B[10]), .Y(n49) );
  NAND2X1 U132 ( .A(n11), .B(n174), .Y(n175) );
  NAND2X1 U133 ( .A(n173), .B(n72), .Y(n176) );
  NAND2X1 U134 ( .A(n175), .B(n176), .Y(SUM[6]) );
  INVX2 U135 ( .A(n11), .Y(n173) );
  CLKINVXL U136 ( .A(n72), .Y(n174) );
  AOI21X2 U137 ( .A0(n185), .A1(n69), .B0(n66), .Y(n64) );
  OAI21X2 U138 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  AOI21XL U139 ( .A0(n21), .A1(n36), .B0(n22), .Y(n20) );
  NOR2XL U140 ( .A(n30), .B(n23), .Y(n21) );
  NAND2X2 U141 ( .A(n100), .B(n46), .Y(n6) );
  INVXL U142 ( .A(n45), .Y(n100) );
  NAND2X4 U143 ( .A(n99), .B(n41), .Y(n5) );
  NAND2X1 U144 ( .A(n35), .B(n97), .Y(n26) );
  AOI21X1 U145 ( .A0(n36), .A1(n97), .B0(n29), .Y(n27) );
  OAI21X2 U146 ( .A0(n1), .A1(n40), .B0(n41), .Y(n39) );
  OAI21X1 U147 ( .A0(n88), .A1(n86), .B0(n87), .Y(n85) );
  OR2X2 U148 ( .A(A[1]), .B(B[1]), .Y(n188) );
  INVX2 U149 ( .A(n40), .Y(n99) );
  OR2X2 U150 ( .A(A[5]), .B(B[5]), .Y(n187) );
  XNOR2X1 U151 ( .A(n14), .B(n85), .Y(SUM[3]) );
  OR2X2 U152 ( .A(A[8]), .B(B[8]), .Y(n186) );
  XOR2X2 U153 ( .A(n50), .B(n7), .Y(SUM[10]) );
  NAND2X2 U154 ( .A(n101), .B(n49), .Y(n7) );
  INVX2 U155 ( .A(n48), .Y(n101) );
  NOR2X1 U156 ( .A(A[2]), .B(B[2]), .Y(n86) );
  AOI21X1 U157 ( .A0(n188), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X2 U158 ( .A(n48), .B(n45), .Y(n43) );
  AND2X4 U159 ( .A(n184), .B(n186), .Y(n177) );
  AND2X1 U160 ( .A(n183), .B(n95), .Y(SUM[0]) );
  XNOR2X2 U161 ( .A(n181), .B(n9), .Y(SUM[8]) );
  INVX1 U162 ( .A(n64), .Y(n179) );
  CLKINVX2 U163 ( .A(n64), .Y(n181) );
  NAND2X1 U164 ( .A(n186), .B(n62), .Y(n9) );
  INVX1 U165 ( .A(n76), .Y(n74) );
  AOI21X2 U166 ( .A0(n184), .A1(n60), .B0(n55), .Y(n53) );
  OR2X4 U167 ( .A(A[7]), .B(B[7]), .Y(n185) );
  NOR2X2 U168 ( .A(A[6]), .B(B[6]), .Y(n70) );
  OAI21X1 U169 ( .A0(n80), .A1(n78), .B0(n79), .Y(n77) );
  NAND2XL U170 ( .A(n184), .B(n57), .Y(n8) );
  NAND2X1 U171 ( .A(A[6]), .B(B[6]), .Y(n71) );
  INVXL U172 ( .A(n78), .Y(n107) );
  AOI21X2 U173 ( .A0(n77), .A1(n187), .B0(n74), .Y(n72) );
  INVX4 U174 ( .A(n51), .Y(n50) );
  OAI21X1 U175 ( .A0(n1), .A1(n26), .B0(n27), .Y(n25) );
  OAI21XL U176 ( .A0(n80), .A1(n78), .B0(n79), .Y(n180) );
  NAND2X1 U177 ( .A(n189), .B(n84), .Y(n14) );
  OAI21X4 U178 ( .A0(n45), .A1(n49), .B0(n46), .Y(n44) );
  AOI21X2 U179 ( .A0(n85), .A1(n190), .B0(n82), .Y(n80) );
  XOR2X1 U180 ( .A(n13), .B(n80), .Y(SUM[4]) );
  NAND2X1 U181 ( .A(n105), .B(n71), .Y(n11) );
  INVXL U182 ( .A(n70), .Y(n105) );
  NAND2X2 U183 ( .A(A[12]), .B(B[12]), .Y(n41) );
  XOR2X1 U184 ( .A(n15), .B(n88), .Y(SUM[2]) );
  XNOR2X1 U185 ( .A(n12), .B(n180), .Y(SUM[5]) );
  OAI21X2 U186 ( .A0(n1), .A1(n33), .B0(n34), .Y(n32) );
  OR2X2 U187 ( .A(A[3]), .B(B[3]), .Y(n190) );
  XOR2X4 U188 ( .A(n1), .B(n5), .Y(SUM[12]) );
  NOR2X2 U189 ( .A(A[12]), .B(B[12]), .Y(n40) );
  NAND2X2 U190 ( .A(n177), .B(n181), .Y(n182) );
  NAND2X4 U191 ( .A(n182), .B(n53), .Y(n51) );
  AOI21X4 U192 ( .A0(n43), .A1(n51), .B0(n44), .Y(n1) );
  AOI21X1 U193 ( .A0(n179), .A1(n186), .B0(n60), .Y(n58) );
  NAND2X2 U194 ( .A(A[11]), .B(B[11]), .Y(n46) );
  CLKINVX1 U195 ( .A(n84), .Y(n82) );
  CLKINVX2 U196 ( .A(n92), .Y(n90) );
  OAI21X4 U197 ( .A0(n50), .A1(n48), .B0(n49), .Y(n47) );
  OR2X1 U198 ( .A(A[3]), .B(B[3]), .Y(n189) );
  INVX1 U199 ( .A(n36), .Y(n34) );
  CLKINVXL U200 ( .A(n37), .Y(n98) );
  XNOR2X2 U201 ( .A(n39), .B(n4), .Y(SUM[13]) );
  CLKINVXL U202 ( .A(n31), .Y(n29) );
  CLKINVXL U203 ( .A(n86), .Y(n109) );
  OR2X4 U204 ( .A(B[9]), .B(A[9]), .Y(n184) );
  NAND2XL U205 ( .A(A[9]), .B(B[9]), .Y(n57) );
  NAND2XL U206 ( .A(A[3]), .B(B[3]), .Y(n84) );
  NAND2XL U207 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NAND2XL U208 ( .A(A[5]), .B(B[5]), .Y(n76) );
  NAND2XL U209 ( .A(A[4]), .B(B[4]), .Y(n79) );
  NAND2XL U210 ( .A(A[8]), .B(B[8]), .Y(n62) );
  NAND2XL U211 ( .A(A[2]), .B(B[2]), .Y(n87) );
  INVX1 U212 ( .A(n23), .Y(n96) );
  NAND2X2 U213 ( .A(n96), .B(n24), .Y(n2) );
  CLKINVX2 U214 ( .A(n95), .Y(n93) );
  OR2XL U215 ( .A(A[0]), .B(B[0]), .Y(n183) );
  NAND2X1 U216 ( .A(n98), .B(n38), .Y(n4) );
  NOR2X1 U217 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U218 ( .A(n97), .B(n31), .Y(n3) );
  INVX2 U219 ( .A(n30), .Y(n97) );
  OAI21X1 U220 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  XNOR2X1 U221 ( .A(n10), .B(n69), .Y(SUM[7]) );
  NAND2X1 U222 ( .A(n185), .B(n68), .Y(n10) );
  INVX2 U223 ( .A(n68), .Y(n66) );
  XOR2X1 U224 ( .A(n58), .B(n8), .Y(SUM[9]) );
  NAND2X1 U225 ( .A(n107), .B(n79), .Y(n13) );
  INVX2 U226 ( .A(n57), .Y(n55) );
  NAND2X1 U227 ( .A(n187), .B(n76), .Y(n12) );
  NOR2X1 U228 ( .A(A[13]), .B(B[13]), .Y(n37) );
  INVX2 U229 ( .A(n62), .Y(n60) );
  NAND2X1 U230 ( .A(n109), .B(n87), .Y(n15) );
  NOR2X1 U231 ( .A(A[14]), .B(B[14]), .Y(n30) );
  NAND2X1 U232 ( .A(A[14]), .B(B[14]), .Y(n31) );
  NAND2X1 U233 ( .A(A[13]), .B(B[13]), .Y(n38) );
  NAND2XL U234 ( .A(n21), .B(n35), .Y(n19) );
  NOR2X1 U235 ( .A(A[4]), .B(B[4]), .Y(n78) );
  XNOR2X1 U236 ( .A(n16), .B(n93), .Y(SUM[1]) );
  NAND2X1 U237 ( .A(n188), .B(n92), .Y(n16) );
  OAI21XL U238 ( .A0(n23), .A1(n31), .B0(n24), .Y(n22) );
  NAND2X1 U239 ( .A(A[1]), .B(B[1]), .Y(n92) );
  NOR2X1 U240 ( .A(A[15]), .B(B[15]), .Y(n23) );
  NAND2X1 U241 ( .A(A[15]), .B(B[15]), .Y(n24) );
  NAND2X1 U242 ( .A(A[0]), .B(B[0]), .Y(n95) );
  XNOR2X2 U243 ( .A(n25), .B(n2), .Y(SUM[15]) );
  XNOR2X2 U244 ( .A(n32), .B(n3), .Y(SUM[14]) );
  NOR2X4 U245 ( .A(A[11]), .B(B[11]), .Y(n45) );
  NOR2X4 U246 ( .A(B[10]), .B(A[10]), .Y(n48) );
  INVX1 U247 ( .A(n35), .Y(n33) );
  OAI21XL U248 ( .A0(n1), .A1(n19), .B0(n20), .Y(SUM[16]) );
endmodule


module SNN_DW_mult_uns_40 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n17, n18, n26,
         n27, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n45, n46, n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78,
         n79, n80, n81, n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98,
         n99, n100, n102, n104, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n223, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n269, n270, n271, n272, n273, n274, n275,
         n276, n278, n279, n280, n282, n283, n284, n298, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362;

  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U34 ( .A(n121), .B(n116), .Y(n37) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  NOR2X2 U64 ( .A(n136), .B(n142), .Y(n58) );
  XOR3X2 U121 ( .A(n109), .B(n174), .C(n179), .Y(n106) );
  ADDFHX4 U126 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  OAI22X1 U173 ( .A0(n228), .A1(n273), .B0(n227), .B1(n278), .Y(n183) );
  OAI22X1 U174 ( .A0(n229), .A1(n273), .B0(n228), .B1(n278), .Y(n184) );
  OAI22X1 U191 ( .A0(n234), .A1(n274), .B0(n279), .B1(n283), .Y(n190) );
  OAI22X1 U215 ( .A0(n246), .A1(n275), .B0(n245), .B1(n280), .Y(n203) );
  OAI22X1 U217 ( .A0(n248), .A1(n275), .B0(n247), .B1(n280), .Y(n205) );
  OAI22X1 U218 ( .A0(n249), .A1(n275), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n250), .A1(n275), .B0(n249), .B1(n280), .Y(n207) );
  NAND2X4 U283 ( .A(n280), .B(n271), .Y(n275) );
  XNOR2X4 U285 ( .A(n359), .B(b[2]), .Y(n280) );
  NAND2XL U291 ( .A(a[3]), .B(n359), .Y(n337) );
  NAND2X1 U292 ( .A(n335), .B(n336), .Y(n338) );
  NAND2X1 U293 ( .A(n337), .B(n338), .Y(n256) );
  INVX2 U294 ( .A(a[3]), .Y(n335) );
  CLKINVXL U295 ( .A(n359), .Y(n336) );
  BUFX12 U296 ( .A(b[1]), .Y(n359) );
  OAI22XL U297 ( .A0(n257), .A1(n276), .B0(n256), .B1(n298), .Y(n215) );
  OR2X2 U298 ( .A(n256), .B(n276), .Y(n341) );
  NOR2X1 U299 ( .A(n87), .B(n90), .Y(n339) );
  CLKINVX2 U300 ( .A(n88), .Y(n340) );
  OR2X4 U301 ( .A(n339), .B(n340), .Y(n86) );
  OR2X4 U302 ( .A(n255), .B(n298), .Y(n342) );
  NAND2X4 U303 ( .A(n341), .B(n342), .Y(n214) );
  INVX2 U304 ( .A(b[0]), .Y(n298) );
  ADDFHX2 U305 ( .A(n198), .B(n214), .CI(n206), .CO(n162), .S(n163) );
  OAI22X4 U306 ( .A0(n242), .A1(n279), .B0(n274), .B1(n283), .Y(n171) );
  OAI22X2 U307 ( .A0(n232), .A1(n273), .B0(n231), .B1(n278), .Y(n187) );
  NAND2X4 U308 ( .A(n278), .B(n269), .Y(n273) );
  OAI22X1 U309 ( .A0(n252), .A1(n276), .B0(n345), .B1(n298), .Y(n210) );
  XNOR2X1 U310 ( .A(a[6]), .B(n359), .Y(n253) );
  XNOR2XL U311 ( .A(a[6]), .B(n360), .Y(n244) );
  XNOR2XL U312 ( .A(a[6]), .B(n361), .Y(n235) );
  XNOR2XL U313 ( .A(a[6]), .B(n362), .Y(n226) );
  ADDFHX2 U314 ( .A(n205), .B(n197), .CI(n161), .CO(n158), .S(n159) );
  OAI22X2 U315 ( .A0(n241), .A1(n274), .B0(n240), .B1(n279), .Y(n197) );
  XNOR2X1 U316 ( .A(a[5]), .B(n359), .Y(n254) );
  OAI22X4 U317 ( .A0(n251), .A1(n280), .B0(n275), .B1(n284), .Y(n172) );
  OAI22X2 U318 ( .A0(n254), .A1(n276), .B0(n253), .B1(n298), .Y(n212) );
  NOR2X2 U319 ( .A(n143), .B(n148), .Y(n64) );
  OAI22X1 U320 ( .A0(n253), .A1(n276), .B0(n252), .B1(n298), .Y(n211) );
  ADDHX1 U321 ( .A(n171), .B(n213), .CO(n160), .S(n161) );
  NAND2X4 U322 ( .A(n279), .B(n270), .Y(n274) );
  OAI22XL U323 ( .A0(n239), .A1(n274), .B0(n238), .B1(n279), .Y(n195) );
  XNOR2X4 U324 ( .A(n360), .B(b[4]), .Y(n279) );
  NAND2XL U325 ( .A(n127), .B(n122), .Y(n45) );
  NOR2X1 U326 ( .A(n58), .B(n53), .Y(n47) );
  ADDHXL U327 ( .A(n170), .B(n195), .CO(n152), .S(n153) );
  ADDFHX1 U328 ( .A(n196), .B(n160), .CI(n157), .CO(n154), .S(n155) );
  CMPR32X1 U329 ( .A(n192), .B(n184), .C(n139), .CO(n129), .S(n130) );
  ADDFHX1 U330 ( .A(n131), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  NAND2XL U331 ( .A(n115), .B(n112), .Y(n31) );
  NAND2XL U332 ( .A(n96), .B(n54), .Y(n6) );
  NAND2XL U333 ( .A(n95), .B(n45), .Y(n5) );
  CLKINVXL U334 ( .A(n42), .Y(n95) );
  XOR2X1 U335 ( .A(n360), .B(b[2]), .Y(n271) );
  NOR2X1 U336 ( .A(n155), .B(n158), .Y(n71) );
  NAND2X1 U337 ( .A(n155), .B(n158), .Y(n72) );
  NOR2X2 U338 ( .A(n348), .B(n75), .Y(n73) );
  AND2X2 U339 ( .A(n78), .B(n357), .Y(n348) );
  ADDFX2 U340 ( .A(n153), .B(n156), .CI(n151), .CO(n148), .S(n149) );
  XOR2X1 U341 ( .A(n361), .B(b[4]), .Y(n270) );
  XOR2X1 U342 ( .A(n69), .B(n9), .Y(product[7]) );
  INVX2 U343 ( .A(n70), .Y(n69) );
  ADDFX2 U344 ( .A(n147), .B(n150), .CI(n145), .CO(n142), .S(n143) );
  OAI21X2 U345 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  NOR2X2 U346 ( .A(n149), .B(n154), .Y(n67) );
  NAND2X1 U347 ( .A(n149), .B(n154), .Y(n68) );
  NAND2X1 U348 ( .A(n143), .B(n148), .Y(n65) );
  OAI21X1 U349 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  ADDFX2 U350 ( .A(n140), .B(n144), .CI(n138), .CO(n135), .S(n136) );
  NOR2X1 U351 ( .A(n128), .B(n135), .Y(n53) );
  AND2X1 U352 ( .A(n354), .B(n31), .Y(n351) );
  XOR2X1 U353 ( .A(n39), .B(n4), .Y(product[12]) );
  NAND2X1 U354 ( .A(n94), .B(n38), .Y(n4) );
  OR2X1 U355 ( .A(n217), .B(n173), .Y(n343) );
  XNOR2X4 U356 ( .A(n361), .B(b[6]), .Y(n278) );
  ADDFHX1 U357 ( .A(n194), .B(n186), .CI(n152), .CO(n144), .S(n145) );
  OAI22XL U358 ( .A0(n231), .A1(n273), .B0(n230), .B1(n278), .Y(n186) );
  NAND2X1 U359 ( .A(n97), .B(n59), .Y(n7) );
  AOI21X1 U360 ( .A0(n32), .A1(n354), .B0(n29), .Y(n27) );
  XOR2X1 U361 ( .A(n32), .B(n351), .Y(product[13]) );
  AOI21X2 U362 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  INVX3 U363 ( .A(n61), .Y(n60) );
  OAI21X1 U364 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  ADDFHX1 U365 ( .A(n211), .B(n187), .CI(n203), .CO(n150), .S(n151) );
  OAI22X1 U366 ( .A0(n233), .A1(n278), .B0(n273), .B1(n282), .Y(n170) );
  AOI21X1 U367 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  AOI21X2 U368 ( .A0(n86), .A1(n356), .B0(n83), .Y(n81) );
  OR2X2 U369 ( .A(n159), .B(n162), .Y(n357) );
  ADDFHX1 U370 ( .A(n132), .B(n137), .CI(n130), .CO(n127), .S(n128) );
  CLKINVX1 U371 ( .A(n48), .Y(n50) );
  OAI22XL U372 ( .A0(n258), .A1(n276), .B0(n257), .B1(n298), .Y(n216) );
  OAI22X1 U373 ( .A0(n260), .A1(n298), .B0(n276), .B1(n345), .Y(n173) );
  NAND2X4 U374 ( .A(n272), .B(n298), .Y(n276) );
  XOR2X2 U375 ( .A(n359), .B(b[0]), .Y(n272) );
  XNOR2X1 U376 ( .A(a[7]), .B(n359), .Y(n252) );
  XNOR2X1 U377 ( .A(n349), .B(n78), .Y(product[5]) );
  OAI21X1 U378 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  AOI21XL U379 ( .A0(n32), .A1(n353), .B0(n352), .Y(n18) );
  NAND2X1 U380 ( .A(n356), .B(n85), .Y(n13) );
  OR2X4 U381 ( .A(n165), .B(n207), .Y(n356) );
  NAND2X1 U382 ( .A(n165), .B(n207), .Y(n85) );
  OAI21X1 U383 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  OAI21X1 U384 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  INVX2 U385 ( .A(a[4]), .Y(n344) );
  NAND2XL U386 ( .A(a[4]), .B(n359), .Y(n346) );
  NAND2X1 U387 ( .A(n344), .B(n345), .Y(n347) );
  NAND2X1 U388 ( .A(n346), .B(n347), .Y(n255) );
  CLKINVXL U389 ( .A(n359), .Y(n345) );
  OAI22XL U390 ( .A0(n255), .A1(n276), .B0(n254), .B1(n298), .Y(n213) );
  CLKINVX2 U391 ( .A(n77), .Y(n75) );
  NAND2X1 U392 ( .A(n357), .B(n77), .Y(n349) );
  NOR2X1 U393 ( .A(n64), .B(n67), .Y(n62) );
  ADDFHX1 U394 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  CLKINVXL U395 ( .A(n64), .Y(n98) );
  NAND2X1 U396 ( .A(n136), .B(n142), .Y(n59) );
  ADDFX1 U397 ( .A(n209), .B(n141), .CI(n201), .CO(n139), .S(n140) );
  ADDFX1 U398 ( .A(n110), .B(n180), .CI(n113), .CO(n107), .S(n108) );
  OAI22X1 U399 ( .A0(n259), .A1(n276), .B0(n258), .B1(n298), .Y(n217) );
  XNOR2X1 U400 ( .A(a[2]), .B(n360), .Y(n248) );
  XNOR2X1 U401 ( .A(a[3]), .B(n360), .Y(n247) );
  XNOR2X1 U402 ( .A(a[1]), .B(n360), .Y(n249) );
  XNOR2X1 U403 ( .A(a[3]), .B(n361), .Y(n238) );
  ADDFX1 U404 ( .A(n119), .B(n175), .CI(n189), .CO(n113), .S(n114) );
  NAND2X1 U405 ( .A(n99), .B(n68), .Y(n9) );
  XNOR2X1 U406 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U407 ( .A(n98), .B(n65), .Y(n8) );
  INVX2 U408 ( .A(n58), .Y(n97) );
  INVX1 U409 ( .A(n53), .Y(n96) );
  OAI21X1 U410 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  NAND2XL U411 ( .A(n355), .B(n26), .Y(n2) );
  XOR2X1 U412 ( .A(n27), .B(n2), .Y(product[14]) );
  CLKINVXL U413 ( .A(n31), .Y(n29) );
  CLKINVXL U414 ( .A(n79), .Y(n102) );
  INVX1 U415 ( .A(n71), .Y(n100) );
  XOR2XL U416 ( .A(n14), .B(n90), .Y(product[2]) );
  INVX1 U417 ( .A(n87), .Y(n104) );
  NAND2X1 U418 ( .A(n128), .B(n135), .Y(n54) );
  NAND2X1 U419 ( .A(n121), .B(n116), .Y(n38) );
  AND2X1 U420 ( .A(n343), .B(n90), .Y(product[1]) );
  NAND2XL U421 ( .A(n216), .B(n208), .Y(n88) );
  CMPR32X1 U422 ( .A(n193), .B(n185), .C(n146), .CO(n137), .S(n138) );
  CLKINVXL U423 ( .A(n361), .Y(n283) );
  CLKINVXL U424 ( .A(n360), .Y(n284) );
  OAI2BB1XL U425 ( .A0N(n298), .A1N(n276), .B0(n359), .Y(n209) );
  CMPR32X1 U426 ( .A(n191), .B(n183), .C(n126), .CO(n123), .S(n124) );
  XOR2X1 U427 ( .A(n18), .B(n1), .Y(product[15]) );
  INVX1 U428 ( .A(n119), .Y(n120) );
  OAI22XL U429 ( .A0(n247), .A1(n275), .B0(n246), .B1(n280), .Y(n204) );
  XNOR2XL U430 ( .A(a[1]), .B(n359), .Y(n258) );
  BUFX8 U431 ( .A(b[7]), .Y(n362) );
  NOR2BXL U432 ( .AN(a[1]), .B(n282), .Y(n133) );
  ADDFX1 U433 ( .A(n177), .B(n141), .CI(n200), .CO(n131), .S(n132) );
  NOR2BXL U434 ( .AN(a[3]), .B(n282), .Y(n176) );
  NOR2BXL U435 ( .AN(a[5]), .B(n282), .Y(n175) );
  NOR2BXL U436 ( .AN(a[7]), .B(n282), .Y(n174) );
  XNOR2X2 U437 ( .A(n60), .B(n7), .Y(product[9]) );
  INVX2 U438 ( .A(n67), .Y(n99) );
  XOR2X2 U439 ( .A(n46), .B(n5), .Y(product[11]) );
  NOR2X1 U440 ( .A(n42), .B(n37), .Y(n35) );
  CLKINVXL U441 ( .A(n37), .Y(n94) );
  NOR2BXL U442 ( .AN(n47), .B(n42), .Y(n40) );
  OAI21XL U443 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  INVX2 U444 ( .A(n59), .Y(n57) );
  OAI2BB1X1 U445 ( .A0N(n29), .A1N(n355), .B0(n26), .Y(n352) );
  AND2X1 U446 ( .A(n354), .B(n355), .Y(n353) );
  XNOR2X1 U447 ( .A(n13), .B(n86), .Y(product[3]) );
  XOR2X1 U448 ( .A(n12), .B(n81), .Y(product[4]) );
  NAND2X1 U449 ( .A(n102), .B(n80), .Y(n12) );
  NAND2X1 U450 ( .A(n104), .B(n88), .Y(n14) );
  INVX2 U451 ( .A(n85), .Y(n83) );
  XOR2X1 U452 ( .A(n10), .B(n73), .Y(product[6]) );
  NAND2X1 U453 ( .A(n100), .B(n72), .Y(n10) );
  OR2X2 U454 ( .A(n115), .B(n112), .Y(n354) );
  OR2X1 U455 ( .A(n111), .B(n108), .Y(n355) );
  NAND2X1 U456 ( .A(n111), .B(n108), .Y(n26) );
  NOR2X1 U457 ( .A(n163), .B(n164), .Y(n79) );
  NOR2X1 U458 ( .A(n216), .B(n208), .Y(n87) );
  NAND2X1 U459 ( .A(n159), .B(n162), .Y(n77) );
  NAND2X1 U460 ( .A(n217), .B(n173), .Y(n90) );
  NAND2X1 U461 ( .A(n163), .B(n164), .Y(n80) );
  INVX2 U462 ( .A(n362), .Y(n282) );
  INVX2 U463 ( .A(n133), .Y(n141) );
  NAND2X1 U464 ( .A(n358), .B(n17), .Y(n1) );
  NAND2XL U465 ( .A(n107), .B(n106), .Y(n17) );
  INVX1 U466 ( .A(n109), .Y(n110) );
  ADDFX2 U467 ( .A(n181), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  OR2X1 U468 ( .A(n107), .B(n106), .Y(n358) );
  ADDHX1 U469 ( .A(n172), .B(n215), .CO(n164), .S(n165) );
  XOR2X1 U470 ( .A(n362), .B(b[6]), .Y(n269) );
  BUFX8 U471 ( .A(b[5]), .Y(n361) );
  XNOR2X1 U472 ( .A(a[3]), .B(n362), .Y(n229) );
  BUFX8 U473 ( .A(b[3]), .Y(n360) );
  CMPR32X1 U474 ( .A(n133), .B(n176), .C(n199), .CO(n125), .S(n126) );
  XNOR2X1 U475 ( .A(a[1]), .B(n361), .Y(n240) );
  XNOR2X1 U476 ( .A(a[1]), .B(n362), .Y(n231) );
  NOR2X1 U477 ( .A(n223), .B(n282), .Y(n177) );
  XNOR2X1 U478 ( .A(a[2]), .B(n362), .Y(n230) );
  XNOR2XL U479 ( .A(a[2]), .B(n361), .Y(n239) );
  NOR2BXL U480 ( .AN(a[4]), .B(n282), .Y(n119) );
  NOR2BXL U481 ( .AN(a[6]), .B(n282), .Y(n109) );
  XNOR2X1 U482 ( .A(a[5]), .B(n362), .Y(n227) );
  XNOR2XL U483 ( .A(a[5]), .B(n361), .Y(n236) );
  XNOR2XL U484 ( .A(a[5]), .B(n360), .Y(n245) );
  NOR2X4 U485 ( .A(n127), .B(n122), .Y(n42) );
  XNOR2X1 U486 ( .A(a[7]), .B(n362), .Y(n225) );
  XNOR2X1 U487 ( .A(a[7]), .B(n361), .Y(n234) );
  OAI2BB1X1 U488 ( .A0N(n278), .A1N(n273), .B0(n362), .Y(n179) );
  OAI22XL U489 ( .A0(n226), .A1(n273), .B0(n225), .B1(n278), .Y(n181) );
  OAI22XL U490 ( .A0(n225), .A1(n273), .B0(n278), .B1(n282), .Y(n180) );
  OAI22XL U491 ( .A0(n227), .A1(n273), .B0(n226), .B1(n278), .Y(n182) );
  OAI22XL U492 ( .A0(n230), .A1(n273), .B0(n229), .B1(n278), .Y(n185) );
  OAI2BB1XL U493 ( .A0N(n279), .A1N(n274), .B0(n361), .Y(n189) );
  OAI22XL U494 ( .A0(n240), .A1(n274), .B0(n239), .B1(n279), .Y(n196) );
  OAI22XL U495 ( .A0(n237), .A1(n274), .B0(n236), .B1(n279), .Y(n193) );
  OAI22XL U496 ( .A0(n235), .A1(n274), .B0(n234), .B1(n279), .Y(n191) );
  OAI22XL U497 ( .A0(n236), .A1(n274), .B0(n235), .B1(n279), .Y(n192) );
  OAI22XL U498 ( .A0(n238), .A1(n274), .B0(n237), .B1(n279), .Y(n194) );
  XNOR2X1 U499 ( .A(a[7]), .B(n360), .Y(n243) );
  ADDFHX1 U500 ( .A(n178), .B(n210), .CI(n202), .CO(n146), .S(n147) );
  NAND2XL U501 ( .A(n47), .B(n35), .Y(n33) );
  NOR2BXL U502 ( .AN(a[0]), .B(n298), .Y(product[0]) );
  NOR2BXL U503 ( .AN(a[0]), .B(n278), .Y(n188) );
  NOR2BXL U504 ( .AN(a[0]), .B(n282), .Y(n178) );
  NOR2BXL U505 ( .AN(a[0]), .B(n279), .Y(n198) );
  NOR2BXL U506 ( .AN(a[0]), .B(n280), .Y(n208) );
  NAND2BX1 U507 ( .AN(a[0]), .B(n362), .Y(n233) );
  XNOR2X1 U508 ( .A(a[0]), .B(n362), .Y(n232) );
  NAND2BX1 U509 ( .AN(a[0]), .B(n361), .Y(n242) );
  XNOR2XL U510 ( .A(a[0]), .B(n360), .Y(n250) );
  XNOR2X1 U511 ( .A(a[0]), .B(n361), .Y(n241) );
  NAND2BXL U512 ( .AN(a[0]), .B(n360), .Y(n251) );
  ADDFHX1 U513 ( .A(n188), .B(n212), .CI(n204), .CO(n156), .S(n157) );
  XNOR2X1 U514 ( .A(a[4]), .B(n361), .Y(n237) );
  XNOR2X1 U515 ( .A(a[4]), .B(n362), .Y(n228) );
  XNOR2XL U516 ( .A(a[4]), .B(n360), .Y(n246) );
  XNOR2X1 U517 ( .A(a[2]), .B(n359), .Y(n257) );
  INVX2 U518 ( .A(a[2]), .Y(n223) );
  XOR2X2 U519 ( .A(n55), .B(n6), .Y(product[10]) );
  NAND2BXL U520 ( .AN(a[0]), .B(n359), .Y(n260) );
  XNOR2XL U521 ( .A(a[0]), .B(n359), .Y(n259) );
  OAI22XL U522 ( .A0(n243), .A1(n275), .B0(n280), .B1(n284), .Y(n200) );
  OAI22XL U523 ( .A0(n244), .A1(n275), .B0(n243), .B1(n280), .Y(n201) );
  OAI2BB1X1 U524 ( .A0N(n280), .A1N(n275), .B0(n360), .Y(n199) );
  OAI22XL U525 ( .A0(n245), .A1(n275), .B0(n244), .B1(n280), .Y(n202) );
endmodule


module SNN_DW01_add_184 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n20, n21, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n54, n55, n56, n57, n59, n61, n62, n63, n64, n65, n67,
         n69, n70, n71, n72, n73, n75, n77, n78, n79, n80, n81, n83, n85, n86,
         n87, n88, n90, n91, n92, n93, n94, n95, n96, n97, n98, n104, n106,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n192, n193, n194, n195;

  NAND2X4 U14 ( .A(n91), .B(n30), .Y(n2) );
  NOR2X2 U22 ( .A(B[15]), .B(A[15]), .Y(n32) );
  NAND2X4 U34 ( .A(n94), .B(n40), .Y(n5) );
  OAI21X4 U61 ( .A0(n55), .A1(n57), .B0(n56), .Y(n54) );
  NOR2X2 U64 ( .A(B[9]), .B(A[9]), .Y(n55) );
  NAND2X2 U130 ( .A(n175), .B(n176), .Y(n177) );
  NAND2X2 U131 ( .A(n177), .B(n52), .Y(n50) );
  INVX2 U132 ( .A(n51), .Y(n175) );
  INVX4 U133 ( .A(n187), .Y(n176) );
  XNOR2X2 U134 ( .A(n7), .B(n50), .Y(SUM[11]) );
  NAND2X4 U135 ( .A(n178), .B(n179), .Y(n180) );
  NAND2X4 U136 ( .A(n180), .B(n72), .Y(n70) );
  INVX3 U137 ( .A(n71), .Y(n178) );
  INVX3 U138 ( .A(n73), .Y(n179) );
  AOI21X2 U139 ( .A0(n78), .A1(n194), .B0(n75), .Y(n73) );
  NAND2X1 U140 ( .A(B[5]), .B(A[5]), .Y(n72) );
  AOI21X4 U141 ( .A0(n195), .A1(n70), .B0(n67), .Y(n65) );
  NAND2X4 U142 ( .A(n181), .B(n182), .Y(n183) );
  NAND2X4 U143 ( .A(n183), .B(n40), .Y(n38) );
  INVX2 U144 ( .A(n41), .Y(n181) );
  CLKINVX12 U145 ( .A(n39), .Y(n182) );
  INVX4 U146 ( .A(n42), .Y(n41) );
  XNOR2X4 U147 ( .A(n38), .B(n4), .Y(SUM[14]) );
  NOR2X4 U148 ( .A(B[14]), .B(A[14]), .Y(n36) );
  NAND2X1 U149 ( .A(B[14]), .B(A[14]), .Y(n37) );
  INVX4 U150 ( .A(n54), .Y(n187) );
  XNOR2X2 U151 ( .A(n31), .B(n2), .Y(SUM[16]) );
  NAND2X2 U152 ( .A(B[10]), .B(A[10]), .Y(n52) );
  NOR2X2 U153 ( .A(B[10]), .B(A[10]), .Y(n51) );
  NOR2X2 U154 ( .A(n48), .B(n51), .Y(n46) );
  OAI21X2 U155 ( .A0(n48), .A1(n52), .B0(n49), .Y(n47) );
  NAND2XL U156 ( .A(n192), .B(n61), .Y(n10) );
  NOR2X2 U157 ( .A(B[16]), .B(A[16]), .Y(n29) );
  INVX2 U158 ( .A(A[6]), .Y(n186) );
  NAND2BX2 U159 ( .AN(B[8]), .B(n185), .Y(n192) );
  INVX2 U160 ( .A(A[8]), .Y(n185) );
  NAND2X1 U161 ( .A(B[8]), .B(A[8]), .Y(n61) );
  NAND2X1 U162 ( .A(n97), .B(n52), .Y(n8) );
  NAND2X1 U163 ( .A(n96), .B(n49), .Y(n7) );
  INVX2 U164 ( .A(n39), .Y(n94) );
  XOR2X1 U165 ( .A(n45), .B(n6), .Y(SUM[12]) );
  NAND2X1 U166 ( .A(n95), .B(n44), .Y(n6) );
  NAND2X1 U167 ( .A(n93), .B(n37), .Y(n4) );
  OR2X2 U168 ( .A(B[4]), .B(A[4]), .Y(n194) );
  AND2X1 U169 ( .A(n193), .B(n85), .Y(n190) );
  OR2X1 U170 ( .A(B[0]), .B(A[0]), .Y(n184) );
  XNOR2X1 U171 ( .A(n10), .B(n62), .Y(SUM[8]) );
  NAND2X1 U172 ( .A(n195), .B(n69), .Y(n12) );
  NAND2BX2 U173 ( .AN(B[6]), .B(n186), .Y(n195) );
  CLKINVX2 U174 ( .A(n29), .Y(n91) );
  NOR2X4 U175 ( .A(B[12]), .B(A[12]), .Y(n43) );
  XNOR2X1 U176 ( .A(n12), .B(n70), .Y(SUM[6]) );
  NAND2X1 U177 ( .A(B[3]), .B(A[3]), .Y(n80) );
  NAND2XL U178 ( .A(B[6]), .B(A[6]), .Y(n69) );
  OR2X2 U179 ( .A(B[2]), .B(A[2]), .Y(n193) );
  CLKINVXL U180 ( .A(n85), .Y(n83) );
  XNOR2X1 U181 ( .A(n14), .B(n78), .Y(SUM[4]) );
  NAND2BXL U182 ( .AN(n63), .B(n64), .Y(n11) );
  XOR2XL U183 ( .A(n190), .B(n86), .Y(SUM[2]) );
  CLKINVX4 U184 ( .A(n188), .Y(n189) );
  INVX2 U185 ( .A(n1), .Y(n188) );
  CLKINVX2 U186 ( .A(n69), .Y(n67) );
  NAND2X4 U187 ( .A(B[13]), .B(A[13]), .Y(n40) );
  INVX2 U188 ( .A(n32), .Y(n92) );
  NAND2X1 U189 ( .A(n194), .B(n77), .Y(n14) );
  NAND2X2 U190 ( .A(n92), .B(n33), .Y(n3) );
  XOR2X4 U191 ( .A(n8), .B(n187), .Y(SUM[10]) );
  OAI21X2 U192 ( .A0(n1), .A1(n32), .B0(n33), .Y(n31) );
  AOI21X1 U193 ( .A0(n34), .A1(n42), .B0(n35), .Y(n1) );
  XOR2X4 U194 ( .A(n189), .B(n3), .Y(SUM[15]) );
  NAND2X2 U195 ( .A(B[11]), .B(A[11]), .Y(n49) );
  XOR2X4 U196 ( .A(n41), .B(n5), .Y(SUM[13]) );
  INVX2 U197 ( .A(n61), .Y(n59) );
  INVX2 U198 ( .A(n48), .Y(n96) );
  NOR2X4 U199 ( .A(B[11]), .B(A[11]), .Y(n48) );
  NAND2X1 U200 ( .A(n98), .B(n56), .Y(n9) );
  INVX1 U201 ( .A(n55), .Y(n98) );
  CLKINVX2 U202 ( .A(n77), .Y(n75) );
  INVX2 U203 ( .A(n36), .Y(n93) );
  OAI21X2 U204 ( .A0(n65), .A1(n63), .B0(n64), .Y(n62) );
  NAND2X1 U205 ( .A(B[9]), .B(A[9]), .Y(n56) );
  NAND2XL U206 ( .A(B[7]), .B(A[7]), .Y(n64) );
  NAND2X2 U207 ( .A(B[12]), .B(A[12]), .Y(n44) );
  NAND2BX1 U208 ( .AN(n71), .B(n72), .Y(n13) );
  INVXL U209 ( .A(n27), .Y(n25) );
  INVXL U210 ( .A(n28), .Y(n26) );
  XOR2X1 U211 ( .A(n24), .B(B[17]), .Y(SUM[17]) );
  AND2X1 U212 ( .A(n184), .B(n90), .Y(SUM[0]) );
  OAI21X1 U213 ( .A0(n36), .A1(n40), .B0(n37), .Y(n35) );
  INVX2 U214 ( .A(n43), .Y(n95) );
  CLKINVXL U215 ( .A(n51), .Y(n97) );
  NOR2X1 U216 ( .A(B[7]), .B(A[7]), .Y(n63) );
  NOR2X1 U217 ( .A(B[3]), .B(A[3]), .Y(n79) );
  OAI21X1 U218 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  NAND2XL U219 ( .A(B[2]), .B(A[2]), .Y(n85) );
  NOR2X1 U220 ( .A(B[5]), .B(A[5]), .Y(n71) );
  NAND2X1 U221 ( .A(B[4]), .B(A[4]), .Y(n77) );
  NOR2XL U222 ( .A(n32), .B(n29), .Y(n27) );
  XOR2X1 U223 ( .A(n15), .B(n81), .Y(SUM[3]) );
  NAND2X1 U224 ( .A(n104), .B(n80), .Y(n15) );
  CLKINVXL U225 ( .A(n79), .Y(n104) );
  OAI21XL U226 ( .A0(n29), .A1(n33), .B0(n30), .Y(n28) );
  AOI21X1 U227 ( .A0(n193), .A1(n86), .B0(n83), .Y(n81) );
  NOR2X1 U228 ( .A(B[1]), .B(A[1]), .Y(n87) );
  NAND2X2 U229 ( .A(B[16]), .B(A[16]), .Y(n30) );
  NAND2X2 U230 ( .A(B[15]), .B(A[15]), .Y(n33) );
  NAND2X1 U231 ( .A(B[1]), .B(A[1]), .Y(n88) );
  NAND2XL U232 ( .A(n28), .B(B[17]), .Y(n21) );
  NAND2XL U233 ( .A(n27), .B(B[17]), .Y(n20) );
  OAI21X1 U234 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  XOR2X1 U235 ( .A(n17), .B(n90), .Y(SUM[1]) );
  NAND2XL U236 ( .A(n106), .B(n88), .Y(n17) );
  CLKINVXL U237 ( .A(n87), .Y(n106) );
  NAND2X1 U238 ( .A(B[0]), .B(A[0]), .Y(n90) );
  NOR2X1 U239 ( .A(n36), .B(n39), .Y(n34) );
  NOR2X4 U240 ( .A(B[13]), .B(A[13]), .Y(n39) );
  XOR2X1 U241 ( .A(n9), .B(n57), .Y(SUM[9]) );
  OAI21X4 U242 ( .A0(n45), .A1(n43), .B0(n44), .Y(n42) );
  AOI21X4 U243 ( .A0(n46), .A1(n54), .B0(n47), .Y(n45) );
  AOI21X4 U244 ( .A0(n192), .A1(n62), .B0(n59), .Y(n57) );
  XOR2X1 U245 ( .A(n11), .B(n65), .Y(SUM[7]) );
  XOR2X1 U246 ( .A(n13), .B(n73), .Y(SUM[5]) );
  OAI21XL U247 ( .A0(n189), .A1(n20), .B0(n21), .Y(SUM[18]) );
  OAI21XL U248 ( .A0(n189), .A1(n25), .B0(n26), .Y(n24) );
endmodule


module SNN_DW01_add_182 ( A, B, CI, SUM, CO );
  input [18:0] A;
  input [18:0] B;
  output [18:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n19, n20,
         n21, n22, n25, n26, n27, n28, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n57, n59, n60, n61, n62, n63, n65, n67, n68, n69, n70,
         n71, n73, n75, n76, n77, n78, n79, n81, n83, n84, n85, n86, n87, n89,
         n91, n92, n94, n95, n96, n97, n98, n99, n100, n104, n106, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n190, n191, n192, n193, n194, n195, n196, n197;

  AOI21X1 U6 ( .A0(n37), .A1(n21), .B0(n22), .Y(n20) );
  XOR2X4 U46 ( .A(n51), .B(n6), .Y(SUM[11]) );
  NAND2X4 U48 ( .A(n99), .B(n50), .Y(n6) );
  NAND2X4 U51 ( .A(A[11]), .B(B[11]), .Y(n50) );
  OAI21X4 U68 ( .A0(n61), .A1(n63), .B0(n62), .Y(n60) );
  NAND2X1 U132 ( .A(n175), .B(n176), .Y(n177) );
  NAND2X1 U133 ( .A(n177), .B(n35), .Y(n33) );
  INVX1 U134 ( .A(n1), .Y(n175) );
  CLKINVX2 U135 ( .A(n34), .Y(n176) );
  NAND2X1 U136 ( .A(n178), .B(n179), .Y(n180) );
  NAND2X2 U137 ( .A(n180), .B(n86), .Y(n84) );
  INVX2 U138 ( .A(n85), .Y(n178) );
  INVX2 U139 ( .A(n87), .Y(n179) );
  NAND2X1 U140 ( .A(n1), .B(n182), .Y(n183) );
  NAND2X1 U141 ( .A(n181), .B(n4), .Y(n184) );
  NAND2X2 U142 ( .A(n183), .B(n184), .Y(SUM[13]) );
  INVX1 U143 ( .A(n1), .Y(n181) );
  INVXL U144 ( .A(n4), .Y(n182) );
  NAND2X1 U145 ( .A(n97), .B(n42), .Y(n4) );
  NAND2X2 U146 ( .A(n40), .B(n3), .Y(n187) );
  NAND2X4 U147 ( .A(n185), .B(n186), .Y(n188) );
  NAND2X4 U148 ( .A(n187), .B(n188), .Y(SUM[14]) );
  INVX3 U149 ( .A(n40), .Y(n185) );
  INVXL U150 ( .A(n3), .Y(n186) );
  NAND2X4 U151 ( .A(n96), .B(n39), .Y(n3) );
  NOR2XL U152 ( .A(n31), .B(n25), .Y(n21) );
  CLKINVX3 U153 ( .A(n31), .Y(n95) );
  NOR2X2 U154 ( .A(B[15]), .B(A[15]), .Y(n31) );
  INVX1 U155 ( .A(n46), .Y(n98) );
  NAND2X1 U156 ( .A(n100), .B(n54), .Y(n7) );
  XOR2X2 U157 ( .A(n7), .B(n55), .Y(SUM[10]) );
  CLKINVXL U158 ( .A(n53), .Y(n100) );
  OAI21X2 U159 ( .A0(n69), .A1(n71), .B0(n70), .Y(n68) );
  INVX1 U160 ( .A(n41), .Y(n97) );
  XNOR2X1 U161 ( .A(n190), .B(n68), .Y(SUM[7]) );
  XOR2X1 U162 ( .A(n9), .B(n63), .Y(SUM[8]) );
  OR2X2 U163 ( .A(B[5]), .B(A[5]), .Y(n196) );
  NAND2X1 U164 ( .A(n106), .B(n78), .Y(n13) );
  XNOR2X1 U165 ( .A(n33), .B(n2), .Y(SUM[15]) );
  NAND2X1 U166 ( .A(n95), .B(n32), .Y(n2) );
  XNOR2X1 U167 ( .A(n26), .B(n25), .Y(SUM[16]) );
  NOR2X2 U168 ( .A(B[14]), .B(A[14]), .Y(n38) );
  NAND2X1 U169 ( .A(B[14]), .B(A[14]), .Y(n39) );
  NAND2X1 U170 ( .A(B[15]), .B(A[15]), .Y(n32) );
  AND2X1 U171 ( .A(n192), .B(n94), .Y(SUM[0]) );
  OAI21X4 U172 ( .A0(n46), .A1(n50), .B0(n47), .Y(n45) );
  XNOR2X1 U173 ( .A(n8), .B(n60), .Y(SUM[9]) );
  NAND2X1 U174 ( .A(n36), .B(n95), .Y(n27) );
  NAND2XL U175 ( .A(n193), .B(n67), .Y(n190) );
  OAI21X4 U176 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  XNOR2X4 U177 ( .A(n48), .B(n5), .Y(SUM[12]) );
  INVX2 U178 ( .A(n38), .Y(n96) );
  OR2X4 U179 ( .A(B[7]), .B(A[7]), .Y(n193) );
  CLKINVX2 U180 ( .A(n77), .Y(n106) );
  NAND2X2 U181 ( .A(n98), .B(n47), .Y(n5) );
  NAND2X2 U182 ( .A(B[12]), .B(A[12]), .Y(n47) );
  INVX1 U183 ( .A(n69), .Y(n104) );
  INVX4 U184 ( .A(n52), .Y(n51) );
  OR2X4 U185 ( .A(B[3]), .B(A[3]), .Y(n195) );
  NAND2X1 U186 ( .A(B[3]), .B(A[3]), .Y(n83) );
  NAND2X1 U187 ( .A(n195), .B(n83), .Y(n14) );
  NAND2XL U188 ( .A(n194), .B(n59), .Y(n8) );
  NAND2X2 U189 ( .A(B[13]), .B(A[13]), .Y(n42) );
  NOR2X2 U190 ( .A(B[13]), .B(A[13]), .Y(n41) );
  NAND2X1 U191 ( .A(B[7]), .B(A[7]), .Y(n67) );
  OR2X4 U192 ( .A(B[9]), .B(A[9]), .Y(n194) );
  AOI21X4 U193 ( .A0(n68), .A1(n193), .B0(n65), .Y(n63) );
  AOI21X2 U194 ( .A0(n84), .A1(n195), .B0(n81), .Y(n79) );
  XOR2X1 U195 ( .A(n13), .B(n79), .Y(SUM[4]) );
  NAND2X1 U196 ( .A(B[4]), .B(A[4]), .Y(n78) );
  NAND2X1 U197 ( .A(B[8]), .B(A[8]), .Y(n62) );
  NOR2X2 U198 ( .A(n46), .B(n49), .Y(n44) );
  OAI21X2 U199 ( .A0(n38), .A1(n42), .B0(n39), .Y(n37) );
  NOR2X4 U200 ( .A(B[12]), .B(A[12]), .Y(n46) );
  NOR2X4 U201 ( .A(B[11]), .B(A[11]), .Y(n49) );
  NOR2X2 U202 ( .A(n38), .B(n41), .Y(n36) );
  CLKINVX2 U203 ( .A(n59), .Y(n57) );
  AOI21X2 U204 ( .A0(n44), .A1(n52), .B0(n45), .Y(n1) );
  NAND2BX1 U205 ( .AN(n61), .B(n62), .Y(n9) );
  NAND2X1 U206 ( .A(B[9]), .B(A[9]), .Y(n59) );
  AOI21X2 U207 ( .A0(n76), .A1(n196), .B0(n73), .Y(n71) );
  NAND2X2 U208 ( .A(B[10]), .B(A[10]), .Y(n54) );
  NOR2X2 U209 ( .A(B[8]), .B(A[8]), .Y(n61) );
  INVXL U210 ( .A(n37), .Y(n35) );
  XNOR2XL U211 ( .A(n12), .B(n76), .Y(SUM[5]) );
  NAND2BX1 U212 ( .AN(n85), .B(n86), .Y(n15) );
  INVX1 U213 ( .A(B[16]), .Y(n25) );
  NAND2XL U214 ( .A(B[5]), .B(A[5]), .Y(n75) );
  XOR2X1 U215 ( .A(n191), .B(n92), .Y(SUM[1]) );
  AND2X1 U216 ( .A(n197), .B(n91), .Y(n191) );
  NAND2XL U217 ( .A(B[2]), .B(A[2]), .Y(n86) );
  CLKINVX2 U218 ( .A(n32), .Y(n30) );
  NAND2XL U219 ( .A(B[1]), .B(A[1]), .Y(n91) );
  OR2XL U220 ( .A(B[0]), .B(A[0]), .Y(n192) );
  INVX2 U221 ( .A(n36), .Y(n34) );
  INVX2 U222 ( .A(n67), .Y(n65) );
  INVX2 U223 ( .A(n75), .Y(n73) );
  OAI21X1 U224 ( .A0(n77), .A1(n79), .B0(n78), .Y(n76) );
  INVX2 U225 ( .A(n83), .Y(n81) );
  XNOR2X1 U226 ( .A(n14), .B(n84), .Y(SUM[3]) );
  NAND2X1 U227 ( .A(n196), .B(n75), .Y(n12) );
  XOR2X1 U228 ( .A(n11), .B(n71), .Y(SUM[6]) );
  NAND2X1 U229 ( .A(n104), .B(n70), .Y(n11) );
  NOR2X1 U230 ( .A(B[4]), .B(A[4]), .Y(n77) );
  AOI21X1 U231 ( .A0(n197), .A1(n92), .B0(n89), .Y(n87) );
  INVX2 U232 ( .A(n91), .Y(n89) );
  NOR2X1 U233 ( .A(B[2]), .B(A[2]), .Y(n85) );
  NAND2X1 U234 ( .A(B[6]), .B(A[6]), .Y(n70) );
  NAND2XL U235 ( .A(n36), .B(n21), .Y(n19) );
  NOR2XL U236 ( .A(n25), .B(n32), .Y(n22) );
  OR2X1 U237 ( .A(B[1]), .B(A[1]), .Y(n197) );
  INVX2 U238 ( .A(n94), .Y(n92) );
  NAND2X1 U239 ( .A(B[0]), .B(A[0]), .Y(n94) );
  INVX4 U240 ( .A(n49), .Y(n99) );
  OAI21X1 U241 ( .A0(n1), .A1(n27), .B0(n28), .Y(n26) );
  XOR2X1 U242 ( .A(n15), .B(n87), .Y(SUM[2]) );
  NOR2X2 U243 ( .A(B[6]), .B(A[6]), .Y(n69) );
  NOR2X4 U244 ( .A(B[10]), .B(A[10]), .Y(n53) );
  AOI21XL U245 ( .A0(n37), .A1(n95), .B0(n30), .Y(n28) );
  OAI21X4 U246 ( .A0(n55), .A1(n53), .B0(n54), .Y(n52) );
  AOI21X4 U247 ( .A0(n60), .A1(n194), .B0(n57), .Y(n55) );
  OAI21XL U248 ( .A0(n1), .A1(n19), .B0(n20), .Y(SUM[17]) );
  OAI21X2 U249 ( .A0(n1), .A1(n41), .B0(n42), .Y(n40) );
endmodule


module SNN_DW01_add_183 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n16, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
         n51, n52, n53, n54, n55, n56, n58, n59, n60, n61, n62, n63, n64, n66,
         n68, n69, n70, n71, n72, n74, n76, n77, n78, n79, n80, n82, n84, n85,
         n86, n87, n89, n90, n91, n93, n96, n98, n99, n105, n174, n175, n177,
         n178, n179, n180, n181, n182, n183, n184;

  XNOR2X4 U2 ( .A(n22), .B(n21), .Y(SUM[18]) );
  XOR2X4 U7 ( .A(n184), .B(n23), .Y(SUM[17]) );
  XNOR2X4 U10 ( .A(n29), .B(n1), .Y(SUM[16]) );
  NAND2X4 U14 ( .A(n90), .B(n28), .Y(n1) );
  OAI21X4 U26 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  NOR2X2 U29 ( .A(B[14]), .B(A[14]), .Y(n34) );
  NOR2X2 U58 ( .A(B[10]), .B(A[10]), .Y(n51) );
  AOI21X1 U109 ( .A0(n85), .A1(n181), .B0(n82), .Y(n80) );
  CLKINVX2 U130 ( .A(n42), .Y(n174) );
  INVX4 U131 ( .A(n174), .Y(n175) );
  NOR2XL U132 ( .A(B[12]), .B(A[12]), .Y(n42) );
  NAND2XL U133 ( .A(n93), .B(n40), .Y(n4) );
  NOR2X1 U134 ( .A(n184), .B(n182), .Y(SUM[19]) );
  NOR2X1 U135 ( .A(B[9]), .B(A[9]), .Y(n54) );
  NAND2X1 U136 ( .A(B[9]), .B(A[9]), .Y(n55) );
  OR2X2 U137 ( .A(B[6]), .B(A[6]), .Y(n179) );
  OAI21X1 U138 ( .A0(n70), .A1(n72), .B0(n71), .Y(n69) );
  NOR2X2 U139 ( .A(B[11]), .B(A[11]), .Y(n46) );
  NAND2X1 U140 ( .A(B[11]), .B(A[11]), .Y(n47) );
  INVX2 U141 ( .A(n45), .Y(n44) );
  NAND2X1 U142 ( .A(B[12]), .B(A[12]), .Y(n43) );
  NOR2X1 U143 ( .A(B[7]), .B(A[7]), .Y(n62) );
  NOR2X1 U144 ( .A(B[8]), .B(A[8]), .Y(n59) );
  NAND2X1 U145 ( .A(B[14]), .B(A[14]), .Y(n35) );
  NOR2X2 U146 ( .A(B[16]), .B(A[16]), .Y(n27) );
  OR2X1 U147 ( .A(B[4]), .B(A[4]), .Y(n180) );
  INVX2 U148 ( .A(B[17]), .Y(n23) );
  AND2X1 U149 ( .A(n178), .B(n89), .Y(SUM[0]) );
  NAND2BX1 U150 ( .AN(n34), .B(n35), .Y(n3) );
  NOR2X4 U151 ( .A(n39), .B(n175), .Y(n37) );
  OAI21X2 U152 ( .A0(n175), .A1(n44), .B0(n43), .Y(n41) );
  CLKINVX1 U153 ( .A(n68), .Y(n66) );
  AOI21X4 U154 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  OAI21X4 U155 ( .A0(n39), .A1(n43), .B0(n40), .Y(n38) );
  NAND2X1 U156 ( .A(n96), .B(n52), .Y(n177) );
  INVX3 U157 ( .A(n51), .Y(n96) );
  XNOR2X2 U158 ( .A(n41), .B(n4), .Y(SUM[13]) );
  INVX3 U159 ( .A(n27), .Y(n90) );
  XNOR2X1 U160 ( .A(n177), .B(n53), .Y(SUM[10]) );
  NAND2XL U161 ( .A(n98), .B(n60), .Y(n9) );
  INVX2 U162 ( .A(n60), .Y(n58) );
  INVX2 U163 ( .A(n59), .Y(n98) );
  CLKINVXL U164 ( .A(n76), .Y(n74) );
  NOR2X4 U165 ( .A(B[13]), .B(A[13]), .Y(n39) );
  AOI21X2 U166 ( .A0(n98), .A1(n61), .B0(n58), .Y(n56) );
  XOR2X1 U167 ( .A(n6), .B(n48), .Y(SUM[11]) );
  INVX4 U168 ( .A(n33), .Y(n32) );
  OAI21X1 U169 ( .A0(n62), .A1(n64), .B0(n63), .Y(n61) );
  OAI21X4 U170 ( .A0(n54), .A1(n56), .B0(n55), .Y(n53) );
  XOR2X4 U171 ( .A(n32), .B(n2), .Y(SUM[15]) );
  NAND2X4 U172 ( .A(n91), .B(n31), .Y(n2) );
  AOI21X4 U173 ( .A0(n96), .A1(n53), .B0(n50), .Y(n48) );
  XOR2X2 U174 ( .A(n5), .B(n44), .Y(SUM[12]) );
  NOR2X4 U175 ( .A(B[15]), .B(A[15]), .Y(n30) );
  OAI21X4 U176 ( .A0(n32), .A1(n30), .B0(n31), .Y(n29) );
  XOR2X2 U177 ( .A(n36), .B(n3), .Y(SUM[14]) );
  INVX3 U178 ( .A(n30), .Y(n91) );
  NAND2X2 U179 ( .A(B[13]), .B(A[13]), .Y(n40) );
  NAND2XL U180 ( .A(B[5]), .B(A[5]), .Y(n71) );
  OR2XL U181 ( .A(n23), .B(n21), .Y(n182) );
  NAND2X1 U182 ( .A(B[7]), .B(A[7]), .Y(n63) );
  NAND2BX1 U183 ( .AN(n46), .B(n47), .Y(n6) );
  NAND2BXL U184 ( .AN(n175), .B(n43), .Y(n5) );
  NAND2BX1 U185 ( .AN(n54), .B(n55), .Y(n8) );
  NAND2BX1 U186 ( .AN(n70), .B(n71), .Y(n12) );
  NAND2X1 U187 ( .A(B[8]), .B(A[8]), .Y(n60) );
  NAND2XL U188 ( .A(A[6]), .B(B[6]), .Y(n68) );
  NOR2X4 U189 ( .A(n184), .B(n23), .Y(n22) );
  NAND2XL U190 ( .A(B[4]), .B(A[4]), .Y(n76) );
  NOR2X1 U191 ( .A(B[5]), .B(A[5]), .Y(n70) );
  NAND2BX1 U192 ( .AN(n78), .B(n79), .Y(n14) );
  NAND2X2 U193 ( .A(B[15]), .B(A[15]), .Y(n31) );
  CLKINVX1 U194 ( .A(n84), .Y(n82) );
  NAND2XL U195 ( .A(B[1]), .B(A[1]), .Y(n87) );
  INVX1 U196 ( .A(B[18]), .Y(n21) );
  OR2XL U197 ( .A(B[0]), .B(A[0]), .Y(n178) );
  INVX2 U198 ( .A(n52), .Y(n50) );
  CLKINVXL U199 ( .A(n39), .Y(n93) );
  NAND2X2 U200 ( .A(B[10]), .B(A[10]), .Y(n52) );
  AOI21X1 U201 ( .A0(n69), .A1(n179), .B0(n66), .Y(n64) );
  AOI21X1 U202 ( .A0(n77), .A1(n180), .B0(n74), .Y(n72) );
  XNOR2XL U203 ( .A(n9), .B(n61), .Y(SUM[8]) );
  NAND2X1 U204 ( .A(n180), .B(n76), .Y(n13) );
  XOR2XL U205 ( .A(n10), .B(n64), .Y(SUM[7]) );
  NAND2X1 U206 ( .A(n99), .B(n63), .Y(n10) );
  INVX2 U207 ( .A(n62), .Y(n99) );
  XNOR2XL U208 ( .A(n11), .B(n69), .Y(SUM[6]) );
  NAND2X1 U209 ( .A(n179), .B(n68), .Y(n11) );
  OAI21XL U210 ( .A0(n27), .A1(n31), .B0(n28), .Y(n26) );
  NOR2XL U211 ( .A(n27), .B(n30), .Y(n25) );
  NOR2X1 U212 ( .A(B[3]), .B(A[3]), .Y(n78) );
  OAI21X1 U213 ( .A0(n78), .A1(n80), .B0(n79), .Y(n77) );
  OR2X1 U214 ( .A(B[2]), .B(A[2]), .Y(n181) );
  NAND2XL U215 ( .A(B[2]), .B(A[2]), .Y(n84) );
  NAND2XL U216 ( .A(B[3]), .B(A[3]), .Y(n79) );
  NAND2X2 U217 ( .A(B[16]), .B(A[16]), .Y(n28) );
  NOR2X1 U218 ( .A(B[1]), .B(A[1]), .Y(n86) );
  XOR2X1 U219 ( .A(n183), .B(n85), .Y(SUM[2]) );
  AND2X1 U220 ( .A(n181), .B(n84), .Y(n183) );
  OAI21X1 U221 ( .A0(n86), .A1(n89), .B0(n87), .Y(n85) );
  XOR2X1 U222 ( .A(n16), .B(n89), .Y(SUM[1]) );
  NAND2X1 U223 ( .A(n105), .B(n87), .Y(n16) );
  CLKINVXL U224 ( .A(n86), .Y(n105) );
  NAND2X1 U225 ( .A(B[0]), .B(A[0]), .Y(n89) );
  BUFX4 U226 ( .A(n24), .Y(n184) );
  AOI21XL U227 ( .A0(n25), .A1(n33), .B0(n26), .Y(n24) );
  XOR2XL U228 ( .A(n12), .B(n72), .Y(SUM[5]) );
  XNOR2XL U229 ( .A(n13), .B(n77), .Y(SUM[4]) );
  XOR2XL U230 ( .A(n14), .B(n80), .Y(SUM[3]) );
  OAI21X4 U231 ( .A0(n46), .A1(n48), .B0(n47), .Y(n45) );
  XOR2XL U232 ( .A(n8), .B(n56), .Y(SUM[9]) );
endmodule


module SNN_DW_mult_uns_32 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n17, n18, n26,
         n27, n29, n31, n32, n34, n35, n36, n37, n38, n39, n40, n41, n42, n45,
         n46, n47, n48, n49, n50, n53, n54, n55, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78,
         n79, n80, n81, n83, n85, n86, n87, n88, n90, n94, n96, n97, n98, n99,
         n100, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n212, n214, n215, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n261, n262, n263,
         n264, n265, n266, n267, n268, n270, n271, n272, n274, n275, n276,
         n277, n290, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358;

  AOI21X1 U7 ( .A0(n32), .A1(n344), .B0(n343), .Y(n18) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  NOR2X2 U64 ( .A(n133), .B(n138), .Y(n58) );
  NAND2X4 U71 ( .A(n98), .B(n65), .Y(n8) );
  OAI21X4 U83 ( .A0(n71), .A1(n73), .B0(n72), .Y(n70) );
  XOR3X2 U121 ( .A(n109), .B(n166), .C(n171), .Y(n106) );
  CMPR42X2 U132 ( .A(n185), .B(n177), .C(n140), .D(n135), .ICI(n137), .S(n133), 
        .ICO(n131), .CO(n132) );
  OAI22X1 U168 ( .A0(n223), .A1(n265), .B0(n222), .B1(n270), .Y(n178) );
  OAI22X1 U187 ( .A0(n230), .A1(n266), .B0(n229), .B1(n271), .Y(n186) );
  OAI22X1 U190 ( .A0(n233), .A1(n266), .B0(n232), .B1(n271), .Y(n189) );
  OAI22X1 U227 ( .A0(n246), .A1(n268), .B0(n245), .B1(n290), .Y(n204) );
  NAND2X4 U269 ( .A(n270), .B(n261), .Y(n265) );
  NAND2X4 U272 ( .A(n271), .B(n262), .Y(n266) );
  XNOR2X4 U274 ( .A(b[3]), .B(b[4]), .Y(n271) );
  NAND2XL U283 ( .A(a[2]), .B(n356), .Y(n329) );
  NAND2X1 U284 ( .A(n327), .B(n328), .Y(n330) );
  NAND2X1 U285 ( .A(n329), .B(n330), .Y(n240) );
  CLKINVXL U286 ( .A(a[2]), .Y(n327) );
  CLKINVXL U287 ( .A(n356), .Y(n328) );
  BUFX4 U288 ( .A(b[3]), .Y(n356) );
  NAND2XL U289 ( .A(n60), .B(n97), .Y(n331) );
  INVX2 U290 ( .A(n57), .Y(n332) );
  AND2X4 U291 ( .A(n331), .B(n332), .Y(n55) );
  XOR2X4 U292 ( .A(n55), .B(n6), .Y(product[10]) );
  OR2X2 U293 ( .A(n81), .B(n79), .Y(n333) );
  NAND2X4 U294 ( .A(n333), .B(n80), .Y(n78) );
  AOI21X2 U295 ( .A0(n86), .A1(n347), .B0(n83), .Y(n81) );
  AOI21X4 U296 ( .A0(n78), .A1(n348), .B0(n75), .Y(n73) );
  ADDHX2 U297 ( .A(n162), .B(n187), .CO(n145), .S(n146) );
  OAI22X2 U298 ( .A0(n225), .A1(n270), .B0(n265), .B1(n274), .Y(n162) );
  CMPR42X2 U299 ( .A(n184), .B(n176), .C(n134), .D(n128), .ICI(n131), .S(n126), 
        .ICO(n124), .CO(n125) );
  ADDFHX2 U300 ( .A(n201), .B(n136), .CI(n193), .CO(n134), .S(n135) );
  OAI21X1 U301 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  OR2X2 U302 ( .A(n151), .B(n154), .Y(n348) );
  OAI22X1 U303 ( .A0(n252), .A1(n290), .B0(n268), .B1(n277), .Y(n165) );
  CLKINVX1 U304 ( .A(n47), .Y(n49) );
  OAI21X1 U305 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  CLKINVX2 U306 ( .A(n48), .Y(n50) );
  CMPR32X1 U307 ( .A(n197), .B(n189), .C(n153), .CO(n150), .S(n151) );
  OAI22X1 U308 ( .A0(n240), .A1(n338), .B0(n239), .B1(n272), .Y(n197) );
  ADDHX1 U309 ( .A(n163), .B(n205), .CO(n152), .S(n153) );
  AOI21X1 U310 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NAND2XL U311 ( .A(n96), .B(n54), .Y(n6) );
  NAND2X1 U312 ( .A(n272), .B(n263), .Y(n352) );
  NAND2X1 U313 ( .A(n150), .B(n149), .Y(n72) );
  NAND2BX1 U314 ( .AN(n79), .B(n80), .Y(n12) );
  NAND2X1 U315 ( .A(n209), .B(n165), .Y(n90) );
  NAND2X1 U316 ( .A(n97), .B(n59), .Y(n7) );
  NOR2X2 U317 ( .A(n126), .B(n132), .Y(n53) );
  NAND2X2 U318 ( .A(n126), .B(n132), .Y(n54) );
  NOR2X1 U319 ( .A(n58), .B(n53), .Y(n47) );
  AND2X1 U320 ( .A(n345), .B(n31), .Y(n342) );
  XOR2X1 U321 ( .A(n39), .B(n4), .Y(product[12]) );
  INVX2 U322 ( .A(n204), .Y(n334) );
  INVX2 U323 ( .A(n334), .Y(n335) );
  XNOR2X1 U324 ( .A(a[4]), .B(n355), .Y(n247) );
  OR2X1 U325 ( .A(n209), .B(n165), .Y(n336) );
  OAI21X2 U326 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  OAI22X1 U327 ( .A0(n244), .A1(n268), .B0(n277), .B1(n290), .Y(n202) );
  XNOR2X1 U328 ( .A(a[5]), .B(n355), .Y(n246) );
  XOR2X4 U329 ( .A(n275), .B(b[6]), .Y(n270) );
  BUFX12 U330 ( .A(b[5]), .Y(n357) );
  INVX8 U331 ( .A(n357), .Y(n275) );
  NAND2X4 U332 ( .A(n264), .B(n290), .Y(n268) );
  INVX2 U333 ( .A(n355), .Y(n277) );
  INVX1 U334 ( .A(n59), .Y(n57) );
  NAND2X2 U335 ( .A(n99), .B(n68), .Y(n9) );
  OAI22X1 U336 ( .A0(n231), .A1(n266), .B0(n230), .B1(n271), .Y(n187) );
  BUFX1 U337 ( .A(a[5]), .Y(n337) );
  XNOR2X1 U338 ( .A(a[3]), .B(n355), .Y(n248) );
  XNOR2X1 U339 ( .A(a[7]), .B(n355), .Y(n244) );
  NOR2BX1 U340 ( .AN(a[0]), .B(n270), .Y(n180) );
  AND2X2 U341 ( .A(n336), .B(n90), .Y(product[1]) );
  NAND2XL U342 ( .A(n272), .B(n263), .Y(n267) );
  XNOR2X4 U343 ( .A(n355), .B(b[2]), .Y(n272) );
  XOR2X2 U344 ( .A(n355), .B(b[0]), .Y(n264) );
  BUFX12 U345 ( .A(b[1]), .Y(n355) );
  OAI22X1 U346 ( .A0(n248), .A1(n268), .B0(n247), .B1(n290), .Y(n206) );
  NOR2X4 U347 ( .A(n149), .B(n150), .Y(n71) );
  XNOR2X1 U348 ( .A(n339), .B(n86), .Y(product[3]) );
  NOR2XL U349 ( .A(n243), .B(n272), .Y(n353) );
  NAND2X4 U350 ( .A(n350), .B(n351), .Y(n203) );
  OR2X2 U351 ( .A(n244), .B(n290), .Y(n351) );
  NOR2X2 U352 ( .A(n144), .B(n148), .Y(n67) );
  CMPR42X2 U353 ( .A(n180), .B(n335), .C(n196), .D(n188), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  OAI21X2 U354 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  AOI21X1 U355 ( .A0(n32), .A1(n345), .B0(n29), .Y(n27) );
  OAI2BB1X4 U356 ( .A0N(n60), .A1N(n341), .B0(n34), .Y(n32) );
  NAND2X2 U357 ( .A(n144), .B(n148), .Y(n68) );
  OR2X2 U358 ( .A(n245), .B(n268), .Y(n350) );
  XNOR2X2 U359 ( .A(n60), .B(n7), .Y(product[9]) );
  NAND2X1 U360 ( .A(n272), .B(n263), .Y(n338) );
  OR2X2 U361 ( .A(n353), .B(n354), .Y(n164) );
  ADDFHX1 U362 ( .A(n190), .B(n206), .CI(n198), .CO(n154), .S(n155) );
  XNOR2X2 U363 ( .A(a[6]), .B(n355), .Y(n245) );
  XNOR2X1 U364 ( .A(a[1]), .B(b[3]), .Y(n241) );
  XNOR2X1 U365 ( .A(a[1]), .B(n357), .Y(n232) );
  NOR2BX1 U366 ( .AN(a[1]), .B(n274), .Y(n129) );
  XOR2X2 U367 ( .A(n10), .B(n73), .Y(product[6]) );
  NOR2X2 U368 ( .A(n121), .B(n125), .Y(n42) );
  CMPR42X2 U369 ( .A(n186), .B(n178), .C(n145), .D(n142), .ICI(n141), .S(n139), 
        .ICO(n137), .CO(n138) );
  CMPR42X2 U370 ( .A(n203), .B(n179), .C(n195), .D(n146), .ICI(n147), .S(n144), 
        .ICO(n142), .CO(n143) );
  INVX1 U371 ( .A(n129), .Y(n136) );
  AOI21X1 U372 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  XNOR2X1 U373 ( .A(a[2]), .B(n357), .Y(n231) );
  ADDHX1 U374 ( .A(n164), .B(n207), .CO(n156), .S(n157) );
  NAND2X2 U375 ( .A(n139), .B(n143), .Y(n65) );
  XNOR2X1 U376 ( .A(a[7]), .B(b[3]), .Y(n235) );
  INVX1 U377 ( .A(n64), .Y(n98) );
  NOR2X2 U378 ( .A(n139), .B(n143), .Y(n64) );
  INVX3 U379 ( .A(n61), .Y(n60) );
  INVX1 U380 ( .A(b[0]), .Y(n290) );
  INVX1 U381 ( .A(n53), .Y(n96) );
  NAND2X1 U382 ( .A(n346), .B(n26), .Y(n2) );
  INVX1 U383 ( .A(n71), .Y(n100) );
  OR2X2 U384 ( .A(n157), .B(n199), .Y(n347) );
  OR2XL U385 ( .A(n107), .B(n106), .Y(n349) );
  XNOR2X1 U386 ( .A(a[4]), .B(n357), .Y(n229) );
  NAND2BX1 U387 ( .AN(n42), .B(n45), .Y(n5) );
  XOR2X1 U388 ( .A(n27), .B(n2), .Y(product[14]) );
  XOR2X1 U389 ( .A(n32), .B(n342), .Y(product[13]) );
  CLKINVXL U390 ( .A(n37), .Y(n94) );
  OAI21XL U391 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  CLKINVXL U392 ( .A(n31), .Y(n29) );
  NAND2X1 U393 ( .A(n347), .B(n85), .Y(n339) );
  INVX1 U394 ( .A(n77), .Y(n75) );
  XNOR2X2 U395 ( .A(n9), .B(n70), .Y(product[7]) );
  XNOR2X1 U396 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U397 ( .A(n133), .B(n138), .Y(n59) );
  NAND2XL U398 ( .A(n157), .B(n199), .Y(n85) );
  NAND2XL U399 ( .A(n208), .B(n200), .Y(n88) );
  XOR2X1 U400 ( .A(n18), .B(n1), .Y(product[15]) );
  NAND2X1 U401 ( .A(n349), .B(n17), .Y(n1) );
  ADDFX1 U402 ( .A(n110), .B(n172), .CI(n111), .CO(n107), .S(n108) );
  XNOR2X1 U403 ( .A(a[0]), .B(n357), .Y(n233) );
  XNOR2XL U404 ( .A(a[0]), .B(n355), .Y(n251) );
  BUFX8 U405 ( .A(b[7]), .Y(n358) );
  CMPR32X1 U406 ( .A(n129), .B(n168), .C(n191), .CO(n122), .S(n123) );
  NOR2BXL U407 ( .AN(a[4]), .B(n274), .Y(n117) );
  NOR2BXL U408 ( .AN(a[7]), .B(n274), .Y(n166) );
  AND2X1 U409 ( .A(n47), .B(n35), .Y(n341) );
  NOR2X1 U410 ( .A(n42), .B(n37), .Y(n35) );
  NAND2X1 U411 ( .A(n94), .B(n38), .Y(n4) );
  INVX2 U412 ( .A(n58), .Y(n97) );
  NOR2X1 U413 ( .A(n49), .B(n42), .Y(n40) );
  OAI2BB1X1 U414 ( .A0N(n29), .A1N(n346), .B0(n26), .Y(n343) );
  AND2X1 U415 ( .A(n345), .B(n346), .Y(n344) );
  INVX2 U416 ( .A(n85), .Y(n83) );
  OAI21X1 U417 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  INVX2 U418 ( .A(n67), .Y(n99) );
  XNOR2X1 U419 ( .A(n11), .B(n78), .Y(product[5]) );
  NAND2X1 U420 ( .A(n348), .B(n77), .Y(n11) );
  NAND2X1 U421 ( .A(n100), .B(n72), .Y(n10) );
  NOR2X1 U422 ( .A(n120), .B(n116), .Y(n37) );
  XOR2X1 U423 ( .A(n14), .B(n90), .Y(product[2]) );
  NAND2X1 U424 ( .A(n104), .B(n88), .Y(n14) );
  NAND2X1 U425 ( .A(n121), .B(n125), .Y(n45) );
  NAND2X1 U426 ( .A(n120), .B(n116), .Y(n38) );
  NAND2X1 U427 ( .A(n115), .B(n113), .Y(n31) );
  OR2X1 U428 ( .A(n115), .B(n113), .Y(n345) );
  OR2X1 U429 ( .A(n112), .B(n108), .Y(n346) );
  NAND2X1 U430 ( .A(n112), .B(n108), .Y(n26) );
  XOR2X1 U431 ( .A(a[1]), .B(n277), .Y(n250) );
  NOR2X1 U432 ( .A(n155), .B(n156), .Y(n79) );
  NOR2X1 U433 ( .A(n267), .B(n276), .Y(n354) );
  OAI22X1 U434 ( .A0(n224), .A1(n265), .B0(n223), .B1(n270), .Y(n179) );
  CMPR42X1 U435 ( .A(n183), .B(n175), .C(n123), .D(n127), .ICI(n124), .S(n121), 
        .ICO(n119), .CO(n120) );
  NOR2X1 U436 ( .A(n208), .B(n200), .Y(n87) );
  NAND2X1 U437 ( .A(n151), .B(n154), .Y(n77) );
  NAND2X1 U438 ( .A(n155), .B(n156), .Y(n80) );
  CMPR42X1 U439 ( .A(n118), .B(n182), .C(n174), .D(n122), .ICI(n119), .S(n116), 
        .ICO(n114), .CO(n115) );
  INVX2 U440 ( .A(n117), .Y(n118) );
  NAND2XL U441 ( .A(n107), .B(n106), .Y(n17) );
  INVX2 U442 ( .A(n358), .Y(n274) );
  XNOR2X1 U443 ( .A(a[6]), .B(n358), .Y(n218) );
  INVX1 U444 ( .A(n109), .Y(n110) );
  CMPR42X1 U445 ( .A(n117), .B(n167), .C(n181), .D(n173), .ICI(n114), .S(n113), 
        .ICO(n111), .CO(n112) );
  NOR2X1 U446 ( .A(n212), .B(n274), .Y(n167) );
  NOR2BXL U447 ( .AN(a[6]), .B(n274), .Y(n109) );
  NOR2BXL U448 ( .AN(a[0]), .B(n271), .Y(n190) );
  XOR2X1 U449 ( .A(n358), .B(b[6]), .Y(n261) );
  NAND2BX1 U450 ( .AN(a[0]), .B(n358), .Y(n225) );
  XNOR2X1 U451 ( .A(a[0]), .B(n356), .Y(n242) );
  XOR2X1 U452 ( .A(a[2]), .B(n277), .Y(n249) );
  NOR2BXL U453 ( .AN(a[0]), .B(n274), .Y(n170) );
  NOR2X1 U454 ( .A(n214), .B(n274), .Y(n168) );
  XOR2X1 U455 ( .A(b[3]), .B(b[2]), .Y(n263) );
  XNOR2X1 U456 ( .A(a[5]), .B(n356), .Y(n237) );
  XNOR2X1 U457 ( .A(a[4]), .B(n356), .Y(n238) );
  CMPR32X1 U458 ( .A(n169), .B(n136), .C(n192), .CO(n127), .S(n128) );
  NOR2X1 U459 ( .A(n215), .B(n274), .Y(n169) );
  XNOR2X1 U460 ( .A(a[3]), .B(n356), .Y(n239) );
  XNOR2X1 U461 ( .A(a[3]), .B(n357), .Y(n230) );
  XNOR2X1 U462 ( .A(n337), .B(n358), .Y(n219) );
  XNOR2X1 U463 ( .A(a[4]), .B(n358), .Y(n220) );
  NOR2BXL U464 ( .AN(a[0]), .B(n290), .Y(product[0]) );
  XNOR2X1 U465 ( .A(a[7]), .B(n358), .Y(n217) );
  CLKINVXL U466 ( .A(n337), .Y(n212) );
  CLKINVX2 U467 ( .A(n87), .Y(n104) );
  XNOR2X1 U468 ( .A(a[3]), .B(n358), .Y(n221) );
  XNOR2X2 U469 ( .A(n275), .B(b[4]), .Y(n262) );
  OAI22X1 U470 ( .A0(n241), .A1(n352), .B0(n240), .B1(n272), .Y(n198) );
  OAI22X1 U471 ( .A0(n229), .A1(n266), .B0(n228), .B1(n271), .Y(n185) );
  OAI22X1 U472 ( .A0(n239), .A1(n338), .B0(n238), .B1(n272), .Y(n196) );
  INVX1 U473 ( .A(a[3]), .Y(n214) );
  OAI22X1 U474 ( .A0(n249), .A1(n268), .B0(n248), .B1(n290), .Y(n207) );
  CLKINVXL U475 ( .A(a[2]), .Y(n215) );
  XNOR2X1 U476 ( .A(a[2]), .B(n358), .Y(n222) );
  AOI21X2 U477 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  OAI2BB1XL U478 ( .A0N(n271), .A1N(n266), .B0(n357), .Y(n181) );
  NAND2BXL U479 ( .AN(a[0]), .B(n357), .Y(n234) );
  XNOR2XL U480 ( .A(a[5]), .B(n357), .Y(n228) );
  XNOR2X1 U481 ( .A(a[6]), .B(n357), .Y(n227) );
  XNOR2X1 U482 ( .A(a[7]), .B(n357), .Y(n226) );
  INVX2 U483 ( .A(n70), .Y(n69) );
  ADDFHX1 U484 ( .A(n170), .B(n202), .CI(n194), .CO(n140), .S(n141) );
  OAI22XL U485 ( .A0(n247), .A1(n268), .B0(n246), .B1(n290), .Y(n205) );
  OAI22X1 U486 ( .A0(n251), .A1(n268), .B0(n250), .B1(n290), .Y(n209) );
  OAI22X1 U487 ( .A0(n234), .A1(n271), .B0(n266), .B1(n275), .Y(n163) );
  XOR2X1 U488 ( .A(n12), .B(n81), .Y(product[4]) );
  OAI2BB1XL U489 ( .A0N(n272), .A1N(n352), .B0(n356), .Y(n191) );
  OAI22XL U490 ( .A0(n232), .A1(n266), .B0(n231), .B1(n271), .Y(n188) );
  XNOR2XL U491 ( .A(a[6]), .B(b[3]), .Y(n236) );
  XNOR2XL U492 ( .A(a[0]), .B(n358), .Y(n224) );
  OAI22XL U493 ( .A0(n250), .A1(n268), .B0(n249), .B1(n290), .Y(n208) );
  XNOR2X1 U494 ( .A(a[1]), .B(n358), .Y(n223) );
  NOR2X1 U495 ( .A(n67), .B(n64), .Y(n62) );
  OAI22XL U496 ( .A0(n226), .A1(n266), .B0(n271), .B1(n275), .Y(n182) );
  OAI22XL U497 ( .A0(n228), .A1(n266), .B0(n227), .B1(n271), .Y(n184) );
  OAI22XL U498 ( .A0(n227), .A1(n266), .B0(n226), .B1(n271), .Y(n183) );
  OAI2BB1XL U499 ( .A0N(n290), .A1N(n268), .B0(n355), .Y(n201) );
  NAND2BXL U500 ( .AN(a[0]), .B(n355), .Y(n252) );
  OAI2BB1X1 U501 ( .A0N(n270), .A1N(n265), .B0(n358), .Y(n171) );
  OAI22XL U502 ( .A0(n217), .A1(n265), .B0(n270), .B1(n274), .Y(n172) );
  OAI22XL U503 ( .A0(n218), .A1(n265), .B0(n217), .B1(n270), .Y(n173) );
  OAI22XL U504 ( .A0(n219), .A1(n265), .B0(n218), .B1(n270), .Y(n174) );
  OAI22XL U505 ( .A0(n220), .A1(n265), .B0(n219), .B1(n270), .Y(n175) );
  OAI22XL U506 ( .A0(n221), .A1(n265), .B0(n220), .B1(n270), .Y(n176) );
  OAI22XL U507 ( .A0(n222), .A1(n265), .B0(n221), .B1(n270), .Y(n177) );
  NAND2BXL U508 ( .AN(a[0]), .B(n356), .Y(n243) );
  CLKINVXL U509 ( .A(n356), .Y(n276) );
  XOR2X2 U510 ( .A(n46), .B(n5), .Y(product[11]) );
  OAI22XL U511 ( .A0(n237), .A1(n338), .B0(n236), .B1(n272), .Y(n194) );
  OAI22XL U512 ( .A0(n236), .A1(n352), .B0(n235), .B1(n272), .Y(n193) );
  OAI22XL U513 ( .A0(n235), .A1(n338), .B0(n272), .B1(n276), .Y(n192) );
  OAI22XL U514 ( .A0(n238), .A1(n352), .B0(n237), .B1(n272), .Y(n195) );
  NOR2BXL U515 ( .AN(a[0]), .B(n272), .Y(n200) );
  OAI22XL U516 ( .A0(n242), .A1(n352), .B0(n241), .B1(n272), .Y(n199) );
endmodule


module SNN_DW01_add_172 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n7, n8, n9, n10, n12, n14, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n35, n36, n37, n38, n40, n43, n44, n45,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n65, n67, n68, n69, n70, n71, n73, n75, n76, n77, n78,
         n79, n81, n83, n84, n85, n86, n87, n89, n91, n92, n94, n96, n97, n98,
         n99, n100, n101, n104, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n189, n190, n191;

  AOI21X1 U13 ( .A0(n38), .A1(n25), .B0(n26), .Y(n24) );
  AOI21X1 U21 ( .A0(n30), .A1(n50), .B0(n31), .Y(n29) );
  AOI21X1 U31 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  AOI21X1 U43 ( .A0(n50), .A1(n99), .B0(n47), .Y(n45) );
  AOI21X1 U73 ( .A0(n186), .A1(n68), .B0(n65), .Y(n63) );
  AOI21X1 U87 ( .A0(n76), .A1(n187), .B0(n73), .Y(n71) );
  AOI21X1 U101 ( .A0(n84), .A1(n189), .B0(n81), .Y(n79) );
  AOI21X1 U115 ( .A0(n190), .A1(n92), .B0(n89), .Y(n87) );
  NAND2X1 U131 ( .A(B[10]), .B(A[10]), .Y(n55) );
  NAND2X1 U132 ( .A(B[12]), .B(A[12]), .Y(n44) );
  NOR2X1 U133 ( .A(B[8]), .B(A[8]), .Y(n61) );
  XOR2X1 U134 ( .A(n56), .B(n184), .Y(SUM[10]) );
  AND2X1 U135 ( .A(n100), .B(n55), .Y(n184) );
  OAI21X1 U136 ( .A0(n59), .A1(n57), .B0(n58), .Y(n56) );
  XOR2X1 U137 ( .A(n59), .B(n7), .Y(SUM[9]) );
  AND2X1 U138 ( .A(n99), .B(n49), .Y(n185) );
  XOR2X1 U139 ( .A(n36), .B(n3), .Y(SUM[13]) );
  XOR2X1 U140 ( .A(n45), .B(n4), .Y(SUM[12]) );
  NAND2X1 U141 ( .A(n98), .B(n44), .Y(n4) );
  XOR2X1 U142 ( .A(n29), .B(n2), .Y(SUM[14]) );
  AND2X1 U143 ( .A(n191), .B(n21), .Y(n181) );
  AND2X1 U144 ( .A(n183), .B(n94), .Y(SUM[0]) );
  INVX2 U145 ( .A(n51), .Y(n50) );
  XOR2X1 U146 ( .A(n50), .B(n185), .Y(SUM[11]) );
  OAI21X1 U147 ( .A0(n40), .A1(n32), .B0(n35), .Y(n31) );
  NAND2X1 U148 ( .A(B[9]), .B(A[9]), .Y(n58) );
  OAI21X2 U149 ( .A0(n43), .A1(n49), .B0(n44), .Y(n38) );
  CLKINVX1 U150 ( .A(n83), .Y(n81) );
  INVX1 U151 ( .A(n48), .Y(n99) );
  NOR2X1 U152 ( .A(n43), .B(n48), .Y(n37) );
  INVX1 U153 ( .A(n69), .Y(n104) );
  INVX2 U154 ( .A(n60), .Y(n59) );
  NAND2X1 U155 ( .A(n96), .B(n28), .Y(n2) );
  CLKINVXL U156 ( .A(n27), .Y(n96) );
  NOR2X2 U157 ( .A(B[9]), .B(A[9]), .Y(n57) );
  OR2X1 U158 ( .A(B[0]), .B(A[0]), .Y(n183) );
  INVX1 U159 ( .A(n32), .Y(n97) );
  NAND2XL U160 ( .A(n37), .B(n25), .Y(n23) );
  NOR2X1 U161 ( .A(n27), .B(n32), .Y(n25) );
  INVX1 U162 ( .A(n67), .Y(n65) );
  CLKINVXL U163 ( .A(n43), .Y(n98) );
  OAI21XL U164 ( .A0(n27), .A1(n35), .B0(n28), .Y(n26) );
  CLKINVXL U165 ( .A(n49), .Y(n47) );
  NAND2BX1 U166 ( .AN(n61), .B(n62), .Y(n8) );
  XOR2X1 U167 ( .A(n179), .B(n76), .Y(SUM[5]) );
  AND2X1 U168 ( .A(n187), .B(n75), .Y(n179) );
  NAND2BX1 U169 ( .AN(n77), .B(n78), .Y(n12) );
  XOR2X1 U170 ( .A(n180), .B(n84), .Y(SUM[3]) );
  AND2X1 U171 ( .A(n189), .B(n83), .Y(n180) );
  NAND2BX1 U172 ( .AN(n85), .B(n86), .Y(n14) );
  NOR2X2 U173 ( .A(B[13]), .B(A[13]), .Y(n32) );
  NAND2XL U174 ( .A(B[13]), .B(A[13]), .Y(n35) );
  NAND2XL U175 ( .A(B[5]), .B(A[5]), .Y(n75) );
  XOR2X1 U176 ( .A(n22), .B(n181), .Y(SUM[15]) );
  XOR2X1 U177 ( .A(n182), .B(n92), .Y(SUM[1]) );
  AND2X1 U178 ( .A(n190), .B(n91), .Y(n182) );
  NAND2XL U179 ( .A(B[1]), .B(A[1]), .Y(n91) );
  CLKINVX2 U180 ( .A(n94), .Y(n92) );
  NAND2X1 U181 ( .A(n97), .B(n35), .Y(n3) );
  NAND2X1 U182 ( .A(n101), .B(n58), .Y(n7) );
  INVX2 U183 ( .A(n57), .Y(n101) );
  CLKINVXL U184 ( .A(n38), .Y(n40) );
  NOR2BXL U185 ( .AN(n37), .B(n32), .Y(n30) );
  INVX2 U186 ( .A(n75), .Y(n73) );
  OAI21X1 U187 ( .A0(n69), .A1(n71), .B0(n70), .Y(n68) );
  OAI21X1 U188 ( .A0(n77), .A1(n79), .B0(n78), .Y(n76) );
  NOR2X1 U189 ( .A(B[14]), .B(A[14]), .Y(n27) );
  XOR2XL U190 ( .A(n10), .B(n71), .Y(SUM[6]) );
  NAND2X1 U191 ( .A(n104), .B(n70), .Y(n10) );
  NOR2X1 U192 ( .A(B[11]), .B(A[11]), .Y(n48) );
  NAND2X1 U193 ( .A(B[11]), .B(A[11]), .Y(n49) );
  OAI21X1 U194 ( .A0(n87), .A1(n85), .B0(n86), .Y(n84) );
  XNOR2XL U195 ( .A(n9), .B(n68), .Y(SUM[7]) );
  NAND2X1 U196 ( .A(n186), .B(n67), .Y(n9) );
  NAND2X1 U197 ( .A(B[14]), .B(A[14]), .Y(n28) );
  OR2X1 U198 ( .A(B[7]), .B(A[7]), .Y(n186) );
  NOR2X1 U199 ( .A(B[4]), .B(A[4]), .Y(n77) );
  NOR2X1 U200 ( .A(B[6]), .B(A[6]), .Y(n69) );
  OR2X1 U201 ( .A(B[5]), .B(A[5]), .Y(n187) );
  NAND2X1 U202 ( .A(B[7]), .B(A[7]), .Y(n67) );
  NAND2X1 U203 ( .A(B[4]), .B(A[4]), .Y(n78) );
  OAI2BB1X1 U204 ( .A0N(n22), .A1N(n191), .B0(n21), .Y(SUM[16]) );
  NAND2X1 U205 ( .A(B[6]), .B(A[6]), .Y(n70) );
  OR2X1 U206 ( .A(B[3]), .B(A[3]), .Y(n189) );
  NAND2XL U207 ( .A(B[8]), .B(A[8]), .Y(n62) );
  INVX2 U208 ( .A(n91), .Y(n89) );
  NAND2X1 U209 ( .A(B[3]), .B(A[3]), .Y(n83) );
  NOR2X1 U210 ( .A(B[2]), .B(A[2]), .Y(n85) );
  NAND2X1 U211 ( .A(B[2]), .B(A[2]), .Y(n86) );
  OR2X1 U212 ( .A(B[1]), .B(A[1]), .Y(n190) );
  OR2X1 U213 ( .A(B[15]), .B(A[15]), .Y(n191) );
  NAND2X1 U214 ( .A(B[15]), .B(A[15]), .Y(n21) );
  NAND2X1 U215 ( .A(B[0]), .B(A[0]), .Y(n94) );
  AOI21X2 U216 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  NOR2X1 U217 ( .A(n54), .B(n57), .Y(n52) );
  OAI21X1 U218 ( .A0(n54), .A1(n58), .B0(n55), .Y(n53) );
  CLKINVX2 U219 ( .A(n54), .Y(n100) );
  NOR2X4 U220 ( .A(B[12]), .B(A[12]), .Y(n43) );
  NOR2X4 U221 ( .A(B[10]), .B(A[10]), .Y(n54) );
  OAI21XL U222 ( .A0(n51), .A1(n23), .B0(n24), .Y(n22) );
  XOR2XL U223 ( .A(n8), .B(n63), .Y(SUM[8]) );
  OAI21XL U224 ( .A0(n63), .A1(n61), .B0(n62), .Y(n60) );
  XOR2XL U225 ( .A(n12), .B(n79), .Y(SUM[4]) );
  XOR2XL U226 ( .A(n14), .B(n87), .Y(SUM[2]) );
endmodule


module SNN_DW_mult_uns_36 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n5, n7, n8, n9, n10, n12, n13, n14, n17, n18, n26, n27, n29,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n45, n46,
         n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78, n79, n80, n81,
         n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98, n99, n100,
         n102, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n212, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n261, n262, n263, n264,
         n265, n266, n267, n268, n270, n271, n272, n274, n275, n276, n277,
         n290, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344;

  AOI21X1 U7 ( .A0(n32), .A1(n334), .B0(n333), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n336), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  XOR3X2 U121 ( .A(n109), .B(n167), .C(n171), .Y(n106) );
  OAI22X1 U159 ( .A0(n225), .A1(n270), .B0(n265), .B1(n274), .Y(n163) );
  OAI22X1 U162 ( .A0(n217), .A1(n265), .B0(n270), .B1(n274), .Y(n172) );
  OAI22X1 U163 ( .A0(n217), .A1(n270), .B0(n218), .B1(n265), .Y(n173) );
  OAI22X1 U164 ( .A0(n219), .A1(n265), .B0(n218), .B1(n270), .Y(n174) );
  OAI22X1 U165 ( .A0(n219), .A1(n270), .B0(n220), .B1(n265), .Y(n175) );
  OAI22X1 U166 ( .A0(n221), .A1(n265), .B0(n220), .B1(n270), .Y(n176) );
  OAI22X1 U167 ( .A0(n221), .A1(n270), .B0(n222), .B1(n265), .Y(n177) );
  OAI22X1 U168 ( .A0(n223), .A1(n265), .B0(n222), .B1(n270), .Y(n178) );
  OAI22X1 U169 ( .A0(n223), .A1(n270), .B0(n224), .B1(n265), .Y(n179) );
  OAI22X1 U180 ( .A0(n234), .A1(n271), .B0(n266), .B1(n275), .Y(n164) );
  OAI22X1 U183 ( .A0(n226), .A1(n266), .B0(n271), .B1(n275), .Y(n182) );
  OAI22X1 U184 ( .A0(n226), .A1(n271), .B0(n227), .B1(n266), .Y(n183) );
  OAI22X1 U185 ( .A0(n228), .A1(n266), .B0(n227), .B1(n271), .Y(n184) );
  OAI22X1 U186 ( .A0(n228), .A1(n271), .B0(n229), .B1(n266), .Y(n185) );
  OAI22X1 U188 ( .A0(n230), .A1(n271), .B0(n231), .B1(n266), .Y(n187) );
  OAI22X1 U189 ( .A0(n232), .A1(n266), .B0(n231), .B1(n271), .Y(n188) );
  OAI22X1 U190 ( .A0(n232), .A1(n271), .B0(n233), .B1(n266), .Y(n189) );
  OAI22X1 U201 ( .A0(n243), .A1(n272), .B0(n267), .B1(n276), .Y(n165) );
  OAI22X1 U204 ( .A0(n235), .A1(n267), .B0(n272), .B1(n276), .Y(n192) );
  OAI22X1 U205 ( .A0(n235), .A1(n272), .B0(n236), .B1(n267), .Y(n193) );
  OAI22X1 U206 ( .A0(n237), .A1(n267), .B0(n236), .B1(n272), .Y(n194) );
  OAI22X1 U207 ( .A0(n237), .A1(n272), .B0(n238), .B1(n267), .Y(n195) );
  OAI22X1 U208 ( .A0(n239), .A1(n267), .B0(n238), .B1(n272), .Y(n196) );
  OAI22X1 U209 ( .A0(n239), .A1(n272), .B0(n240), .B1(n267), .Y(n197) );
  OAI22X1 U210 ( .A0(n241), .A1(n267), .B0(n240), .B1(n272), .Y(n198) );
  OAI22X1 U211 ( .A0(n241), .A1(n272), .B0(n242), .B1(n267), .Y(n199) );
  OAI22X1 U222 ( .A0(n252), .A1(n290), .B0(n268), .B1(n277), .Y(n166) );
  OAI22X1 U225 ( .A0(n244), .A1(n268), .B0(n277), .B1(n290), .Y(n202) );
  OAI22X1 U226 ( .A0(n244), .A1(n290), .B0(n245), .B1(n268), .Y(n203) );
  OAI22X1 U228 ( .A0(n246), .A1(n290), .B0(n247), .B1(n268), .Y(n205) );
  OAI22X1 U229 ( .A0(n248), .A1(n268), .B0(n247), .B1(n290), .Y(n206) );
  OAI22X1 U230 ( .A0(n248), .A1(n290), .B0(n249), .B1(n268), .Y(n207) );
  OAI22X1 U231 ( .A0(n250), .A1(n268), .B0(n249), .B1(n290), .Y(n208) );
  OAI22X1 U232 ( .A0(n250), .A1(n290), .B0(n251), .B1(n268), .Y(n209) );
  OAI21XL U283 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  CMPR32X1 U284 ( .A(n136), .B(n130), .C(n192), .CO(n127), .S(n128) );
  CMPR42X1 U285 ( .A(n180), .B(n204), .C(n196), .D(n188), .ICI(n153), .S(n150), 
        .ICO(n148), .CO(n149) );
  BUFX4 U286 ( .A(b[3]), .Y(n342) );
  NAND2X1 U287 ( .A(n96), .B(n54), .Y(n328) );
  CLKINVXL U288 ( .A(n53), .Y(n96) );
  AND2X1 U289 ( .A(n94), .B(n38), .Y(n329) );
  NOR2X1 U290 ( .A(n150), .B(n151), .Y(n71) );
  NAND2X1 U291 ( .A(n271), .B(n262), .Y(n266) );
  XOR2X1 U292 ( .A(b[4]), .B(n343), .Y(n262) );
  BUFX2 U293 ( .A(b[5]), .Y(n343) );
  NOR2BX1 U294 ( .AN(n47), .B(n42), .Y(n40) );
  NOR2X1 U295 ( .A(n145), .B(n149), .Y(n67) );
  NAND2X1 U296 ( .A(n272), .B(n263), .Y(n267) );
  XNOR2X1 U297 ( .A(b[4]), .B(n342), .Y(n271) );
  BUFX2 U298 ( .A(b[7]), .Y(n344) );
  XNOR2X1 U299 ( .A(b[6]), .B(n343), .Y(n270) );
  NAND2X1 U300 ( .A(n270), .B(n261), .Y(n265) );
  XOR2X1 U301 ( .A(b[6]), .B(n344), .Y(n261) );
  NOR2X1 U302 ( .A(n42), .B(n37), .Y(n35) );
  XNOR2X1 U303 ( .A(b[2]), .B(n341), .Y(n272) );
  NAND2X1 U304 ( .A(n264), .B(n290), .Y(n268) );
  BUFX2 U305 ( .A(b[1]), .Y(n341) );
  XNOR2X1 U306 ( .A(n13), .B(n86), .Y(product[3]) );
  AND2X1 U307 ( .A(n331), .B(n90), .Y(product[1]) );
  XOR2X1 U308 ( .A(n10), .B(n73), .Y(product[6]) );
  CLKINVXL U309 ( .A(n344), .Y(n274) );
  OAI22X1 U310 ( .A0(n246), .A1(n268), .B0(n245), .B1(n290), .Y(n204) );
  XOR2X1 U311 ( .A(b[0]), .B(n341), .Y(n264) );
  CLKINVX2 U312 ( .A(b[0]), .Y(n290) );
  OAI21X1 U313 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  NAND2X1 U314 ( .A(n126), .B(n132), .Y(n54) );
  NAND2XL U315 ( .A(n99), .B(n68), .Y(n9) );
  CLKINVXL U316 ( .A(n67), .Y(n99) );
  INVX1 U317 ( .A(n71), .Y(n100) );
  CLKINVXL U318 ( .A(n87), .Y(n104) );
  NAND2XL U319 ( .A(n104), .B(n88), .Y(n14) );
  OR2X1 U320 ( .A(n158), .B(n199), .Y(n338) );
  XNOR2X1 U321 ( .A(n60), .B(n7), .Y(product[9]) );
  NAND2X1 U322 ( .A(n97), .B(n59), .Y(n7) );
  CLKINVXL U323 ( .A(n42), .Y(n95) );
  NAND2X1 U324 ( .A(n337), .B(n26), .Y(n2) );
  NOR2X1 U325 ( .A(n67), .B(n64), .Y(n330) );
  AOI21X2 U326 ( .A0(n330), .A1(n70), .B0(n63), .Y(n61) );
  AOI21X1 U327 ( .A0(n78), .A1(n339), .B0(n75), .Y(n73) );
  NOR2X2 U328 ( .A(n126), .B(n132), .Y(n53) );
  OAI21XL U329 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  NAND2XL U330 ( .A(n98), .B(n65), .Y(n8) );
  CLKINVXL U331 ( .A(n64), .Y(n98) );
  NAND2X1 U332 ( .A(n150), .B(n151), .Y(n72) );
  OAI2BB1XL U333 ( .A0N(n272), .A1N(n267), .B0(n342), .Y(n191) );
  XOR2X2 U334 ( .A(n55), .B(n328), .Y(product[10]) );
  XOR2X1 U335 ( .A(n46), .B(n5), .Y(product[11]) );
  XNOR2X2 U336 ( .A(n39), .B(n329), .Y(product[12]) );
  INVX1 U337 ( .A(n58), .Y(n97) );
  XOR2X1 U338 ( .A(n27), .B(n2), .Y(product[14]) );
  NAND2XL U339 ( .A(n47), .B(n35), .Y(n33) );
  CLKINVXL U340 ( .A(n59), .Y(n57) );
  OAI21XL U341 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  CLKINVXL U342 ( .A(n31), .Y(n29) );
  XNOR2X1 U343 ( .A(n66), .B(n8), .Y(product[8]) );
  CLKINVXL U344 ( .A(n77), .Y(n75) );
  OAI21X1 U345 ( .A0(n71), .A1(n73), .B0(n72), .Y(n70) );
  XOR2X1 U346 ( .A(n9), .B(n69), .Y(product[7]) );
  XOR2XL U347 ( .A(n12), .B(n81), .Y(product[4]) );
  CLKINVXL U348 ( .A(n79), .Y(n102) );
  NAND2XL U349 ( .A(n140), .B(n144), .Y(n65) );
  XOR2XL U350 ( .A(n14), .B(n90), .Y(product[2]) );
  OAI22XL U351 ( .A0(n230), .A1(n266), .B0(n229), .B1(n271), .Y(n186) );
  NAND2XL U352 ( .A(n158), .B(n199), .Y(n85) );
  NAND2X1 U353 ( .A(n145), .B(n149), .Y(n68) );
  OR2XL U354 ( .A(n209), .B(n166), .Y(n331) );
  INVX1 U355 ( .A(n129), .Y(n130) );
  CLKINVXL U356 ( .A(n343), .Y(n275) );
  CLKINVXL U357 ( .A(n341), .Y(n277) );
  XOR2X1 U358 ( .A(n18), .B(n1), .Y(product[15]) );
  INVX1 U359 ( .A(n117), .Y(n118) );
  CMPR32X1 U360 ( .A(n110), .B(n172), .C(n111), .CO(n107), .S(n108) );
  CMPR32X1 U361 ( .A(n197), .B(n189), .C(n154), .CO(n151), .S(n152) );
  ADDHXL U362 ( .A(n165), .B(n207), .CO(n157), .S(n158) );
  CMPR32X1 U363 ( .A(n190), .B(n206), .C(n198), .CO(n155), .S(n156) );
  XNOR2X1 U364 ( .A(a[2]), .B(n344), .Y(n222) );
  XNOR2X1 U365 ( .A(a[4]), .B(n344), .Y(n220) );
  NOR2BXL U366 ( .AN(a[3]), .B(n274), .Y(n169) );
  XNOR2X1 U367 ( .A(a[6]), .B(n344), .Y(n218) );
  NOR2BXL U368 ( .AN(a[7]), .B(n274), .Y(n167) );
  INVX2 U369 ( .A(n61), .Y(n60) );
  INVX2 U370 ( .A(n37), .Y(n94) );
  NAND2X1 U371 ( .A(n95), .B(n45), .Y(n5) );
  OAI21X1 U372 ( .A0(n61), .A1(n33), .B0(n34), .Y(n32) );
  INVX2 U373 ( .A(n70), .Y(n69) );
  XOR2X1 U374 ( .A(n32), .B(n332), .Y(product[13]) );
  AND2X1 U375 ( .A(n336), .B(n31), .Y(n332) );
  NOR2X1 U376 ( .A(n58), .B(n53), .Y(n47) );
  OAI21X1 U377 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  CLKINVXL U378 ( .A(n48), .Y(n50) );
  OAI2BB1X1 U379 ( .A0N(n29), .A1N(n337), .B0(n26), .Y(n333) );
  AND2X1 U380 ( .A(n336), .B(n337), .Y(n334) );
  NOR2X1 U381 ( .A(n140), .B(n144), .Y(n64) );
  NAND2X1 U382 ( .A(n338), .B(n85), .Y(n13) );
  AOI21X1 U383 ( .A0(n86), .A1(n338), .B0(n83), .Y(n81) );
  INVX2 U384 ( .A(n85), .Y(n83) );
  OAI21X1 U385 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  XOR2X1 U386 ( .A(n335), .B(n78), .Y(product[5]) );
  AND2X1 U387 ( .A(n339), .B(n77), .Y(n335) );
  NAND2X1 U388 ( .A(n102), .B(n80), .Y(n12) );
  OAI21X1 U389 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  NAND2X1 U390 ( .A(n100), .B(n72), .Y(n10) );
  NOR2X1 U391 ( .A(n121), .B(n125), .Y(n42) );
  NOR2X1 U392 ( .A(n133), .B(n139), .Y(n58) );
  NOR2X1 U393 ( .A(n120), .B(n116), .Y(n37) );
  NAND2X1 U394 ( .A(n133), .B(n139), .Y(n59) );
  NAND2X1 U395 ( .A(n121), .B(n125), .Y(n45) );
  NAND2X1 U396 ( .A(n120), .B(n116), .Y(n38) );
  OR2X1 U397 ( .A(n115), .B(n113), .Y(n336) );
  NAND2X1 U398 ( .A(n115), .B(n113), .Y(n31) );
  OR2X1 U399 ( .A(n112), .B(n108), .Y(n337) );
  NAND2X1 U400 ( .A(n112), .B(n108), .Y(n26) );
  CMPR42X1 U401 ( .A(n186), .B(n178), .C(n146), .D(n143), .ICI(n142), .S(n140), 
        .ICO(n138), .CO(n139) );
  CMPR42X1 U402 ( .A(n203), .B(n179), .C(n195), .D(n147), .ICI(n148), .S(n145), 
        .ICO(n143), .CO(n144) );
  OR2X1 U403 ( .A(n152), .B(n155), .Y(n339) );
  NAND2X1 U404 ( .A(n152), .B(n155), .Y(n77) );
  NAND2X1 U405 ( .A(n209), .B(n166), .Y(n90) );
  NOR2X1 U406 ( .A(n156), .B(n157), .Y(n79) );
  NOR2X1 U407 ( .A(n208), .B(n200), .Y(n87) );
  INVX2 U408 ( .A(n342), .Y(n276) );
  NAND2X1 U409 ( .A(n156), .B(n157), .Y(n80) );
  NAND2XL U410 ( .A(n208), .B(n200), .Y(n88) );
  CMPR42X1 U411 ( .A(n183), .B(n175), .C(n123), .D(n127), .ICI(n124), .S(n121), 
        .ICO(n119), .CO(n120) );
  CMPR42X1 U412 ( .A(n184), .B(n176), .C(n134), .D(n128), .ICI(n131), .S(n126), 
        .ICO(n124), .CO(n125) );
  CMPR42X1 U413 ( .A(n185), .B(n177), .C(n141), .D(n135), .ICI(n138), .S(n133), 
        .ICO(n131), .CO(n132) );
  ADDFX1 U414 ( .A(n201), .B(n137), .CI(n193), .CO(n134), .S(n135) );
  INVX2 U415 ( .A(n136), .Y(n137) );
  OAI2BB1X1 U416 ( .A0N(n290), .A1N(n268), .B0(n341), .Y(n201) );
  CMPR42X1 U417 ( .A(n118), .B(n182), .C(n174), .D(n122), .ICI(n119), .S(n116), 
        .ICO(n114), .CO(n115) );
  NAND2X1 U418 ( .A(n340), .B(n17), .Y(n1) );
  NAND2X1 U419 ( .A(n107), .B(n106), .Y(n17) );
  CMPR42X1 U420 ( .A(n117), .B(n168), .C(n181), .D(n173), .ICI(n114), .S(n113), 
        .ICO(n111), .CO(n112) );
  NOR2X1 U421 ( .A(n212), .B(n274), .Y(n168) );
  OAI2BB1X1 U422 ( .A0N(n271), .A1N(n266), .B0(n343), .Y(n181) );
  INVX1 U423 ( .A(n109), .Y(n110) );
  OR2X1 U424 ( .A(n107), .B(n106), .Y(n340) );
  ADDHXL U425 ( .A(n163), .B(n187), .CO(n146), .S(n147) );
  NAND2BX1 U426 ( .AN(a[0]), .B(n344), .Y(n225) );
  NAND2BX1 U427 ( .AN(a[0]), .B(n342), .Y(n243) );
  XOR2X1 U428 ( .A(b[2]), .B(n342), .Y(n263) );
  ADDHXL U429 ( .A(n164), .B(n205), .CO(n153), .S(n154) );
  NAND2BXL U430 ( .AN(a[0]), .B(n343), .Y(n234) );
  XNOR2XL U431 ( .A(a[0]), .B(n343), .Y(n233) );
  XNOR2XL U432 ( .A(a[2]), .B(n343), .Y(n231) );
  XNOR2XL U433 ( .A(a[0]), .B(n341), .Y(n251) );
  XNOR2XL U434 ( .A(a[3]), .B(n343), .Y(n230) );
  XNOR2XL U435 ( .A(a[4]), .B(n343), .Y(n229) );
  NAND2BXL U436 ( .AN(a[0]), .B(n341), .Y(n252) );
  XNOR2XL U437 ( .A(a[0]), .B(n344), .Y(n224) );
  NOR2BXL U438 ( .AN(a[0]), .B(n270), .Y(n180) );
  NOR2BXL U439 ( .AN(a[0]), .B(n271), .Y(n190) );
  XNOR2XL U440 ( .A(a[4]), .B(n341), .Y(n247) );
  XNOR2XL U441 ( .A(a[6]), .B(n341), .Y(n245) );
  XNOR2XL U442 ( .A(a[2]), .B(n341), .Y(n249) );
  XNOR2XL U443 ( .A(a[3]), .B(n341), .Y(n248) );
  XNOR2XL U444 ( .A(a[1]), .B(n341), .Y(n250) );
  XNOR2XL U445 ( .A(a[0]), .B(n342), .Y(n242) );
  XNOR2XL U446 ( .A(a[7]), .B(n341), .Y(n244) );
  ADDFHX1 U447 ( .A(n170), .B(n202), .CI(n194), .CO(n141), .S(n142) );
  NOR2BXL U448 ( .AN(a[0]), .B(n274), .Y(n170) );
  XNOR2XL U449 ( .A(a[1]), .B(n344), .Y(n223) );
  XNOR2XL U450 ( .A(a[4]), .B(n342), .Y(n238) );
  XNOR2XL U451 ( .A(a[5]), .B(n341), .Y(n246) );
  XNOR2XL U452 ( .A(a[5]), .B(n342), .Y(n237) );
  NOR2BXL U453 ( .AN(a[0]), .B(n272), .Y(n200) );
  XNOR2XL U454 ( .A(a[1]), .B(n343), .Y(n232) );
  XNOR2XL U455 ( .A(a[3]), .B(n342), .Y(n239) );
  XNOR2XL U456 ( .A(a[2]), .B(n342), .Y(n240) );
  ADDFX2 U457 ( .A(n129), .B(n169), .CI(n191), .CO(n122), .S(n123) );
  XNOR2XL U458 ( .A(a[6]), .B(n342), .Y(n236) );
  XNOR2XL U459 ( .A(a[1]), .B(n342), .Y(n241) );
  XNOR2XL U460 ( .A(a[6]), .B(n343), .Y(n227) );
  NOR2BXL U461 ( .AN(a[2]), .B(n274), .Y(n129) );
  XNOR2XL U462 ( .A(a[7]), .B(n343), .Y(n226) );
  XNOR2XL U463 ( .A(a[5]), .B(n343), .Y(n228) );
  XNOR2XL U464 ( .A(a[3]), .B(n344), .Y(n221) );
  XNOR2XL U465 ( .A(a[7]), .B(n342), .Y(n235) );
  XNOR2XL U466 ( .A(a[5]), .B(n344), .Y(n219) );
  NOR2BXL U467 ( .AN(a[1]), .B(n274), .Y(n136) );
  NOR2BXL U468 ( .AN(a[4]), .B(n274), .Y(n117) );
  NOR2BXL U469 ( .AN(a[0]), .B(n290), .Y(product[0]) );
  XNOR2XL U470 ( .A(a[7]), .B(n344), .Y(n217) );
  CLKINVXL U471 ( .A(a[5]), .Y(n212) );
  NOR2BXL U472 ( .AN(a[6]), .B(n274), .Y(n109) );
  OAI2BB1X1 U473 ( .A0N(n270), .A1N(n265), .B0(n344), .Y(n171) );
endmodule


module SNN_DW_mult_uns_37 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n17, n18, n26,
         n27, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n45, n46, n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78,
         n79, n80, n81, n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98,
         n99, n100, n102, n104, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n212, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n261, n262, n263,
         n264, n265, n266, n267, n268, n270, n271, n272, n274, n275, n276,
         n277, n290, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341;

  AOI21X1 U7 ( .A0(n32), .A1(n331), .B0(n330), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n333), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U34 ( .A(n120), .B(n116), .Y(n37) );
  NOR2X2 U44 ( .A(n121), .B(n125), .Y(n42) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  NOR2X2 U56 ( .A(n126), .B(n132), .Y(n53) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  NOR2X2 U64 ( .A(n133), .B(n139), .Y(n58) );
  AOI21X1 U89 ( .A0(n78), .A1(n336), .B0(n75), .Y(n73) );
  AOI21X1 U103 ( .A0(n86), .A1(n335), .B0(n83), .Y(n81) );
  XOR3X2 U121 ( .A(n109), .B(n167), .C(n171), .Y(n106) );
  CMPR42X2 U127 ( .A(n183), .B(n175), .C(n123), .D(n127), .ICI(n124), .S(n121), 
        .ICO(n119), .CO(n120) );
  CMPR42X2 U129 ( .A(n184), .B(n176), .C(n134), .D(n128), .ICI(n131), .S(n126), 
        .ICO(n124), .CO(n125) );
  CMPR42X2 U132 ( .A(n185), .B(n177), .C(n141), .D(n135), .ICI(n138), .S(n133), 
        .ICO(n131), .CO(n132) );
  OAI22X1 U159 ( .A0(n225), .A1(n270), .B0(n265), .B1(n274), .Y(n163) );
  OAI22X1 U162 ( .A0(n217), .A1(n265), .B0(n270), .B1(n274), .Y(n172) );
  OAI22X1 U163 ( .A0(n217), .A1(n270), .B0(n218), .B1(n265), .Y(n173) );
  OAI22X1 U164 ( .A0(n219), .A1(n265), .B0(n218), .B1(n270), .Y(n174) );
  OAI22X1 U165 ( .A0(n219), .A1(n270), .B0(n220), .B1(n265), .Y(n175) );
  OAI22X1 U166 ( .A0(n221), .A1(n265), .B0(n220), .B1(n270), .Y(n176) );
  OAI22X1 U167 ( .A0(n221), .A1(n270), .B0(n222), .B1(n265), .Y(n177) );
  OAI22X1 U168 ( .A0(n223), .A1(n265), .B0(n222), .B1(n270), .Y(n178) );
  OAI22X1 U169 ( .A0(n223), .A1(n270), .B0(n224), .B1(n265), .Y(n179) );
  OAI22X1 U180 ( .A0(n234), .A1(n271), .B0(n266), .B1(n275), .Y(n164) );
  OAI22X1 U184 ( .A0(n226), .A1(n271), .B0(n227), .B1(n266), .Y(n183) );
  OAI22X1 U185 ( .A0(n228), .A1(n266), .B0(n227), .B1(n271), .Y(n184) );
  OAI22X1 U186 ( .A0(n228), .A1(n271), .B0(n229), .B1(n266), .Y(n185) );
  OAI22X1 U187 ( .A0(n230), .A1(n266), .B0(n229), .B1(n271), .Y(n186) );
  OAI22X1 U188 ( .A0(n230), .A1(n271), .B0(n231), .B1(n266), .Y(n187) );
  OAI22X1 U189 ( .A0(n232), .A1(n266), .B0(n231), .B1(n271), .Y(n188) );
  OAI22X1 U190 ( .A0(n232), .A1(n271), .B0(n233), .B1(n266), .Y(n189) );
  OAI22X1 U201 ( .A0(n243), .A1(n272), .B0(n267), .B1(n276), .Y(n165) );
  OAI22X1 U222 ( .A0(n252), .A1(n290), .B0(n268), .B1(n277), .Y(n166) );
  OAI22X1 U225 ( .A0(n244), .A1(n268), .B0(n277), .B1(n290), .Y(n202) );
  OAI22X1 U227 ( .A0(n246), .A1(n268), .B0(n245), .B1(n290), .Y(n204) );
  OAI22X1 U228 ( .A0(n246), .A1(n290), .B0(n247), .B1(n268), .Y(n205) );
  OAI22X1 U229 ( .A0(n248), .A1(n268), .B0(n247), .B1(n290), .Y(n206) );
  OAI22X1 U230 ( .A0(n248), .A1(n290), .B0(n249), .B1(n268), .Y(n207) );
  OAI22X1 U231 ( .A0(n250), .A1(n268), .B0(n249), .B1(n290), .Y(n208) );
  OAI22X1 U232 ( .A0(n250), .A1(n290), .B0(n251), .B1(n268), .Y(n209) );
  CMPR42X1 U283 ( .A(n118), .B(n182), .C(n174), .D(n122), .ICI(n119), .S(n116), 
        .ICO(n114), .CO(n115) );
  NOR2X1 U284 ( .A(n58), .B(n53), .Y(n47) );
  BUFX4 U285 ( .A(b[5]), .Y(n340) );
  OAI21X1 U286 ( .A0(n71), .A1(n73), .B0(n72), .Y(n70) );
  BUFX2 U287 ( .A(b[3]), .Y(n339) );
  BUFX4 U288 ( .A(b[7]), .Y(n341) );
  XOR2X1 U289 ( .A(n55), .B(n6), .Y(product[10]) );
  NAND2XL U290 ( .A(n96), .B(n54), .Y(n6) );
  NAND2XL U291 ( .A(n95), .B(n45), .Y(n5) );
  XOR2X1 U292 ( .A(n39), .B(n4), .Y(product[12]) );
  NAND2X1 U293 ( .A(n94), .B(n38), .Y(n4) );
  BUFX4 U294 ( .A(b[1]), .Y(n338) );
  NAND2X1 U295 ( .A(n271), .B(n262), .Y(n266) );
  NOR2BX1 U296 ( .AN(n47), .B(n42), .Y(n40) );
  NAND2X1 U297 ( .A(n272), .B(n263), .Y(n267) );
  XNOR2X1 U298 ( .A(b[4]), .B(n339), .Y(n271) );
  NAND2X1 U299 ( .A(n270), .B(n261), .Y(n265) );
  OR2X1 U300 ( .A(n115), .B(n113), .Y(n333) );
  XNOR2X1 U301 ( .A(n66), .B(n8), .Y(product[8]) );
  OR2X1 U302 ( .A(n158), .B(n199), .Y(n335) );
  NOR2X1 U303 ( .A(n42), .B(n37), .Y(n35) );
  XNOR2X1 U304 ( .A(b[2]), .B(n338), .Y(n272) );
  NAND2X1 U305 ( .A(n264), .B(n290), .Y(n268) );
  AND2X1 U306 ( .A(n328), .B(n90), .Y(product[1]) );
  NAND2X1 U307 ( .A(n98), .B(n65), .Y(n8) );
  XOR2XL U308 ( .A(b[2]), .B(n339), .Y(n263) );
  AOI21X1 U309 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  OAI22XL U310 ( .A0(n244), .A1(n290), .B0(n245), .B1(n268), .Y(n203) );
  XNOR2X1 U311 ( .A(a[6]), .B(n341), .Y(n218) );
  XNOR2X1 U312 ( .A(n13), .B(n86), .Y(product[3]) );
  OAI21XL U313 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  NOR2XL U314 ( .A(n67), .B(n64), .Y(n62) );
  XOR2X1 U315 ( .A(n332), .B(n78), .Y(product[5]) );
  INVX1 U316 ( .A(n71), .Y(n100) );
  XOR2X1 U317 ( .A(n10), .B(n73), .Y(product[6]) );
  CLKINVXL U318 ( .A(n77), .Y(n75) );
  INVX1 U319 ( .A(b[0]), .Y(n290) );
  NAND2XL U320 ( .A(n334), .B(n26), .Y(n2) );
  CLKINVXL U321 ( .A(n42), .Y(n95) );
  OAI21XL U322 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  CLKINVXL U323 ( .A(n67), .Y(n99) );
  XOR2X1 U324 ( .A(n9), .B(n69), .Y(product[7]) );
  CLKINVXL U325 ( .A(n64), .Y(n98) );
  XNOR2XL U326 ( .A(a[0]), .B(n340), .Y(n233) );
  INVX2 U327 ( .A(n58), .Y(n97) );
  XOR2X1 U328 ( .A(n46), .B(n5), .Y(product[11]) );
  AOI21XL U329 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  NAND2XL U330 ( .A(n47), .B(n35), .Y(n33) );
  XOR2X1 U331 ( .A(n27), .B(n2), .Y(product[14]) );
  XOR2XL U332 ( .A(n12), .B(n81), .Y(product[4]) );
  CLKINVXL U333 ( .A(n79), .Y(n102) );
  OAI21XL U334 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  NAND2XL U335 ( .A(n133), .B(n139), .Y(n59) );
  XOR2XL U336 ( .A(n14), .B(n90), .Y(product[2]) );
  CLKINVXL U337 ( .A(n87), .Y(n104) );
  NAND2XL U338 ( .A(n115), .B(n113), .Y(n31) );
  NAND2XL U339 ( .A(n158), .B(n199), .Y(n85) );
  NAND2XL U340 ( .A(n156), .B(n157), .Y(n80) );
  NAND2XL U341 ( .A(n150), .B(n151), .Y(n72) );
  NAND2XL U342 ( .A(n208), .B(n200), .Y(n88) );
  INVX1 U343 ( .A(n136), .Y(n137) );
  OR2XL U344 ( .A(n209), .B(n166), .Y(n328) );
  CLKINVXL U345 ( .A(n338), .Y(n277) );
  INVX1 U346 ( .A(n129), .Y(n130) );
  XOR2X1 U347 ( .A(n18), .B(n1), .Y(product[15]) );
  OAI22XL U348 ( .A0(n226), .A1(n266), .B0(n271), .B1(n275), .Y(n182) );
  CMPR32X1 U349 ( .A(n110), .B(n172), .C(n111), .CO(n107), .S(n108) );
  OR2XL U350 ( .A(n107), .B(n106), .Y(n337) );
  CMPR32X1 U351 ( .A(n197), .B(n189), .C(n154), .CO(n151), .S(n152) );
  NAND2BXL U352 ( .AN(a[0]), .B(n339), .Y(n243) );
  XNOR2XL U353 ( .A(a[2]), .B(n340), .Y(n231) );
  XNOR2XL U354 ( .A(a[3]), .B(n340), .Y(n230) );
  NOR2BXL U355 ( .AN(a[3]), .B(n274), .Y(n169) );
  NOR2BXL U356 ( .AN(a[7]), .B(n274), .Y(n167) );
  INVX2 U357 ( .A(n70), .Y(n69) );
  CLKINVXL U358 ( .A(n53), .Y(n96) );
  INVX2 U359 ( .A(n61), .Y(n60) );
  XNOR2X1 U360 ( .A(n60), .B(n7), .Y(product[9]) );
  NAND2X1 U361 ( .A(n97), .B(n59), .Y(n7) );
  CLKINVXL U362 ( .A(n37), .Y(n94) );
  XOR2X1 U363 ( .A(n32), .B(n329), .Y(product[13]) );
  AND2X1 U364 ( .A(n333), .B(n31), .Y(n329) );
  OAI21X1 U365 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  OAI21XL U366 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  CLKINVXL U367 ( .A(n48), .Y(n50) );
  INVX2 U368 ( .A(n59), .Y(n57) );
  INVX2 U369 ( .A(n31), .Y(n29) );
  OAI2BB1X1 U370 ( .A0N(n29), .A1N(n334), .B0(n26), .Y(n330) );
  AND2X1 U371 ( .A(n333), .B(n334), .Y(n331) );
  INVX2 U372 ( .A(n85), .Y(n83) );
  OAI21X1 U373 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  NAND2X1 U374 ( .A(n99), .B(n68), .Y(n9) );
  NAND2X1 U375 ( .A(n102), .B(n80), .Y(n12) );
  NAND2X1 U376 ( .A(n100), .B(n72), .Y(n10) );
  AND2X1 U377 ( .A(n336), .B(n77), .Y(n332) );
  NAND2X1 U378 ( .A(n335), .B(n85), .Y(n13) );
  OAI21X1 U379 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  NAND2X1 U380 ( .A(n104), .B(n88), .Y(n14) );
  NOR2X1 U381 ( .A(n140), .B(n144), .Y(n64) );
  NAND2XL U382 ( .A(n126), .B(n132), .Y(n54) );
  NAND2X1 U383 ( .A(n140), .B(n144), .Y(n65) );
  NAND2X1 U384 ( .A(n121), .B(n125), .Y(n45) );
  NAND2XL U385 ( .A(n120), .B(n116), .Y(n38) );
  OR2X1 U386 ( .A(n112), .B(n108), .Y(n334) );
  NAND2X1 U387 ( .A(n112), .B(n108), .Y(n26) );
  OR2X1 U388 ( .A(n152), .B(n155), .Y(n336) );
  INVX2 U389 ( .A(n339), .Y(n276) );
  NAND2X1 U390 ( .A(n209), .B(n166), .Y(n90) );
  NOR2X1 U391 ( .A(n208), .B(n200), .Y(n87) );
  NAND2X1 U392 ( .A(n152), .B(n155), .Y(n77) );
  NOR2X1 U393 ( .A(n156), .B(n157), .Y(n79) );
  ADDFX1 U394 ( .A(n201), .B(n137), .CI(n193), .CO(n134), .S(n135) );
  CMPR42X1 U395 ( .A(n186), .B(n178), .C(n146), .D(n143), .ICI(n142), .S(n140), 
        .ICO(n138), .CO(n139) );
  NOR2X1 U396 ( .A(n145), .B(n149), .Y(n67) );
  CMPR42X1 U397 ( .A(n203), .B(n179), .C(n195), .D(n147), .ICI(n148), .S(n145), 
        .ICO(n143), .CO(n144) );
  NOR2X1 U398 ( .A(n150), .B(n151), .Y(n71) );
  NAND2X1 U399 ( .A(n337), .B(n17), .Y(n1) );
  NAND2X1 U400 ( .A(n107), .B(n106), .Y(n17) );
  NAND2X1 U401 ( .A(n145), .B(n149), .Y(n68) );
  INVX2 U402 ( .A(n340), .Y(n275) );
  INVX2 U403 ( .A(n117), .Y(n118) );
  CMPR32X1 U404 ( .A(n136), .B(n130), .C(n192), .CO(n127), .S(n128) );
  INVX2 U405 ( .A(n341), .Y(n274) );
  CMPR42X1 U406 ( .A(n117), .B(n168), .C(n181), .D(n173), .ICI(n114), .S(n113), 
        .ICO(n111), .CO(n112) );
  NOR2X1 U407 ( .A(n212), .B(n274), .Y(n168) );
  OAI2BB1X1 U408 ( .A0N(n271), .A1N(n266), .B0(n340), .Y(n181) );
  INVX1 U409 ( .A(n109), .Y(n110) );
  ADDHX1 U410 ( .A(n165), .B(n207), .CO(n157), .S(n158) );
  ADDHXL U411 ( .A(n164), .B(n205), .CO(n153), .S(n154) );
  NAND2BX1 U412 ( .AN(a[0]), .B(n340), .Y(n234) );
  XOR2X1 U413 ( .A(b[4]), .B(n340), .Y(n262) );
  ADDFHX1 U414 ( .A(n190), .B(n206), .CI(n198), .CO(n155), .S(n156) );
  NOR2BXL U415 ( .AN(a[0]), .B(n271), .Y(n190) );
  XNOR2XL U416 ( .A(a[0]), .B(n339), .Y(n242) );
  ADDHXL U417 ( .A(n163), .B(n187), .CO(n146), .S(n147) );
  NAND2BX1 U418 ( .AN(a[0]), .B(n341), .Y(n225) );
  ADDFHX1 U419 ( .A(n170), .B(n202), .CI(n194), .CO(n141), .S(n142) );
  NOR2BXL U420 ( .AN(a[0]), .B(n274), .Y(n170) );
  XNOR2X2 U421 ( .A(b[6]), .B(n340), .Y(n270) );
  XOR2X1 U422 ( .A(b[6]), .B(n341), .Y(n261) );
  XNOR2XL U423 ( .A(a[1]), .B(n339), .Y(n241) );
  CMPR42X1 U424 ( .A(n180), .B(n204), .C(n196), .D(n188), .ICI(n153), .S(n150), 
        .ICO(n148), .CO(n149) );
  NOR2BXL U425 ( .AN(a[0]), .B(n270), .Y(n180) );
  XNOR2XL U426 ( .A(a[2]), .B(n339), .Y(n240) );
  ADDFX2 U427 ( .A(n129), .B(n169), .CI(n191), .CO(n122), .S(n123) );
  XNOR2XL U428 ( .A(a[3]), .B(n339), .Y(n239) );
  XNOR2XL U429 ( .A(a[1]), .B(n340), .Y(n232) );
  XNOR2XL U430 ( .A(a[4]), .B(n339), .Y(n238) );
  XNOR2XL U431 ( .A(a[5]), .B(n339), .Y(n237) );
  XNOR2XL U432 ( .A(a[4]), .B(n340), .Y(n229) );
  XNOR2XL U433 ( .A(a[6]), .B(n339), .Y(n236) );
  XNOR2XL U434 ( .A(a[7]), .B(n339), .Y(n235) );
  XNOR2X1 U435 ( .A(a[0]), .B(n341), .Y(n224) );
  XNOR2X1 U436 ( .A(a[2]), .B(n341), .Y(n222) );
  XNOR2XL U437 ( .A(a[6]), .B(n340), .Y(n227) );
  NOR2BXL U438 ( .AN(a[2]), .B(n274), .Y(n129) );
  XNOR2X1 U439 ( .A(a[1]), .B(n341), .Y(n223) );
  XNOR2XL U440 ( .A(a[7]), .B(n340), .Y(n226) );
  XNOR2X1 U441 ( .A(a[4]), .B(n341), .Y(n220) );
  XNOR2XL U442 ( .A(a[5]), .B(n340), .Y(n228) );
  NOR2BXL U443 ( .AN(a[1]), .B(n274), .Y(n136) );
  XNOR2X1 U444 ( .A(a[3]), .B(n341), .Y(n221) );
  XNOR2X1 U445 ( .A(a[5]), .B(n341), .Y(n219) );
  NOR2BXL U446 ( .AN(a[4]), .B(n274), .Y(n117) );
  NOR2BXL U447 ( .AN(a[0]), .B(n290), .Y(product[0]) );
  XNOR2XL U448 ( .A(a[7]), .B(n341), .Y(n217) );
  CLKINVXL U449 ( .A(a[5]), .Y(n212) );
  NOR2BXL U450 ( .AN(a[6]), .B(n274), .Y(n109) );
  OAI2BB1X1 U451 ( .A0N(n270), .A1N(n265), .B0(n341), .Y(n171) );
  OAI21XL U452 ( .A0(n61), .A1(n33), .B0(n34), .Y(n32) );
  OAI2BB1XL U453 ( .A0N(n290), .A1N(n268), .B0(n338), .Y(n201) );
  XNOR2XL U454 ( .A(a[7]), .B(n338), .Y(n244) );
  XNOR2XL U455 ( .A(a[6]), .B(n338), .Y(n245) );
  XNOR2XL U456 ( .A(a[5]), .B(n338), .Y(n246) );
  XNOR2XL U457 ( .A(a[4]), .B(n338), .Y(n247) );
  NAND2BXL U458 ( .AN(a[0]), .B(n338), .Y(n252) );
  XNOR2XL U459 ( .A(a[3]), .B(n338), .Y(n248) );
  XNOR2XL U460 ( .A(a[1]), .B(n338), .Y(n250) );
  XNOR2XL U461 ( .A(a[0]), .B(n338), .Y(n251) );
  XNOR2XL U462 ( .A(a[2]), .B(n338), .Y(n249) );
  XOR2XL U463 ( .A(b[0]), .B(n338), .Y(n264) );
  OAI2BB1X1 U464 ( .A0N(n272), .A1N(n267), .B0(n339), .Y(n191) );
  OAI22XL U465 ( .A0(n235), .A1(n267), .B0(n272), .B1(n276), .Y(n192) );
  OAI22XL U466 ( .A0(n235), .A1(n272), .B0(n236), .B1(n267), .Y(n193) );
  OAI22XL U467 ( .A0(n237), .A1(n267), .B0(n236), .B1(n272), .Y(n194) );
  OAI22XL U468 ( .A0(n239), .A1(n267), .B0(n238), .B1(n272), .Y(n196) );
  OAI22XL U469 ( .A0(n237), .A1(n272), .B0(n238), .B1(n267), .Y(n195) );
  OAI22XL U470 ( .A0(n239), .A1(n272), .B0(n240), .B1(n267), .Y(n197) );
  OAI22XL U471 ( .A0(n241), .A1(n267), .B0(n240), .B1(n272), .Y(n198) );
  NOR2BXL U472 ( .AN(a[0]), .B(n272), .Y(n200) );
  OAI22XL U473 ( .A0(n241), .A1(n272), .B0(n242), .B1(n267), .Y(n199) );
endmodule


module SNN_DW01_add_130 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n7, n10, n13, n21, n24, n25, n26, n27, n28, n33, n37, n38, n39, n41,
         n42, n43, n44, n45, n47, n48, n50, n53, n54, n55, n56, n57, n60, n61,
         n62, n68, n70, n73, n75, n76, n77, n78, n79, n80, n81, n82, n84, n85,
         n87, n90, n93, n95, n96, n97, n103, n113, n170, n171, n173, n174,
         n175, n176;

  AOI21X1 U60 ( .A0(n55), .A1(n75), .B0(n56), .Y(n54) );
  NOR2XL U137 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2X1 U138 ( .A(n176), .B(A[1]), .Y(n90) );
  OAI21X2 U139 ( .A0(n76), .A1(n48), .B0(n171), .Y(n47) );
  NOR2X1 U140 ( .A(A[8]), .B(B[8]), .Y(n57) );
  XOR2X1 U141 ( .A(n70), .B(n68), .Y(SUM[7]) );
  NOR2X1 U142 ( .A(n68), .B(n73), .Y(n62) );
  NAND2X1 U143 ( .A(A[8]), .B(B[8]), .Y(n60) );
  AOI21X2 U144 ( .A0(n77), .A1(n85), .B0(n78), .Y(n76) );
  NOR2X1 U145 ( .A(n82), .B(n79), .Y(n77) );
  NOR2X1 U146 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2X1 U147 ( .A(A[10]), .B(B[10]), .Y(n45) );
  INVX2 U148 ( .A(A[7]), .Y(n68) );
  AND2X1 U149 ( .A(n37), .B(n25), .Y(n170) );
  INVX2 U150 ( .A(A[6]), .Y(n73) );
  NOR2X1 U151 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NOR2X1 U152 ( .A(n44), .B(n39), .Y(n37) );
  AND2X2 U153 ( .A(n24), .B(n21), .Y(n173) );
  XNOR2XL U154 ( .A(n54), .B(n53), .Y(SUM[9]) );
  INVX1 U155 ( .A(A[9]), .Y(n53) );
  XOR2X1 U156 ( .A(n82), .B(n84), .Y(SUM[4]) );
  AND2X4 U157 ( .A(n60), .B(n53), .Y(n171) );
  NAND2X1 U158 ( .A(n175), .B(n87), .Y(n85) );
  CLKINVXL U159 ( .A(n60), .Y(n56) );
  CLKINVXL U160 ( .A(n76), .Y(n75) );
  XNOR2X1 U161 ( .A(n81), .B(n10), .Y(SUM[5]) );
  CLKINVXL U162 ( .A(n45), .Y(n43) );
  AOI21XL U163 ( .A0(n38), .A1(n25), .B0(n26), .Y(n24) );
  OAI21XL U164 ( .A0(n33), .A1(n27), .B0(n28), .Y(n26) );
  XNOR2X1 U165 ( .A(A[1]), .B(n103), .Y(SUM[1]) );
  INVX1 U166 ( .A(n27), .Y(n25) );
  CLKINVXL U167 ( .A(A[1]), .Y(n97) );
  OR2XL U168 ( .A(A[2]), .B(B[2]), .Y(n176) );
  NAND2XL U169 ( .A(A[2]), .B(B[2]), .Y(n95) );
  XOR2X1 U170 ( .A(n75), .B(A[6]), .Y(SUM[6]) );
  NAND2XL U171 ( .A(n75), .B(A[6]), .Y(n70) );
  XNOR2X1 U172 ( .A(n41), .B(A[11]), .Y(SUM[11]) );
  INVX2 U173 ( .A(A[11]), .Y(n39) );
  INVX2 U174 ( .A(n85), .Y(n84) );
  XNOR2X1 U175 ( .A(n13), .B(n96), .Y(SUM[2]) );
  INVX2 U176 ( .A(n80), .Y(n78) );
  NAND2X2 U177 ( .A(n62), .B(n50), .Y(n48) );
  OAI2BB1X4 U178 ( .A0N(n47), .A1N(n170), .B0(n173), .Y(CO) );
  INVX2 U179 ( .A(A[4]), .Y(n82) );
  XOR2X1 U180 ( .A(n47), .B(n174), .Y(SUM[10]) );
  AND2X1 U181 ( .A(n42), .B(n45), .Y(n174) );
  INVX2 U182 ( .A(n57), .Y(n50) );
  CLKINVXL U183 ( .A(A[3]), .Y(n87) );
  XOR2X1 U184 ( .A(n61), .B(n7), .Y(SUM[8]) );
  NAND2X1 U185 ( .A(n50), .B(n60), .Y(n7) );
  NAND2XL U186 ( .A(n75), .B(n62), .Y(n61) );
  NOR2BXL U187 ( .AN(n62), .B(n57), .Y(n55) );
  CLKINVXL U188 ( .A(A[14]), .Y(n21) );
  NAND2XL U189 ( .A(n113), .B(n80), .Y(n10) );
  NOR2X1 U190 ( .A(n84), .B(n82), .Y(n81) );
  CLKINVXL U191 ( .A(n79), .Y(n113) );
  CLKINVXL U192 ( .A(n44), .Y(n42) );
  XNOR2X1 U193 ( .A(n87), .B(n175), .Y(SUM[3]) );
  NOR2X1 U194 ( .A(n97), .B(n103), .Y(n96) );
  XNOR2X1 U195 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NOR2X1 U196 ( .A(n39), .B(n45), .Y(n38) );
  CLKINVXL U197 ( .A(A[12]), .Y(n33) );
  AOI2BB1X1 U198 ( .A0N(n90), .A1N(n103), .B0(n93), .Y(n175) );
  INVX2 U199 ( .A(n95), .Y(n93) );
  NOR2X1 U200 ( .A(A[0]), .B(B[0]), .Y(n103) );
  NAND2X1 U201 ( .A(n176), .B(n95), .Y(n13) );
  NAND2XL U202 ( .A(A[13]), .B(B[13]), .Y(n28) );
  NAND2X2 U203 ( .A(A[5]), .B(B[5]), .Y(n80) );
  AOI21XL U204 ( .A0(n47), .A1(n42), .B0(n43), .Y(n41) );
endmodule


module SNN_DW01_add_124 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n4, n5, n6, n10, n11, n12, n13, n16, n21, n23, n24, n25, n26, n27,
         n28, n32, n33, n37, n38, n39, n40, n41, n42, n43, n44, n45, n47, n48,
         n50, n52, n53, n54, n55, n57, n62, n68, n70, n71, n73, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n90, n91, n93, n95,
         n96, n97, n98, n99, n100, n109, n113, n115, n170, n171, n172, n173,
         n174, n176, n177;

  NOR2X2 U16 ( .A(n32), .B(n27), .Y(n25) );
  OAI21X4 U50 ( .A0(n76), .A1(n48), .B0(n53), .Y(n47) );
  NOR2X2 U92 ( .A(n82), .B(n79), .Y(n77) );
  AOI21X1 U115 ( .A0(n177), .A1(n100), .B0(n93), .Y(n91) );
  NOR2X1 U137 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NAND2X1 U138 ( .A(A[4]), .B(B[4]), .Y(n83) );
  NAND2BX1 U139 ( .AN(n82), .B(n83), .Y(n11) );
  AOI21XL U140 ( .A0(n47), .A1(n42), .B0(n43), .Y(n41) );
  CLKINVXL U141 ( .A(n76), .Y(n75) );
  NOR2X2 U142 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NOR2X1 U143 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2XL U144 ( .A(n75), .B(n71), .Y(n70) );
  NOR2X2 U145 ( .A(n73), .B(n68), .Y(n62) );
  NOR2X1 U146 ( .A(A[12]), .B(B[12]), .Y(n32) );
  AOI21X1 U147 ( .A0(n38), .A1(n25), .B0(n26), .Y(n24) );
  OAI21X1 U148 ( .A0(n33), .A1(n27), .B0(n28), .Y(n26) );
  OAI21X2 U149 ( .A0(n39), .A1(n45), .B0(n40), .Y(n38) );
  NAND2X2 U150 ( .A(n62), .B(n50), .Y(n48) );
  NOR2X1 U151 ( .A(n57), .B(n52), .Y(n50) );
  INVX2 U152 ( .A(n86), .Y(n115) );
  NAND2X2 U153 ( .A(A[10]), .B(B[10]), .Y(n45) );
  NAND2XL U154 ( .A(n75), .B(n62), .Y(n173) );
  CLKINVX2 U155 ( .A(n52), .Y(n109) );
  NOR2X2 U156 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NOR2XL U157 ( .A(A[11]), .B(B[11]), .Y(n170) );
  NOR2X2 U158 ( .A(A[11]), .B(B[11]), .Y(n39) );
  INVX2 U159 ( .A(A[8]), .Y(n57) );
  NAND2X2 U160 ( .A(n115), .B(n171), .Y(n172) );
  NOR2X2 U161 ( .A(A[3]), .B(B[3]), .Y(n86) );
  INVX2 U162 ( .A(n23), .Y(n16) );
  NAND2X2 U163 ( .A(n172), .B(n87), .Y(n85) );
  INVX1 U164 ( .A(n174), .Y(n171) );
  NAND2XL U165 ( .A(A[3]), .B(B[3]), .Y(n87) );
  AND2X1 U166 ( .A(n90), .B(n91), .Y(n174) );
  CLKINVXL U167 ( .A(n85), .Y(n84) );
  AOI21X4 U168 ( .A0(n77), .A1(n85), .B0(n78), .Y(n76) );
  INVX2 U169 ( .A(A[6]), .Y(n73) );
  NAND2XL U170 ( .A(n115), .B(n87), .Y(n12) );
  NAND2XL U171 ( .A(A[5]), .B(B[5]), .Y(n80) );
  NAND2XL U172 ( .A(n177), .B(n99), .Y(n90) );
  XOR2XL U173 ( .A(n173), .B(n57), .Y(SUM[8]) );
  XOR2XL U174 ( .A(n70), .B(n68), .Y(SUM[7]) );
  CLKINVX2 U175 ( .A(n73), .Y(n71) );
  OAI21X2 U176 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  XOR2XL U177 ( .A(n11), .B(n84), .Y(SUM[4]) );
  CLKINVXL U178 ( .A(n45), .Y(n43) );
  CLKINVXL U179 ( .A(A[14]), .Y(n21) );
  XNOR2X1 U180 ( .A(n81), .B(n10), .Y(SUM[5]) );
  NAND2X1 U181 ( .A(n113), .B(n80), .Y(n10) );
  NAND2BX1 U182 ( .AN(n170), .B(n40), .Y(n4) );
  NAND2XL U183 ( .A(A[9]), .B(B[9]), .Y(n53) );
  CLKINVX1 U184 ( .A(n98), .Y(n100) );
  CLKINVX2 U185 ( .A(n97), .Y(n99) );
  NAND2XL U186 ( .A(n177), .B(n95), .Y(n13) );
  NAND2XL U187 ( .A(n97), .B(n98), .Y(n96) );
  NAND2XL U188 ( .A(n99), .B(n98), .Y(SUM[1]) );
  BUFX1 U189 ( .A(A[0]), .Y(SUM[0]) );
  NAND2XL U190 ( .A(A[2]), .B(B[2]), .Y(n95) );
  XOR2X1 U191 ( .A(n75), .B(n71), .Y(SUM[6]) );
  NOR2BXL U192 ( .AN(n62), .B(n57), .Y(n55) );
  XOR2X1 U193 ( .A(n41), .B(n4), .Y(SUM[11]) );
  XNOR2X1 U194 ( .A(n47), .B(n5), .Y(SUM[10]) );
  XOR2X1 U195 ( .A(n54), .B(n6), .Y(SUM[9]) );
  NAND2X1 U196 ( .A(n109), .B(n53), .Y(n6) );
  NAND2XL U197 ( .A(n55), .B(n75), .Y(n54) );
  INVX2 U198 ( .A(A[7]), .Y(n68) );
  OAI21XL U199 ( .A0(n84), .A1(n82), .B0(n83), .Y(n81) );
  CLKINVXL U200 ( .A(n79), .Y(n113) );
  XOR2X1 U201 ( .A(n12), .B(n174), .Y(SUM[3]) );
  OAI2BB1X4 U202 ( .A0N(n47), .A1N(n16), .B0(n176), .Y(CO) );
  AND2X4 U203 ( .A(n24), .B(n21), .Y(n176) );
  NOR2X1 U204 ( .A(n44), .B(n170), .Y(n37) );
  INVX2 U205 ( .A(n95), .Y(n93) );
  XNOR2X1 U206 ( .A(n13), .B(n96), .Y(SUM[2]) );
  NAND2XL U207 ( .A(A[12]), .B(B[12]), .Y(n33) );
  OR2X1 U208 ( .A(A[2]), .B(B[2]), .Y(n177) );
  NAND2X1 U209 ( .A(A[1]), .B(B[1]), .Y(n98) );
  NOR2X1 U210 ( .A(A[1]), .B(B[1]), .Y(n97) );
  NOR2X1 U211 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2X1 U212 ( .A(n37), .B(n25), .Y(n23) );
  INVX1 U213 ( .A(n44), .Y(n42) );
  NAND2X2 U214 ( .A(A[11]), .B(B[11]), .Y(n40) );
  NAND2XL U215 ( .A(A[13]), .B(B[13]), .Y(n28) );
  NAND2XL U216 ( .A(n42), .B(n45), .Y(n5) );
endmodule


module SNN_DW01_add_128 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n4, n6, n7, n11, n12, n13, n14, n21, n24, n26, n28, n33, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n60, n61, n62, n68, n73, n75, n76, n77, n78, n79,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n93, n95, n96,
         n97, n98, n99, n100, n103, n107, n109, n110, n113, n114, n115, n170,
         n171, n172, n174, n175, n176;

  NOR2X2 U38 ( .A(A[11]), .B(B[11]), .Y(n39) );
  AOI21X1 U60 ( .A0(n55), .A1(n75), .B0(n56), .Y(n54) );
  AOI21X1 U115 ( .A0(n175), .A1(n100), .B0(n93), .Y(n91) );
  NOR2X1 U137 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2X1 U138 ( .A(A[10]), .B(B[10]), .Y(n45) );
  AOI21X2 U139 ( .A0(n77), .A1(n85), .B0(n78), .Y(n76) );
  NOR2X2 U140 ( .A(A[9]), .B(B[9]), .Y(n52) );
  AOI21XL U141 ( .A0(n47), .A1(n42), .B0(n43), .Y(n41) );
  OAI21X2 U142 ( .A0(n76), .A1(n48), .B0(n49), .Y(n47) );
  NAND2X1 U143 ( .A(A[11]), .B(B[11]), .Y(n40) );
  AND2X2 U144 ( .A(n24), .B(n21), .Y(n174) );
  NOR2X1 U145 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NAND2X1 U146 ( .A(A[8]), .B(B[8]), .Y(n60) );
  NOR2X1 U147 ( .A(n68), .B(n73), .Y(n62) );
  NOR2X1 U148 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NAND2X1 U149 ( .A(n107), .B(n40), .Y(n4) );
  INVX2 U150 ( .A(A[6]), .Y(n73) );
  AND2X1 U151 ( .A(n37), .B(n176), .Y(n170) );
  AOI21XL U152 ( .A0(n38), .A1(n176), .B0(n26), .Y(n24) );
  OAI21X1 U153 ( .A0(n39), .A1(n45), .B0(n40), .Y(n38) );
  AND2X2 U154 ( .A(n75), .B(A[6]), .Y(n171) );
  CLKINVX2 U155 ( .A(n97), .Y(n99) );
  NAND2X1 U156 ( .A(n75), .B(n62), .Y(n61) );
  CLKINVXL U157 ( .A(A[5]), .Y(n79) );
  XOR2X1 U158 ( .A(n171), .B(A[7]), .Y(SUM[7]) );
  CLKINVXL U159 ( .A(n85), .Y(n84) );
  CLKINVX2 U160 ( .A(n51), .Y(n49) );
  NOR2X1 U161 ( .A(n82), .B(n79), .Y(n77) );
  NAND2XL U162 ( .A(n109), .B(n53), .Y(n6) );
  CLKINVXL U163 ( .A(n57), .Y(n110) );
  XOR2X1 U164 ( .A(n81), .B(n113), .Y(SUM[5]) );
  CLKINVXL U165 ( .A(n44), .Y(n42) );
  NAND2XL U166 ( .A(A[3]), .B(B[3]), .Y(n87) );
  NAND2X1 U167 ( .A(A[4]), .B(B[4]), .Y(n83) );
  XOR2X1 U168 ( .A(n41), .B(n4), .Y(SUM[11]) );
  OR2XL U169 ( .A(A[2]), .B(B[2]), .Y(n175) );
  NAND2XL U170 ( .A(A[2]), .B(B[2]), .Y(n95) );
  OAI21XL U171 ( .A0(n97), .A1(n103), .B0(n98), .Y(n96) );
  XOR2XL U172 ( .A(n14), .B(n103), .Y(SUM[1]) );
  NAND2XL U173 ( .A(n99), .B(n98), .Y(n14) );
  NAND2XL U174 ( .A(A[1]), .B(B[1]), .Y(n98) );
  XOR2X1 U175 ( .A(n75), .B(A[6]), .Y(SUM[6]) );
  CLKINVXL U176 ( .A(n76), .Y(n75) );
  CLKINVXL U177 ( .A(A[13]), .Y(n28) );
  XNOR2X1 U178 ( .A(n13), .B(n96), .Y(SUM[2]) );
  OAI21X1 U179 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  NOR2X1 U180 ( .A(n83), .B(n79), .Y(n78) );
  XOR2X1 U181 ( .A(n12), .B(n88), .Y(SUM[3]) );
  NAND2X1 U182 ( .A(n115), .B(n87), .Y(n12) );
  XOR2X1 U183 ( .A(n61), .B(n7), .Y(SUM[8]) );
  NAND2X1 U184 ( .A(n110), .B(n60), .Y(n7) );
  INVX2 U185 ( .A(A[7]), .Y(n68) );
  XOR2X1 U186 ( .A(n47), .B(n172), .Y(SUM[10]) );
  AND2X1 U187 ( .A(n42), .B(n45), .Y(n172) );
  XOR2X1 U188 ( .A(n54), .B(n6), .Y(SUM[9]) );
  INVX2 U189 ( .A(n52), .Y(n109) );
  OAI21X1 U190 ( .A0(n86), .A1(n88), .B0(n87), .Y(n85) );
  NOR2X1 U191 ( .A(n57), .B(n52), .Y(n50) );
  OAI21XL U192 ( .A0(n84), .A1(n82), .B0(n83), .Y(n81) );
  CLKINVXL U193 ( .A(n79), .Y(n113) );
  XOR2X1 U194 ( .A(n11), .B(n84), .Y(SUM[4]) );
  NAND2X1 U195 ( .A(n114), .B(n83), .Y(n11) );
  CLKINVXL U196 ( .A(n82), .Y(n114) );
  NOR2BXL U197 ( .AN(n62), .B(n57), .Y(n55) );
  CLKINVXL U198 ( .A(A[14]), .Y(n21) );
  INVX2 U199 ( .A(n60), .Y(n56) );
  INVX2 U200 ( .A(n45), .Y(n43) );
  INVX2 U201 ( .A(n89), .Y(n88) );
  OAI21X1 U202 ( .A0(n90), .A1(n103), .B0(n91), .Y(n89) );
  NAND2X1 U203 ( .A(n175), .B(n99), .Y(n90) );
  INVX2 U204 ( .A(n95), .Y(n93) );
  NAND2X1 U205 ( .A(n175), .B(n95), .Y(n13) );
  OAI2BB1X4 U206 ( .A0N(n47), .A1N(n170), .B0(n174), .Y(CO) );
  CLKINVXL U207 ( .A(n39), .Y(n107) );
  NOR2X1 U208 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NOR2X1 U209 ( .A(n44), .B(n39), .Y(n37) );
  NAND2XL U210 ( .A(A[9]), .B(B[9]), .Y(n53) );
  INVX2 U211 ( .A(n98), .Y(n100) );
  NOR2X1 U212 ( .A(A[0]), .B(B[0]), .Y(n103) );
  XNOR2X1 U213 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NAND2X1 U214 ( .A(n33), .B(n28), .Y(n26) );
  NAND2XL U215 ( .A(A[12]), .B(B[12]), .Y(n33) );
  OR2XL U216 ( .A(A[12]), .B(B[12]), .Y(n176) );
  NOR2X1 U217 ( .A(A[1]), .B(B[1]), .Y(n97) );
  INVX1 U218 ( .A(n86), .Y(n115) );
  NAND2X1 U219 ( .A(n62), .B(n50), .Y(n48) );
endmodule


module SNN_DW01_add_135 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n3, n4, n6, n7, n8, n9, n10, n11, n12, n14, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n35, n36, n37, n38, n39, n40, n43,
         n44, n45, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n67, n68, n69, n70, n71, n73, n75, n76,
         n77, n78, n79, n81, n83, n84, n85, n86, n87, n89, n91, n92, n94, n96,
         n97, n98, n99, n100, n104, n106, n108, n172, n173, n174, n175, n176,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n188, n189;

  AOI21X1 U13 ( .A0(n38), .A1(n25), .B0(n26), .Y(n24) );
  AOI21X1 U21 ( .A0(n30), .A1(n50), .B0(n31), .Y(n29) );
  AOI21X1 U31 ( .A0(n50), .A1(n37), .B0(n38), .Y(n36) );
  NAND2X1 U131 ( .A(n50), .B(n99), .Y(n172) );
  INVX2 U132 ( .A(n47), .Y(n173) );
  AND2X4 U133 ( .A(n172), .B(n173), .Y(n45) );
  XOR2X4 U134 ( .A(n45), .B(n4), .Y(SUM[12]) );
  NAND2X4 U135 ( .A(n174), .B(n175), .Y(n176) );
  NAND2X4 U136 ( .A(n176), .B(n70), .Y(n68) );
  INVX2 U137 ( .A(n69), .Y(n174) );
  INVX3 U138 ( .A(n71), .Y(n175) );
  NAND2X2 U139 ( .A(B[6]), .B(A[6]), .Y(n70) );
  AOI21X2 U140 ( .A0(n184), .A1(n68), .B0(n65), .Y(n63) );
  XNOR2XL U141 ( .A(n9), .B(n68), .Y(SUM[7]) );
  XNOR2X1 U142 ( .A(n56), .B(n6), .Y(SUM[10]) );
  NAND2XL U143 ( .A(n100), .B(n55), .Y(n6) );
  OAI21XL U144 ( .A0(n59), .A1(n57), .B0(n58), .Y(n56) );
  NAND2X1 U145 ( .A(n99), .B(n49), .Y(n178) );
  AOI21X1 U146 ( .A0(n76), .A1(n186), .B0(n73), .Y(n71) );
  NOR2X1 U147 ( .A(B[6]), .B(A[6]), .Y(n69) );
  OR2X1 U148 ( .A(B[7]), .B(A[7]), .Y(n184) );
  XOR2X1 U149 ( .A(n59), .B(n7), .Y(SUM[9]) );
  NOR2X1 U150 ( .A(B[9]), .B(A[9]), .Y(n57) );
  NAND2X1 U151 ( .A(B[10]), .B(A[10]), .Y(n55) );
  NOR2X1 U152 ( .A(B[13]), .B(A[13]), .Y(n32) );
  NOR2X1 U153 ( .A(n43), .B(n48), .Y(n37) );
  AND2X1 U154 ( .A(n189), .B(n21), .Y(n182) );
  AND2X1 U155 ( .A(n183), .B(n94), .Y(SUM[0]) );
  CLKINVXL U156 ( .A(n60), .Y(n59) );
  NOR2X1 U157 ( .A(B[10]), .B(A[10]), .Y(n54) );
  NAND2XL U158 ( .A(B[9]), .B(A[9]), .Y(n58) );
  AOI21X1 U159 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  INVX1 U160 ( .A(n38), .Y(n40) );
  NAND2BX1 U161 ( .AN(n61), .B(n62), .Y(n8) );
  OAI21XL U162 ( .A0(n54), .A1(n58), .B0(n55), .Y(n53) );
  NAND2X1 U163 ( .A(n98), .B(n44), .Y(n4) );
  CLKINVXL U164 ( .A(n43), .Y(n98) );
  CLKINVXL U165 ( .A(n37), .Y(n39) );
  NOR2X1 U166 ( .A(B[8]), .B(A[8]), .Y(n61) );
  NAND2XL U167 ( .A(n106), .B(n78), .Y(n12) );
  CLKINVXL U168 ( .A(n85), .Y(n108) );
  XNOR2X2 U169 ( .A(n50), .B(n178), .Y(SUM[11]) );
  INVX1 U170 ( .A(n48), .Y(n99) );
  CLKINVXL U171 ( .A(n49), .Y(n47) );
  NAND2BX1 U172 ( .AN(n57), .B(n58), .Y(n7) );
  XNOR2X2 U173 ( .A(n29), .B(n179), .Y(SUM[14]) );
  AND2X4 U174 ( .A(n96), .B(n28), .Y(n179) );
  OAI21XL U175 ( .A0(n43), .A1(n49), .B0(n44), .Y(n38) );
  OAI21XL U176 ( .A0(n27), .A1(n35), .B0(n28), .Y(n26) );
  OAI21XL U177 ( .A0(n77), .A1(n79), .B0(n78), .Y(n76) );
  XOR2XL U178 ( .A(n12), .B(n79), .Y(SUM[4]) );
  XOR2X1 U179 ( .A(n180), .B(n84), .Y(SUM[3]) );
  AND2X1 U180 ( .A(n185), .B(n83), .Y(n180) );
  XNOR2XL U181 ( .A(n11), .B(n76), .Y(SUM[5]) );
  NAND2XL U182 ( .A(n186), .B(n75), .Y(n11) );
  NAND2XL U183 ( .A(B[7]), .B(A[7]), .Y(n67) );
  XOR2XL U184 ( .A(n14), .B(n87), .Y(SUM[2]) );
  NAND2XL U185 ( .A(B[8]), .B(A[8]), .Y(n62) );
  NAND2XL U186 ( .A(B[13]), .B(A[13]), .Y(n35) );
  NAND2XL U187 ( .A(B[3]), .B(A[3]), .Y(n83) );
  NAND2XL U188 ( .A(B[4]), .B(A[4]), .Y(n78) );
  NAND2XL U189 ( .A(B[5]), .B(A[5]), .Y(n75) );
  XOR2X1 U190 ( .A(n181), .B(n92), .Y(SUM[1]) );
  AND2X1 U191 ( .A(n188), .B(n91), .Y(n181) );
  XOR2X1 U192 ( .A(n22), .B(n182), .Y(SUM[15]) );
  NAND2XL U193 ( .A(B[1]), .B(A[1]), .Y(n91) );
  CLKINVX2 U194 ( .A(n94), .Y(n92) );
  OR2XL U195 ( .A(B[0]), .B(A[0]), .Y(n183) );
  INVX2 U196 ( .A(n51), .Y(n50) );
  INVX2 U197 ( .A(n67), .Y(n65) );
  CLKINVXL U198 ( .A(n54), .Y(n100) );
  XOR2X2 U199 ( .A(n36), .B(n3), .Y(SUM[13]) );
  NAND2X1 U200 ( .A(n97), .B(n35), .Y(n3) );
  INVX2 U201 ( .A(n32), .Y(n97) );
  NOR2X1 U202 ( .A(n39), .B(n32), .Y(n30) );
  INVX2 U203 ( .A(n27), .Y(n96) );
  NOR2X1 U204 ( .A(B[11]), .B(A[11]), .Y(n48) );
  NOR2X1 U205 ( .A(n27), .B(n32), .Y(n25) );
  NAND2XL U206 ( .A(n37), .B(n25), .Y(n23) );
  OAI21X1 U207 ( .A0(n40), .A1(n32), .B0(n35), .Y(n31) );
  NAND2X1 U208 ( .A(n184), .B(n67), .Y(n9) );
  NAND2X1 U209 ( .A(B[11]), .B(A[11]), .Y(n49) );
  INVX2 U210 ( .A(n75), .Y(n73) );
  NOR2X1 U211 ( .A(B[12]), .B(A[12]), .Y(n43) );
  AOI21X1 U212 ( .A0(n84), .A1(n185), .B0(n81), .Y(n79) );
  INVX2 U213 ( .A(n83), .Y(n81) );
  OAI21X1 U214 ( .A0(n87), .A1(n85), .B0(n86), .Y(n84) );
  NOR2X1 U215 ( .A(B[14]), .B(A[14]), .Y(n27) );
  XOR2X1 U216 ( .A(n10), .B(n71), .Y(SUM[6]) );
  NAND2X1 U217 ( .A(n104), .B(n70), .Y(n10) );
  CLKINVXL U218 ( .A(n69), .Y(n104) );
  NAND2X1 U219 ( .A(n108), .B(n86), .Y(n14) );
  NAND2X1 U220 ( .A(B[12]), .B(A[12]), .Y(n44) );
  NAND2X1 U221 ( .A(B[14]), .B(A[14]), .Y(n28) );
  NOR2X1 U222 ( .A(B[4]), .B(A[4]), .Y(n77) );
  OR2X1 U223 ( .A(B[3]), .B(A[3]), .Y(n185) );
  AOI21X1 U224 ( .A0(n188), .A1(n92), .B0(n89), .Y(n87) );
  INVX2 U225 ( .A(n91), .Y(n89) );
  OR2X1 U226 ( .A(B[5]), .B(A[5]), .Y(n186) );
  NOR2X1 U227 ( .A(B[2]), .B(A[2]), .Y(n85) );
  OAI2BB1X1 U228 ( .A0N(n22), .A1N(n189), .B0(n21), .Y(SUM[16]) );
  NAND2X1 U229 ( .A(B[2]), .B(A[2]), .Y(n86) );
  OR2X1 U230 ( .A(B[1]), .B(A[1]), .Y(n188) );
  OR2X1 U231 ( .A(B[15]), .B(A[15]), .Y(n189) );
  NAND2X1 U232 ( .A(B[15]), .B(A[15]), .Y(n21) );
  NAND2X1 U233 ( .A(B[0]), .B(A[0]), .Y(n94) );
  INVX2 U234 ( .A(n77), .Y(n106) );
  NOR2X1 U235 ( .A(n54), .B(n57), .Y(n52) );
  XOR2X1 U236 ( .A(n8), .B(n63), .Y(SUM[8]) );
  OAI21X1 U237 ( .A0(n63), .A1(n61), .B0(n62), .Y(n60) );
  OAI21XL U238 ( .A0(n51), .A1(n23), .B0(n24), .Y(n22) );
endmodule


module SNN_DW01_add_133 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n7, n8, n12, n13, n14, n16, n17, n25, n26, n28, n29, n32, n34, n35,
         n38, n40, n42, n47, n48, n49, n50, n54, n56, n57, n58, n59, n63, n66,
         n67, n68, n69, n70, n73, n76, n79, n80, n137, n138, n139, n140, n142;

  AOI21X1 U10 ( .A0(n28), .A1(n140), .B0(n16), .Y(n14) );
  AOI21X1 U29 ( .A0(n47), .A1(n142), .B0(n28), .Y(n26) );
  AOI21X1 U37 ( .A0(n47), .A1(n142), .B0(n34), .Y(n32) );
  AOI21X1 U45 ( .A0(n47), .A1(n142), .B0(n40), .Y(n38) );
  NAND2X4 U58 ( .A(n49), .B(n68), .Y(n48) );
  NOR2X1 U104 ( .A(A[3]), .B(B[3]), .Y(n69) );
  NOR2X1 U105 ( .A(n50), .B(n58), .Y(n49) );
  OR2X2 U106 ( .A(A[8]), .B(B[8]), .Y(n142) );
  NAND2X1 U107 ( .A(A[4]), .B(A[5]), .Y(n58) );
  NOR2X1 U108 ( .A(n67), .B(n66), .Y(n63) );
  NOR2X1 U109 ( .A(A[10]), .B(A[9]), .Y(n29) );
  NAND2XL U110 ( .A(A[11]), .B(B[11]), .Y(n25) );
  OR2X1 U111 ( .A(A[11]), .B(B[11]), .Y(n140) );
  XOR2XL U112 ( .A(n137), .B(A[7]), .Y(SUM[7]) );
  NAND2X1 U113 ( .A(A[8]), .B(B[8]), .Y(n42) );
  CLKINVXL U114 ( .A(n68), .Y(n67) );
  NOR2X1 U115 ( .A(n54), .B(n67), .Y(n137) );
  XNOR2X1 U116 ( .A(n57), .B(n56), .Y(SUM[6]) );
  XOR2X1 U117 ( .A(A[2]), .B(n76), .Y(SUM[2]) );
  OR2X1 U118 ( .A(n73), .B(n80), .Y(n138) );
  CLKINVXL U119 ( .A(A[1]), .Y(n79) );
  OR2X4 U120 ( .A(n12), .B(A[14]), .Y(CO) );
  NAND2X1 U121 ( .A(n142), .B(n140), .Y(n13) );
  NAND2XL U122 ( .A(A[3]), .B(B[3]), .Y(n70) );
  XNOR2X1 U123 ( .A(n26), .B(n139), .Y(SUM[11]) );
  AND2X1 U124 ( .A(n140), .B(n25), .Y(n139) );
  INVX2 U125 ( .A(n58), .Y(n59) );
  CLKINVXL U126 ( .A(n48), .Y(n47) );
  NOR2X1 U127 ( .A(n67), .B(n58), .Y(n57) );
  CLKINVXL U128 ( .A(A[4]), .Y(n66) );
  XOR2X1 U129 ( .A(n63), .B(A[5]), .Y(SUM[5]) );
  XOR2XL U130 ( .A(n67), .B(n66), .Y(SUM[4]) );
  INVX2 U131 ( .A(A[6]), .Y(n56) );
  XOR2X1 U132 ( .A(n8), .B(n138), .Y(SUM[3]) );
  XNOR2X1 U133 ( .A(n47), .B(n7), .Y(SUM[8]) );
  XOR2X1 U134 ( .A(n79), .B(n80), .Y(SUM[1]) );
  OAI21X2 U135 ( .A0(n69), .A1(n138), .B0(n70), .Y(n68) );
  NAND2X1 U136 ( .A(n42), .B(n35), .Y(n34) );
  CLKINVXL U137 ( .A(A[9]), .Y(n35) );
  NAND2X1 U138 ( .A(n29), .B(n42), .Y(n28) );
  INVX2 U139 ( .A(n42), .Y(n40) );
  NAND2X1 U140 ( .A(n142), .B(n42), .Y(n7) );
  NAND2BX1 U141 ( .AN(n69), .B(n70), .Y(n8) );
  NAND2X1 U142 ( .A(A[2]), .B(A[1]), .Y(n73) );
  NOR2X1 U143 ( .A(n79), .B(n80), .Y(n76) );
  XNOR2X1 U144 ( .A(A[0]), .B(B[11]), .Y(SUM[0]) );
  NOR2X1 U145 ( .A(A[12]), .B(A[13]), .Y(n17) );
  NOR2X1 U146 ( .A(A[0]), .B(B[0]), .Y(n80) );
  XOR2XL U147 ( .A(n32), .B(A[10]), .Y(SUM[10]) );
  NAND2X1 U148 ( .A(A[7]), .B(A[6]), .Y(n50) );
  XOR2XL U149 ( .A(n38), .B(A[9]), .Y(SUM[9]) );
  NAND2XL U150 ( .A(n17), .B(n25), .Y(n16) );
  OAI21X1 U151 ( .A0(n48), .A1(n13), .B0(n14), .Y(n12) );
  NAND2XL U152 ( .A(n59), .B(A[6]), .Y(n54) );
endmodule


module SNN_DW_mult_uns_28 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n17, n18, n26,
         n27, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n45, n46, n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78,
         n79, n80, n81, n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98,
         n99, n100, n102, n104, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n269, n270, n271, n272, n273, n274, n275,
         n276, n278, n279, n280, n282, n283, n284, n285, n298, n335, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350;

  AOI21X1 U7 ( .A0(n32), .A1(n341), .B0(n340), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n342), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U34 ( .A(n121), .B(n116), .Y(n37) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  NOR2X2 U44 ( .A(n127), .B(n122), .Y(n42) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  NOR2X2 U52 ( .A(n58), .B(n53), .Y(n47) );
  NOR2X2 U56 ( .A(n128), .B(n135), .Y(n53) );
  NOR2X2 U64 ( .A(n136), .B(n143), .Y(n58) );
  NOR2X2 U69 ( .A(n64), .B(n67), .Y(n62) );
  XOR3X2 U121 ( .A(n109), .B(n175), .C(n179), .Y(n106) );
  ADDFHX4 U132 ( .A(n132), .B(n137), .CI(n130), .CO(n127), .S(n128) );
  ADDFHX4 U136 ( .A(n140), .B(n145), .CI(n138), .CO(n135), .S(n136) );
  ADDFHX4 U137 ( .A(n193), .B(n185), .CI(n147), .CO(n137), .S(n138) );
  OAI22X1 U170 ( .A0(n225), .A1(n273), .B0(n278), .B1(n282), .Y(n180) );
  OAI22X1 U171 ( .A0(n225), .A1(n278), .B0(n226), .B1(n273), .Y(n181) );
  OAI22X1 U172 ( .A0(n227), .A1(n273), .B0(n226), .B1(n278), .Y(n182) );
  OAI22X1 U175 ( .A0(n229), .A1(n278), .B0(n230), .B1(n273), .Y(n185) );
  OAI22X1 U177 ( .A0(n231), .A1(n278), .B0(n232), .B1(n273), .Y(n187) );
  OAI22X1 U188 ( .A0(n242), .A1(n279), .B0(n274), .B1(n283), .Y(n172) );
  OAI22X1 U191 ( .A0(n234), .A1(n274), .B0(n279), .B1(n283), .Y(n190) );
  OAI22X1 U192 ( .A0(n234), .A1(n279), .B0(n235), .B1(n274), .Y(n191) );
  OAI22X1 U193 ( .A0(n236), .A1(n274), .B0(n235), .B1(n279), .Y(n192) );
  OAI22X1 U194 ( .A0(n236), .A1(n279), .B0(n237), .B1(n274), .Y(n193) );
  OAI22X1 U195 ( .A0(n238), .A1(n274), .B0(n237), .B1(n279), .Y(n194) );
  OAI22X1 U196 ( .A0(n238), .A1(n279), .B0(n239), .B1(n274), .Y(n195) );
  OAI22X1 U197 ( .A0(n240), .A1(n274), .B0(n239), .B1(n279), .Y(n196) );
  OAI22X1 U198 ( .A0(n240), .A1(n279), .B0(n241), .B1(n274), .Y(n197) );
  OAI22X1 U209 ( .A0(n251), .A1(n280), .B0(n275), .B1(n284), .Y(n173) );
  OAI22X1 U212 ( .A0(n243), .A1(n275), .B0(n280), .B1(n284), .Y(n200) );
  OAI22X1 U213 ( .A0(n243), .A1(n280), .B0(n244), .B1(n275), .Y(n201) );
  OAI22X1 U214 ( .A0(n245), .A1(n275), .B0(n244), .B1(n280), .Y(n202) );
  OAI22X1 U215 ( .A0(n245), .A1(n280), .B0(n246), .B1(n275), .Y(n203) );
  OAI22X1 U216 ( .A0(n247), .A1(n275), .B0(n246), .B1(n280), .Y(n204) );
  OAI22X1 U217 ( .A0(n247), .A1(n280), .B0(n248), .B1(n275), .Y(n205) );
  OAI22X1 U218 ( .A0(n249), .A1(n275), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n249), .A1(n280), .B0(n250), .B1(n275), .Y(n207) );
  OAI22X1 U230 ( .A0(n260), .A1(n298), .B0(n276), .B1(n285), .Y(n174) );
  OAI22X1 U233 ( .A0(n252), .A1(n276), .B0(n285), .B1(n298), .Y(n210) );
  OAI22X1 U234 ( .A0(n252), .A1(n298), .B0(n253), .B1(n276), .Y(n211) );
  OAI22X1 U235 ( .A0(n254), .A1(n276), .B0(n253), .B1(n298), .Y(n212) );
  OAI22X1 U236 ( .A0(n254), .A1(n298), .B0(n255), .B1(n276), .Y(n213) );
  OAI22X1 U237 ( .A0(n256), .A1(n276), .B0(n255), .B1(n298), .Y(n214) );
  OAI22X1 U238 ( .A0(n256), .A1(n298), .B0(n257), .B1(n276), .Y(n215) );
  OAI22X1 U239 ( .A0(n258), .A1(n276), .B0(n257), .B1(n298), .Y(n216) );
  OAI22X1 U240 ( .A0(n258), .A1(n298), .B0(n259), .B1(n276), .Y(n217) );
  XNOR2X4 U279 ( .A(b[6]), .B(n349), .Y(n278) );
  NAND2X4 U280 ( .A(n279), .B(n270), .Y(n274) );
  XNOR2X4 U282 ( .A(b[4]), .B(n348), .Y(n279) );
  XNOR2X4 U285 ( .A(b[2]), .B(n347), .Y(n280) );
  OR2X2 U291 ( .A(n73), .B(n71), .Y(n335) );
  NAND2X2 U292 ( .A(n335), .B(n72), .Y(n70) );
  ADDHXL U293 ( .A(n171), .B(n195), .CO(n153), .S(n154) );
  BUFX4 U294 ( .A(b[5]), .Y(n349) );
  NOR2X2 U295 ( .A(n144), .B(n149), .Y(n64) );
  BUFX4 U296 ( .A(b[7]), .Y(n350) );
  NAND2X1 U297 ( .A(n346), .B(n17), .Y(n1) );
  OR2X1 U298 ( .A(n107), .B(n106), .Y(n346) );
  ADDFX2 U299 ( .A(n148), .B(n151), .CI(n146), .CO(n143), .S(n144) );
  NAND2X2 U300 ( .A(n280), .B(n271), .Y(n275) );
  XOR2X1 U301 ( .A(b[4]), .B(n349), .Y(n270) );
  ADDFX2 U302 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  XNOR2X1 U303 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U304 ( .A(n98), .B(n65), .Y(n8) );
  XOR2X1 U305 ( .A(n55), .B(n6), .Y(product[10]) );
  NAND2X1 U306 ( .A(n96), .B(n54), .Y(n6) );
  AOI21X1 U307 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  NAND2X1 U308 ( .A(n278), .B(n269), .Y(n273) );
  NAND2X1 U309 ( .A(n95), .B(n45), .Y(n5) );
  NAND2X1 U310 ( .A(n94), .B(n38), .Y(n4) );
  OR2X1 U311 ( .A(n115), .B(n112), .Y(n342) );
  XNOR2X1 U312 ( .A(n337), .B(n78), .Y(product[5]) );
  NAND2X2 U313 ( .A(n272), .B(n298), .Y(n276) );
  NOR2X1 U314 ( .A(n42), .B(n37), .Y(n35) );
  OAI21X1 U315 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  XNOR2X1 U316 ( .A(a[5]), .B(n349), .Y(n236) );
  XNOR2X1 U317 ( .A(a[5]), .B(n348), .Y(n245) );
  XNOR2X1 U318 ( .A(a[5]), .B(n347), .Y(n254) );
  AND2X1 U319 ( .A(n338), .B(n90), .Y(product[1]) );
  NAND2X1 U320 ( .A(n345), .B(n77), .Y(n337) );
  AOI21X1 U321 ( .A0(n78), .A1(n345), .B0(n75), .Y(n73) );
  CLKINVXL U322 ( .A(n77), .Y(n75) );
  NAND2XL U323 ( .A(n343), .B(n26), .Y(n2) );
  INVX2 U324 ( .A(n53), .Y(n96) );
  OAI21XL U325 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  INVXL U326 ( .A(n87), .Y(n104) );
  NAND2X1 U327 ( .A(n150), .B(n155), .Y(n68) );
  NAND2X1 U328 ( .A(n136), .B(n143), .Y(n59) );
  CMPR32X1 U329 ( .A(n194), .B(n186), .C(n153), .CO(n145), .S(n146) );
  CMPR32X1 U330 ( .A(n192), .B(n184), .C(n139), .CO(n129), .S(n130) );
  INVX1 U331 ( .A(n141), .Y(n142) );
  ADDFHX1 U332 ( .A(n198), .B(n214), .CI(n206), .CO(n163), .S(n164) );
  CLKINVX2 U333 ( .A(b[0]), .Y(n298) );
  OAI2BB1X1 U334 ( .A0N(n279), .A1N(n274), .B0(n349), .Y(n189) );
  INVX2 U335 ( .A(n42), .Y(n95) );
  XOR2X1 U336 ( .A(n46), .B(n5), .Y(product[11]) );
  CLKINVX2 U337 ( .A(n70), .Y(n69) );
  OAI21XL U338 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  INVX2 U339 ( .A(n58), .Y(n97) );
  XOR2X1 U340 ( .A(n39), .B(n4), .Y(product[12]) );
  NAND2XL U341 ( .A(n127), .B(n122), .Y(n45) );
  XOR2X1 U342 ( .A(n27), .B(n2), .Y(product[14]) );
  INVX1 U343 ( .A(n79), .Y(n102) );
  NAND2XL U344 ( .A(n344), .B(n85), .Y(n13) );
  XOR2X1 U345 ( .A(n10), .B(n73), .Y(product[6]) );
  INVX1 U346 ( .A(n71), .Y(n100) );
  NOR2X2 U347 ( .A(n150), .B(n155), .Y(n67) );
  XOR2XL U348 ( .A(n14), .B(n90), .Y(product[2]) );
  NAND2X1 U349 ( .A(n121), .B(n116), .Y(n38) );
  NAND2XL U350 ( .A(n115), .B(n112), .Y(n31) );
  ADDFX1 U351 ( .A(n196), .B(n161), .CI(n158), .CO(n155), .S(n156) );
  NAND2XL U352 ( .A(n166), .B(n207), .Y(n85) );
  OR2XL U353 ( .A(n217), .B(n174), .Y(n338) );
  OAI22XL U354 ( .A0(n231), .A1(n273), .B0(n230), .B1(n278), .Y(n186) );
  CLKINVXL U355 ( .A(n349), .Y(n283) );
  CLKINVXL U356 ( .A(n347), .Y(n285) );
  OAI2BB1XL U357 ( .A0N(n298), .A1N(n276), .B0(n347), .Y(n209) );
  OAI22XL U358 ( .A0(n229), .A1(n273), .B0(n228), .B1(n278), .Y(n184) );
  CMPR32X1 U359 ( .A(n191), .B(n183), .C(n126), .CO(n123), .S(n124) );
  OAI22XL U360 ( .A0(n227), .A1(n278), .B0(n228), .B1(n273), .Y(n183) );
  INVX1 U361 ( .A(n119), .Y(n120) );
  XOR2X1 U362 ( .A(n18), .B(n1), .Y(product[15]) );
  CMPR32X1 U363 ( .A(n110), .B(n180), .C(n113), .CO(n107), .S(n108) );
  XNOR2X1 U364 ( .A(a[0]), .B(n349), .Y(n241) );
  ADDFX1 U365 ( .A(n205), .B(n197), .CI(n162), .CO(n159), .S(n160) );
  BUFX8 U366 ( .A(b[3]), .Y(n348) );
  NAND2BXL U367 ( .AN(a[0]), .B(n348), .Y(n251) );
  XOR2X1 U368 ( .A(b[0]), .B(n347), .Y(n272) );
  XNOR2XL U369 ( .A(a[0]), .B(n348), .Y(n250) );
  XNOR2X1 U370 ( .A(a[3]), .B(n350), .Y(n229) );
  NOR2BXL U371 ( .AN(a[3]), .B(n282), .Y(n177) );
  NOR2BXL U372 ( .AN(a[1]), .B(n282), .Y(n141) );
  NOR2BXL U373 ( .AN(a[2]), .B(n282), .Y(n133) );
  XNOR2X1 U374 ( .A(a[5]), .B(n350), .Y(n227) );
  XNOR2X1 U375 ( .A(a[6]), .B(n350), .Y(n226) );
  NOR2BXL U376 ( .AN(a[5]), .B(n282), .Y(n176) );
  NOR2BXL U377 ( .AN(a[7]), .B(n282), .Y(n175) );
  NOR2BXL U378 ( .AN(n47), .B(n42), .Y(n40) );
  OAI21XL U379 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  INVX2 U380 ( .A(n48), .Y(n50) );
  XOR2X1 U381 ( .A(n69), .B(n9), .Y(product[7]) );
  NAND2X1 U382 ( .A(n99), .B(n68), .Y(n9) );
  INVX2 U383 ( .A(n67), .Y(n99) );
  CLKINVXL U384 ( .A(n37), .Y(n94) );
  OAI21X2 U385 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  XNOR2X2 U386 ( .A(n60), .B(n7), .Y(product[9]) );
  NAND2X1 U387 ( .A(n97), .B(n59), .Y(n7) );
  OAI21XL U388 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  NAND2XL U389 ( .A(n47), .B(n35), .Y(n33) );
  CLKINVXL U390 ( .A(n64), .Y(n98) );
  OAI21XL U391 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  XOR2X1 U392 ( .A(n32), .B(n339), .Y(product[13]) );
  AND2X1 U393 ( .A(n342), .B(n31), .Y(n339) );
  NAND2XL U394 ( .A(n128), .B(n135), .Y(n54) );
  INVX2 U395 ( .A(n59), .Y(n57) );
  INVX2 U396 ( .A(n31), .Y(n29) );
  OAI2BB1X1 U397 ( .A0N(n29), .A1N(n343), .B0(n26), .Y(n340) );
  AND2X1 U398 ( .A(n342), .B(n343), .Y(n341) );
  XNOR2X1 U399 ( .A(n13), .B(n86), .Y(product[3]) );
  NAND2X1 U400 ( .A(n104), .B(n88), .Y(n14) );
  AOI21X1 U401 ( .A0(n86), .A1(n344), .B0(n83), .Y(n81) );
  INVX2 U402 ( .A(n85), .Y(n83) );
  NAND2X1 U403 ( .A(n100), .B(n72), .Y(n10) );
  ADDFX2 U404 ( .A(n131), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  XOR2X1 U405 ( .A(n12), .B(n81), .Y(product[4]) );
  NAND2X1 U406 ( .A(n102), .B(n80), .Y(n12) );
  OAI21X1 U407 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  NAND2X1 U408 ( .A(n144), .B(n149), .Y(n65) );
  OR2X1 U409 ( .A(n111), .B(n108), .Y(n343) );
  NAND2X1 U410 ( .A(n111), .B(n108), .Y(n26) );
  ADDFX2 U411 ( .A(n154), .B(n157), .CI(n152), .CO(n149), .S(n150) );
  ADDFHX1 U412 ( .A(n211), .B(n187), .CI(n203), .CO(n151), .S(n152) );
  OR2X1 U413 ( .A(n166), .B(n207), .Y(n344) );
  NAND2X1 U414 ( .A(n217), .B(n174), .Y(n90) );
  OR2X1 U415 ( .A(n160), .B(n163), .Y(n345) );
  NOR2X1 U416 ( .A(n216), .B(n208), .Y(n87) );
  NOR2X1 U417 ( .A(n156), .B(n159), .Y(n71) );
  NOR2X1 U418 ( .A(n164), .B(n165), .Y(n79) );
  ADDFHX1 U419 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  ADDFHX1 U420 ( .A(n209), .B(n142), .CI(n201), .CO(n139), .S(n140) );
  NAND2X1 U421 ( .A(n160), .B(n163), .Y(n77) );
  NAND2XL U422 ( .A(n216), .B(n208), .Y(n88) );
  ADDFX2 U423 ( .A(n141), .B(n134), .CI(n200), .CO(n131), .S(n132) );
  INVX2 U424 ( .A(n133), .Y(n134) );
  NAND2XL U425 ( .A(n164), .B(n165), .Y(n80) );
  NAND2XL U426 ( .A(n156), .B(n159), .Y(n72) );
  INVX2 U427 ( .A(n350), .Y(n282) );
  INVX2 U428 ( .A(n348), .Y(n284) );
  NAND2XL U429 ( .A(n107), .B(n106), .Y(n17) );
  ADDFX2 U430 ( .A(n181), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  INVX1 U431 ( .A(n109), .Y(n110) );
  XOR2X1 U432 ( .A(b[6]), .B(n350), .Y(n269) );
  XOR2X1 U433 ( .A(b[2]), .B(n348), .Y(n271) );
  BUFX8 U434 ( .A(b[1]), .Y(n347) );
  XNOR2XL U435 ( .A(a[0]), .B(n347), .Y(n259) );
  OAI22XL U436 ( .A0(n233), .A1(n278), .B0(n273), .B1(n282), .Y(n171) );
  NAND2BX1 U437 ( .AN(a[0]), .B(n350), .Y(n233) );
  XNOR2XL U438 ( .A(a[2]), .B(n347), .Y(n257) );
  NAND2BXL U439 ( .AN(a[0]), .B(n347), .Y(n260) );
  XNOR2XL U440 ( .A(a[1]), .B(n347), .Y(n258) );
  NAND2BXL U441 ( .AN(a[0]), .B(n349), .Y(n242) );
  NOR2BXL U442 ( .AN(a[0]), .B(n279), .Y(n198) );
  XNOR2X1 U443 ( .A(a[4]), .B(n347), .Y(n255) );
  XNOR2X1 U444 ( .A(a[0]), .B(n350), .Y(n232) );
  ADDFHX1 U445 ( .A(n188), .B(n212), .CI(n204), .CO(n157), .S(n158) );
  NOR2BXL U446 ( .AN(a[0]), .B(n278), .Y(n188) );
  XNOR2XL U447 ( .A(a[6]), .B(n347), .Y(n253) );
  CMPR32X1 U448 ( .A(n133), .B(n177), .C(n199), .CO(n125), .S(n126) );
  OAI2BB1X1 U449 ( .A0N(n280), .A1N(n275), .B0(n348), .Y(n199) );
  XNOR2XL U450 ( .A(a[3]), .B(n347), .Y(n256) );
  ADDFHX1 U451 ( .A(n178), .B(n210), .CI(n202), .CO(n147), .S(n148) );
  NOR2BXL U452 ( .AN(a[0]), .B(n282), .Y(n178) );
  NOR2BXL U453 ( .AN(a[0]), .B(n280), .Y(n208) );
  XNOR2X1 U454 ( .A(a[1]), .B(n350), .Y(n231) );
  XNOR2XL U455 ( .A(a[7]), .B(n347), .Y(n252) );
  XNOR2XL U456 ( .A(a[2]), .B(n349), .Y(n239) );
  XNOR2XL U457 ( .A(a[1]), .B(n349), .Y(n240) );
  XNOR2X1 U458 ( .A(a[4]), .B(n350), .Y(n228) );
  XNOR2XL U459 ( .A(a[3]), .B(n349), .Y(n238) );
  XNOR2XL U460 ( .A(a[2]), .B(n348), .Y(n248) );
  XNOR2XL U461 ( .A(a[7]), .B(n349), .Y(n234) );
  XNOR2XL U462 ( .A(a[4]), .B(n348), .Y(n246) );
  XNOR2X1 U463 ( .A(a[2]), .B(n350), .Y(n230) );
  XNOR2XL U464 ( .A(a[6]), .B(n349), .Y(n235) );
  XNOR2XL U465 ( .A(a[3]), .B(n348), .Y(n247) );
  XNOR2XL U466 ( .A(a[1]), .B(n348), .Y(n249) );
  XNOR2XL U467 ( .A(a[4]), .B(n349), .Y(n237) );
  XNOR2XL U468 ( .A(a[6]), .B(n348), .Y(n244) );
  XNOR2XL U469 ( .A(a[7]), .B(n348), .Y(n243) );
  NOR2BXL U470 ( .AN(a[4]), .B(n282), .Y(n119) );
  NOR2BXL U471 ( .AN(a[0]), .B(n298), .Y(product[0]) );
  ADDFX2 U472 ( .A(n119), .B(n176), .CI(n189), .CO(n113), .S(n114) );
  XNOR2XL U473 ( .A(a[7]), .B(n350), .Y(n225) );
  NOR2BXL U474 ( .AN(a[6]), .B(n282), .Y(n109) );
  OAI2BB1X1 U475 ( .A0N(n278), .A1N(n273), .B0(n350), .Y(n179) );
  ADDHX1 U476 ( .A(n172), .B(n213), .CO(n161), .S(n162) );
  INVX3 U477 ( .A(n61), .Y(n60) );
  AOI21X4 U478 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  ADDHX1 U479 ( .A(n173), .B(n215), .CO(n165), .S(n166) );
endmodule


module SNN_DW_mult_uns_26 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n8, n9, n10, n12, n13, n14, n17, n18, n26, n27,
         n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n45,
         n46, n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78, n79,
         n80, n81, n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98, n99,
         n104, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n269, n270, n271, n272, n273, n274, n275, n276, n278,
         n279, n280, n282, n283, n284, n285, n298, n335, n336, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352;

  AOI21X1 U7 ( .A0(n32), .A1(n343), .B0(n342), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n344), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U34 ( .A(n121), .B(n116), .Y(n37) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  AOI21X1 U89 ( .A0(n78), .A1(n346), .B0(n75), .Y(n73) );
  XOR3X2 U121 ( .A(n109), .B(n175), .C(n179), .Y(n106) );
  ADDFHX4 U126 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  OAI22X1 U167 ( .A0(n233), .A1(n278), .B0(n273), .B1(n282), .Y(n171) );
  OAI22X1 U170 ( .A0(n225), .A1(n273), .B0(n278), .B1(n282), .Y(n180) );
  OAI22X1 U171 ( .A0(n225), .A1(n278), .B0(n226), .B1(n273), .Y(n181) );
  OAI22X1 U172 ( .A0(n227), .A1(n273), .B0(n226), .B1(n278), .Y(n182) );
  OAI22X1 U191 ( .A0(n234), .A1(n274), .B0(n336), .B1(n283), .Y(n190) );
  OAI22X1 U192 ( .A0(n234), .A1(n336), .B0(n235), .B1(n274), .Y(n191) );
  OAI22X1 U193 ( .A0(n236), .A1(n274), .B0(n235), .B1(n336), .Y(n192) );
  OAI22X1 U194 ( .A0(n236), .A1(n336), .B0(n237), .B1(n274), .Y(n193) );
  OAI22X1 U195 ( .A0(n238), .A1(n274), .B0(n237), .B1(n336), .Y(n194) );
  OAI22X1 U196 ( .A0(n238), .A1(n336), .B0(n239), .B1(n274), .Y(n195) );
  OAI22X1 U197 ( .A0(n240), .A1(n274), .B0(n239), .B1(n336), .Y(n196) );
  OAI22X1 U198 ( .A0(n240), .A1(n336), .B0(n241), .B1(n274), .Y(n197) );
  OAI22X1 U212 ( .A0(n243), .A1(n275), .B0(n280), .B1(n284), .Y(n200) );
  OAI22X1 U213 ( .A0(n243), .A1(n280), .B0(n244), .B1(n275), .Y(n201) );
  OAI22X1 U214 ( .A0(n245), .A1(n275), .B0(n244), .B1(n280), .Y(n202) );
  OAI22X1 U215 ( .A0(n245), .A1(n280), .B0(n246), .B1(n275), .Y(n203) );
  OAI22X1 U216 ( .A0(n247), .A1(n275), .B0(n246), .B1(n280), .Y(n204) );
  OAI22X1 U217 ( .A0(n247), .A1(n280), .B0(n248), .B1(n275), .Y(n205) );
  OAI22X1 U218 ( .A0(n249), .A1(n275), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n249), .A1(n280), .B0(n250), .B1(n275), .Y(n207) );
  OAI22X1 U230 ( .A0(n260), .A1(n298), .B0(n276), .B1(n285), .Y(n174) );
  OAI22X1 U233 ( .A0(n252), .A1(n276), .B0(n285), .B1(n298), .Y(n210) );
  OAI22X1 U234 ( .A0(n252), .A1(n298), .B0(n253), .B1(n276), .Y(n211) );
  OAI22X1 U235 ( .A0(n254), .A1(n276), .B0(n253), .B1(n298), .Y(n212) );
  OAI22X1 U236 ( .A0(n254), .A1(n298), .B0(n255), .B1(n276), .Y(n213) );
  OAI22X1 U238 ( .A0(n256), .A1(n298), .B0(n257), .B1(n276), .Y(n215) );
  OAI22X1 U239 ( .A0(n258), .A1(n276), .B0(n257), .B1(n298), .Y(n216) );
  OAI22X1 U240 ( .A0(n258), .A1(n298), .B0(n259), .B1(n276), .Y(n217) );
  NAND2X4 U283 ( .A(n280), .B(n271), .Y(n275) );
  NAND2X2 U291 ( .A(n278), .B(n269), .Y(n273) );
  OAI22X1 U292 ( .A0(n231), .A1(n278), .B0(n232), .B1(n273), .Y(n187) );
  XNOR2X2 U293 ( .A(b[6]), .B(n351), .Y(n278) );
  INVX2 U294 ( .A(n279), .Y(n335) );
  CLKINVX8 U295 ( .A(n335), .Y(n336) );
  XNOR2X2 U296 ( .A(b[2]), .B(n349), .Y(n280) );
  BUFX4 U297 ( .A(b[1]), .Y(n349) );
  OAI21X1 U298 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  BUFX4 U299 ( .A(b[3]), .Y(n350) );
  NAND2X1 U300 ( .A(n115), .B(n112), .Y(n31) );
  OR2X1 U301 ( .A(n115), .B(n112), .Y(n344) );
  OR2X1 U302 ( .A(n107), .B(n106), .Y(n348) );
  ADDFX2 U303 ( .A(n194), .B(n186), .CI(n153), .CO(n145), .S(n146) );
  ADDFX2 U304 ( .A(n196), .B(n161), .CI(n158), .CO(n155), .S(n156) );
  ADDFX2 U305 ( .A(n141), .B(n134), .CI(n200), .CO(n131), .S(n132) );
  ADDFX2 U306 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  NAND2X1 U307 ( .A(n272), .B(n298), .Y(n276) );
  XNOR2X1 U308 ( .A(b[4]), .B(n350), .Y(n279) );
  NAND2X2 U309 ( .A(n336), .B(n270), .Y(n274) );
  XOR2X1 U310 ( .A(b[4]), .B(n351), .Y(n270) );
  BUFX2 U311 ( .A(b[5]), .Y(n351) );
  NOR2X1 U312 ( .A(n144), .B(n149), .Y(n64) );
  XOR2X1 U313 ( .A(n55), .B(n6), .Y(product[10]) );
  BUFX2 U314 ( .A(b[7]), .Y(n352) );
  XOR2X1 U315 ( .A(b[6]), .B(n352), .Y(n269) );
  XOR2X1 U316 ( .A(n46), .B(n5), .Y(product[11]) );
  NAND2X1 U317 ( .A(n94), .B(n38), .Y(n4) );
  AND2X1 U318 ( .A(n344), .B(n31), .Y(n338) );
  XOR2X1 U319 ( .A(n27), .B(n2), .Y(product[14]) );
  XOR2X1 U320 ( .A(n18), .B(n1), .Y(product[15]) );
  XNOR2X1 U321 ( .A(a[4]), .B(n349), .Y(n255) );
  AND2X1 U322 ( .A(n340), .B(n90), .Y(product[1]) );
  XOR2X1 U323 ( .A(n32), .B(n338), .Y(product[13]) );
  INVX2 U324 ( .A(n31), .Y(n29) );
  ADDFX1 U325 ( .A(n209), .B(n142), .CI(n201), .CO(n139), .S(n140) );
  NAND2X1 U326 ( .A(n96), .B(n54), .Y(n6) );
  NOR2X1 U327 ( .A(n64), .B(n67), .Y(n62) );
  CLKINVXL U328 ( .A(n53), .Y(n96) );
  INVX1 U329 ( .A(n67), .Y(n99) );
  AOI21XL U330 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  CLKINVX2 U331 ( .A(n77), .Y(n75) );
  INVX1 U332 ( .A(n141), .Y(n142) );
  XNOR2X1 U333 ( .A(a[3]), .B(n352), .Y(n229) );
  OAI21XL U334 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  XNOR2X1 U335 ( .A(a[2]), .B(n352), .Y(n230) );
  XNOR2X1 U336 ( .A(a[4]), .B(n352), .Y(n228) );
  NAND2X1 U337 ( .A(n127), .B(n122), .Y(n45) );
  XNOR2X1 U338 ( .A(n339), .B(n78), .Y(product[5]) );
  NAND2X1 U339 ( .A(n136), .B(n143), .Y(n59) );
  ADDFHX1 U340 ( .A(n211), .B(n187), .CI(n203), .CO(n151), .S(n152) );
  ADDFX1 U341 ( .A(n193), .B(n185), .CI(n147), .CO(n137), .S(n138) );
  ADDFX1 U342 ( .A(n192), .B(n184), .CI(n139), .CO(n129), .S(n130) );
  CLKINVXL U343 ( .A(n352), .Y(n282) );
  NOR2BXL U344 ( .AN(a[0]), .B(n278), .Y(n188) );
  ADDHX1 U345 ( .A(n173), .B(n215), .CO(n165), .S(n166) );
  XNOR2XL U346 ( .A(a[1]), .B(n352), .Y(n231) );
  XNOR2XL U347 ( .A(a[6]), .B(n350), .Y(n244) );
  XNOR2XL U348 ( .A(a[5]), .B(n351), .Y(n236) );
  XNOR2XL U349 ( .A(a[6]), .B(n351), .Y(n235) );
  CLKINVX2 U350 ( .A(n70), .Y(n69) );
  OAI21XL U351 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  INVX1 U352 ( .A(n58), .Y(n97) );
  CLKINVXL U353 ( .A(n37), .Y(n94) );
  NOR2XL U354 ( .A(n58), .B(n53), .Y(n47) );
  NOR2X2 U355 ( .A(n127), .B(n122), .Y(n42) );
  NAND2XL U356 ( .A(n345), .B(n26), .Y(n2) );
  NAND2XL U357 ( .A(n346), .B(n77), .Y(n339) );
  NAND2BX1 U358 ( .AN(n79), .B(n80), .Y(n12) );
  NAND2BX1 U359 ( .AN(n71), .B(n72), .Y(n10) );
  XOR2XL U360 ( .A(n14), .B(n90), .Y(product[2]) );
  CLKINVXL U361 ( .A(n87), .Y(n104) );
  NAND2XL U362 ( .A(n144), .B(n149), .Y(n65) );
  CMPR32X1 U363 ( .A(n132), .B(n137), .C(n130), .CO(n127), .S(n128) );
  ADDFX1 U364 ( .A(n154), .B(n157), .CI(n152), .CO(n149), .S(n150) );
  NAND2XL U365 ( .A(n166), .B(n207), .Y(n85) );
  OR2XL U366 ( .A(n217), .B(n174), .Y(n340) );
  NAND2XL U367 ( .A(n216), .B(n208), .Y(n88) );
  CLKINVXL U368 ( .A(n351), .Y(n283) );
  CLKINVXL U369 ( .A(n350), .Y(n284) );
  OAI22XL U370 ( .A0(n229), .A1(n278), .B0(n230), .B1(n273), .Y(n185) );
  OAI2BB1XL U371 ( .A0N(n298), .A1N(n276), .B0(n349), .Y(n209) );
  OAI22XL U372 ( .A0(n231), .A1(n273), .B0(n230), .B1(n278), .Y(n186) );
  CLKINVXL U373 ( .A(n349), .Y(n285) );
  OAI22XL U374 ( .A0(n229), .A1(n273), .B0(n228), .B1(n278), .Y(n184) );
  CMPR32X1 U375 ( .A(n191), .B(n183), .C(n126), .CO(n123), .S(n124) );
  OAI22XL U376 ( .A0(n227), .A1(n278), .B0(n228), .B1(n273), .Y(n183) );
  INVX1 U377 ( .A(n133), .Y(n134) );
  NAND2X1 U378 ( .A(n348), .B(n17), .Y(n1) );
  INVX1 U379 ( .A(n119), .Y(n120) );
  CMPR32X1 U380 ( .A(n110), .B(n180), .C(n113), .CO(n107), .S(n108) );
  ADDFHX1 U381 ( .A(n188), .B(n212), .CI(n204), .CO(n157), .S(n158) );
  XNOR2X1 U382 ( .A(a[6]), .B(n349), .Y(n253) );
  OAI22X1 U383 ( .A0(n251), .A1(n280), .B0(n275), .B1(n284), .Y(n173) );
  XOR2X1 U384 ( .A(b[2]), .B(n350), .Y(n271) );
  XOR2X1 U385 ( .A(b[0]), .B(n349), .Y(n272) );
  CMPR32X1 U386 ( .A(n205), .B(n197), .C(n162), .CO(n159), .S(n160) );
  CMPR32X1 U387 ( .A(n198), .B(n214), .C(n206), .CO(n163), .S(n164) );
  OAI22XL U388 ( .A0(n256), .A1(n276), .B0(n255), .B1(n298), .Y(n214) );
  XNOR2X1 U389 ( .A(a[0]), .B(n352), .Y(n232) );
  NOR2BXL U390 ( .AN(a[3]), .B(n282), .Y(n177) );
  XNOR2X1 U391 ( .A(a[6]), .B(n352), .Y(n226) );
  XNOR2X1 U392 ( .A(a[5]), .B(n352), .Y(n227) );
  NOR2BXL U393 ( .AN(a[5]), .B(n282), .Y(n176) );
  NOR2BXL U394 ( .AN(a[7]), .B(n282), .Y(n175) );
  INVX2 U395 ( .A(n61), .Y(n60) );
  NAND2X1 U396 ( .A(n95), .B(n45), .Y(n5) );
  INVX2 U397 ( .A(n42), .Y(n95) );
  NOR2BX1 U398 ( .AN(n47), .B(n42), .Y(n40) );
  OAI21X1 U399 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  INVX2 U400 ( .A(n48), .Y(n50) );
  XOR2X1 U401 ( .A(n69), .B(n9), .Y(product[7]) );
  NAND2X1 U402 ( .A(n99), .B(n68), .Y(n9) );
  XOR2X1 U403 ( .A(n60), .B(n341), .Y(product[9]) );
  AND2X1 U404 ( .A(n97), .B(n59), .Y(n341) );
  XNOR2X2 U405 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U406 ( .A(n98), .B(n65), .Y(n8) );
  INVX2 U407 ( .A(n64), .Y(n98) );
  XOR2X2 U408 ( .A(n39), .B(n4), .Y(product[12]) );
  NOR2X1 U409 ( .A(n128), .B(n135), .Y(n53) );
  OAI21XL U410 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  NAND2XL U411 ( .A(n47), .B(n35), .Y(n33) );
  NOR2X1 U412 ( .A(n42), .B(n37), .Y(n35) );
  INVX2 U413 ( .A(n59), .Y(n57) );
  OAI21XL U414 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  NAND2X1 U415 ( .A(n128), .B(n135), .Y(n54) );
  OAI2BB1X1 U416 ( .A0N(n29), .A1N(n345), .B0(n26), .Y(n342) );
  AND2X1 U417 ( .A(n344), .B(n345), .Y(n343) );
  NOR2X1 U418 ( .A(n150), .B(n155), .Y(n67) );
  OAI21X1 U419 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  AOI21X1 U420 ( .A0(n86), .A1(n347), .B0(n83), .Y(n81) );
  INVX2 U421 ( .A(n85), .Y(n83) );
  OAI21X1 U422 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  XNOR2X1 U423 ( .A(n13), .B(n86), .Y(product[3]) );
  NAND2X1 U424 ( .A(n347), .B(n85), .Y(n13) );
  NAND2X1 U425 ( .A(n150), .B(n155), .Y(n68) );
  NAND2X1 U426 ( .A(n104), .B(n88), .Y(n14) );
  NOR2X1 U427 ( .A(n136), .B(n143), .Y(n58) );
  ADDFX2 U428 ( .A(n140), .B(n145), .CI(n138), .CO(n135), .S(n136) );
  ADDFX2 U429 ( .A(n131), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  NAND2XL U430 ( .A(n121), .B(n116), .Y(n38) );
  OR2X1 U431 ( .A(n111), .B(n108), .Y(n345) );
  NAND2X1 U432 ( .A(n111), .B(n108), .Y(n26) );
  ADDFX2 U433 ( .A(n148), .B(n151), .CI(n146), .CO(n143), .S(n144) );
  OR2X1 U434 ( .A(n160), .B(n163), .Y(n346) );
  OR2X1 U435 ( .A(n166), .B(n207), .Y(n347) );
  NAND2X1 U436 ( .A(n160), .B(n163), .Y(n77) );
  NOR2X1 U437 ( .A(n164), .B(n165), .Y(n79) );
  NOR2X1 U438 ( .A(n156), .B(n159), .Y(n71) );
  NAND2X1 U439 ( .A(n217), .B(n174), .Y(n90) );
  NOR2X1 U440 ( .A(n216), .B(n208), .Y(n87) );
  NAND2X1 U441 ( .A(n164), .B(n165), .Y(n80) );
  NAND2XL U442 ( .A(n156), .B(n159), .Y(n72) );
  NAND2XL U443 ( .A(n107), .B(n106), .Y(n17) );
  ADDFX2 U444 ( .A(n181), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  INVX1 U445 ( .A(n109), .Y(n110) );
  ADDHXL U446 ( .A(n171), .B(n195), .CO(n153), .S(n154) );
  NAND2BX1 U447 ( .AN(a[0]), .B(n352), .Y(n233) );
  ADDHXL U448 ( .A(n172), .B(n213), .CO(n161), .S(n162) );
  OAI22XL U449 ( .A0(n242), .A1(n336), .B0(n274), .B1(n283), .Y(n172) );
  NAND2BXL U450 ( .AN(a[0]), .B(n351), .Y(n242) );
  XNOR2XL U451 ( .A(a[0]), .B(n351), .Y(n241) );
  NAND2BXL U452 ( .AN(a[0]), .B(n350), .Y(n251) );
  XNOR2XL U453 ( .A(a[2]), .B(n349), .Y(n257) );
  XNOR2XL U454 ( .A(a[3]), .B(n349), .Y(n256) );
  XNOR2XL U455 ( .A(a[0]), .B(n350), .Y(n250) );
  XNOR2XL U456 ( .A(a[0]), .B(n349), .Y(n259) );
  XNOR2XL U457 ( .A(a[5]), .B(n349), .Y(n254) );
  NAND2BXL U458 ( .AN(a[0]), .B(n349), .Y(n260) );
  ADDFX1 U459 ( .A(n178), .B(n210), .CI(n202), .CO(n147), .S(n148) );
  NOR2BXL U460 ( .AN(a[0]), .B(n282), .Y(n178) );
  XNOR2XL U461 ( .A(a[1]), .B(n349), .Y(n258) );
  XNOR2XL U462 ( .A(a[1]), .B(n351), .Y(n240) );
  XNOR2XL U463 ( .A(a[7]), .B(n349), .Y(n252) );
  XNOR2XL U464 ( .A(a[2]), .B(n350), .Y(n248) );
  XNOR2XL U465 ( .A(a[2]), .B(n351), .Y(n239) );
  XNOR2XL U466 ( .A(a[3]), .B(n350), .Y(n247) );
  XNOR2XL U467 ( .A(a[3]), .B(n351), .Y(n238) );
  XNOR2XL U468 ( .A(a[4]), .B(n350), .Y(n246) );
  XNOR2XL U469 ( .A(a[1]), .B(n350), .Y(n249) );
  XNOR2XL U470 ( .A(a[4]), .B(n351), .Y(n237) );
  NOR2BXL U471 ( .AN(a[0]), .B(n280), .Y(n208) );
  CLKINVX2 U472 ( .A(b[0]), .Y(n298) );
  XNOR2XL U473 ( .A(a[5]), .B(n350), .Y(n245) );
  CMPR32X1 U474 ( .A(n133), .B(n177), .C(n199), .CO(n125), .S(n126) );
  OAI2BB1XL U475 ( .A0N(n280), .A1N(n275), .B0(n350), .Y(n199) );
  XNOR2XL U476 ( .A(a[7]), .B(n350), .Y(n243) );
  NOR2BXL U477 ( .AN(a[1]), .B(n282), .Y(n141) );
  XNOR2XL U478 ( .A(a[7]), .B(n351), .Y(n234) );
  NOR2BXL U479 ( .AN(a[2]), .B(n282), .Y(n133) );
  NOR2BXL U480 ( .AN(a[4]), .B(n282), .Y(n119) );
  NOR2BXL U481 ( .AN(a[0]), .B(n298), .Y(product[0]) );
  ADDFX2 U482 ( .A(n119), .B(n176), .CI(n189), .CO(n113), .S(n114) );
  OAI2BB1XL U483 ( .A0N(n336), .A1N(n274), .B0(n351), .Y(n189) );
  XNOR2XL U484 ( .A(a[7]), .B(n352), .Y(n225) );
  NOR2BXL U485 ( .AN(a[6]), .B(n282), .Y(n109) );
  OAI2BB1X1 U486 ( .A0N(n278), .A1N(n273), .B0(n352), .Y(n179) );
  XOR2X1 U487 ( .A(n12), .B(n81), .Y(product[4]) );
  OAI21XL U488 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  NOR2BXL U489 ( .AN(a[0]), .B(n336), .Y(n198) );
  XOR2X1 U490 ( .A(n10), .B(n73), .Y(product[6]) );
endmodule


module SNN_DW_mult_uns_27 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n17, n18,
         n26, n27, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n45, n46, n47, n48, n50, n53, n54, n55, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n77,
         n78, n79, n80, n81, n83, n85, n86, n87, n88, n90, n94, n95, n96, n97,
         n98, n99, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n269, n270, n271, n272, n273, n274, n275, n276,
         n278, n279, n280, n282, n283, n284, n285, n298, n335, n336, n337,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351;

  AOI21X1 U7 ( .A0(n32), .A1(n343), .B0(n342), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n344), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n48), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U34 ( .A(n121), .B(n116), .Y(n37) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  NOR2X2 U64 ( .A(n136), .B(n143), .Y(n58) );
  XOR3X2 U121 ( .A(n109), .B(n175), .C(n179), .Y(n106) );
  OAI22X1 U170 ( .A0(n225), .A1(n273), .B0(n278), .B1(n282), .Y(n180) );
  OAI22X1 U171 ( .A0(n225), .A1(n278), .B0(n226), .B1(n273), .Y(n181) );
  OAI22X1 U172 ( .A0(n227), .A1(n273), .B0(n226), .B1(n278), .Y(n182) );
  OAI22X1 U177 ( .A0(n231), .A1(n278), .B0(n232), .B1(n273), .Y(n187) );
  OAI22X1 U191 ( .A0(n234), .A1(n274), .B0(n279), .B1(n283), .Y(n190) );
  OAI22X1 U192 ( .A0(n234), .A1(n279), .B0(n235), .B1(n274), .Y(n191) );
  OAI22X1 U193 ( .A0(n236), .A1(n274), .B0(n235), .B1(n279), .Y(n192) );
  OAI22X1 U194 ( .A0(n236), .A1(n279), .B0(n237), .B1(n274), .Y(n193) );
  OAI22X1 U195 ( .A0(n238), .A1(n274), .B0(n237), .B1(n279), .Y(n194) );
  OAI22X1 U196 ( .A0(n238), .A1(n279), .B0(n239), .B1(n274), .Y(n195) );
  OAI22X1 U197 ( .A0(n240), .A1(n274), .B0(n239), .B1(n279), .Y(n196) );
  OAI22X1 U198 ( .A0(n240), .A1(n279), .B0(n241), .B1(n274), .Y(n197) );
  OAI22X1 U209 ( .A0(n251), .A1(n280), .B0(n275), .B1(n284), .Y(n173) );
  OAI22X1 U212 ( .A0(n243), .A1(n275), .B0(n280), .B1(n284), .Y(n200) );
  OAI22X1 U213 ( .A0(n243), .A1(n280), .B0(n244), .B1(n275), .Y(n201) );
  OAI22X1 U214 ( .A0(n245), .A1(n275), .B0(n244), .B1(n280), .Y(n202) );
  OAI22X1 U215 ( .A0(n245), .A1(n280), .B0(n246), .B1(n275), .Y(n203) );
  OAI22X1 U216 ( .A0(n247), .A1(n275), .B0(n246), .B1(n280), .Y(n204) );
  OAI22X1 U217 ( .A0(n247), .A1(n280), .B0(n248), .B1(n275), .Y(n205) );
  OAI22X1 U218 ( .A0(n249), .A1(n275), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n249), .A1(n280), .B0(n250), .B1(n275), .Y(n207) );
  OAI22X1 U230 ( .A0(n260), .A1(n298), .B0(n276), .B1(n285), .Y(n174) );
  OAI22X1 U233 ( .A0(n252), .A1(n276), .B0(n285), .B1(n298), .Y(n210) );
  OAI22X1 U234 ( .A0(n252), .A1(n298), .B0(n253), .B1(n276), .Y(n211) );
  OAI22X1 U235 ( .A0(n254), .A1(n276), .B0(n253), .B1(n298), .Y(n212) );
  OAI22X1 U236 ( .A0(n254), .A1(n298), .B0(n255), .B1(n276), .Y(n213) );
  OAI22X1 U237 ( .A0(n256), .A1(n276), .B0(n255), .B1(n298), .Y(n214) );
  OAI22X1 U238 ( .A0(n256), .A1(n298), .B0(n257), .B1(n276), .Y(n215) );
  OAI22X1 U239 ( .A0(n258), .A1(n276), .B0(n257), .B1(n298), .Y(n216) );
  OAI22X1 U240 ( .A0(n258), .A1(n298), .B0(n259), .B1(n276), .Y(n217) );
  NAND2X4 U280 ( .A(n279), .B(n270), .Y(n274) );
  XNOR2X4 U282 ( .A(b[4]), .B(n349), .Y(n279) );
  NAND2X4 U283 ( .A(n280), .B(n271), .Y(n275) );
  NOR2X2 U291 ( .A(n335), .B(n336), .Y(n337) );
  NOR2X4 U292 ( .A(n337), .B(n63), .Y(n61) );
  CLKINVX2 U293 ( .A(n62), .Y(n335) );
  CLKINVX4 U294 ( .A(n70), .Y(n336) );
  OAI21X2 U295 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  INVX3 U296 ( .A(n61), .Y(n60) );
  OAI22X1 U297 ( .A0(n233), .A1(n278), .B0(n273), .B1(n282), .Y(n171) );
  OAI22XL U298 ( .A0(n231), .A1(n273), .B0(n230), .B1(n278), .Y(n186) );
  XNOR2X2 U299 ( .A(b[6]), .B(n350), .Y(n278) );
  NAND2X1 U300 ( .A(n136), .B(n143), .Y(n59) );
  BUFX4 U301 ( .A(b[3]), .Y(n349) );
  BUFX4 U302 ( .A(b[5]), .Y(n350) );
  NOR2X2 U303 ( .A(n144), .B(n149), .Y(n64) );
  NAND2X1 U304 ( .A(n144), .B(n149), .Y(n65) );
  NAND2XL U305 ( .A(n97), .B(n59), .Y(n7) );
  BUFX4 U306 ( .A(b[7]), .Y(n351) );
  NOR2X2 U307 ( .A(n127), .B(n122), .Y(n42) );
  NOR2X1 U308 ( .A(n58), .B(n53), .Y(n47) );
  NAND2X1 U309 ( .A(n340), .B(n17), .Y(n1) );
  OR2X1 U310 ( .A(n107), .B(n106), .Y(n340) );
  ADDFX2 U311 ( .A(n140), .B(n145), .CI(n138), .CO(n135), .S(n136) );
  ADDFX2 U312 ( .A(n148), .B(n151), .CI(n146), .CO(n143), .S(n144) );
  XOR2X1 U313 ( .A(b[4]), .B(n350), .Y(n270) );
  ADDFX2 U314 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  XNOR2X1 U315 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X2 U316 ( .A(n278), .B(n269), .Y(n273) );
  NAND2X1 U317 ( .A(n94), .B(n38), .Y(n4) );
  OR2X1 U318 ( .A(n115), .B(n112), .Y(n344) );
  XNOR2X2 U319 ( .A(b[2]), .B(n348), .Y(n280) );
  NAND2X1 U320 ( .A(n272), .B(n298), .Y(n276) );
  BUFX4 U321 ( .A(b[1]), .Y(n348) );
  NOR2X1 U322 ( .A(n42), .B(n37), .Y(n35) );
  XNOR2X1 U323 ( .A(a[1]), .B(n348), .Y(n258) );
  OAI21X1 U324 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  AND2X1 U325 ( .A(n339), .B(n90), .Y(product[1]) );
  INVX1 U326 ( .A(n77), .Y(n75) );
  OAI21X1 U327 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  NAND2X1 U328 ( .A(n127), .B(n122), .Y(n45) );
  ADDFX1 U329 ( .A(n141), .B(n134), .CI(n200), .CO(n131), .S(n132) );
  NAND2XL U330 ( .A(n345), .B(n26), .Y(n2) );
  ADDFX1 U331 ( .A(n132), .B(n137), .CI(n130), .CO(n127), .S(n128) );
  INVX1 U332 ( .A(n53), .Y(n96) );
  XNOR2X1 U333 ( .A(n60), .B(n7), .Y(product[9]) );
  OAI21XL U334 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  AOI21X1 U335 ( .A0(n78), .A1(n346), .B0(n75), .Y(n73) );
  AOI21X1 U336 ( .A0(n86), .A1(n347), .B0(n83), .Y(n81) );
  CMPR32X1 U337 ( .A(n192), .B(n184), .C(n139), .CO(n129), .S(n130) );
  INVX1 U338 ( .A(n133), .Y(n134) );
  XNOR2XL U339 ( .A(a[1]), .B(n351), .Y(n231) );
  XNOR2XL U340 ( .A(a[5]), .B(n351), .Y(n227) );
  OAI2BB1X1 U341 ( .A0N(n279), .A1N(n274), .B0(n350), .Y(n189) );
  XOR2X1 U342 ( .A(n46), .B(n5), .Y(product[11]) );
  NOR2BXL U343 ( .AN(n47), .B(n42), .Y(n40) );
  INVX1 U344 ( .A(n67), .Y(n99) );
  NAND2XL U345 ( .A(n98), .B(n65), .Y(n8) );
  INVX2 U346 ( .A(n58), .Y(n97) );
  XOR2X1 U347 ( .A(n39), .B(n4), .Y(product[12]) );
  XOR2X1 U348 ( .A(n27), .B(n2), .Y(product[14]) );
  NAND2BX1 U349 ( .AN(n71), .B(n72), .Y(n10) );
  NAND2BX1 U350 ( .AN(n79), .B(n80), .Y(n12) );
  XOR2XL U351 ( .A(n14), .B(n90), .Y(product[2]) );
  INVXL U352 ( .A(n87), .Y(n104) );
  NAND2X1 U353 ( .A(n121), .B(n116), .Y(n38) );
  NAND2XL U354 ( .A(n115), .B(n112), .Y(n31) );
  NAND2XL U355 ( .A(n166), .B(n207), .Y(n85) );
  ADDFHX1 U356 ( .A(n154), .B(n157), .CI(n152), .CO(n149), .S(n150) );
  OR2XL U357 ( .A(n217), .B(n174), .Y(n339) );
  ADDFX1 U358 ( .A(n196), .B(n161), .CI(n158), .CO(n155), .S(n156) );
  CLKINVXL U359 ( .A(n350), .Y(n283) );
  OAI22XL U360 ( .A0(n229), .A1(n278), .B0(n230), .B1(n273), .Y(n185) );
  CLKINVXL U361 ( .A(n349), .Y(n284) );
  OAI22XL U362 ( .A0(n229), .A1(n273), .B0(n228), .B1(n278), .Y(n184) );
  CLKINVXL U363 ( .A(n348), .Y(n285) );
  CMPR32X1 U364 ( .A(n191), .B(n183), .C(n126), .CO(n123), .S(n124) );
  OAI22XL U365 ( .A0(n227), .A1(n278), .B0(n228), .B1(n273), .Y(n183) );
  NAND2X1 U366 ( .A(n107), .B(n106), .Y(n17) );
  XOR2X1 U367 ( .A(n18), .B(n1), .Y(product[15]) );
  INVX1 U368 ( .A(n119), .Y(n120) );
  CMPR32X1 U369 ( .A(n110), .B(n180), .C(n113), .CO(n107), .S(n108) );
  NAND2BX1 U370 ( .AN(a[0]), .B(n350), .Y(n242) );
  OAI22X1 U371 ( .A0(n242), .A1(n279), .B0(n274), .B1(n283), .Y(n172) );
  CMPR32X1 U372 ( .A(n205), .B(n197), .C(n162), .CO(n159), .S(n160) );
  ADDFX1 U373 ( .A(n198), .B(n214), .CI(n206), .CO(n163), .S(n164) );
  XNOR2XL U374 ( .A(a[6]), .B(n348), .Y(n253) );
  XNOR2XL U375 ( .A(a[4]), .B(n348), .Y(n255) );
  XNOR2XL U376 ( .A(a[5]), .B(n348), .Y(n254) );
  XNOR2XL U377 ( .A(a[3]), .B(n348), .Y(n256) );
  XNOR2X1 U378 ( .A(a[2]), .B(n351), .Y(n230) );
  NOR2BXL U379 ( .AN(a[1]), .B(n282), .Y(n141) );
  NOR2BXL U380 ( .AN(a[3]), .B(n282), .Y(n177) );
  NOR2BXL U381 ( .AN(a[2]), .B(n282), .Y(n133) );
  NOR2BXL U382 ( .AN(a[5]), .B(n282), .Y(n176) );
  NOR2BXL U383 ( .AN(a[7]), .B(n282), .Y(n175) );
  XOR2X1 U384 ( .A(n55), .B(n6), .Y(product[10]) );
  NAND2X1 U385 ( .A(n96), .B(n54), .Y(n6) );
  NAND2X1 U386 ( .A(n95), .B(n45), .Y(n5) );
  INVX2 U387 ( .A(n42), .Y(n95) );
  OAI21X1 U388 ( .A0(n50), .A1(n42), .B0(n45), .Y(n41) );
  INVX2 U389 ( .A(n48), .Y(n50) );
  XOR2X1 U390 ( .A(n69), .B(n9), .Y(product[7]) );
  NAND2X1 U391 ( .A(n99), .B(n68), .Y(n9) );
  CLKINVXL U392 ( .A(n37), .Y(n94) );
  INVX2 U393 ( .A(n70), .Y(n69) );
  OAI21XL U394 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  NAND2XL U395 ( .A(n47), .B(n35), .Y(n33) );
  CLKINVXL U396 ( .A(n64), .Y(n98) );
  NOR2X1 U397 ( .A(n128), .B(n135), .Y(n53) );
  OAI21XL U398 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  XOR2X1 U399 ( .A(n32), .B(n341), .Y(product[13]) );
  AND2X1 U400 ( .A(n344), .B(n31), .Y(n341) );
  NAND2X1 U401 ( .A(n128), .B(n135), .Y(n54) );
  CLKINVXL U402 ( .A(n59), .Y(n57) );
  INVX2 U403 ( .A(n31), .Y(n29) );
  OAI2BB1X1 U404 ( .A0N(n29), .A1N(n345), .B0(n26), .Y(n342) );
  AND2X1 U405 ( .A(n344), .B(n345), .Y(n343) );
  NOR2X1 U406 ( .A(n150), .B(n155), .Y(n67) );
  OAI21X1 U407 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  INVX2 U408 ( .A(n85), .Y(n83) );
  XNOR2X1 U409 ( .A(n11), .B(n78), .Y(product[5]) );
  NAND2X1 U410 ( .A(n346), .B(n77), .Y(n11) );
  XNOR2X1 U411 ( .A(n13), .B(n86), .Y(product[3]) );
  NAND2X1 U412 ( .A(n347), .B(n85), .Y(n13) );
  NAND2X1 U413 ( .A(n104), .B(n88), .Y(n14) );
  OAI21X1 U414 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  ADDFX2 U415 ( .A(n131), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  NAND2X1 U416 ( .A(n150), .B(n155), .Y(n68) );
  OR2X1 U417 ( .A(n111), .B(n108), .Y(n345) );
  NAND2X1 U418 ( .A(n111), .B(n108), .Y(n26) );
  ADDFHX1 U419 ( .A(n211), .B(n187), .CI(n203), .CO(n151), .S(n152) );
  NOR2X1 U420 ( .A(n156), .B(n159), .Y(n71) );
  OR2X1 U421 ( .A(n160), .B(n163), .Y(n346) );
  NOR2X1 U422 ( .A(n164), .B(n165), .Y(n79) );
  OR2X1 U423 ( .A(n166), .B(n207), .Y(n347) );
  NAND2X1 U424 ( .A(n217), .B(n174), .Y(n90) );
  NAND2X1 U425 ( .A(n160), .B(n163), .Y(n77) );
  NOR2X1 U426 ( .A(n216), .B(n208), .Y(n87) );
  ADDFHX1 U427 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  CMPR32X1 U428 ( .A(n194), .B(n186), .C(n153), .CO(n145), .S(n146) );
  NAND2XL U429 ( .A(n164), .B(n165), .Y(n80) );
  NAND2XL U430 ( .A(n156), .B(n159), .Y(n72) );
  ADDFX1 U431 ( .A(n209), .B(n142), .CI(n201), .CO(n139), .S(n140) );
  INVX2 U432 ( .A(n141), .Y(n142) );
  OAI2BB1X1 U433 ( .A0N(n298), .A1N(n276), .B0(n348), .Y(n209) );
  ADDFHX1 U434 ( .A(n193), .B(n185), .CI(n147), .CO(n137), .S(n138) );
  INVX2 U435 ( .A(n351), .Y(n282) );
  NAND2XL U436 ( .A(n216), .B(n208), .Y(n88) );
  ADDFX2 U437 ( .A(n181), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  INVX1 U438 ( .A(n109), .Y(n110) );
  XOR2X1 U439 ( .A(b[6]), .B(n351), .Y(n269) );
  NAND2BX1 U440 ( .AN(a[0]), .B(n351), .Y(n233) );
  XNOR2XL U441 ( .A(a[0]), .B(n350), .Y(n241) );
  XOR2X1 U442 ( .A(b[0]), .B(n348), .Y(n272) );
  ADDFHX1 U443 ( .A(n188), .B(n212), .CI(n204), .CO(n157), .S(n158) );
  NOR2BXL U444 ( .AN(a[0]), .B(n278), .Y(n188) );
  NOR2BXL U445 ( .AN(a[0]), .B(n279), .Y(n198) );
  NAND2BXL U446 ( .AN(a[0]), .B(n349), .Y(n251) );
  XOR2X1 U447 ( .A(b[2]), .B(n349), .Y(n271) );
  XNOR2X1 U448 ( .A(a[0]), .B(n351), .Y(n232) );
  XNOR2XL U449 ( .A(a[0]), .B(n348), .Y(n259) );
  XNOR2XL U450 ( .A(a[2]), .B(n348), .Y(n257) );
  NAND2BXL U451 ( .AN(a[0]), .B(n348), .Y(n260) );
  CMPR32X1 U452 ( .A(n133), .B(n177), .C(n199), .CO(n125), .S(n126) );
  OAI2BB1XL U453 ( .A0N(n280), .A1N(n275), .B0(n349), .Y(n199) );
  XNOR2XL U454 ( .A(a[0]), .B(n349), .Y(n250) );
  ADDFHX1 U455 ( .A(n178), .B(n210), .CI(n202), .CO(n147), .S(n148) );
  NOR2BXL U456 ( .AN(a[0]), .B(n282), .Y(n178) );
  XNOR2XL U457 ( .A(a[2]), .B(n350), .Y(n239) );
  XNOR2XL U458 ( .A(a[7]), .B(n348), .Y(n252) );
  XNOR2XL U459 ( .A(a[4]), .B(n349), .Y(n246) );
  NOR2BXL U460 ( .AN(a[0]), .B(n280), .Y(n208) );
  XNOR2XL U461 ( .A(a[3]), .B(n350), .Y(n238) );
  XNOR2XL U462 ( .A(a[2]), .B(n349), .Y(n248) );
  XNOR2XL U463 ( .A(a[3]), .B(n349), .Y(n247) );
  XNOR2X1 U464 ( .A(a[4]), .B(n351), .Y(n228) );
  XNOR2XL U465 ( .A(a[7]), .B(n350), .Y(n234) );
  XNOR2XL U466 ( .A(a[1]), .B(n350), .Y(n240) );
  XNOR2XL U467 ( .A(a[1]), .B(n349), .Y(n249) );
  XNOR2XL U468 ( .A(a[6]), .B(n350), .Y(n235) );
  XNOR2XL U469 ( .A(a[4]), .B(n350), .Y(n237) );
  CLKINVX2 U470 ( .A(b[0]), .Y(n298) );
  XNOR2XL U471 ( .A(a[5]), .B(n349), .Y(n245) );
  XNOR2XL U472 ( .A(a[6]), .B(n349), .Y(n244) );
  XNOR2XL U473 ( .A(a[3]), .B(n351), .Y(n229) );
  XNOR2XL U474 ( .A(a[5]), .B(n350), .Y(n236) );
  XNOR2XL U475 ( .A(a[7]), .B(n349), .Y(n243) );
  XNOR2X1 U476 ( .A(a[6]), .B(n351), .Y(n226) );
  NOR2BXL U477 ( .AN(a[4]), .B(n282), .Y(n119) );
  NOR2BXL U478 ( .AN(a[0]), .B(n298), .Y(product[0]) );
  ADDFX2 U479 ( .A(n119), .B(n176), .CI(n189), .CO(n113), .S(n114) );
  XNOR2XL U480 ( .A(a[7]), .B(n351), .Y(n225) );
  NOR2BXL U481 ( .AN(a[6]), .B(n282), .Y(n109) );
  OAI2BB1X1 U482 ( .A0N(n278), .A1N(n273), .B0(n351), .Y(n179) );
  XOR2X1 U483 ( .A(n12), .B(n81), .Y(product[4]) );
  ADDHXL U484 ( .A(n172), .B(n213), .CO(n161), .S(n162) );
  XOR2X1 U485 ( .A(n10), .B(n73), .Y(product[6]) );
  ADDHXL U486 ( .A(n171), .B(n195), .CO(n153), .S(n154) );
  NOR2X1 U487 ( .A(n64), .B(n67), .Y(n62) );
  ADDHX1 U488 ( .A(n173), .B(n215), .CO(n165), .S(n166) );
endmodule


module SNN_DW01_add_117 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n6, n7, n11, n14, n21, n24, n25, n26, n27, n28, n32, n33, n37, n39,
         n41, n44, n47, n48, n50, n52, n53, n54, n55, n56, n57, n60, n61, n62,
         n68, n73, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n87,
         n95, n96, n97, n98, n99, n100, n103, n109, n113, n114, n170, n171,
         n172, n173, n174, n175, n176, n178;

  OAI21X4 U50 ( .A0(n76), .A1(n48), .B0(n175), .Y(n47) );
  NAND2X4 U51 ( .A(n62), .B(n50), .Y(n48) );
  AOI21X1 U60 ( .A0(n55), .A1(n75), .B0(n56), .Y(n54) );
  NOR2X1 U137 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NAND2X1 U138 ( .A(A[8]), .B(B[8]), .Y(n60) );
  NAND2X1 U139 ( .A(A[4]), .B(B[4]), .Y(n83) );
  NOR2X1 U140 ( .A(n57), .B(n52), .Y(n50) );
  NOR2X1 U141 ( .A(A[9]), .B(B[9]), .Y(n52) );
  XOR2X1 U142 ( .A(A[3]), .B(n173), .Y(SUM[3]) );
  XOR2X1 U143 ( .A(n41), .B(n39), .Y(SUM[11]) );
  XOR2X1 U144 ( .A(n61), .B(n7), .Y(SUM[8]) );
  AND2X1 U145 ( .A(n37), .B(n25), .Y(n170) );
  INVX1 U146 ( .A(A[6]), .Y(n73) );
  NOR2X2 U147 ( .A(n82), .B(n79), .Y(n77) );
  NOR2X1 U148 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NOR2X2 U149 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NOR2X2 U150 ( .A(n68), .B(n73), .Y(n62) );
  NAND2XL U151 ( .A(n75), .B(n62), .Y(n61) );
  CLKINVXL U152 ( .A(A[3]), .Y(n87) );
  NAND2BX1 U153 ( .AN(n57), .B(n60), .Y(n7) );
  AOI21X4 U154 ( .A0(n77), .A1(n85), .B0(n78), .Y(n76) );
  OAI21X2 U155 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  NAND2XL U156 ( .A(A[9]), .B(B[9]), .Y(n53) );
  CLKINVXL U157 ( .A(n26), .Y(n24) );
  INVX1 U158 ( .A(n97), .Y(n99) );
  NAND2XL U159 ( .A(n47), .B(A[10]), .Y(n41) );
  INVX2 U160 ( .A(n53), .Y(n176) );
  AOI2BB1X4 U161 ( .A0N(n52), .A1N(n60), .B0(n176), .Y(n175) );
  XOR2XL U162 ( .A(n171), .B(n68), .Y(SUM[7]) );
  NAND2XL U163 ( .A(n75), .B(A[6]), .Y(n171) );
  NOR2X1 U164 ( .A(n44), .B(n39), .Y(n37) );
  XOR2X1 U165 ( .A(n81), .B(n172), .Y(SUM[5]) );
  AND2X1 U166 ( .A(n113), .B(n80), .Y(n172) );
  AOI2BB1X1 U167 ( .A0N(n97), .A1N(n103), .B0(n174), .Y(n173) );
  OR2XL U168 ( .A(n100), .B(A[2]), .Y(n174) );
  CLKINVXL U169 ( .A(A[2]), .Y(n95) );
  XOR2X1 U170 ( .A(n95), .B(n96), .Y(SUM[2]) );
  XOR2XL U171 ( .A(n14), .B(n103), .Y(SUM[1]) );
  NAND2XL U172 ( .A(n99), .B(n98), .Y(n14) );
  NAND2XL U173 ( .A(A[1]), .B(B[1]), .Y(n98) );
  XOR2X1 U174 ( .A(n47), .B(A[10]), .Y(SUM[10]) );
  XOR2X1 U175 ( .A(n75), .B(A[6]), .Y(SUM[6]) );
  INVX2 U176 ( .A(n85), .Y(n84) );
  INVX2 U177 ( .A(n76), .Y(n75) );
  XOR2X1 U178 ( .A(n54), .B(n6), .Y(SUM[9]) );
  NAND2X1 U179 ( .A(n109), .B(n53), .Y(n6) );
  CLKINVXL U180 ( .A(n52), .Y(n109) );
  NAND2X1 U181 ( .A(n173), .B(n87), .Y(n85) );
  NOR2BXL U182 ( .AN(n62), .B(n57), .Y(n55) );
  INVX2 U183 ( .A(A[10]), .Y(n44) );
  CLKINVXL U184 ( .A(A[11]), .Y(n39) );
  CLKINVXL U185 ( .A(n60), .Y(n56) );
  OAI2BB1X4 U186 ( .A0N(n47), .A1N(n170), .B0(n178), .Y(CO) );
  AND2X1 U187 ( .A(n24), .B(n21), .Y(n178) );
  NOR2X1 U188 ( .A(A[12]), .B(B[12]), .Y(n32) );
  INVX2 U189 ( .A(A[7]), .Y(n68) );
  OAI21XL U190 ( .A0(n84), .A1(n82), .B0(n83), .Y(n81) );
  CLKINVXL U191 ( .A(n79), .Y(n113) );
  XOR2X1 U192 ( .A(n11), .B(n84), .Y(SUM[4]) );
  NAND2X1 U193 ( .A(n114), .B(n83), .Y(n11) );
  CLKINVXL U194 ( .A(n82), .Y(n114) );
  CLKINVXL U195 ( .A(A[14]), .Y(n21) );
  OAI21XL U196 ( .A0(n33), .A1(n27), .B0(n28), .Y(n26) );
  NAND2XL U197 ( .A(A[12]), .B(B[12]), .Y(n33) );
  NAND2X1 U198 ( .A(A[5]), .B(B[5]), .Y(n80) );
  INVX2 U199 ( .A(n98), .Y(n100) );
  NOR2X1 U200 ( .A(A[0]), .B(B[0]), .Y(n103) );
  OAI21X1 U201 ( .A0(n97), .A1(n103), .B0(n98), .Y(n96) );
  XNOR2X1 U202 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NOR2X1 U203 ( .A(A[1]), .B(B[1]), .Y(n97) );
  NAND2XL U204 ( .A(A[13]), .B(B[13]), .Y(n28) );
  NOR2X1 U205 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NOR2X1 U206 ( .A(n32), .B(n27), .Y(n25) );
endmodule


module SNN_DW01_add_127 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n7, n9, n10, n11, n12, n13, n20, n21, n24, n25, n28, n30, n33, n34,
         n35, n41, n42, n43, n46, n47, n50, n51, n56, n59, n60, n61, n62, n63,
         n64, n67, n71, n125, n126;

  NAND2X4 U91 ( .A(n42), .B(n61), .Y(n41) );
  XNOR2X1 U92 ( .A(n33), .B(A[10]), .Y(SUM[10]) );
  NOR2X1 U93 ( .A(A[4]), .B(B[4]), .Y(n62) );
  NAND2XL U94 ( .A(A[4]), .B(B[4]), .Y(n63) );
  NOR2X1 U95 ( .A(A[12]), .B(B[12]), .Y(n20) );
  NOR2X1 U96 ( .A(n51), .B(n43), .Y(n42) );
  OR2X1 U97 ( .A(A[1]), .B(B[1]), .Y(n125) );
  NAND2XL U98 ( .A(A[3]), .B(n67), .Y(n64) );
  NAND2X2 U99 ( .A(A[6]), .B(A[5]), .Y(n51) );
  NAND2X1 U100 ( .A(A[9]), .B(B[9]), .Y(n35) );
  NOR2X2 U101 ( .A(A[14]), .B(A[13]), .Y(n13) );
  OAI21X2 U102 ( .A0(n62), .A1(n64), .B0(n63), .Y(n61) );
  NAND2BX1 U103 ( .AN(n51), .B(A[7]), .Y(n47) );
  XOR2XL U104 ( .A(n50), .B(A[7]), .Y(SUM[7]) );
  XOR2XL U105 ( .A(n56), .B(A[6]), .Y(SUM[6]) );
  INVX1 U106 ( .A(n34), .Y(n71) );
  XOR2X1 U107 ( .A(A[3]), .B(n67), .Y(SUM[3]) );
  XOR2X1 U108 ( .A(n41), .B(n126), .Y(SUM[9]) );
  NAND2XL U109 ( .A(n71), .B(n35), .Y(n126) );
  NAND2XL U110 ( .A(A[12]), .B(B[12]), .Y(n21) );
  NOR2X1 U111 ( .A(n47), .B(n60), .Y(n46) );
  NOR2X1 U112 ( .A(n60), .B(n51), .Y(n50) );
  NOR2X1 U113 ( .A(n60), .B(n59), .Y(n56) );
  CLKINVXL U114 ( .A(A[5]), .Y(n59) );
  XOR2XL U115 ( .A(n46), .B(A[8]), .Y(SUM[8]) );
  XOR2X1 U116 ( .A(n7), .B(n64), .Y(SUM[4]) );
  XOR2X1 U117 ( .A(n60), .B(n59), .Y(SUM[5]) );
  CLKINVXL U118 ( .A(n61), .Y(n60) );
  NOR2X1 U119 ( .A(A[11]), .B(A[10]), .Y(n25) );
  NAND2BX1 U120 ( .AN(n62), .B(n63), .Y(n7) );
  NOR2BXL U121 ( .AN(n35), .B(A[10]), .Y(n30) );
  INVX2 U122 ( .A(n20), .Y(n11) );
  XNOR2X1 U123 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  NOR2X1 U124 ( .A(A[9]), .B(B[9]), .Y(n34) );
  ADDHXL U125 ( .A(n125), .B(A[2]), .CO(n67), .S(SUM[2]) );
  BUFX2 U126 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2XL U127 ( .A(n28), .B(A[11]), .Y(SUM[11]) );
  OAI21XL U128 ( .A0(n41), .A1(n34), .B0(n30), .Y(n28) );
  OAI21X1 U129 ( .A0(n41), .A1(n34), .B0(n35), .Y(n33) );
  NAND2XL U130 ( .A(A[7]), .B(A[8]), .Y(n43) );
  AOI21X4 U131 ( .A0(n24), .A1(n11), .B0(n12), .Y(n10) );
  NAND2X2 U132 ( .A(n13), .B(n21), .Y(n12) );
  NAND2X1 U133 ( .A(n25), .B(n35), .Y(n24) );
  OAI21X4 U134 ( .A0(n41), .A1(n9), .B0(n10), .Y(CO) );
  NAND2X1 U135 ( .A(n71), .B(n11), .Y(n9) );
endmodule


module SNN_DW01_add_120 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n6, n7, n9, n10, n12, n13, n21, n24, n25, n28, n30, n33, n34, n35,
         n40, n41, n42, n43, n46, n47, n50, n51, n56, n59, n60, n61, n62, n63,
         n64, n66, n67, n71, n72, n125, n126;

  NOR2X2 U77 ( .A(A[4]), .B(B[4]), .Y(n62) );
  NAND2X2 U91 ( .A(n25), .B(n35), .Y(n24) );
  OAI21X2 U92 ( .A0(n62), .A1(n64), .B0(n63), .Y(n61) );
  AOI21X2 U93 ( .A0(n24), .A1(n125), .B0(n12), .Y(n10) );
  NOR2X1 U94 ( .A(A[9]), .B(B[9]), .Y(n34) );
  NAND2X2 U95 ( .A(n42), .B(n61), .Y(n41) );
  NOR2X1 U96 ( .A(n43), .B(n51), .Y(n42) );
  OR2X4 U97 ( .A(A[12]), .B(B[12]), .Y(n125) );
  NAND2X1 U98 ( .A(n13), .B(n21), .Y(n12) );
  NOR2XL U99 ( .A(n60), .B(n51), .Y(n50) );
  NAND2XL U100 ( .A(n71), .B(n35), .Y(n6) );
  NAND2X4 U101 ( .A(n71), .B(n125), .Y(n9) );
  INVX2 U102 ( .A(n34), .Y(n71) );
  NOR2X1 U103 ( .A(A[11]), .B(A[10]), .Y(n25) );
  NAND2X2 U104 ( .A(A[9]), .B(B[9]), .Y(n35) );
  OAI21X4 U105 ( .A0(n41), .A1(n9), .B0(n10), .Y(CO) );
  NAND2X1 U106 ( .A(A[4]), .B(B[4]), .Y(n63) );
  XOR2XL U107 ( .A(n50), .B(A[7]), .Y(SUM[7]) );
  XNOR2XL U108 ( .A(n28), .B(A[11]), .Y(SUM[11]) );
  XOR2XL U109 ( .A(n56), .B(A[6]), .Y(SUM[6]) );
  NAND2BX1 U110 ( .AN(n51), .B(A[7]), .Y(n47) );
  OR2XL U111 ( .A(A[1]), .B(B[1]), .Y(n126) );
  NAND2XL U112 ( .A(A[12]), .B(B[12]), .Y(n21) );
  NOR2X1 U113 ( .A(n60), .B(n59), .Y(n56) );
  NAND2X1 U114 ( .A(A[6]), .B(A[5]), .Y(n51) );
  CLKINVXL U115 ( .A(n41), .Y(n40) );
  INVX2 U116 ( .A(A[5]), .Y(n59) );
  XOR2XL U117 ( .A(n46), .B(A[8]), .Y(SUM[8]) );
  XOR2X1 U118 ( .A(n60), .B(n59), .Y(SUM[5]) );
  CLKINVXL U119 ( .A(n61), .Y(n60) );
  NOR2X1 U120 ( .A(n60), .B(n47), .Y(n46) );
  NOR2BXL U121 ( .AN(n35), .B(A[10]), .Y(n30) );
  XOR2XL U122 ( .A(n7), .B(n64), .Y(SUM[4]) );
  NAND2X1 U123 ( .A(n72), .B(n63), .Y(n7) );
  XNOR2X1 U124 ( .A(n66), .B(n67), .Y(SUM[3]) );
  XNOR2X1 U125 ( .A(n40), .B(n6), .Y(SUM[9]) );
  CLKINVXL U126 ( .A(n62), .Y(n72) );
  XNOR2X1 U127 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  ADDHXL U128 ( .A(n126), .B(A[2]), .CO(n67), .S(SUM[2]) );
  NOR2X1 U129 ( .A(A[14]), .B(A[13]), .Y(n13) );
  BUFX2 U130 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2XL U131 ( .A(n33), .B(A[10]), .Y(SUM[10]) );
  NAND2X2 U132 ( .A(A[3]), .B(n67), .Y(n64) );
  CLKINVX1 U133 ( .A(A[3]), .Y(n66) );
  OAI21XL U134 ( .A0(n41), .A1(n34), .B0(n35), .Y(n33) );
  OAI21XL U135 ( .A0(n41), .A1(n34), .B0(n30), .Y(n28) );
  NAND2XL U136 ( .A(A[7]), .B(A[8]), .Y(n43) );
endmodule


module SNN_DW01_add_100 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n9, n10, n12, n13, n21, n24, n25, n36, n38, n39, n40, n47, n55, n56,
         n57, n58, n61, n119, n120, n121;

  NAND2XL U85 ( .A(A[9]), .B(B[9]), .Y(n36) );
  OR2X1 U86 ( .A(A[1]), .B(B[1]), .Y(n119) );
  NOR2X1 U87 ( .A(n47), .B(n40), .Y(n39) );
  NAND2XL U88 ( .A(A[8]), .B(A[7]), .Y(n40) );
  NAND2XL U89 ( .A(A[6]), .B(A[5]), .Y(n47) );
  OAI21X1 U90 ( .A0(n38), .A1(n9), .B0(n10), .Y(CO) );
  NAND2X1 U91 ( .A(n39), .B(n55), .Y(n38) );
  NAND2X1 U92 ( .A(n120), .B(n121), .Y(n9) );
  AOI21X1 U93 ( .A0(n24), .A1(n121), .B0(n12), .Y(n10) );
  NOR2X1 U94 ( .A(A[10]), .B(A[11]), .Y(n25) );
  OR2XL U95 ( .A(A[9]), .B(B[9]), .Y(n120) );
  OAI21X1 U96 ( .A0(n56), .A1(n58), .B0(n57), .Y(n55) );
  NAND2XL U97 ( .A(A[4]), .B(B[4]), .Y(n57) );
  NAND2XL U98 ( .A(A[3]), .B(n61), .Y(n58) );
  NOR2X1 U99 ( .A(A[4]), .B(B[4]), .Y(n56) );
  NAND2X1 U100 ( .A(n13), .B(n21), .Y(n12) );
  NOR2X1 U101 ( .A(A[14]), .B(A[13]), .Y(n13) );
  OR2XL U102 ( .A(A[12]), .B(B[12]), .Y(n121) );
  AND2X1 U103 ( .A(n119), .B(A[2]), .Y(n61) );
  NAND2X1 U104 ( .A(n25), .B(n36), .Y(n24) );
  NAND2XL U105 ( .A(A[12]), .B(B[12]), .Y(n21) );
endmodule


module SNN_DW01_add_93 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n51, n52, n53, n54, n55, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n67, n68, n69, n70, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n95, n96, n97, n98, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n126, n135, n137, n139, n140,
         n141, n201, n202;

  AOI21X1 U6 ( .A0(n1), .A1(n21), .B0(n22), .Y(n20) );
  AOI21X1 U10 ( .A0(n25), .A1(n44), .B0(n26), .Y(n24) );
  AOI21X1 U22 ( .A0(n44), .A1(n34), .B0(n35), .Y(n33) );
  AOI21X1 U30 ( .A0(n1), .A1(n39), .B0(n40), .Y(n38) );
  AOI21X1 U52 ( .A0(n1), .A1(n55), .B0(n201), .Y(n54) );
  AOI21X1 U64 ( .A0(n1), .A1(n64), .B0(n65), .Y(n63) );
  AOI21X1 U74 ( .A0(n1), .A1(n75), .B0(n76), .Y(n70) );
  AOI21X1 U96 ( .A0(n87), .A1(n104), .B0(n88), .Y(n86) );
  AOI21X1 U104 ( .A0(n112), .A1(n92), .B0(n93), .Y(n91) );
  AOI21X1 U114 ( .A0(n112), .A1(n103), .B0(n104), .Y(n98) );
  AOI21X1 U126 ( .A0(n112), .A1(n108), .B0(n109), .Y(n107) );
  AOI21X1 U135 ( .A0(n114), .A1(n122), .B0(n115), .Y(n113) );
  XOR2X2 U163 ( .A(n47), .B(n6), .Y(SUM[13]) );
  XOR2X1 U164 ( .A(n63), .B(n8), .Y(SUM[11]) );
  NAND2X1 U165 ( .A(A[8]), .B(B[8]), .Y(n83) );
  XOR2X1 U166 ( .A(n29), .B(n4), .Y(SUM[15]) );
  NOR2X1 U167 ( .A(n52), .B(n45), .Y(n43) );
  NAND2X1 U168 ( .A(n34), .B(n37), .Y(n5) );
  NOR2X1 U169 ( .A(A[5]), .B(B[5]), .Y(n105) );
  BUFX2 U170 ( .A(n57), .Y(n3) );
  INVX2 U171 ( .A(n60), .Y(n202) );
  OAI21X1 U172 ( .A0(n61), .A1(n69), .B0(n62), .Y(n60) );
  XOR2X1 U173 ( .A(n79), .B(n10), .Y(SUM[9]) );
  XOR2X1 U174 ( .A(n91), .B(n12), .Y(SUM[7]) );
  NAND2X1 U175 ( .A(n135), .B(n90), .Y(n12) );
  INVX2 U176 ( .A(n201), .Y(n58) );
  OAI2BB1X1 U177 ( .A0N(n59), .A1N(n76), .B0(n202), .Y(n201) );
  OAI21X1 U178 ( .A0(n77), .A1(n83), .B0(n78), .Y(n76) );
  AOI21X1 U179 ( .A0(n1), .A1(n48), .B0(n49), .Y(n47) );
  XOR2X1 U180 ( .A(n38), .B(n5), .Y(SUM[14]) );
  NOR2X1 U181 ( .A(A[8]), .B(B[8]), .Y(n82) );
  AOI21X1 U182 ( .A0(n1), .A1(n80), .B0(n81), .Y(n79) );
  CLKINVXL U183 ( .A(n75), .Y(n73) );
  CLKINVX2 U184 ( .A(n104), .Y(n102) );
  NOR2X1 U185 ( .A(A[11]), .B(B[11]), .Y(n61) );
  NAND2BXL U186 ( .AN(n61), .B(n62), .Y(n8) );
  AOI21XL U187 ( .A0(n1), .A1(n30), .B0(n31), .Y(n29) );
  OAI21XL U188 ( .A0(n74), .A1(n68), .B0(n69), .Y(n65) );
  CLKINVXL U189 ( .A(n68), .Y(n67) );
  INVX1 U190 ( .A(n52), .Y(n51) );
  OAI21XL U191 ( .A0(n45), .A1(n53), .B0(n46), .Y(n44) );
  NAND2BX1 U192 ( .AN(n45), .B(n46), .Y(n6) );
  NAND2XL U193 ( .A(A[11]), .B(B[11]), .Y(n62) );
  NAND2X1 U194 ( .A(n51), .B(n53), .Y(n7) );
  NAND2BX1 U195 ( .AN(n77), .B(n78), .Y(n10) );
  XNOR2X1 U196 ( .A(n1), .B(n11), .Y(SUM[8]) );
  CLKINVXL U197 ( .A(n96), .Y(n95) );
  OAI21XL U198 ( .A0(n102), .A1(n96), .B0(n97), .Y(n93) );
  NAND2XL U199 ( .A(n95), .B(n97), .Y(n13) );
  BUFX4 U200 ( .A(n84), .Y(n1) );
  NAND2XL U201 ( .A(A[5]), .B(B[5]), .Y(n106) );
  NAND2BX1 U202 ( .AN(n27), .B(n28), .Y(n4) );
  INVX2 U203 ( .A(n113), .Y(n112) );
  INVX2 U204 ( .A(n3), .Y(n55) );
  NOR2X1 U205 ( .A(n73), .B(n68), .Y(n64) );
  NOR2X1 U206 ( .A(n3), .B(n41), .Y(n39) );
  NOR2X1 U207 ( .A(n3), .B(n32), .Y(n30) );
  OAI21X1 U208 ( .A0(n58), .A1(n41), .B0(n42), .Y(n40) );
  INVX2 U209 ( .A(n44), .Y(n42) );
  NOR2X1 U210 ( .A(n3), .B(n52), .Y(n48) );
  NAND2X1 U211 ( .A(n75), .B(n59), .Y(n57) );
  INVX2 U212 ( .A(n43), .Y(n41) );
  NAND2X1 U213 ( .A(n43), .B(n34), .Y(n32) );
  INVX2 U214 ( .A(n76), .Y(n74) );
  NOR2X1 U215 ( .A(n68), .B(n61), .Y(n59) );
  OAI21X1 U216 ( .A0(n58), .A1(n52), .B0(n53), .Y(n49) );
  NOR2X1 U217 ( .A(A[10]), .B(B[10]), .Y(n68) );
  NAND2X1 U218 ( .A(A[10]), .B(B[10]), .Y(n69) );
  OAI21XL U219 ( .A0(n58), .A1(n32), .B0(n33), .Y(n31) );
  INVX2 U220 ( .A(n37), .Y(n35) );
  NOR2X1 U221 ( .A(n82), .B(n77), .Y(n75) );
  INVX2 U222 ( .A(n36), .Y(n34) );
  NOR2X1 U223 ( .A(n101), .B(n96), .Y(n92) );
  INVX2 U224 ( .A(n82), .Y(n80) );
  CLKINVXL U225 ( .A(n83), .Y(n81) );
  INVX2 U226 ( .A(n103), .Y(n101) );
  XOR2X1 U227 ( .A(n54), .B(n7), .Y(SUM[12]) );
  NOR2X1 U228 ( .A(A[12]), .B(B[12]), .Y(n52) );
  NOR2X1 U229 ( .A(A[9]), .B(B[9]), .Y(n77) );
  NAND2X1 U230 ( .A(A[9]), .B(B[9]), .Y(n78) );
  NOR2X1 U231 ( .A(A[14]), .B(B[14]), .Y(n36) );
  NAND2X1 U232 ( .A(A[12]), .B(B[12]), .Y(n53) );
  XOR2X1 U233 ( .A(n70), .B(n9), .Y(SUM[10]) );
  NAND2XL U234 ( .A(n67), .B(n69), .Y(n9) );
  NOR2X1 U235 ( .A(A[7]), .B(B[7]), .Y(n89) );
  NOR2X1 U236 ( .A(n96), .B(n89), .Y(n87) );
  NAND2X1 U237 ( .A(A[14]), .B(B[14]), .Y(n37) );
  NOR2X1 U238 ( .A(A[13]), .B(B[13]), .Y(n45) );
  OAI21XL U239 ( .A0(n89), .A1(n97), .B0(n90), .Y(n88) );
  CLKINVXL U240 ( .A(n89), .Y(n135) );
  NAND2XL U241 ( .A(n80), .B(n83), .Y(n11) );
  NAND2X1 U242 ( .A(A[7]), .B(B[7]), .Y(n90) );
  NAND2X1 U243 ( .A(A[13]), .B(B[13]), .Y(n46) );
  INVX1 U244 ( .A(n20), .Y(SUM[16]) );
  NOR2X1 U245 ( .A(n3), .B(n23), .Y(n21) );
  NOR2X1 U246 ( .A(n110), .B(n105), .Y(n103) );
  OAI21X1 U247 ( .A0(n105), .A1(n111), .B0(n106), .Y(n104) );
  NAND2XL U248 ( .A(n43), .B(n25), .Y(n23) );
  XOR2X1 U249 ( .A(n98), .B(n13), .Y(SUM[6]) );
  XOR2X1 U250 ( .A(n107), .B(n14), .Y(SUM[5]) );
  NAND2X1 U251 ( .A(n137), .B(n106), .Y(n14) );
  INVX2 U252 ( .A(n105), .Y(n137) );
  INVX2 U253 ( .A(n110), .Y(n108) );
  INVX2 U254 ( .A(n111), .Y(n109) );
  XNOR2X1 U255 ( .A(n112), .B(n15), .Y(SUM[4]) );
  NAND2X1 U256 ( .A(n108), .B(n111), .Y(n15) );
  OAI21X1 U257 ( .A0(n113), .A1(n85), .B0(n86), .Y(n84) );
  NAND2XL U258 ( .A(n103), .B(n87), .Y(n85) );
  NOR2X1 U259 ( .A(A[6]), .B(B[6]), .Y(n96) );
  NAND2X1 U260 ( .A(A[6]), .B(B[6]), .Y(n97) );
  OAI21XL U261 ( .A0(n58), .A1(n23), .B0(n24), .Y(n22) );
  OAI21XL U262 ( .A0(n27), .A1(n37), .B0(n28), .Y(n26) );
  NOR2X1 U263 ( .A(n36), .B(n27), .Y(n25) );
  NOR2X1 U264 ( .A(A[4]), .B(B[4]), .Y(n110) );
  NAND2X1 U265 ( .A(A[4]), .B(B[4]), .Y(n111) );
  NOR2X1 U266 ( .A(A[3]), .B(B[3]), .Y(n116) );
  NAND2X1 U267 ( .A(A[3]), .B(B[3]), .Y(n117) );
  NOR2X1 U268 ( .A(A[2]), .B(B[2]), .Y(n119) );
  XNOR2X1 U269 ( .A(n118), .B(n16), .Y(SUM[3]) );
  OAI21X1 U270 ( .A0(n121), .A1(n119), .B0(n120), .Y(n118) );
  NAND2X1 U271 ( .A(n139), .B(n117), .Y(n16) );
  INVX2 U272 ( .A(n116), .Y(n139) );
  NAND2X1 U273 ( .A(A[2]), .B(B[2]), .Y(n120) );
  XOR2X1 U274 ( .A(n121), .B(n17), .Y(SUM[2]) );
  NAND2X1 U275 ( .A(n140), .B(n120), .Y(n17) );
  INVX2 U276 ( .A(n119), .Y(n140) );
  NOR2X1 U277 ( .A(A[15]), .B(B[15]), .Y(n27) );
  NAND2X1 U278 ( .A(A[15]), .B(B[15]), .Y(n28) );
  OAI21XL U279 ( .A0(n116), .A1(n120), .B0(n117), .Y(n115) );
  NOR2X1 U280 ( .A(n119), .B(n116), .Y(n114) );
  NOR2X1 U281 ( .A(A[1]), .B(B[1]), .Y(n123) );
  NAND2X1 U282 ( .A(A[1]), .B(B[1]), .Y(n124) );
  INVX2 U283 ( .A(n122), .Y(n121) );
  OAI21X1 U284 ( .A0(n123), .A1(n126), .B0(n124), .Y(n122) );
  XOR2X1 U285 ( .A(n18), .B(n126), .Y(SUM[1]) );
  NAND2X1 U286 ( .A(n141), .B(n124), .Y(n18) );
  INVX2 U287 ( .A(n123), .Y(n141) );
  NAND2X1 U288 ( .A(A[0]), .B(B[0]), .Y(n126) );
endmodule


module SNN_DW_mult_uns_13 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n3, n6, n8, n11, n12, n13, n14, n17, n18, n26, n27, n29, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n44, n45, n46, n49, n50,
         n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78, n79, n80, n81,
         n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98, n99, n100,
         n102, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n220, n223, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n270, n271, n272, n274, n275, n276, n277, n278, n279,
         n280, n281, n283, n284, n285, n286, n287, n288, n289, n291, n292,
         n293, n294, n295, n296, n297, n298, n335, n336, n337, n338, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351;

  AOI21X1 U7 ( .A0(n32), .A1(n348), .B0(n350), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n335), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n52), .A1(n35), .B0(n36), .Y(n34) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n51), .B0(n52), .Y(n46) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  AOI21X1 U68 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  AOI21X1 U89 ( .A0(n78), .A1(n336), .B0(n75), .Y(n73) );
  AOI21X1 U103 ( .A0(n337), .A1(n86), .B0(n83), .Y(n81) );
  XOR3X2 U121 ( .A(n109), .B(n174), .C(n179), .Y(n106) );
  OAI22X1 U167 ( .A0(n346), .A1(n277), .B0(n278), .B1(n233), .Y(n170) );
  OAI22X1 U170 ( .A0(n346), .A1(n225), .B0(n278), .B1(n294), .Y(n180) );
  OAI22X1 U171 ( .A0(n346), .A1(n226), .B0(n225), .B1(n278), .Y(n181) );
  OAI22X1 U172 ( .A0(n346), .A1(n227), .B0(n226), .B1(n278), .Y(n182) );
  OAI22X1 U173 ( .A0(n346), .A1(n228), .B0(n227), .B1(n278), .Y(n183) );
  OAI22X1 U174 ( .A0(n346), .A1(n229), .B0(n228), .B1(n278), .Y(n184) );
  OAI22X1 U175 ( .A0(n346), .A1(n230), .B0(n229), .B1(n278), .Y(n185) );
  OAI22X1 U176 ( .A0(n346), .A1(n231), .B0(n230), .B1(n278), .Y(n186) );
  OAI22X1 U177 ( .A0(n346), .A1(n232), .B0(n231), .B1(n278), .Y(n187) );
  OAI22X1 U188 ( .A0(n274), .A1(n283), .B0(n279), .B1(n242), .Y(n171) );
  OAI22X1 U191 ( .A0(n274), .A1(n234), .B0(n279), .B1(n283), .Y(n190) );
  OAI22X1 U192 ( .A0(n274), .A1(n235), .B0(n234), .B1(n279), .Y(n191) );
  OAI22X1 U193 ( .A0(n274), .A1(n236), .B0(n235), .B1(n279), .Y(n192) );
  OAI22X1 U194 ( .A0(n274), .A1(n237), .B0(n236), .B1(n279), .Y(n193) );
  OAI22X1 U195 ( .A0(n274), .A1(n238), .B0(n237), .B1(n279), .Y(n194) );
  OAI22X1 U196 ( .A0(n274), .A1(n239), .B0(n238), .B1(n279), .Y(n195) );
  OAI22X1 U197 ( .A0(n274), .A1(n240), .B0(n239), .B1(n279), .Y(n196) );
  OAI22X1 U198 ( .A0(n274), .A1(n241), .B0(n240), .B1(n279), .Y(n197) );
  OAI22X1 U209 ( .A0(n275), .A1(n284), .B0(n280), .B1(n251), .Y(n172) );
  OAI22X1 U212 ( .A0(n275), .A1(n243), .B0(n280), .B1(n284), .Y(n200) );
  OAI22X1 U213 ( .A0(n275), .A1(n244), .B0(n243), .B1(n280), .Y(n201) );
  OAI22X1 U214 ( .A0(n275), .A1(n245), .B0(n244), .B1(n280), .Y(n202) );
  OAI22X1 U215 ( .A0(n275), .A1(n246), .B0(n245), .B1(n280), .Y(n203) );
  OAI22X1 U216 ( .A0(n275), .A1(n247), .B0(n246), .B1(n280), .Y(n204) );
  OAI22X1 U217 ( .A0(n275), .A1(n248), .B0(n247), .B1(n280), .Y(n205) );
  OAI22X1 U218 ( .A0(n275), .A1(n249), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n275), .A1(n250), .B0(n249), .B1(n280), .Y(n207) );
  OAI22X1 U230 ( .A0(n276), .A1(n285), .B0(n260), .B1(n281), .Y(n173) );
  OAI22X1 U233 ( .A0(n276), .A1(n252), .B0(n285), .B1(n281), .Y(n210) );
  OAI22X1 U235 ( .A0(n276), .A1(n254), .B0(n253), .B1(n281), .Y(n212) );
  OAI22X1 U236 ( .A0(n276), .A1(n255), .B0(n254), .B1(n281), .Y(n213) );
  OAI22X1 U237 ( .A0(n276), .A1(n256), .B0(n255), .B1(n281), .Y(n214) );
  OAI22X1 U238 ( .A0(n276), .A1(n257), .B0(n256), .B1(n281), .Y(n215) );
  OAI22X1 U239 ( .A0(n276), .A1(n258), .B0(n257), .B1(n281), .Y(n216) );
  OAI22X1 U240 ( .A0(n276), .A1(n259), .B0(n258), .B1(n281), .Y(n217) );
  XNOR2X1 U291 ( .A(a[6]), .B(a[5]), .Y(n295) );
  ADDFX2 U292 ( .A(n178), .B(n210), .CI(n202), .CO(n146), .S(n147) );
  ADDFX2 U293 ( .A(n134), .B(n209), .CI(n201), .CO(n139), .S(n140) );
  ADDFX2 U294 ( .A(n198), .B(n214), .CI(n206), .CO(n162), .S(n163) );
  XNOR2X1 U295 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U296 ( .A(n98), .B(n65), .Y(n8) );
  NAND2X1 U297 ( .A(n96), .B(n54), .Y(n6) );
  XNOR2X1 U298 ( .A(n46), .B(n349), .Y(product[11]) );
  AND2X1 U299 ( .A(n95), .B(n45), .Y(n349) );
  INVX2 U300 ( .A(n44), .Y(n95) );
  INVX2 U301 ( .A(n67), .Y(n99) );
  ADDFX2 U302 ( .A(n188), .B(n212), .CI(n196), .CO(n156), .S(n157) );
  BUFX2 U303 ( .A(n292), .Y(n275) );
  NOR2X1 U304 ( .A(n216), .B(n208), .Y(n87) );
  NOR2X1 U305 ( .A(n44), .B(n37), .Y(n35) );
  ADDFX2 U306 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  ADDFX2 U307 ( .A(n140), .B(n144), .CI(n138), .CO(n135), .S(n136) );
  ADDFX2 U308 ( .A(n126), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  ADDFX2 U309 ( .A(n139), .B(n137), .CI(n130), .CO(n127), .S(n128) );
  NAND2X1 U310 ( .A(n136), .B(n142), .Y(n59) );
  NOR2X1 U311 ( .A(n143), .B(n148), .Y(n64) );
  ADDFX2 U312 ( .A(n153), .B(n156), .CI(n151), .CO(n148), .S(n149) );
  NOR2X1 U313 ( .A(n121), .B(n116), .Y(n37) );
  NOR2X1 U314 ( .A(n128), .B(n135), .Y(n53) );
  NOR2X1 U315 ( .A(n149), .B(n154), .Y(n67) );
  OR2X1 U316 ( .A(n115), .B(n112), .Y(n335) );
  OR2X1 U317 ( .A(n159), .B(n162), .Y(n336) );
  OR2X1 U318 ( .A(n165), .B(n207), .Y(n337) );
  OR2X1 U319 ( .A(n111), .B(n108), .Y(n338) );
  NOR2X1 U320 ( .A(n53), .B(n58), .Y(n51) );
  NOR2X1 U321 ( .A(n136), .B(n142), .Y(n58) );
  NOR2X1 U322 ( .A(n122), .B(n127), .Y(n44) );
  AND2X1 U323 ( .A(n345), .B(n90), .Y(product[1]) );
  INVX2 U324 ( .A(n51), .Y(n49) );
  OAI21X1 U325 ( .A0(n53), .A1(n59), .B0(n54), .Y(n52) );
  NAND2X1 U326 ( .A(n99), .B(n68), .Y(n341) );
  XOR2X1 U327 ( .A(n69), .B(n341), .Y(product[7]) );
  NAND2X1 U328 ( .A(n128), .B(n135), .Y(n54) );
  XNOR2X1 U329 ( .A(n39), .B(n340), .Y(product[12]) );
  NAND2X1 U330 ( .A(n143), .B(n148), .Y(n65) );
  NOR2X1 U331 ( .A(n163), .B(n164), .Y(n79) );
  ADDFX2 U332 ( .A(n170), .B(n187), .CI(n203), .CO(n150), .S(n151) );
  BUFX2 U333 ( .A(n295), .Y(n278) );
  ADDFX2 U334 ( .A(n193), .B(n185), .CI(n146), .CO(n137), .S(n138) );
  BUFX2 U335 ( .A(n293), .Y(n276) );
  BUFX2 U336 ( .A(a[1]), .Y(n289) );
  ADDHXL U337 ( .A(n215), .B(n172), .CO(n164), .S(n165) );
  NAND2X1 U338 ( .A(n295), .B(n347), .Y(n346) );
  XOR2X1 U339 ( .A(n55), .B(n6), .Y(product[10]) );
  NOR2X1 U340 ( .A(n64), .B(n67), .Y(n62) );
  AND2X1 U341 ( .A(n94), .B(n38), .Y(n340) );
  CLKINVXL U342 ( .A(n70), .Y(n69) );
  CLKINVXL U343 ( .A(n64), .Y(n98) );
  OAI21XL U344 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  XOR2X1 U345 ( .A(n60), .B(n342), .Y(product[9]) );
  AND2X1 U346 ( .A(n97), .B(n59), .Y(n342) );
  CLKINVXL U347 ( .A(n59), .Y(n57) );
  XOR2X1 U348 ( .A(n27), .B(n343), .Y(product[14]) );
  NAND2X1 U349 ( .A(n338), .B(n26), .Y(n343) );
  INVX1 U350 ( .A(n77), .Y(n75) );
  NAND2X1 U351 ( .A(n149), .B(n154), .Y(n68) );
  XNOR2XL U352 ( .A(n344), .B(n73), .Y(product[6]) );
  AND2X1 U353 ( .A(n100), .B(n72), .Y(n344) );
  INVX1 U354 ( .A(n85), .Y(n83) );
  NAND2XL U355 ( .A(n104), .B(n88), .Y(n14) );
  OAI22XL U356 ( .A0(n276), .A1(n253), .B0(n252), .B1(n281), .Y(n211) );
  CMPR32X1 U357 ( .A(n177), .B(n134), .C(n200), .CO(n131), .S(n132) );
  NAND2XL U358 ( .A(n163), .B(n164), .Y(n80) );
  NAND2X1 U359 ( .A(n217), .B(n173), .Y(n90) );
  CLKINVXL U360 ( .A(n288), .Y(n284) );
  XOR2X1 U361 ( .A(n18), .B(n1), .Y(product[15]) );
  OR2XL U362 ( .A(n217), .B(n173), .Y(n345) );
  CMPR32X1 U363 ( .A(n171), .B(n205), .C(n161), .CO(n158), .S(n159) );
  XOR2XL U364 ( .A(a[0]), .B(a[1]), .Y(n272) );
  XNOR2XL U365 ( .A(a[2]), .B(a[1]), .Y(n297) );
  NAND2XL U366 ( .A(n297), .B(n271), .Y(n292) );
  XOR2XL U367 ( .A(a[2]), .B(a[3]), .Y(n271) );
  XOR2X1 U368 ( .A(a[6]), .B(a[7]), .Y(n347) );
  XNOR2X1 U369 ( .A(n261), .B(n288), .Y(n243) );
  CLKINVXL U370 ( .A(a[0]), .Y(n298) );
  XNOR2XL U371 ( .A(n265), .B(n289), .Y(n256) );
  NAND2BXL U372 ( .AN(n268), .B(n288), .Y(n251) );
  XNOR2XL U373 ( .A(n266), .B(n289), .Y(n257) );
  XNOR2XL U374 ( .A(a[4]), .B(a[3]), .Y(n296) );
  BUFX2 U375 ( .A(n291), .Y(n274) );
  NAND2X1 U376 ( .A(n296), .B(n270), .Y(n291) );
  XNOR2X1 U377 ( .A(n267), .B(n287), .Y(n240) );
  NOR2BX1 U378 ( .AN(n265), .B(n277), .Y(n176) );
  INVX2 U379 ( .A(n61), .Y(n60) );
  CLKINVXL U380 ( .A(n53), .Y(n96) );
  INVX2 U381 ( .A(n52), .Y(n50) );
  NOR2X1 U382 ( .A(n49), .B(n44), .Y(n40) );
  AND2X1 U383 ( .A(n335), .B(n338), .Y(n348) );
  OAI21X1 U384 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  INVX2 U385 ( .A(n37), .Y(n94) );
  CLKINVXL U386 ( .A(n58), .Y(n97) );
  OAI21XL U387 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  NAND2XL U388 ( .A(n51), .B(n35), .Y(n33) );
  XNOR2X1 U389 ( .A(n32), .B(n3), .Y(product[13]) );
  NAND2X1 U390 ( .A(n335), .B(n31), .Y(n3) );
  OAI21XL U391 ( .A0(n50), .A1(n44), .B0(n45), .Y(n41) );
  OAI21XL U392 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  INVX2 U393 ( .A(n31), .Y(n29) );
  OAI2BB1X1 U394 ( .A0N(n338), .A1N(n29), .B0(n26), .Y(n350) );
  OAI21X1 U395 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  OAI21X1 U396 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  OAI21X1 U397 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  INVX2 U398 ( .A(n71), .Y(n100) );
  XNOR2XL U399 ( .A(n11), .B(n78), .Y(product[5]) );
  NAND2X1 U400 ( .A(n336), .B(n77), .Y(n11) );
  XOR2XL U401 ( .A(n12), .B(n81), .Y(product[4]) );
  NAND2X1 U402 ( .A(n102), .B(n80), .Y(n12) );
  INVX2 U403 ( .A(n79), .Y(n102) );
  NAND2X1 U404 ( .A(n122), .B(n127), .Y(n45) );
  NAND2XL U405 ( .A(n121), .B(n116), .Y(n38) );
  XNOR2XL U406 ( .A(n13), .B(n86), .Y(product[3]) );
  NAND2X1 U407 ( .A(n337), .B(n85), .Y(n13) );
  NAND2X1 U408 ( .A(n115), .B(n112), .Y(n31) );
  XOR2X1 U409 ( .A(n14), .B(n90), .Y(product[2]) );
  CLKINVXL U410 ( .A(n87), .Y(n104) );
  NAND2X1 U411 ( .A(n111), .B(n108), .Y(n26) );
  NAND2X1 U412 ( .A(n165), .B(n207), .Y(n85) );
  BUFX2 U413 ( .A(n297), .Y(n280) );
  BUFX2 U414 ( .A(n298), .Y(n281) );
  NAND2X1 U415 ( .A(n159), .B(n162), .Y(n77) );
  BUFX2 U416 ( .A(n296), .Y(n279) );
  NAND2X1 U417 ( .A(n216), .B(n208), .Y(n88) );
  INVX2 U418 ( .A(n289), .Y(n285) );
  ADDFX2 U419 ( .A(n147), .B(n150), .CI(n145), .CO(n142), .S(n143) );
  ADDFX1 U420 ( .A(n194), .B(n186), .CI(n152), .CO(n144), .S(n145) );
  ADDHXL U421 ( .A(n211), .B(n195), .CO(n152), .S(n153) );
  NOR2X1 U422 ( .A(n155), .B(n158), .Y(n71) );
  ADDFX1 U423 ( .A(n204), .B(n160), .CI(n157), .CO(n154), .S(n155) );
  NOR2X1 U424 ( .A(n223), .B(n277), .Y(n177) );
  INVX2 U425 ( .A(n133), .Y(n134) );
  CMPR32X1 U426 ( .A(n192), .B(n184), .C(n132), .CO(n129), .S(n130) );
  NAND2X1 U427 ( .A(n155), .B(n158), .Y(n72) );
  INVX2 U428 ( .A(n287), .Y(n283) );
  OAI2BB1X1 U429 ( .A0N(n281), .A1N(n276), .B0(n289), .Y(n209) );
  NAND2X1 U430 ( .A(n351), .B(n17), .Y(n1) );
  NAND2X1 U431 ( .A(n107), .B(n106), .Y(n17) );
  CMPR32X1 U432 ( .A(n183), .B(n199), .C(n131), .CO(n123), .S(n124) );
  OAI2BB1X1 U433 ( .A0N(n280), .A1N(n275), .B0(n288), .Y(n199) );
  ADDFX2 U434 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  INVX2 U435 ( .A(n119), .Y(n120) );
  ADDFX2 U436 ( .A(n189), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  OAI2BB1X1 U437 ( .A0N(n279), .A1N(n274), .B0(n287), .Y(n189) );
  ADDFX2 U438 ( .A(n110), .B(n180), .CI(n113), .CO(n107), .S(n108) );
  INVX2 U439 ( .A(n109), .Y(n110) );
  OR2X1 U440 ( .A(n107), .B(n106), .Y(n351) );
  NAND2X1 U441 ( .A(n272), .B(n298), .Y(n293) );
  ADDHXL U442 ( .A(n213), .B(n197), .CO(n160), .S(n161) );
  XNOR2X1 U443 ( .A(n268), .B(n287), .Y(n241) );
  NAND2BX1 U444 ( .AN(n268), .B(n287), .Y(n242) );
  XNOR2XL U445 ( .A(n263), .B(n289), .Y(n254) );
  XNOR2XL U446 ( .A(n264), .B(n289), .Y(n255) );
  BUFX2 U447 ( .A(a[3]), .Y(n288) );
  XOR2X1 U448 ( .A(a[4]), .B(a[5]), .Y(n270) );
  XNOR2XL U449 ( .A(n268), .B(n288), .Y(n250) );
  XNOR2XL U450 ( .A(n267), .B(n289), .Y(n258) );
  XNOR2XL U451 ( .A(n268), .B(n289), .Y(n259) );
  NAND2BXL U452 ( .AN(n268), .B(n289), .Y(n260) );
  XNOR2XL U453 ( .A(n267), .B(n288), .Y(n249) );
  NOR2BXL U454 ( .AN(n268), .B(n279), .Y(n198) );
  NOR2BXL U455 ( .AN(n268), .B(n280), .Y(n208) );
  XNOR2XL U456 ( .A(n265), .B(n288), .Y(n247) );
  XNOR2XL U457 ( .A(n266), .B(n288), .Y(n248) );
  XNOR2XL U458 ( .A(n261), .B(n289), .Y(n252) );
  XNOR2XL U459 ( .A(n262), .B(n289), .Y(n253) );
  BUFX2 U460 ( .A(a[5]), .Y(n287) );
  NOR2BX1 U461 ( .AN(n268), .B(n277), .Y(n178) );
  NOR2BXL U462 ( .AN(n268), .B(n278), .Y(n188) );
  XNOR2XL U463 ( .A(n262), .B(n288), .Y(n244) );
  XNOR2XL U464 ( .A(n263), .B(n288), .Y(n245) );
  XNOR2XL U465 ( .A(n265), .B(n287), .Y(n238) );
  XNOR2XL U466 ( .A(n264), .B(n288), .Y(n246) );
  XNOR2XL U467 ( .A(n266), .B(n287), .Y(n239) );
  XNOR2XL U468 ( .A(n264), .B(n287), .Y(n237) );
  XNOR2XL U469 ( .A(n263), .B(n287), .Y(n236) );
  XNOR2XL U470 ( .A(n262), .B(n287), .Y(n235) );
  ADDFX2 U471 ( .A(n133), .B(n176), .CI(n191), .CO(n125), .S(n126) );
  XNOR2XL U472 ( .A(n261), .B(n287), .Y(n234) );
  ADDFX2 U473 ( .A(n119), .B(n175), .CI(n181), .CO(n113), .S(n114) );
  NOR2X1 U474 ( .A(n220), .B(n277), .Y(n175) );
  INVX2 U475 ( .A(n263), .Y(n220) );
  BUFX2 U476 ( .A(a[7]), .Y(n286) );
  XNOR2X1 U477 ( .A(n267), .B(n286), .Y(n231) );
  XNOR2X1 U478 ( .A(n266), .B(n286), .Y(n230) );
  XNOR2X1 U479 ( .A(n268), .B(n286), .Y(n232) );
  XNOR2X1 U480 ( .A(n264), .B(n286), .Y(n228) );
  XNOR2X1 U481 ( .A(n265), .B(n286), .Y(n229) );
  NAND2BX1 U482 ( .AN(n268), .B(n286), .Y(n233) );
  NOR2BX1 U483 ( .AN(n267), .B(n277), .Y(n133) );
  BUFX2 U484 ( .A(n294), .Y(n277) );
  INVX2 U485 ( .A(a[7]), .Y(n294) );
  XNOR2X1 U486 ( .A(n263), .B(n286), .Y(n227) );
  XNOR2X1 U487 ( .A(n262), .B(n286), .Y(n226) );
  NOR2BX1 U488 ( .AN(n264), .B(n277), .Y(n119) );
  INVX2 U489 ( .A(n266), .Y(n223) );
  XNOR2X1 U490 ( .A(n261), .B(n286), .Y(n225) );
  NOR2BXL U491 ( .AN(n268), .B(n281), .Y(product[0]) );
  NOR2X1 U492 ( .A(n218), .B(n277), .Y(n174) );
  OAI2BB1X1 U493 ( .A0N(n278), .A1N(n346), .B0(n286), .Y(n179) );
  INVX2 U494 ( .A(n261), .Y(n218) );
  NOR2BX1 U495 ( .AN(n262), .B(n277), .Y(n109) );
  BUFX2 U496 ( .A(b[3]), .Y(n265) );
  BUFX2 U497 ( .A(b[2]), .Y(n266) );
  BUFX2 U498 ( .A(b[0]), .Y(n268) );
  BUFX2 U499 ( .A(b[5]), .Y(n263) );
  BUFX2 U500 ( .A(b[4]), .Y(n264) );
  BUFX2 U501 ( .A(b[1]), .Y(n267) );
  BUFX2 U502 ( .A(b[7]), .Y(n261) );
  BUFX2 U503 ( .A(b[6]), .Y(n262) );
endmodule


module SNN_DW_mult_uns_14 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n6, n8, n11, n13, n14, n17, n18, n26, n27, n29, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n44, n45, n46, n49, n50,
         n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n75, n77, n78, n79, n80, n81,
         n83, n85, n86, n87, n88, n90, n94, n95, n96, n97, n98, n99, n100,
         n102, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n223,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n273, n274, n276, n277, n278, n279, n280, n281, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n293, n294, n295,
         n296, n297, n298, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n348, n349, n350, n351, n352;

  AOI21X1 U7 ( .A0(n32), .A1(n350), .B0(n351), .Y(n18) );
  AOI21X1 U19 ( .A0(n32), .A1(n335), .B0(n29), .Y(n27) );
  AOI21X1 U29 ( .A0(n52), .A1(n35), .B0(n36), .Y(n34) );
  AOI21X1 U37 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  AOI21X1 U47 ( .A0(n60), .A1(n51), .B0(n52), .Y(n46) );
  AOI21X1 U59 ( .A0(n60), .A1(n97), .B0(n57), .Y(n55) );
  AOI21X1 U68 ( .A0(n62), .A1(n70), .B0(n63), .Y(n61) );
  AOI21X1 U89 ( .A0(n78), .A1(n336), .B0(n75), .Y(n73) );
  NOR2X2 U100 ( .A(n163), .B(n164), .Y(n79) );
  AOI21X1 U103 ( .A0(n337), .A1(n86), .B0(n83), .Y(n81) );
  XOR3X2 U121 ( .A(n109), .B(n174), .C(n179), .Y(n106) );
  OAI22X1 U167 ( .A0(n273), .A1(n277), .B0(n278), .B1(n233), .Y(n170) );
  OAI22X1 U170 ( .A0(n273), .A1(n225), .B0(n278), .B1(n294), .Y(n180) );
  OAI22X1 U171 ( .A0(n273), .A1(n226), .B0(n225), .B1(n278), .Y(n181) );
  OAI22X1 U172 ( .A0(n273), .A1(n227), .B0(n226), .B1(n278), .Y(n182) );
  OAI22X1 U173 ( .A0(n273), .A1(n228), .B0(n227), .B1(n278), .Y(n183) );
  OAI22X1 U174 ( .A0(n273), .A1(n229), .B0(n228), .B1(n278), .Y(n184) );
  OAI22X1 U175 ( .A0(n273), .A1(n230), .B0(n229), .B1(n278), .Y(n185) );
  OAI22X1 U176 ( .A0(n273), .A1(n231), .B0(n230), .B1(n278), .Y(n186) );
  OAI22X1 U177 ( .A0(n273), .A1(n232), .B0(n231), .B1(n278), .Y(n187) );
  OAI22X1 U188 ( .A0(n274), .A1(n283), .B0(n279), .B1(n242), .Y(n171) );
  OAI22X1 U191 ( .A0(n274), .A1(n234), .B0(n279), .B1(n283), .Y(n190) );
  OAI22X1 U192 ( .A0(n274), .A1(n235), .B0(n234), .B1(n279), .Y(n191) );
  OAI22X1 U193 ( .A0(n274), .A1(n236), .B0(n235), .B1(n279), .Y(n192) );
  OAI22X1 U194 ( .A0(n274), .A1(n237), .B0(n236), .B1(n279), .Y(n193) );
  OAI22X1 U195 ( .A0(n274), .A1(n238), .B0(n237), .B1(n279), .Y(n194) );
  OAI22X1 U196 ( .A0(n274), .A1(n239), .B0(n238), .B1(n279), .Y(n195) );
  OAI22X1 U197 ( .A0(n274), .A1(n240), .B0(n239), .B1(n279), .Y(n196) );
  OAI22X1 U198 ( .A0(n274), .A1(n241), .B0(n240), .B1(n279), .Y(n197) );
  OAI22X1 U209 ( .A0(n338), .A1(n284), .B0(n280), .B1(n251), .Y(n172) );
  OAI22X1 U212 ( .A0(n338), .A1(n243), .B0(n280), .B1(n284), .Y(n200) );
  OAI22X1 U213 ( .A0(n338), .A1(n244), .B0(n243), .B1(n280), .Y(n201) );
  OAI22X1 U214 ( .A0(n338), .A1(n245), .B0(n244), .B1(n280), .Y(n202) );
  OAI22X1 U216 ( .A0(n338), .A1(n247), .B0(n246), .B1(n280), .Y(n204) );
  OAI22X1 U217 ( .A0(n338), .A1(n248), .B0(n247), .B1(n280), .Y(n205) );
  OAI22X1 U218 ( .A0(n338), .A1(n249), .B0(n248), .B1(n280), .Y(n206) );
  OAI22X1 U219 ( .A0(n338), .A1(n250), .B0(n249), .B1(n280), .Y(n207) );
  OAI22X1 U230 ( .A0(n276), .A1(n285), .B0(n260), .B1(n281), .Y(n173) );
  OAI22X1 U233 ( .A0(n276), .A1(n252), .B0(n285), .B1(n281), .Y(n210) );
  OAI22X1 U234 ( .A0(n276), .A1(n253), .B0(n252), .B1(n281), .Y(n211) );
  OAI22X1 U235 ( .A0(n276), .A1(n254), .B0(n253), .B1(n281), .Y(n212) );
  OAI22X1 U236 ( .A0(n276), .A1(n255), .B0(n254), .B1(n281), .Y(n213) );
  OAI22X1 U237 ( .A0(n276), .A1(n256), .B0(n255), .B1(n281), .Y(n214) );
  OAI22X1 U238 ( .A0(n276), .A1(n257), .B0(n256), .B1(n281), .Y(n215) );
  OAI22X1 U239 ( .A0(n276), .A1(n258), .B0(n257), .B1(n281), .Y(n216) );
  OAI22X1 U240 ( .A0(n276), .A1(n259), .B0(n258), .B1(n281), .Y(n217) );
  XNOR2XL U291 ( .A(n265), .B(n289), .Y(n256) );
  CMPR32X1 U292 ( .A(n171), .B(n205), .C(n161), .CO(n158), .S(n159) );
  ADDFX2 U293 ( .A(n126), .B(n129), .CI(n124), .CO(n121), .S(n122) );
  NOR2X1 U294 ( .A(n121), .B(n116), .Y(n37) );
  XNOR2X1 U295 ( .A(n66), .B(n8), .Y(product[8]) );
  NAND2X1 U296 ( .A(n98), .B(n65), .Y(n8) );
  NAND2XL U297 ( .A(n96), .B(n54), .Y(n6) );
  CLKINVXL U298 ( .A(n44), .Y(n95) );
  CLKINVXL U299 ( .A(n67), .Y(n99) );
  ADDFX2 U300 ( .A(n193), .B(n185), .CI(n146), .CO(n137), .S(n138) );
  ADDFX2 U301 ( .A(n134), .B(n209), .CI(n201), .CO(n139), .S(n140) );
  ADDFX2 U302 ( .A(n198), .B(n214), .CI(n206), .CO(n162), .S(n163) );
  ADDFX2 U303 ( .A(n188), .B(n212), .CI(n196), .CO(n156), .S(n157) );
  NOR2X1 U304 ( .A(n216), .B(n208), .Y(n87) );
  NAND2X1 U305 ( .A(n217), .B(n173), .Y(n90) );
  ADDFX2 U306 ( .A(n125), .B(n118), .CI(n123), .CO(n115), .S(n116) );
  ADDFX2 U307 ( .A(n140), .B(n144), .CI(n138), .CO(n135), .S(n136) );
  ADDFX2 U308 ( .A(n139), .B(n137), .CI(n130), .CO(n127), .S(n128) );
  NAND2X1 U309 ( .A(n136), .B(n142), .Y(n59) );
  NOR2X1 U310 ( .A(n143), .B(n148), .Y(n64) );
  NAND2X1 U311 ( .A(n143), .B(n148), .Y(n65) );
  ADDFX2 U312 ( .A(n153), .B(n156), .CI(n151), .CO(n148), .S(n149) );
  INVX2 U313 ( .A(n79), .Y(n102) );
  NOR2X1 U314 ( .A(n128), .B(n135), .Y(n53) );
  NOR2X1 U315 ( .A(n149), .B(n154), .Y(n67) );
  INVX2 U316 ( .A(n71), .Y(n100) );
  INVX2 U317 ( .A(n37), .Y(n94) );
  OR2X1 U318 ( .A(n115), .B(n112), .Y(n335) );
  OR2X1 U319 ( .A(n159), .B(n162), .Y(n336) );
  OR2X1 U320 ( .A(n165), .B(n207), .Y(n337) );
  NAND2X1 U321 ( .A(n297), .B(n349), .Y(n338) );
  OR2X1 U322 ( .A(n111), .B(n108), .Y(n339) );
  NOR2X1 U323 ( .A(n53), .B(n58), .Y(n51) );
  NOR2X1 U324 ( .A(n136), .B(n142), .Y(n58) );
  NOR2X1 U325 ( .A(n122), .B(n127), .Y(n44) );
  OR2X1 U326 ( .A(n217), .B(n173), .Y(n340) );
  XOR2X1 U327 ( .A(n46), .B(n341), .Y(product[11]) );
  NAND2X1 U328 ( .A(n95), .B(n45), .Y(n341) );
  NAND2X1 U329 ( .A(n128), .B(n135), .Y(n54) );
  ADDFX2 U330 ( .A(n170), .B(n187), .CI(n203), .CO(n150), .S(n151) );
  NAND2BX1 U331 ( .AN(n348), .B(n298), .Y(n293) );
  ADDHXL U332 ( .A(n215), .B(n172), .CO(n164), .S(n165) );
  NAND2XL U333 ( .A(n99), .B(n68), .Y(n344) );
  CLKINVXL U334 ( .A(n59), .Y(n57) );
  NAND2XL U335 ( .A(n337), .B(n85), .Y(n13) );
  NAND2XL U336 ( .A(n100), .B(n72), .Y(n345) );
  XOR2XL U337 ( .A(n345), .B(n73), .Y(product[6]) );
  NAND2XL U338 ( .A(n102), .B(n80), .Y(n346) );
  XOR2XL U339 ( .A(n346), .B(n81), .Y(product[4]) );
  OAI22XL U340 ( .A0(n338), .A1(n246), .B0(n245), .B1(n280), .Y(n203) );
  XNOR2X1 U341 ( .A(a[0]), .B(a[1]), .Y(n348) );
  XNOR2X1 U342 ( .A(a[2]), .B(a[1]), .Y(n297) );
  XNOR2XL U343 ( .A(n261), .B(n289), .Y(n252) );
  CLKINVX2 U344 ( .A(n52), .Y(n50) );
  XOR2X1 U345 ( .A(n55), .B(n6), .Y(product[10]) );
  NOR2X1 U346 ( .A(n64), .B(n67), .Y(n62) );
  XOR2X1 U347 ( .A(n60), .B(n342), .Y(product[9]) );
  AND2X1 U348 ( .A(n97), .B(n59), .Y(n342) );
  XOR2X1 U349 ( .A(n39), .B(n343), .Y(product[12]) );
  NAND2X1 U350 ( .A(n94), .B(n38), .Y(n343) );
  XOR2X1 U351 ( .A(n69), .B(n344), .Y(product[7]) );
  NAND2X1 U352 ( .A(n335), .B(n31), .Y(n3) );
  NAND2X1 U353 ( .A(n149), .B(n154), .Y(n68) );
  NAND2X1 U354 ( .A(n336), .B(n77), .Y(n11) );
  ADDFX2 U355 ( .A(n120), .B(n190), .CI(n182), .CO(n117), .S(n118) );
  XOR2X1 U356 ( .A(n18), .B(n1), .Y(product[15]) );
  AND2X1 U357 ( .A(n340), .B(n90), .Y(product[1]) );
  ADDFHX1 U358 ( .A(n178), .B(n210), .CI(n202), .CO(n146), .S(n147) );
  ADDHXL U359 ( .A(n213), .B(n197), .CO(n160), .S(n161) );
  BUFX2 U360 ( .A(n291), .Y(n274) );
  NAND2X1 U361 ( .A(n296), .B(n270), .Y(n291) );
  XOR2X1 U362 ( .A(a[2]), .B(a[3]), .Y(n349) );
  XNOR2XL U363 ( .A(n266), .B(n289), .Y(n257) );
  BUFX2 U364 ( .A(n290), .Y(n273) );
  NAND2X1 U365 ( .A(n295), .B(n269), .Y(n290) );
  NOR2BX1 U366 ( .AN(n265), .B(n277), .Y(n176) );
  XNOR2X1 U367 ( .A(n267), .B(n287), .Y(n240) );
  NOR2BX1 U368 ( .AN(n263), .B(n277), .Y(n175) );
  NOR2BX1 U369 ( .AN(n261), .B(n277), .Y(n174) );
  INVX2 U370 ( .A(n61), .Y(n60) );
  CLKINVXL U371 ( .A(n53), .Y(n96) );
  CLKINVX2 U372 ( .A(n51), .Y(n49) );
  NOR2X1 U373 ( .A(n49), .B(n44), .Y(n40) );
  AND2X1 U374 ( .A(n335), .B(n339), .Y(n350) );
  OAI21X1 U375 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  CLKINVXL U376 ( .A(n58), .Y(n97) );
  XOR2X1 U377 ( .A(n27), .B(n2), .Y(product[14]) );
  NAND2X1 U378 ( .A(n339), .B(n26), .Y(n2) );
  OAI21XL U379 ( .A0(n33), .A1(n61), .B0(n34), .Y(n32) );
  NAND2XL U380 ( .A(n51), .B(n35), .Y(n33) );
  NOR2X1 U381 ( .A(n44), .B(n37), .Y(n35) );
  OAI21XL U382 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  INVX1 U383 ( .A(n64), .Y(n98) );
  INVX2 U384 ( .A(n70), .Y(n69) );
  XNOR2X1 U385 ( .A(n32), .B(n3), .Y(product[13]) );
  OAI21XL U386 ( .A0(n53), .A1(n59), .B0(n54), .Y(n52) );
  OAI21XL U387 ( .A0(n50), .A1(n44), .B0(n45), .Y(n41) );
  OAI21XL U388 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  INVX2 U389 ( .A(n31), .Y(n29) );
  OAI2BB1X1 U390 ( .A0N(n339), .A1N(n29), .B0(n26), .Y(n351) );
  INVX2 U391 ( .A(n85), .Y(n83) );
  INVX2 U392 ( .A(n77), .Y(n75) );
  OAI21X1 U393 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  OAI21X1 U394 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  OAI21X1 U395 ( .A0(n87), .A1(n90), .B0(n88), .Y(n86) );
  XNOR2XL U396 ( .A(n11), .B(n78), .Y(product[5]) );
  NAND2XL U397 ( .A(n121), .B(n116), .Y(n38) );
  NAND2X1 U398 ( .A(n122), .B(n127), .Y(n45) );
  NAND2X1 U399 ( .A(n115), .B(n112), .Y(n31) );
  XNOR2XL U400 ( .A(n13), .B(n86), .Y(product[3]) );
  NAND2X1 U401 ( .A(n111), .B(n108), .Y(n26) );
  XOR2XL U402 ( .A(n14), .B(n90), .Y(product[2]) );
  NAND2X1 U403 ( .A(n104), .B(n88), .Y(n14) );
  CLKINVXL U404 ( .A(n87), .Y(n104) );
  NAND2X1 U405 ( .A(n165), .B(n207), .Y(n85) );
  INVX2 U406 ( .A(n288), .Y(n284) );
  BUFX2 U407 ( .A(n296), .Y(n279) );
  NAND2X1 U408 ( .A(n159), .B(n162), .Y(n77) );
  BUFX2 U409 ( .A(n298), .Y(n281) );
  ADDFX2 U410 ( .A(n147), .B(n150), .CI(n145), .CO(n142), .S(n143) );
  ADDFX1 U411 ( .A(n194), .B(n186), .CI(n152), .CO(n144), .S(n145) );
  ADDHXL U412 ( .A(n211), .B(n195), .CO(n152), .S(n153) );
  BUFX2 U413 ( .A(n297), .Y(n280) );
  NAND2X1 U414 ( .A(n163), .B(n164), .Y(n80) );
  ADDFX2 U415 ( .A(n177), .B(n134), .CI(n200), .CO(n131), .S(n132) );
  NOR2X1 U416 ( .A(n223), .B(n277), .Y(n177) );
  INVX2 U417 ( .A(n133), .Y(n134) );
  CMPR32X1 U418 ( .A(n192), .B(n184), .C(n132), .CO(n129), .S(n130) );
  NOR2X1 U419 ( .A(n155), .B(n158), .Y(n71) );
  ADDFX1 U420 ( .A(n204), .B(n160), .CI(n157), .CO(n154), .S(n155) );
  NAND2X1 U421 ( .A(n155), .B(n158), .Y(n72) );
  OAI2BB1X1 U422 ( .A0N(n281), .A1N(n276), .B0(n289), .Y(n209) );
  NAND2X1 U423 ( .A(n216), .B(n208), .Y(n88) );
  INVX2 U424 ( .A(n289), .Y(n285) );
  NAND2X1 U425 ( .A(n352), .B(n17), .Y(n1) );
  NAND2X1 U426 ( .A(n107), .B(n106), .Y(n17) );
  INVX2 U427 ( .A(n119), .Y(n120) );
  INVX2 U428 ( .A(n287), .Y(n283) );
  BUFX2 U429 ( .A(n295), .Y(n278) );
  CMPR32X1 U430 ( .A(n183), .B(n199), .C(n131), .CO(n123), .S(n124) );
  OAI2BB1X1 U431 ( .A0N(n280), .A1N(n338), .B0(n288), .Y(n199) );
  ADDFX2 U432 ( .A(n189), .B(n114), .CI(n117), .CO(n111), .S(n112) );
  OAI2BB1X1 U433 ( .A0N(n279), .A1N(n274), .B0(n287), .Y(n189) );
  ADDFX2 U434 ( .A(n110), .B(n180), .CI(n113), .CO(n107), .S(n108) );
  INVX2 U435 ( .A(n109), .Y(n110) );
  OR2X1 U436 ( .A(n107), .B(n106), .Y(n352) );
  NAND2BX1 U437 ( .AN(n268), .B(n288), .Y(n251) );
  BUFX1 U438 ( .A(a[3]), .Y(n288) );
  XNOR2X1 U439 ( .A(n268), .B(n287), .Y(n241) );
  XNOR2XL U440 ( .A(a[4]), .B(a[3]), .Y(n296) );
  NAND2BX1 U441 ( .AN(n268), .B(n287), .Y(n242) );
  XOR2X1 U442 ( .A(a[4]), .B(a[5]), .Y(n270) );
  XNOR2XL U443 ( .A(n268), .B(n288), .Y(n250) );
  XNOR2XL U444 ( .A(n267), .B(n288), .Y(n249) );
  XNOR2XL U445 ( .A(n265), .B(n288), .Y(n247) );
  BUFX2 U446 ( .A(a[1]), .Y(n289) );
  BUFX2 U447 ( .A(n293), .Y(n276) );
  XNOR2XL U448 ( .A(n266), .B(n288), .Y(n248) );
  INVX2 U449 ( .A(a[0]), .Y(n298) );
  NOR2BXL U450 ( .AN(n268), .B(n279), .Y(n198) );
  XNOR2XL U451 ( .A(n263), .B(n289), .Y(n254) );
  XNOR2XL U452 ( .A(n264), .B(n289), .Y(n255) );
  NOR2BX1 U453 ( .AN(n268), .B(n277), .Y(n178) );
  XNOR2XL U454 ( .A(n261), .B(n288), .Y(n243) );
  NOR2BXL U455 ( .AN(n268), .B(n278), .Y(n188) );
  BUFX2 U456 ( .A(a[5]), .Y(n287) );
  XNOR2XL U457 ( .A(n262), .B(n288), .Y(n244) );
  XNOR2XL U458 ( .A(n263), .B(n288), .Y(n245) );
  XNOR2XL U459 ( .A(n267), .B(n289), .Y(n258) );
  XNOR2XL U460 ( .A(n264), .B(n288), .Y(n246) );
  XNOR2XL U461 ( .A(n268), .B(n289), .Y(n259) );
  NAND2BXL U462 ( .AN(n268), .B(n289), .Y(n260) );
  NOR2BXL U463 ( .AN(n268), .B(n280), .Y(n208) );
  XNOR2XL U464 ( .A(n262), .B(n289), .Y(n253) );
  XNOR2XL U465 ( .A(n265), .B(n287), .Y(n238) );
  XNOR2X1 U466 ( .A(a[6]), .B(a[5]), .Y(n295) );
  XOR2X1 U467 ( .A(a[6]), .B(a[7]), .Y(n269) );
  XNOR2XL U468 ( .A(n266), .B(n287), .Y(n239) );
  ADDFX2 U469 ( .A(n133), .B(n176), .CI(n191), .CO(n125), .S(n126) );
  XNOR2XL U470 ( .A(n264), .B(n287), .Y(n237) );
  XNOR2XL U471 ( .A(n263), .B(n287), .Y(n236) );
  XNOR2XL U472 ( .A(n262), .B(n287), .Y(n235) );
  XNOR2XL U473 ( .A(n261), .B(n287), .Y(n234) );
  BUFX2 U474 ( .A(a[7]), .Y(n286) );
  XNOR2X1 U475 ( .A(n267), .B(n286), .Y(n231) );
  XNOR2X1 U476 ( .A(n266), .B(n286), .Y(n230) );
  XNOR2X1 U477 ( .A(n268), .B(n286), .Y(n232) );
  XNOR2X1 U478 ( .A(n264), .B(n286), .Y(n228) );
  XNOR2X1 U479 ( .A(n265), .B(n286), .Y(n229) );
  ADDFX2 U480 ( .A(n119), .B(n175), .CI(n181), .CO(n113), .S(n114) );
  NAND2BX1 U481 ( .AN(n268), .B(n286), .Y(n233) );
  NOR2BX1 U482 ( .AN(n267), .B(n277), .Y(n133) );
  BUFX2 U483 ( .A(n294), .Y(n277) );
  INVX2 U484 ( .A(a[7]), .Y(n294) );
  XNOR2X1 U485 ( .A(n263), .B(n286), .Y(n227) );
  XNOR2X1 U486 ( .A(n262), .B(n286), .Y(n226) );
  NOR2BX1 U487 ( .AN(n264), .B(n277), .Y(n119) );
  XNOR2X1 U488 ( .A(n261), .B(n286), .Y(n225) );
  INVX2 U489 ( .A(n266), .Y(n223) );
  NOR2BXL U490 ( .AN(n268), .B(n281), .Y(product[0]) );
  OAI2BB1X1 U491 ( .A0N(n278), .A1N(n273), .B0(n286), .Y(n179) );
  NOR2BX1 U492 ( .AN(n262), .B(n277), .Y(n109) );
  BUFX2 U493 ( .A(b[3]), .Y(n265) );
  BUFX2 U494 ( .A(b[2]), .Y(n266) );
  BUFX2 U495 ( .A(b[0]), .Y(n268) );
  BUFX2 U496 ( .A(b[5]), .Y(n263) );
  BUFX2 U497 ( .A(b[4]), .Y(n264) );
  BUFX2 U498 ( .A(b[1]), .Y(n267) );
  BUFX2 U499 ( .A(b[7]), .Y(n261) );
  BUFX2 U500 ( .A(b[6]), .Y(n262) );
endmodule


module SNN_DW_div_uns_3 ( a, b, quotient, remainder, divide_by_0 );
  input [16:0] a;
  input [8:0] b;
  output [16:0] quotient;
  output [8:0] remainder;
  output divide_by_0;
  wire   SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
         SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
         SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
         SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
         SYNOPSYS_UNCONNECTED_35;

  SNN_add_308_DP_OP_359_5563_0 u_div_add_308_DP_OP_359_5563_7 ( .I1({a[16:1], 
        1'b0}), .I2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0}), .O2({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, quotient[7:0], 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, 
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, 
        SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25, 
        SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27, 
        SYNOPSYS_UNCONNECTED_28, SYNOPSYS_UNCONNECTED_29, 
        SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31, 
        SYNOPSYS_UNCONNECTED_32, SYNOPSYS_UNCONNECTED_33, 
        SYNOPSYS_UNCONNECTED_34, SYNOPSYS_UNCONNECTED_35}) );
endmodule


module SNN_add_308_DP_OP_359_5563_0 ( I1, I2, O2 );
  input [16:0] I1;
  input [25:0] I2;
  output [42:0] O2;
  wire   n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523,
         n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533,
         n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543,
         n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553,
         n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563,
         n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573,
         n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583,
         n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593,
         n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603,
         n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613,
         n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623,
         n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633,
         n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643,
         n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653,
         n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
         n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673,
         n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683,
         n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693,
         n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703,
         n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713,
         n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723,
         n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733,
         n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743,
         n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753,
         n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763,
         n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773,
         n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783,
         n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793,
         n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803,
         n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813,
         n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823,
         n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833,
         n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843,
         n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853,
         n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863,
         n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1873,
         n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883,
         n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893,
         n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903,
         n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913,
         n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923,
         n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933,
         n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943,
         n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953,
         n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963,
         n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973,
         n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983,
         n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993,
         n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003,
         n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013,
         n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023,
         n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033,
         n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043,
         n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053,
         n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063,
         n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073,
         n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083,
         n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093,
         n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103,
         n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113,
         n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123,
         n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133,
         n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2142, n2143,
         n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2153,
         n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163,
         n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173,
         n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183,
         n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193,
         n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203,
         n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213,
         n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223,
         n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233,
         n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243,
         n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253,
         n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263,
         n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273,
         n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283,
         n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291, n2292, n2293,
         n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301, n2302, n2303,
         n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311, n2312, n2313,
         n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321, n2322, n2323,
         n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331, n2332, n2333,
         n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341, n2342, n2343,
         n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351, n2352, n2353,
         n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361, n2362, n2363,
         n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371, n2372, n2373,
         n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381, n2382, n2383,
         n2384, n2385, n2386, n2387, n2388, n2389;

  NOR2X1 U1271 ( .A(n2142), .B(n2175), .Y(n1514) );
  NOR2X1 U1272 ( .A(n2175), .B(n2144), .Y(n1515) );
  NOR2X1 U1273 ( .A(n2142), .B(n2144), .Y(n1516) );
  OR3X2 U1274 ( .A(n1514), .B(n1515), .C(n1516), .Y(n2148) );
  NOR2X1 U1275 ( .A(n1606), .B(n1618), .Y(n1517) );
  NOR2X1 U1276 ( .A(n1519), .B(n1606), .Y(n1518) );
  OR2X1 U1277 ( .A(n1517), .B(n1518), .Y(n1861) );
  OAI22X1 U1278 ( .A0(n1607), .A1(n1532), .B0(n1521), .B1(n1607), .Y(n2225) );
  OAI222X1 U1279 ( .A0(n1746), .A1(n1980), .B0(n1746), .B1(n1979), .C0(n1980), 
        .C1(n1979), .Y(n1953) );
  OAI222X1 U1280 ( .A0(n1937), .A1(n1938), .B0(n1939), .B1(n1938), .C0(n1937), 
        .C1(n1939), .Y(n1916) );
  OAI222X1 U1281 ( .A0(n1943), .A1(n1944), .B0(n1945), .B1(n1944), .C0(n1943), 
        .C1(n1945), .Y(n1918) );
  XOR2X1 U1282 ( .A(n2384), .B(I1[7]), .Y(n1538) );
  OAI2BB1X1 U1283 ( .A0N(n1610), .A1N(n1539), .B0(I1[7]), .Y(n1616) );
  OAI222X1 U1284 ( .A0(n2176), .A1(n2310), .B0(n2176), .B1(n2224), .C0(n2310), 
        .C1(n2224), .Y(n1923) );
  OAI222X1 U1285 ( .A0(n2302), .A1(n2361), .B0(n2303), .B1(n2361), .C0(n2302), 
        .C1(n2303), .Y(n1921) );
  OAI222X1 U1286 ( .A0(n2307), .A1(n2308), .B0(n2308), .B1(n2309), .C0(n2307), 
        .C1(n2309), .Y(n1920) );
  OAI222X1 U1287 ( .A0(n1913), .A1(n1914), .B0(n1915), .B1(n1914), .C0(n1913), 
        .C1(n1915), .Y(n1911) );
  INVX2 U1288 ( .A(n1916), .Y(n1915) );
  OR2X1 U1289 ( .A(n1906), .B(n1907), .Y(n1908) );
  NAND2BX1 U1290 ( .AN(n1533), .B(n1521), .Y(n1532) );
  OAI222X1 U1291 ( .A0(n1531), .A1(n1579), .B0(n1910), .B1(n1531), .C0(n1910), 
        .C1(n1579), .Y(n1907) );
  INVX2 U1292 ( .A(n1911), .Y(n1910) );
  OAI222X1 U1293 ( .A0(n1631), .A1(n1632), .B0(n1631), .B1(n1633), .C0(n1632), 
        .C1(n1633), .Y(n1612) );
  XOR2X1 U1294 ( .A(n2385), .B(I1[13]), .Y(n1519) );
  XOR2X1 U1295 ( .A(n2388), .B(I1[9]), .Y(n1520) );
  NAND2X1 U1296 ( .A(n1591), .B(n1519), .Y(n1618) );
  XOR2X1 U1297 ( .A(n2387), .B(I1[11]), .Y(n1521) );
  INVX2 U1298 ( .A(n1861), .Y(n1809) );
  XNOR3X2 U1299 ( .A(n2258), .B(n2257), .C(n2256), .Y(n1522) );
  XNOR3X2 U1300 ( .A(n2110), .B(n2166), .C(n2109), .Y(n1523) );
  NOR2X1 U1301 ( .A(n2098), .B(n2099), .Y(n1524) );
  AND2X1 U1302 ( .A(n1630), .B(n1629), .Y(n1525) );
  XOR2X1 U1303 ( .A(n1526), .B(n1656), .Y(O2[32]) );
  XOR2X1 U1304 ( .A(n1529), .B(n1752), .Y(O2[29]) );
  XOR2X1 U1305 ( .A(n1530), .B(n1720), .Y(O2[30]) );
  NAND2X1 U1306 ( .A(n1816), .B(n1817), .Y(n1625) );
  OAI22X1 U1307 ( .A0(n1608), .A1(n1534), .B0(n1520), .B1(n1608), .Y(n2264) );
  OAI22X1 U1308 ( .A0(n1605), .A1(n1536), .B0(n1538), .B1(n1605), .Y(n1969) );
  NAND2BX1 U1309 ( .AN(n1535), .B(n1520), .Y(n1534) );
  NAND2BX1 U1310 ( .AN(n1537), .B(n1538), .Y(n1536) );
  OR2X1 U1311 ( .A(n1540), .B(n2062), .Y(n1539) );
  CLKINVX2 U1312 ( .A(n1828), .Y(n1827) );
  INVX1 U1313 ( .A(n1658), .Y(n1693) );
  CLKINVXL U1314 ( .A(n1897), .Y(n1896) );
  INVX2 U1315 ( .A(n2292), .Y(n2357) );
  INVX1 U1316 ( .A(n2143), .Y(n2175) );
  OAI222XL U1317 ( .A0(n1557), .A1(n1574), .B0(n1926), .B1(n1557), .C0(n1926), 
        .C1(n1574), .Y(n1925) );
  OAI222X1 U1318 ( .A0(n2317), .A1(n1587), .B0(n1577), .B1(n1587), .C0(n2317), 
        .C1(n1577), .Y(n2288) );
  CLKINVX2 U1319 ( .A(I1[13]), .Y(n1684) );
  INVX1 U1320 ( .A(n2212), .Y(n2211) );
  XOR2XL U1321 ( .A(n2387), .B(I1[13]), .Y(n1533) );
  INVX2 U1322 ( .A(I1[9]), .Y(n1811) );
  INVX1 U1323 ( .A(n1942), .Y(n1937) );
  INVX1 U1324 ( .A(n1950), .Y(n2302) );
  XOR2XL U1325 ( .A(n2384), .B(I1[9]), .Y(n1537) );
  XOR2XL U1326 ( .A(n2388), .B(I1[11]), .Y(n1535) );
  INVX1 U1327 ( .A(I1[6]), .Y(n2389) );
  INVX2 U1328 ( .A(I1[14]), .Y(n2385) );
  XOR2XL U1329 ( .A(n2383), .B(I1[15]), .Y(n1542) );
  CLKINVXL U1330 ( .A(n1626), .Y(n1620) );
  NOR2X1 U1331 ( .A(n1622), .B(n1546), .Y(n1526) );
  AND2XL U1332 ( .A(n1628), .B(n1623), .Y(n1627) );
  XOR2X1 U1333 ( .A(n1527), .B(n1691), .Y(O2[31]) );
  NOR2X1 U1334 ( .A(n1695), .B(n1665), .Y(n1527) );
  XOR2X1 U1335 ( .A(n1528), .B(n1624), .Y(O2[33]) );
  NOR2X1 U1336 ( .A(n1525), .B(n1547), .Y(n1528) );
  OR2XL U1337 ( .A(n1830), .B(n1834), .Y(n1821) );
  INVX1 U1338 ( .A(n1832), .Y(n1836) );
  INVX1 U1339 ( .A(n1844), .Y(n1835) );
  NOR2X1 U1340 ( .A(n1755), .B(n1726), .Y(n1529) );
  NOR2X1 U1341 ( .A(n1661), .B(n1551), .Y(n1530) );
  INVX1 U1342 ( .A(n1829), .Y(n1826) );
  INVX1 U1343 ( .A(n1753), .Y(n1725) );
  CLKINVX2 U1344 ( .A(n1754), .Y(n1722) );
  NAND2XL U1345 ( .A(n1818), .B(n1819), .Y(n1817) );
  OAI21XL U1346 ( .A0(n1821), .A1(n1822), .B0(n1818), .Y(n1816) );
  INVX1 U1347 ( .A(n1820), .Y(n1819) );
  OAI2BB1X1 U1348 ( .A0N(n1883), .A1N(n1563), .B0(n1888), .Y(n1834) );
  CLKINVX2 U1349 ( .A(n1909), .Y(n1889) );
  CLKINVXL U1350 ( .A(n1886), .Y(n1885) );
  CLKINVXL U1351 ( .A(n1887), .Y(n1884) );
  CLKINVXL U1352 ( .A(n1888), .Y(n1882) );
  CLKINVXL U1353 ( .A(n1997), .Y(n1995) );
  NAND2XL U1354 ( .A(n2330), .B(n2329), .Y(n1845) );
  CLKINVXL U1355 ( .A(n1848), .Y(n1850) );
  OAI222XL U1356 ( .A0(n2105), .A1(n2106), .B0(n2152), .B1(n2106), .C0(n2152), 
        .C1(n2105), .Y(n2250) );
  OAI222XL U1357 ( .A0(n2136), .A1(n2138), .B0(n2139), .B1(n2138), .C0(n2139), 
        .C1(n2136), .Y(n2122) );
  CLKINVXL U1358 ( .A(n2137), .Y(n2139) );
  AOI32XL U1359 ( .A0(n1839), .A1(n1820), .A2(n1545), .B0(n1840), .B1(n1841), 
        .Y(n1838) );
  CLKINVXL U1360 ( .A(n1833), .Y(n1846) );
  OAI222XL U1361 ( .A0(n2152), .A1(n1964), .B0(n2152), .B1(n2183), .C0(n1964), 
        .C1(n2183), .Y(n2182) );
  INVXL U1362 ( .A(n1784), .Y(n1786) );
  CLKINVXL U1363 ( .A(n1825), .Y(n1843) );
  CLKINVXL U1364 ( .A(n1822), .Y(n1839) );
  CLKINVXL U1365 ( .A(n2148), .Y(n2174) );
  CLKINVXL U1366 ( .A(n2147), .Y(n2173) );
  CLKINVXL U1367 ( .A(n1898), .Y(n1895) );
  INVX1 U1368 ( .A(n1925), .Y(n1903) );
  INVX1 U1369 ( .A(n1927), .Y(n1926) );
  CLKINVXL U1370 ( .A(n2342), .Y(n2337) );
  OAI222XL U1371 ( .A0(n2363), .A1(n1580), .B0(n1577), .B1(n1580), .C0(n2363), 
        .C1(n1577), .Y(n2334) );
  INVX1 U1372 ( .A(n1854), .Y(n1853) );
  CLKINVXL U1373 ( .A(n1856), .Y(n1851) );
  INVX1 U1374 ( .A(n2253), .Y(n2002) );
  OAI222XL U1375 ( .A0(n1968), .A1(n2273), .B0(n1968), .B1(n2262), .C0(n2273), 
        .C1(n2262), .Y(n2256) );
  INVX1 U1376 ( .A(n2297), .Y(n1883) );
  INVX1 U1377 ( .A(n1912), .Y(n2298) );
  XNOR3X2 U1378 ( .A(n1919), .B(n1920), .C(n1921), .Y(n1531) );
  OAI22XL U1379 ( .A0(I1[13]), .A1(n1532), .B0(n1521), .B1(n1607), .Y(n2197)
         );
  OAI22XL U1380 ( .A0(I1[11]), .A1(n1534), .B0(n1520), .B1(n1608), .Y(n2167)
         );
  OAI22XL U1381 ( .A0(n1520), .A1(n1608), .B0(n1608), .B1(n1534), .Y(n1769) );
  XOR2XL U1382 ( .A(n1966), .B(n2272), .Y(n2257) );
  INVX2 U1383 ( .A(n2305), .Y(n1976) );
  INVX1 U1384 ( .A(n1957), .Y(n1956) );
  INVXL U1385 ( .A(I1[11]), .Y(n1742) );
  OAI222XL U1386 ( .A0(n2152), .A1(n1964), .B0(n1964), .B1(n2224), .C0(n2152), 
        .C1(n2224), .Y(n2205) );
  INVX2 U1387 ( .A(n1954), .Y(n2308) );
  INVX2 U1388 ( .A(n1953), .Y(n2307) );
  OAI222XL U1389 ( .A0(n1964), .A1(n2066), .B0(n2224), .B1(n2066), .C0(n1964), 
        .C1(n2224), .Y(n2185) );
  NAND2BX1 U1390 ( .AN(n2383), .B(n1542), .Y(n1619) );
  XOR2X1 U1391 ( .A(n2389), .B(I1[7]), .Y(n1540) );
  INVX2 U1392 ( .A(n1947), .Y(n1944) );
  NAND2X1 U1393 ( .A(n1589), .B(n1603), .Y(n1541) );
  XOR2X1 U1394 ( .A(n2318), .B(n2304), .Y(n1587) );
  INVX2 U1395 ( .A(I1[12]), .Y(n2387) );
  CLKINVXL U1396 ( .A(n2243), .Y(n2242) );
  XNOR2X1 U1397 ( .A(n2385), .B(I1[15]), .Y(n1591) );
  OAI222XL U1398 ( .A0(n2152), .A1(n2323), .B0(n2224), .B1(n2323), .C0(n2152), 
        .C1(n2224), .Y(n2315) );
  INVX2 U1399 ( .A(I1[10]), .Y(n2388) );
  INVX2 U1400 ( .A(I1[8]), .Y(n2384) );
  NAND2X1 U1401 ( .A(n1600), .B(n1602), .Y(n1543) );
  OAI2BB1X1 U1402 ( .A0N(n1621), .A1N(n1620), .B0(n1623), .Y(n1656) );
  INVX2 U1403 ( .A(n1628), .Y(n1622) );
  OR2X1 U1404 ( .A(n1835), .B(n1836), .Y(n1830) );
  OR2X1 U1405 ( .A(n1545), .B(n1842), .Y(n1841) );
  OR2X1 U1406 ( .A(n1725), .B(n1726), .Y(n1664) );
  OR2X1 U1407 ( .A(n1660), .B(n1664), .Y(n1626) );
  OAI32XL U1408 ( .A0(n1625), .A1(n1551), .A2(n1664), .B0(n1551), .B1(n1692), 
        .Y(n1691) );
  INVX2 U1409 ( .A(n1663), .Y(n1695) );
  OAI32XL U1410 ( .A0(n1625), .A1(n1546), .A2(n1626), .B0(n1546), .B1(n1627), 
        .Y(n1624) );
  INVX2 U1411 ( .A(n1908), .Y(n1902) );
  INVX2 U1412 ( .A(n2000), .Y(n1992) );
  INVX2 U1413 ( .A(n1625), .Y(n1621) );
  OAI2BB1X1 U1414 ( .A0N(n1621), .A1N(n1753), .B0(n1754), .Y(n1752) );
  INVX2 U1415 ( .A(n1724), .Y(n1755) );
  OAI2BB1X1 U1416 ( .A0N(n1621), .A1N(n1721), .B0(n1693), .Y(n1720) );
  CLKINVXL U1417 ( .A(n1664), .Y(n1721) );
  INVX2 U1418 ( .A(n2009), .Y(n2019) );
  NOR2BX1 U1419 ( .AN(n2121), .B(n2122), .Y(n1544) );
  OR2X1 U1420 ( .A(n1843), .B(n1842), .Y(n1840) );
  OR2X1 U1421 ( .A(n1843), .B(n1829), .Y(n1880) );
  OAI2BB1X1 U1422 ( .A0N(n1831), .A1N(n1832), .B0(n1833), .Y(n1828) );
  INVX2 U1423 ( .A(n1845), .Y(n1831) );
  XOR2X1 U1424 ( .A(n1625), .B(n1782), .Y(O2[28]) );
  OR2X1 U1425 ( .A(n1722), .B(n1725), .Y(n1782) );
  OAI2BB1X1 U1426 ( .A0N(n1844), .A1N(n1829), .B0(n1845), .Y(n1842) );
  INVX2 U1427 ( .A(n2127), .Y(n2126) );
  INVX2 U1428 ( .A(n1723), .Y(n1726) );
  OR2X1 U1429 ( .A(n1551), .B(n1665), .Y(n1660) );
  INVX2 U1430 ( .A(n1662), .Y(n1665) );
  OAI22X1 U1431 ( .A0(n1657), .A1(n1658), .B0(n1659), .B1(n1657), .Y(n1623) );
  OAI2BB1X1 U1432 ( .A0N(n1661), .A1N(n1662), .B0(n1663), .Y(n1657) );
  CLKINVX1 U1433 ( .A(n1660), .Y(n1659) );
  OAI2BB1X1 U1434 ( .A0N(n1722), .A1N(n1723), .B0(n1724), .Y(n1658) );
  INVX2 U1435 ( .A(n1694), .Y(n1661) );
  AND2XL U1436 ( .A(n1693), .B(n1694), .Y(n1692) );
  NOR2X1 U1437 ( .A(n1835), .B(n1834), .Y(n1545) );
  INVX2 U1438 ( .A(n1834), .Y(n1879) );
  NOR2BX1 U1439 ( .AN(n1667), .B(n1666), .Y(n1546) );
  OR2X1 U1440 ( .A(n1668), .B(n1667), .Y(n1628) );
  INVX2 U1441 ( .A(n1666), .Y(n1668) );
  OAI222X1 U1442 ( .A0(n2176), .A1(n1964), .B0(n1615), .B1(n1964), .C0(n1615), 
        .C1(n2176), .Y(n1705) );
  NOR2X1 U1443 ( .A(n1629), .B(n1630), .Y(n1547) );
  INVX2 U1444 ( .A(n1634), .Y(n1633) );
  OAI222X1 U1445 ( .A0(n1976), .A1(n1681), .B0(n1809), .B1(n1681), .C0(n1809), 
        .C1(n1976), .Y(n1950) );
  AOI2BB2X1 U1446 ( .B0(n1823), .B1(n1824), .A0N(n1825), .A1N(n1821), .Y(n1818) );
  NAND2X1 U1447 ( .A(n1830), .B(n1827), .Y(n1823) );
  NAND2X1 U1448 ( .A(n1826), .B(n1827), .Y(n1824) );
  XOR3X2 U1449 ( .A(n2312), .B(n1809), .C(n1969), .Y(n1954) );
  XOR3X2 U1450 ( .A(n1967), .B(n1809), .C(n2225), .Y(n1974) );
  INVX2 U1451 ( .A(n1901), .Y(n1892) );
  INVX2 U1452 ( .A(n2222), .Y(n1983) );
  OAI222XL U1453 ( .A0(n1968), .A1(n1619), .B0(n1968), .B1(n1809), .C0(n1809), 
        .C1(n1619), .Y(n2222) );
  OAI222XL U1454 ( .A0(n1809), .A1(n1967), .B0(n1968), .B1(n1967), .C0(n1968), 
        .C1(n1809), .Y(n1942) );
  OAI222X1 U1455 ( .A0(n2245), .A1(n2246), .B0(n2246), .B1(n2247), .C0(n2245), 
        .C1(n2247), .Y(n2212) );
  INVX2 U1456 ( .A(n2249), .Y(n2246) );
  INVX2 U1457 ( .A(n2250), .Y(n2245) );
  INVX2 U1458 ( .A(n2248), .Y(n2247) );
  INVX2 U1459 ( .A(n2225), .Y(n1968) );
  OAI222XL U1460 ( .A0(n1964), .A1(n2312), .B0(n1809), .B1(n2312), .C0(n1964), 
        .C1(n1809), .Y(n2306) );
  OAI32X1 U1461 ( .A0(n1882), .A1(n1563), .A2(n1883), .B0(n1884), .B1(n1885), 
        .Y(n1829) );
  OR2X1 U1462 ( .A(n1886), .B(n1887), .Y(n1888) );
  OAI222XL U1463 ( .A0(n1968), .A1(n2105), .B0(n1968), .B1(n1809), .C0(n1809), 
        .C1(n2105), .Y(n2234) );
  INVX2 U1464 ( .A(n2254), .Y(n2015) );
  OAI222X1 U1465 ( .A0(n2202), .A1(n2255), .B0(n2255), .B1(n1522), .C0(n2202), 
        .C1(n1522), .Y(n2254) );
  INVX2 U1466 ( .A(n2203), .Y(n2255) );
  OR2X1 U1467 ( .A(n2012), .B(n1997), .Y(n2000) );
  INVX2 U1468 ( .A(n1996), .Y(n2012) );
  OAI32X1 U1469 ( .A0(n1992), .A1(n1993), .A2(n1994), .B0(n1995), .B1(n1996), 
        .Y(n1991) );
  INVX2 U1470 ( .A(n1998), .Y(n1994) );
  INVX2 U1471 ( .A(n1999), .Y(n1993) );
  XNOR3X2 U1472 ( .A(n2202), .B(n1522), .C(n2203), .Y(n1548) );
  OAI222X1 U1473 ( .A0(n2271), .A1(n2258), .B0(n2271), .B1(n2257), .C0(n2257), 
        .C1(n2258), .Y(n2239) );
  INVX2 U1474 ( .A(n2256), .Y(n2271) );
  OR2X1 U1475 ( .A(n1847), .B(n1848), .Y(n1832) );
  INVX2 U1476 ( .A(n1849), .Y(n1847) );
  INVX2 U1477 ( .A(n2197), .Y(n2267) );
  CLKINVXL U1478 ( .A(n1907), .Y(n1904) );
  OR2X1 U1479 ( .A(n2329), .B(n2330), .Y(n1844) );
  XNOR3X2 U1480 ( .A(n2187), .B(n2189), .C(n2188), .Y(n2149) );
  XOR3X2 U1481 ( .A(n2147), .B(n2148), .C(n2149), .Y(n2121) );
  OAI32X1 U1482 ( .A0(n1544), .A1(n1550), .A2(n2119), .B0(n2120), .B1(n2121), 
        .Y(n2009) );
  INVX2 U1483 ( .A(n2122), .Y(n2120) );
  AOI2BB2XL U1484 ( .B0(n2123), .B1(n2124), .A0N(n2125), .A1N(n2126), .Y(n2119) );
  INVX2 U1485 ( .A(n2129), .Y(n2123) );
  AND2X1 U1486 ( .A(n2011), .B(n2000), .Y(n2010) );
  OAI221X1 U1487 ( .A0(n1524), .A1(n2017), .B0(n2018), .B1(n1524), .C0(n2019), 
        .Y(n2011) );
  AOI2BB2X1 U1488 ( .B0(n2098), .B1(n2099), .A0N(n2100), .A1N(n2072), .Y(n2017) );
  INVX2 U1489 ( .A(n1906), .Y(n1905) );
  XOR2X1 U1490 ( .A(n1837), .B(n1838), .Y(O2[27]) );
  OR2X1 U1491 ( .A(n1846), .B(n1836), .Y(n1837) );
  XOR2X1 U1492 ( .A(n1877), .B(n1878), .Y(O2[26]) );
  OR2X1 U1493 ( .A(n1831), .B(n1835), .Y(n1877) );
  AOI32X1 U1494 ( .A0(n1879), .A1(n1820), .A2(n1839), .B0(n1880), .B1(n1881), 
        .Y(n1878) );
  OR2X1 U1495 ( .A(n1879), .B(n1829), .Y(n1881) );
  OAI2BB1XL U1496 ( .A0N(n1903), .A1N(n1558), .B0(n1908), .Y(n1909) );
  OAI222X1 U1497 ( .A0(n2187), .A1(n2190), .B0(n2190), .B1(n2189), .C0(n2187), 
        .C1(n2189), .Y(n2014) );
  INVX2 U1498 ( .A(n2188), .Y(n2190) );
  XOR3X2 U1499 ( .A(n2136), .B(n2137), .C(n2138), .Y(n2127) );
  OR2X1 U1500 ( .A(n1850), .B(n1849), .Y(n1833) );
  INVX2 U1501 ( .A(n2128), .Y(n2125) );
  XNOR3X2 U1502 ( .A(n2152), .B(n1964), .C(n2153), .Y(n1549) );
  NOR2X1 U1503 ( .A(n2127), .B(n2128), .Y(n1550) );
  INVX2 U1504 ( .A(n2182), .Y(n2142) );
  INVX2 U1505 ( .A(n2153), .Y(n2183) );
  INVX2 U1506 ( .A(n2264), .Y(n2152) );
  OR2X1 U1507 ( .A(n1756), .B(n1757), .Y(n1723) );
  OR2X1 U1508 ( .A(n1783), .B(n1784), .Y(n1753) );
  INVX2 U1509 ( .A(n1785), .Y(n1783) );
  INVX2 U1510 ( .A(n1808), .Y(n1764) );
  OAI222XL U1511 ( .A0(n1964), .A1(n1746), .B0(n1964), .B1(n1809), .C0(n1809), 
        .C1(n1746), .Y(n1808) );
  OR2X1 U1512 ( .A(n1696), .B(n1697), .Y(n1662) );
  INVX2 U1513 ( .A(n1873), .Y(n1793) );
  OAI222XL U1514 ( .A0(n1681), .A1(n2176), .B0(n1809), .B1(n1681), .C0(n1809), 
        .C1(n2176), .Y(n1873) );
  NOR2BX1 U1515 ( .AN(n1728), .B(n1727), .Y(n1551) );
  OR2X1 U1516 ( .A(n1786), .B(n1785), .Y(n1754) );
  OR2X1 U1517 ( .A(n1729), .B(n1728), .Y(n1694) );
  INVX2 U1518 ( .A(n1727), .Y(n1729) );
  OAI222XL U1519 ( .A0(n1978), .A1(n2252), .B0(n2152), .B1(n2252), .C0(n2152), 
        .C1(n1978), .Y(n2218) );
  OAI222XL U1520 ( .A0(n2149), .A1(n2173), .B0(n2174), .B1(n2149), .C0(n2174), 
        .C1(n2173), .Y(n1998) );
  INVX2 U1521 ( .A(n1969), .Y(n1964) );
  NAND2X1 U1522 ( .A(n1697), .B(n1696), .Y(n1663) );
  XNOR3X2 U1523 ( .A(n2249), .B(n2250), .C(n2248), .Y(n1552) );
  NAND2X1 U1524 ( .A(n1757), .B(n1756), .Y(n1724) );
  INVX2 U1525 ( .A(n2167), .Y(n1980) );
  XOR3X2 U1526 ( .A(n2176), .B(n2152), .C(n2177), .Y(n2144) );
  XOR3X2 U1527 ( .A(n2252), .B(n1978), .C(n2264), .Y(n2249) );
  XOR3X2 U1528 ( .A(n1689), .B(n1688), .C(n1690), .Y(n1696) );
  XOR3X2 U1529 ( .A(n2106), .B(n2105), .C(n2264), .Y(n2204) );
  INVX2 U1530 ( .A(n2198), .Y(n2187) );
  OAI222XL U1531 ( .A0(n2176), .A1(n2177), .B0(n2152), .B1(n2177), .C0(n2152), 
        .C1(n2176), .Y(n2198) );
  OAI222X1 U1532 ( .A0(n1701), .A1(n1702), .B0(n1703), .B1(n1702), .C0(n1701), 
        .C1(n1703), .Y(n1671) );
  INVX2 U1533 ( .A(n1705), .Y(n1701) );
  INVX2 U1534 ( .A(n1704), .Y(n1702) );
  XOR3X2 U1535 ( .A(n1703), .B(n1705), .C(n1704), .Y(n1698) );
  INVX2 U1536 ( .A(n2108), .Y(n1978) );
  OAI222XL U1537 ( .A0(n1978), .A1(n2114), .B0(n1978), .B1(n2094), .C0(n2114), 
        .C1(n2094), .Y(n2109) );
  INVX2 U1538 ( .A(n2095), .Y(n2114) );
  INVX2 U1539 ( .A(n2021), .Y(n2027) );
  OAI222X1 U1540 ( .A0(n1685), .A1(n1686), .B0(n1685), .B1(n1687), .C0(n1687), 
        .C1(n1686), .Y(n1666) );
  INVX2 U1541 ( .A(n1689), .Y(n1686) );
  INVX2 U1542 ( .A(n1690), .Y(n1685) );
  INVX2 U1543 ( .A(n1688), .Y(n1687) );
  OAI222X1 U1544 ( .A0(n2176), .A1(n2152), .B0(n1809), .B1(n2152), .C0(n2176), 
        .C1(n1809), .Y(n1677) );
  XNOR3X2 U1545 ( .A(n1653), .B(n1567), .C(n1655), .Y(n1667) );
  INVX2 U1546 ( .A(n2113), .Y(n2166) );
  XNOR3X2 U1547 ( .A(n1964), .B(n1615), .C(n1679), .Y(n1553) );
  XNOR3X2 U1548 ( .A(n1964), .B(n2176), .C(n1769), .Y(n1554) );
  OAI222X1 U1549 ( .A0(n1653), .A1(n1567), .B0(n1654), .B1(n1567), .C0(n1654), 
        .C1(n1653), .Y(n1630) );
  INVX2 U1550 ( .A(n1655), .Y(n1654) );
  OAI222X1 U1551 ( .A0(n1964), .A1(n1678), .B0(n1678), .B1(n1615), .C0(n1964), 
        .C1(n1615), .Y(n1634) );
  INVX2 U1552 ( .A(n1679), .Y(n1678) );
  INVX2 U1553 ( .A(n2124), .Y(n2130) );
  XNOR3X2 U1554 ( .A(n1978), .B(n2094), .C(n2095), .Y(n1555) );
  INVX2 U1555 ( .A(n2091), .Y(n2106) );
  XOR3X2 U1556 ( .A(n1647), .B(n1637), .C(n1612), .Y(n1629) );
  INVX2 U1557 ( .A(n1636), .Y(n1631) );
  XOR2X1 U1558 ( .A(n2176), .B(n1681), .Y(n1649) );
  NOR2X1 U1559 ( .A(n1681), .B(n1639), .Y(n1613) );
  INVX2 U1560 ( .A(n1918), .Y(n1913) );
  INVX2 U1561 ( .A(n1917), .Y(n1914) );
  OAI22X1 U1562 ( .A0(n1889), .A1(n1890), .B0(n1890), .B1(n1891), .Y(n1825) );
  OAI32X1 U1563 ( .A0(n1892), .A1(n1893), .A2(n1894), .B0(n1895), .B1(n1896), 
        .Y(n1891) );
  OAI32X1 U1564 ( .A0(n1902), .A1(n1558), .A2(n1903), .B0(n1904), .B1(n1905), 
        .Y(n1890) );
  OR2X1 U1565 ( .A(n1897), .B(n1898), .Y(n1901) );
  XNOR3X2 U1566 ( .A(n1934), .B(n1936), .C(n1935), .Y(n1556) );
  XOR3X2 U1567 ( .A(n1574), .B(n1557), .C(n1927), .Y(n1897) );
  XNOR3X2 U1568 ( .A(n1917), .B(n1918), .C(n1916), .Y(n1557) );
  OAI21X1 U1569 ( .A0(n1986), .A1(n1987), .B0(n1988), .Y(n1820) );
  OAI221X1 U1570 ( .A0(n1999), .A1(n1998), .B0(n2008), .B1(n2009), .C0(n2010), 
        .Y(n1987) );
  OAI22X1 U1571 ( .A0(n1989), .A1(n1990), .B0(n1990), .B1(n1991), .Y(n1988) );
  AOI211XL U1572 ( .A0(n2130), .A1(n2129), .B0(n1544), .C0(n1550), .Y(n2008)
         );
  XOR3X2 U1573 ( .A(n1968), .B(n2105), .C(n1861), .Y(n2248) );
  XOR3X2 U1574 ( .A(n1587), .B(n1577), .C(n2306), .Y(n1919) );
  XOR3X2 U1575 ( .A(n1968), .B(n1619), .C(n1861), .Y(n2219) );
  OAI222X1 U1576 ( .A0(n2299), .A1(n2300), .B0(n2301), .B1(n2300), .C0(n2299), 
        .C1(n2301), .Y(n1912) );
  CLKINVXL U1577 ( .A(n1919), .Y(n2300) );
  CLKINVXL U1578 ( .A(n1920), .Y(n2299) );
  CLKINVXL U1579 ( .A(n1921), .Y(n2301) );
  XOR3X2 U1580 ( .A(n1575), .B(n1559), .C(n1912), .Y(n1906) );
  OAI222X1 U1581 ( .A0(n1931), .A1(n1932), .B0(n1933), .B1(n1932), .C0(n1931), 
        .C1(n1933), .Y(n1927) );
  INVX2 U1582 ( .A(n1934), .Y(n1933) );
  INVX2 U1583 ( .A(n1936), .Y(n1931) );
  INVX2 U1584 ( .A(n1935), .Y(n1932) );
  CLKINVXL U1585 ( .A(n2306), .Y(n2317) );
  OAI222X1 U1586 ( .A0(n2285), .A1(n2286), .B0(n2287), .B1(n2286), .C0(n2285), 
        .C1(n2287), .Y(n2283) );
  INVX2 U1587 ( .A(n2290), .Y(n2285) );
  INVX2 U1588 ( .A(n2289), .Y(n2286) );
  INVX2 U1589 ( .A(n2288), .Y(n2287) );
  OAI222X1 U1590 ( .A0(n1582), .A1(n1560), .B0(n2282), .B1(n1560), .C0(n2282), 
        .C1(n1582), .Y(n1887) );
  INVX2 U1591 ( .A(n2283), .Y(n2282) );
  INVX2 U1592 ( .A(n1900), .Y(n1893) );
  INVX2 U1593 ( .A(n1899), .Y(n1894) );
  XNOR3X2 U1594 ( .A(n1579), .B(n1531), .C(n1911), .Y(n1558) );
  XNOR3X2 U1595 ( .A(n2289), .B(n2290), .C(n2288), .Y(n1559) );
  OAI222X1 U1596 ( .A0(n2259), .A1(n2260), .B0(n2260), .B1(n2261), .C0(n2259), 
        .C1(n2261), .Y(n2203) );
  INVX2 U1597 ( .A(n2185), .Y(n2259) );
  INVX2 U1598 ( .A(n2184), .Y(n2260) );
  INVX2 U1599 ( .A(n2186), .Y(n2261) );
  XOR3X2 U1600 ( .A(n1968), .B(n2262), .C(n2263), .Y(n2186) );
  XOR3X2 U1601 ( .A(n1552), .B(n2015), .C(n2016), .Y(n1996) );
  XOR3X2 U1602 ( .A(n2363), .B(n1580), .C(n2364), .Y(n2291) );
  INVX2 U1603 ( .A(n2374), .Y(n2363) );
  OAI222XL U1604 ( .A0(n1964), .A1(n1968), .B0(n2375), .B1(n1968), .C0(n1964), 
        .C1(n2375), .Y(n2374) );
  INVX2 U1605 ( .A(n2369), .Y(n2375) );
  XNOR3X2 U1606 ( .A(n2291), .B(n2292), .C(n2293), .Y(n1560) );
  XOR3X2 U1607 ( .A(n1964), .B(n1968), .C(n2369), .Y(n2316) );
  XOR3X2 U1608 ( .A(n1681), .B(n1976), .C(n1861), .Y(n1947) );
  OAI222X1 U1609 ( .A0(n1583), .A1(n1548), .B0(n2013), .B1(n1548), .C0(n2013), 
        .C1(n1583), .Y(n1997) );
  INVX2 U1610 ( .A(n2014), .Y(n2013) );
  INVX2 U1611 ( .A(n2263), .Y(n2273) );
  OAI222X1 U1612 ( .A0(n1578), .A1(n1561), .B0(n1875), .B1(n1561), .C0(n1875), 
        .C1(n1578), .Y(n1848) );
  INVX2 U1613 ( .A(n1876), .Y(n1875) );
  XOR3X2 U1614 ( .A(n1859), .B(n1857), .C(n1860), .Y(n1855) );
  INVX2 U1615 ( .A(n2350), .Y(n1857) );
  OAI222XL U1616 ( .A0(n1968), .A1(n2351), .B0(n1968), .B1(n1809), .C0(n1809), 
        .C1(n2351), .Y(n2350) );
  XNOR3X2 U1617 ( .A(n1855), .B(n1856), .C(n1854), .Y(n1561) );
  OAI222XL U1618 ( .A0(n1968), .A1(n2379), .B0(n1968), .B1(n2275), .C0(n2379), 
        .C1(n2275), .Y(n2342) );
  XOR3X2 U1619 ( .A(n2341), .B(n2342), .C(n2340), .Y(n2335) );
  XOR3X2 U1620 ( .A(n1573), .B(n1562), .C(n2284), .Y(n1886) );
  XNOR3X2 U1621 ( .A(n2335), .B(n2336), .C(n2334), .Y(n1562) );
  XOR3X2 U1622 ( .A(n1968), .B(n2351), .C(n1861), .Y(n2347) );
  OAI222XL U1623 ( .A0(n2176), .A1(n2267), .B0(n1809), .B1(n2267), .C0(n2176), 
        .C1(n1809), .Y(n2327) );
  XOR3X2 U1624 ( .A(n2326), .B(n2327), .C(n2328), .Y(n2289) );
  OAI222XL U1625 ( .A0(n1559), .A1(n1575), .B0(n2298), .B1(n1559), .C0(n2298), 
        .C1(n1575), .Y(n2297) );
  INVX2 U1626 ( .A(n2319), .Y(n2312) );
  OAI22X1 U1627 ( .A0(n1684), .A1(n1532), .B0(n1521), .B1(I1[13]), .Y(n2319)
         );
  OAI222XL U1628 ( .A0(n2016), .A1(n1552), .B0(n2015), .B1(n2016), .C0(n2015), 
        .C1(n1552), .Y(n2253) );
  OAI222X1 U1629 ( .A0(n1562), .A1(n1573), .B0(n2356), .B1(n1562), .C0(n2356), 
        .C1(n1573), .Y(n2330) );
  INVX2 U1630 ( .A(n2284), .Y(n2356) );
  OAI222X1 U1631 ( .A0(n2331), .A1(n2332), .B0(n2333), .B1(n2332), .C0(n2331), 
        .C1(n2333), .Y(n1876) );
  INVX2 U1632 ( .A(n2336), .Y(n2331) );
  INVX2 U1633 ( .A(n2334), .Y(n2333) );
  INVX2 U1634 ( .A(n2335), .Y(n2332) );
  OAI222X1 U1635 ( .A0(n2357), .A1(n2358), .B0(n2359), .B1(n2358), .C0(n2357), 
        .C1(n2359), .Y(n2284) );
  INVX2 U1636 ( .A(n2293), .Y(n2359) );
  INVX2 U1637 ( .A(n2291), .Y(n2358) );
  OAI222X1 U1638 ( .A0(n2146), .A1(n1585), .B0(n2194), .B1(n1585), .C0(n2194), 
        .C1(n2146), .Y(n2188) );
  INVX2 U1639 ( .A(n2145), .Y(n2194) );
  OAI22X1 U1640 ( .A0(n1684), .A1(n1521), .B0(n1684), .B1(n1532), .Y(n2154) );
  XOR3X2 U1641 ( .A(n2176), .B(n2267), .C(n2324), .Y(n1924) );
  XOR3X2 U1642 ( .A(n1578), .B(n1561), .C(n1876), .Y(n2329) );
  XNOR3X2 U1643 ( .A(n1582), .B(n1560), .C(n2283), .Y(n1563) );
  INVX2 U1644 ( .A(n2272), .Y(n2275) );
  BUFX2 U1645 ( .A(n1684), .Y(n1607) );
  OAI222X1 U1646 ( .A0(n1851), .A1(n1852), .B0(n1853), .B1(n1852), .C0(n1851), 
        .C1(n1853), .Y(n1815) );
  CLKINVXL U1647 ( .A(n1855), .Y(n1852) );
  XNOR3X2 U1648 ( .A(n1813), .B(n1564), .C(n1815), .Y(n1849) );
  XOR3X2 U1649 ( .A(n2176), .B(n1681), .C(n1861), .Y(n1867) );
  XNOR3X2 U1650 ( .A(n1791), .B(n1790), .C(n1792), .Y(n1564) );
  XOR3X2 U1651 ( .A(n1583), .B(n1548), .C(n2014), .Y(n1999) );
  XOR3X2 U1652 ( .A(n2184), .B(n2185), .C(n2186), .Y(n2147) );
  OAI222XL U1653 ( .A0(n1857), .A1(n1858), .B0(n1859), .B1(n1858), .C0(n1857), 
        .C1(n1859), .Y(n1792) );
  INVX2 U1654 ( .A(n1860), .Y(n1858) );
  OAI211XL U1655 ( .A0(n1900), .A1(n1899), .B0(n1901), .C0(n1889), .Y(n1822)
         );
  XOR3X2 U1656 ( .A(n2379), .B(n2275), .C(n2225), .Y(n2296) );
  OAI222X1 U1657 ( .A0(n2337), .A1(n2338), .B0(n2339), .B1(n2338), .C0(n2337), 
        .C1(n2339), .Y(n1854) );
  INVX2 U1658 ( .A(n2340), .Y(n2339) );
  INVX2 U1659 ( .A(n2341), .Y(n2338) );
  INVX2 U1660 ( .A(n1986), .Y(n1989) );
  OAI222X1 U1661 ( .A0(n2360), .A1(n2361), .B0(n2362), .B1(n2361), .C0(n2360), 
        .C1(n2362), .Y(n2293) );
  INVX2 U1662 ( .A(n2328), .Y(n2362) );
  INVX2 U1663 ( .A(n2326), .Y(n2361) );
  INVXL U1664 ( .A(n2327), .Y(n2360) );
  XNOR3X2 U1665 ( .A(n2146), .B(n1585), .C(n2145), .Y(n2136) );
  OAI222X1 U1666 ( .A0(n2131), .A1(n2132), .B0(n2133), .B1(n2132), .C0(n2133), 
        .C1(n2131), .Y(n2128) );
  INVX2 U1667 ( .A(n2134), .Y(n2133) );
  INVX2 U1668 ( .A(n2135), .Y(n2132) );
  XOR3X2 U1669 ( .A(n1572), .B(n1549), .C(n2141), .Y(n2135) );
  OAI222X1 U1670 ( .A0(n2140), .A1(n1572), .B0(n2140), .B1(n1549), .C0(n1549), 
        .C1(n1572), .Y(n2137) );
  INVX2 U1671 ( .A(n2141), .Y(n2140) );
  OAI22X1 U1672 ( .A0(n1684), .A1(n1532), .B0(n1521), .B1(I1[13]), .Y(n2153)
         );
  OAI222X1 U1673 ( .A0(n1787), .A1(n1788), .B0(n1787), .B1(n1789), .C0(n1788), 
        .C1(n1789), .Y(n1781) );
  INVX2 U1674 ( .A(n1791), .Y(n1788) );
  INVX2 U1675 ( .A(n1790), .Y(n1789) );
  CLKINVXL U1676 ( .A(n1792), .Y(n1787) );
  OAI222X1 U1677 ( .A0(n1779), .A1(n1581), .B0(n1780), .B1(n1779), .C0(n1780), 
        .C1(n1581), .Y(n1757) );
  INVX2 U1678 ( .A(n1781), .Y(n1780) );
  OAI222X1 U1679 ( .A0(n1813), .A1(n1564), .B0(n1814), .B1(n1564), .C0(n1814), 
        .C1(n1813), .Y(n1784) );
  CLKINVXL U1680 ( .A(n1815), .Y(n1814) );
  OAI222X1 U1681 ( .A0(n1730), .A1(n1731), .B0(n1730), .B1(n1732), .C0(n1731), 
        .C1(n1732), .Y(n1719) );
  INVX2 U1682 ( .A(n1733), .Y(n1732) );
  INVX2 U1683 ( .A(n1734), .Y(n1731) );
  INVX2 U1684 ( .A(n1735), .Y(n1730) );
  OAI222X1 U1685 ( .A0(n1715), .A1(n1716), .B0(n1715), .B1(n1717), .C0(n1716), 
        .C1(n1717), .Y(n1697) );
  INVX2 U1686 ( .A(n1718), .Y(n1716) );
  INVX2 U1687 ( .A(n1719), .Y(n1715) );
  XOR3X2 U1688 ( .A(n1964), .B(n1746), .C(n1861), .Y(n1803) );
  XNOR3X2 U1689 ( .A(n2144), .B(n2142), .C(n2143), .Y(n2138) );
  XNOR3X2 U1690 ( .A(n2191), .B(n2193), .C(n2192), .Y(n2189) );
  INVX2 U1691 ( .A(n2265), .Y(n2202) );
  OAI222X1 U1692 ( .A0(n2191), .A1(n2266), .B0(n2266), .B1(n2193), .C0(n2191), 
        .C1(n2193), .Y(n2265) );
  INVX2 U1693 ( .A(n2192), .Y(n2266) );
  OAI222X1 U1694 ( .A0(n1758), .A1(n1759), .B0(n1758), .B1(n1760), .C0(n1759), 
        .C1(n1760), .Y(n1751) );
  INVX2 U1695 ( .A(n1761), .Y(n1759) );
  INVX2 U1696 ( .A(n1762), .Y(n1758) );
  OAI222X1 U1697 ( .A0(n1565), .A1(n1586), .B0(n1750), .B1(n1565), .C0(n1750), 
        .C1(n1586), .Y(n1727) );
  INVX2 U1698 ( .A(n1751), .Y(n1750) );
  BUFX2 U1699 ( .A(n1742), .Y(n1608) );
  XOR3X2 U1700 ( .A(n1761), .B(n1760), .C(n1762), .Y(n1779) );
  XNOR3X2 U1701 ( .A(n1581), .B(n1779), .C(n1781), .Y(n1785) );
  XOR3X2 U1702 ( .A(n1586), .B(n1565), .C(n1751), .Y(n1756) );
  XNOR3X2 U1703 ( .A(n1734), .B(n1733), .C(n1735), .Y(n1565) );
  XOR3X2 U1704 ( .A(n1718), .B(n1717), .C(n1719), .Y(n1728) );
  NOR2X1 U1705 ( .A(n2275), .B(n1966), .Y(n2244) );
  OAI222X1 U1706 ( .A0(n1746), .A1(n2150), .B0(n2150), .B1(n2089), .C0(n1746), 
        .C1(n2089), .Y(n2141) );
  XOR2X1 U1707 ( .A(n2045), .B(n2167), .Y(n2150) );
  XOR3X2 U1708 ( .A(n2131), .B(n2134), .C(n2135), .Y(n2129) );
  NOR2X1 U1709 ( .A(n1980), .B(n2045), .Y(n2160) );
  BUFX2 U1710 ( .A(n1811), .Y(n1605) );
  INVX2 U1711 ( .A(n1862), .Y(n1681) );
  OAI22XL U1712 ( .A0(n1607), .A1(n1532), .B0(n1521), .B1(n1607), .Y(n1862) );
  XNOR3X2 U1713 ( .A(n1576), .B(n1698), .C(n1700), .Y(n1717) );
  INVX2 U1714 ( .A(n1745), .Y(n1707) );
  OAI222X1 U1715 ( .A0(n1746), .A1(n1747), .B0(n1746), .B1(n1809), .C0(n1747), 
        .C1(n1809), .Y(n1745) );
  XOR3X2 U1716 ( .A(n1775), .B(n1809), .C(n1797), .Y(n1773) );
  INVX2 U1717 ( .A(n2226), .Y(n1967) );
  OAI22X1 U1718 ( .A0(n1742), .A1(n1534), .B0(n1520), .B1(I1[11]), .Y(n2226)
         );
  XOR3X2 U1719 ( .A(n1553), .B(n1670), .C(n1671), .Y(n1688) );
  OAI222X1 U1720 ( .A0(n1698), .A1(n1576), .B0(n1699), .B1(n1698), .C0(n1699), 
        .C1(n1576), .Y(n1690) );
  INVX2 U1721 ( .A(n1700), .Y(n1699) );
  OAI222X1 U1722 ( .A0(n1746), .A1(n1775), .B0(n1775), .B1(n1809), .C0(n1746), 
        .C1(n1809), .Y(n1741) );
  XOR3X2 U1723 ( .A(n1746), .B(n1747), .C(n1643), .Y(n1740) );
  OAI22X1 U1724 ( .A0(n1742), .A1(n1520), .B0(n1742), .B1(n1534), .Y(n2165) );
  XOR3X2 U1725 ( .A(n2176), .B(n2152), .C(n1643), .Y(n1704) );
  AOI2BB1X1 U1726 ( .A0N(n1520), .A1N(I1[11]), .B0(n2170), .Y(n2163) );
  NOR2X1 U1727 ( .A(n1742), .B(n1534), .Y(n2170) );
  XNOR2X1 U1728 ( .A(n1710), .B(n1711), .Y(n1703) );
  INVX2 U1729 ( .A(n2172), .Y(n2156) );
  OAI222XL U1730 ( .A0(n1978), .A1(n2058), .B0(n1964), .B1(n2058), .C0(n1964), 
        .C1(n1978), .Y(n2172) );
  OAI222X1 U1731 ( .A0(n1584), .A1(n1568), .B0(n2161), .B1(n1584), .C0(n2161), 
        .C1(n1568), .Y(n2124) );
  INVX2 U1732 ( .A(n2118), .Y(n2161) );
  OAI22X1 U1733 ( .A0(n1611), .A1(n1539), .B0(n1610), .B1(n1611), .Y(n2108) );
  OAI22X1 U1734 ( .A0(n1811), .A1(n1538), .B0(n1811), .B1(n1536), .Y(n2095) );
  OAI221X1 U1735 ( .A0(n2020), .A1(n2021), .B0(n2022), .B1(n2023), .C0(n2024), 
        .Y(n2018) );
  AOI2BB1X1 U1736 ( .A0N(n2080), .A1N(n2079), .B0(n1566), .Y(n2020) );
  INVX2 U1737 ( .A(n2072), .Y(n2022) );
  OAI221X1 U1738 ( .A0(n1570), .A1(n2025), .B0(n2026), .B1(n1570), .C0(n2027), 
        .Y(n2024) );
  OAI32X1 U1739 ( .A0(n1566), .A1(n2073), .A2(n2074), .B0(n2075), .B1(n2076), 
        .Y(n2021) );
  INVX2 U1740 ( .A(n2079), .Y(n2074) );
  INVX2 U1741 ( .A(n2078), .Y(n2075) );
  INVX2 U1742 ( .A(n2077), .Y(n2076) );
  NOR2X1 U1743 ( .A(n2077), .B(n2078), .Y(n1566) );
  BUFX2 U1744 ( .A(n2201), .Y(n1611) );
  AOI2BB1X1 U1745 ( .A0N(n1538), .A1N(I1[9]), .B0(n2115), .Y(n2094) );
  NOR2X1 U1746 ( .A(n1811), .B(n1536), .Y(n2115) );
  INVX2 U1747 ( .A(n2270), .Y(n2252) );
  OAI22X1 U1748 ( .A0(n1811), .A1(n1536), .B0(n1538), .B1(I1[9]), .Y(n2270) );
  XOR3X2 U1749 ( .A(n1675), .B(n1676), .C(n1677), .Y(n1689) );
  OAI222X1 U1750 ( .A0(n1672), .A1(n1673), .B0(n1674), .B1(n1673), .C0(n1672), 
        .C1(n1674), .Y(n1636) );
  INVX2 U1751 ( .A(n1675), .Y(n1674) );
  CLKINVXL U1752 ( .A(n1677), .Y(n1672) );
  INVX2 U1753 ( .A(n1676), .Y(n1673) );
  XNOR3X2 U1754 ( .A(n1635), .B(n1634), .C(n1636), .Y(n1567) );
  OAI22XL U1755 ( .A0(I1[9]), .A1(n1536), .B0(n1538), .B1(n1605), .Y(n2113) );
  OAI222X1 U1756 ( .A0(n1669), .A1(n1553), .B0(n1669), .B1(n1670), .C0(n1670), 
        .C1(n1553), .Y(n1655) );
  CLKINVXL U1757 ( .A(n1671), .Y(n1669) );
  NOR2X1 U1758 ( .A(n1710), .B(n1711), .Y(n1679) );
  OAI22XL U1759 ( .A0(n1538), .A1(n1605), .B0(n1605), .B1(n1536), .Y(n2318) );
  INVX2 U1760 ( .A(n1610), .Y(n2062) );
  XNOR3X2 U1761 ( .A(n2151), .B(n2089), .C(n2150), .Y(n1568) );
  OAI22X1 U1762 ( .A0(n1611), .A1(n1539), .B0(n1610), .B1(n1611), .Y(n2311) );
  OAI22XL U1763 ( .A0(I1[7]), .A1(n1539), .B0(n1610), .B1(n1611), .Y(n2091) );
  OAI22X1 U1764 ( .A0(n1811), .A1(n1536), .B0(n1538), .B1(n1811), .Y(n1638) );
  XOR3X2 U1765 ( .A(n1568), .B(n1584), .C(n2118), .Y(n2098) );
  OAI22XL U1766 ( .A0(n1610), .A1(n1611), .B0(n1611), .B1(n1539), .Y(n2305) );
  OAI222X1 U1767 ( .A0(n2102), .A1(n1588), .B0(n2111), .B1(n1588), .C0(n2111), 
        .C1(n2102), .Y(n2099) );
  INVX2 U1768 ( .A(n2101), .Y(n2111) );
  XOR2X1 U1769 ( .A(n1978), .B(n2228), .Y(n2232) );
  XNOR3X2 U1770 ( .A(n2102), .B(n1588), .C(n2101), .Y(n2072) );
  NOR2X1 U1771 ( .A(n1978), .B(n2227), .Y(n1975) );
  INVX2 U1772 ( .A(n2228), .Y(n2227) );
  INVX2 U1773 ( .A(n2200), .Y(n2176) );
  OAI22X1 U1774 ( .A0(n1611), .A1(n1539), .B0(n1610), .B1(n2201), .Y(n2200) );
  XOR3X2 U1775 ( .A(n1649), .B(n1651), .C(n1652), .Y(n1653) );
  INVX2 U1776 ( .A(n1712), .Y(n1615) );
  OAI22X1 U1777 ( .A0(n1520), .A1(n1742), .B0(n1742), .B1(n1534), .Y(n1712) );
  INVX2 U1778 ( .A(n2023), .Y(n2100) );
  XOR3X2 U1779 ( .A(n1978), .B(n1964), .C(n2058), .Y(n2102) );
  INVX2 U1780 ( .A(n2269), .Y(n2191) );
  OAI22X1 U1781 ( .A0(n2201), .A1(n1539), .B0(n1610), .B1(I1[7]), .Y(n2269) );
  XNOR3X2 U1782 ( .A(n1644), .B(n1642), .C(n1569), .Y(n1637) );
  XNOR3X2 U1783 ( .A(n1614), .B(n1638), .C(n1613), .Y(n1569) );
  OAI22X1 U1784 ( .A0(n2201), .A1(n1610), .B0(n2201), .B1(n1539), .Y(n2068) );
  INVX2 U1785 ( .A(n2087), .Y(n2067) );
  OAI22X1 U1786 ( .A0(n1539), .A1(n2201), .B0(n1610), .B1(I1[7]), .Y(n2087) );
  OAI22X1 U1787 ( .A0(n2201), .A1(n1539), .B0(n1610), .B1(n2201), .Y(n1812) );
  INVX2 U1788 ( .A(n2090), .Y(n2105) );
  OR2X1 U1789 ( .A(n2105), .B(n2045), .Y(n2089) );
  BUFX2 U1790 ( .A(n2168), .Y(n1604) );
  OAI22X1 U1791 ( .A0(n1684), .A1(n1532), .B0(n1521), .B1(n1684), .Y(n1646) );
  OAI222XL U1792 ( .A0(n1648), .A1(n1649), .B0(n1649), .B1(n1650), .C0(n1648), 
        .C1(n1650), .Y(n1647) );
  INVX2 U1793 ( .A(n1652), .Y(n1648) );
  INVX2 U1794 ( .A(n1651), .Y(n1650) );
  XOR3X2 U1795 ( .A(n2176), .B(n1615), .C(n1643), .Y(n1642) );
  INVX2 U1796 ( .A(n2073), .Y(n2080) );
  INVX2 U1797 ( .A(n1635), .Y(n1632) );
  INVX2 U1798 ( .A(n2063), .Y(n2066) );
  OAI222X1 U1799 ( .A0(n2058), .A1(n2064), .B0(n2065), .B1(n2064), .C0(n2065), 
        .C1(n2058), .Y(n2056) );
  INVX2 U1800 ( .A(n2059), .Y(n2065) );
  INVX2 U1801 ( .A(n2060), .Y(n2064) );
  NOR2X1 U1802 ( .A(n1590), .B(n2056), .Y(n1570) );
  AOI2BB2X1 U1803 ( .B0(n1590), .B1(n2056), .A0N(n2057), .A1N(n2051), .Y(n2025) );
  INVX2 U1804 ( .A(n2031), .Y(n2057) );
  INVX2 U1805 ( .A(n1797), .Y(n1746) );
  OR2X1 U1806 ( .A(n2045), .B(n2180), .Y(n2177) );
  XOR3X2 U1807 ( .A(n2058), .B(n2059), .C(n2060), .Y(n2051) );
  OR2X1 U1808 ( .A(n1966), .B(n2105), .Y(n2258) );
  XOR3X2 U1809 ( .A(n2062), .B(n2045), .C(n2063), .Y(n2055) );
  INVX2 U1810 ( .A(n2028), .Y(n2036) );
  OAI222X1 U1811 ( .A0(n2066), .A1(n1610), .B0(n2066), .B1(n2045), .C0(n2045), 
        .C1(n1610), .Y(n2059) );
  INVX2 U1812 ( .A(n2029), .Y(n2035) );
  OAI22X1 U1813 ( .A0(n2201), .A1(n1539), .B0(n1610), .B1(n2201), .Y(n1639) );
  INVX2 U1814 ( .A(n2034), .Y(n2040) );
  OR2X1 U1815 ( .A(n2045), .B(n2052), .Y(n2054) );
  XOR2X1 U1816 ( .A(n1683), .B(n1746), .Y(n1675) );
  NOR2X1 U1817 ( .A(n1746), .B(n1683), .Y(n1652) );
  XOR3X2 U1818 ( .A(n1949), .B(n1950), .C(n1951), .Y(n1917) );
  INVX2 U1819 ( .A(n1952), .Y(n2309) );
  OAI222X1 U1820 ( .A0(n1970), .A1(n1971), .B0(n1972), .B1(n1971), .C0(n1970), 
        .C1(n1972), .Y(n1936) );
  INVX2 U1821 ( .A(n1975), .Y(n1970) );
  INVX2 U1822 ( .A(n1973), .Y(n1972) );
  INVX2 U1823 ( .A(n1974), .Y(n1971) );
  OAI222X1 U1824 ( .A0(n1928), .A1(n1556), .B0(n1929), .B1(n1556), .C0(n1928), 
        .C1(n1929), .Y(n1898) );
  INVX2 U1825 ( .A(n1930), .Y(n1929) );
  INVX2 U1826 ( .A(n1941), .Y(n1938) );
  INVX2 U1827 ( .A(n1940), .Y(n1939) );
  OAI32X1 U1828 ( .A0(n2001), .A1(n1593), .A2(n2002), .B0(n2003), .B1(n2004), 
        .Y(n1990) );
  INVX2 U1829 ( .A(n2005), .Y(n2004) );
  INVX2 U1830 ( .A(n2006), .Y(n2003) );
  INVX2 U1831 ( .A(n2007), .Y(n2001) );
  OR2X1 U1832 ( .A(n2005), .B(n2006), .Y(n2007) );
  XNOR3X2 U1833 ( .A(n2212), .B(n2213), .C(n2214), .Y(n1571) );
  INVX2 U1834 ( .A(n1951), .Y(n2303) );
  XOR3X2 U1835 ( .A(n1941), .B(n1942), .C(n1940), .Y(n1935) );
  XOR3X2 U1836 ( .A(n1928), .B(n1556), .C(n1930), .Y(n1900) );
  OAI222X1 U1837 ( .A0(n2209), .A1(n2210), .B0(n2211), .B1(n2210), .C0(n2209), 
        .C1(n2211), .Y(n1957) );
  INVX2 U1838 ( .A(n2214), .Y(n2209) );
  INVX2 U1839 ( .A(n2213), .Y(n2210) );
  OAI222X1 U1840 ( .A0(n1955), .A1(n1592), .B0(n1956), .B1(n1592), .C0(n1955), 
        .C1(n1956), .Y(n1899) );
  OAI222X1 U1841 ( .A0(n2235), .A1(n2236), .B0(n2236), .B1(n2237), .C0(n2235), 
        .C1(n2237), .Y(n2208) );
  INVX2 U1842 ( .A(n2238), .Y(n2236) );
  INVX2 U1843 ( .A(n2239), .Y(n2235) );
  XOR3X2 U1844 ( .A(n1973), .B(n1975), .C(n1974), .Y(n1961) );
  OAI222X1 U1845 ( .A0(n2365), .A1(n2366), .B0(n2367), .B1(n2366), .C0(n2365), 
        .C1(n2367), .Y(n2292) );
  INVX2 U1846 ( .A(n2314), .Y(n2367) );
  INVX2 U1847 ( .A(n2315), .Y(n2365) );
  INVX2 U1848 ( .A(n2316), .Y(n2366) );
  INVX2 U1849 ( .A(n1948), .Y(n1943) );
  INVX2 U1850 ( .A(n1946), .Y(n1945) );
  XOR3X2 U1851 ( .A(n1955), .B(n1592), .C(n1957), .Y(n2005) );
  OAI222X1 U1852 ( .A0(n2343), .A1(n2344), .B0(n2344), .B1(n2345), .C0(n2343), 
        .C1(n2345), .Y(n1856) );
  INVX2 U1853 ( .A(n2348), .Y(n2343) );
  INVX2 U1854 ( .A(n2346), .Y(n2345) );
  INVX2 U1855 ( .A(n2347), .Y(n2344) );
  OAI222X1 U1856 ( .A0(n1978), .A1(n2195), .B0(n1978), .B1(n2224), .C0(n2224), 
        .C1(n2195), .Y(n2145) );
  INVX2 U1857 ( .A(n2154), .Y(n2195) );
  OAI222X1 U1858 ( .A0(n2320), .A1(n2321), .B0(n2321), .B1(n2322), .C0(n2320), 
        .C1(n2322), .Y(n2290) );
  INVX2 U1859 ( .A(n1923), .Y(n2320) );
  INVX2 U1860 ( .A(n1922), .Y(n2322) );
  INVX2 U1861 ( .A(n1924), .Y(n2321) );
  OAI22XL U1862 ( .A0(n1606), .A1(n1618), .B0(n1519), .B1(n1617), .Y(n2324) );
  BUFX2 U1863 ( .A(n1617), .Y(n1606) );
  OAI22X1 U1864 ( .A0(I1[15]), .A1(n1618), .B0(n1519), .B1(n1606), .Y(n2272)
         );
  OAI222X1 U1865 ( .A0(n1863), .A1(n1864), .B0(n1865), .B1(n1864), .C0(n1863), 
        .C1(n1865), .Y(n1791) );
  INVX2 U1866 ( .A(n1868), .Y(n1863) );
  INVX2 U1867 ( .A(n1866), .Y(n1865) );
  INVX2 U1868 ( .A(n1867), .Y(n1864) );
  XOR3X2 U1869 ( .A(n2238), .B(n2237), .C(n2239), .Y(n2016) );
  XOR3X2 U1870 ( .A(n1946), .B(n1948), .C(n1947), .Y(n1934) );
  OAI22XL U1871 ( .A0(n1617), .A1(n1618), .B0(n1519), .B1(I1[15]), .Y(n2369)
         );
  OAI222X1 U1872 ( .A0(n2376), .A1(n2377), .B0(n2377), .B1(n2378), .C0(n2376), 
        .C1(n2378), .Y(n2336) );
  INVX2 U1873 ( .A(n2294), .Y(n2378) );
  INVX2 U1874 ( .A(n2295), .Y(n2376) );
  INVX2 U1875 ( .A(n2296), .Y(n2377) );
  OAI22XL U1876 ( .A0(n1617), .A1(n1519), .B0(n1617), .B1(n1618), .Y(n2263) );
  OAI2BB1XL U1877 ( .A0N(n2002), .A1N(n1593), .B0(n2007), .Y(n1986) );
  OAI222X1 U1878 ( .A0(n2278), .A1(n2279), .B0(n2279), .B1(n2280), .C0(n2278), 
        .C1(n2280), .Y(n2238) );
  INVX2 U1879 ( .A(n2204), .Y(n2279) );
  INVX2 U1880 ( .A(n2205), .Y(n2278) );
  INVX2 U1881 ( .A(n2206), .Y(n2280) );
  AOI2BB1X1 U1882 ( .A0N(n1519), .A1N(I1[15]), .B0(n2274), .Y(n2262) );
  NOR2X1 U1883 ( .A(n1617), .B(n1618), .Y(n2274) );
  XNOR3X2 U1884 ( .A(n1978), .B(n2224), .C(n2154), .Y(n1572) );
  XOR2X1 U1885 ( .A(n2196), .B(n2197), .Y(n2146) );
  OAI222X1 U1886 ( .A0(n1763), .A1(n1764), .B0(n1763), .B1(n1597), .C0(n1764), 
        .C1(n1597), .Y(n1735) );
  INVX2 U1887 ( .A(n1765), .Y(n1763) );
  XOR3X2 U1888 ( .A(n1802), .B(n1803), .C(n1804), .Y(n1790) );
  XNOR3X2 U1889 ( .A(n2347), .B(n2346), .C(n2348), .Y(n1573) );
  NOR2X1 U1890 ( .A(n2267), .B(n2196), .Y(n2192) );
  OAI222X1 U1891 ( .A0(n1793), .A1(n1794), .B0(n1795), .B1(n1794), .C0(n1793), 
        .C1(n1795), .Y(n1762) );
  INVX2 U1892 ( .A(n1796), .Y(n1795) );
  XNOR3X2 U1893 ( .A(n1952), .B(n1953), .C(n1954), .Y(n1574) );
  XNOR3X2 U1894 ( .A(n1794), .B(n1793), .C(n1796), .Y(n1813) );
  INVX2 U1895 ( .A(n1619), .Y(n2251) );
  OAI222X1 U1896 ( .A0(n1799), .A1(n1800), .B0(n1801), .B1(n1800), .C0(n1799), 
        .C1(n1801), .Y(n1761) );
  INVX2 U1897 ( .A(n1804), .Y(n1799) );
  INVX2 U1898 ( .A(n1802), .Y(n1801) );
  INVX2 U1899 ( .A(n1803), .Y(n1800) );
  OAI222X1 U1900 ( .A0(n2178), .A1(n2159), .B0(n2179), .B1(n2178), .C0(n2179), 
        .C1(n2159), .Y(n2143) );
  INVX2 U1901 ( .A(n2160), .Y(n2179) );
  INVX2 U1902 ( .A(n2158), .Y(n2178) );
  XNOR3X2 U1903 ( .A(n2314), .B(n2315), .C(n2316), .Y(n1575) );
  OAI22XL U1904 ( .A0(n1606), .A1(n1618), .B0(n1519), .B1(n1606), .Y(n1643) );
  XNOR3X2 U1905 ( .A(n1964), .B(n1707), .C(n1709), .Y(n1576) );
  XNOR2X1 U1906 ( .A(n2264), .B(n2304), .Y(n1949) );
  XOR3X2 U1907 ( .A(n2311), .B(n2354), .C(n2353), .Y(n2341) );
  OAI222X1 U1908 ( .A0(n1770), .A1(n1771), .B0(n1772), .B1(n1771), .C0(n1770), 
        .C1(n1772), .Y(n1734) );
  INVX2 U1909 ( .A(n1774), .Y(n1770) );
  INVX2 U1910 ( .A(n1773), .Y(n1771) );
  XNOR2X1 U1911 ( .A(n2264), .B(n2304), .Y(n2326) );
  OR2XL U1912 ( .A(n2152), .B(n2304), .Y(n1577) );
  OR2X1 U1913 ( .A(n2349), .B(n2152), .Y(n2354) );
  XOR3X2 U1914 ( .A(n1872), .B(n1870), .C(n1871), .Y(n1860) );
  OR2X1 U1915 ( .A(n2349), .B(n1615), .Y(n1870) );
  INVX2 U1916 ( .A(n1706), .Y(n1670) );
  OAI222XL U1917 ( .A0(n1964), .A1(n1707), .B0(n1707), .B1(n1708), .C0(n1964), 
        .C1(n1708), .Y(n1706) );
  INVX2 U1918 ( .A(n1709), .Y(n1708) );
  XNOR3X2 U1919 ( .A(n1866), .B(n1867), .C(n1868), .Y(n1578) );
  INVX2 U1920 ( .A(n2352), .Y(n1859) );
  OAI22XL U1921 ( .A0(n2176), .A1(n2353), .B0(n2176), .B1(n2354), .Y(n2352) );
  XNOR3X2 U1922 ( .A(n1922), .B(n1923), .C(n1924), .Y(n1579) );
  XNOR2X1 U1923 ( .A(n1964), .B(n2373), .Y(n1580) );
  XOR3X2 U1924 ( .A(n2224), .B(n1964), .C(n2264), .Y(n2184) );
  INVX2 U1925 ( .A(n1778), .Y(n1747) );
  OAI22XL U1926 ( .A0(n1607), .A1(n1532), .B0(I1[13]), .B1(n1521), .Y(n1778)
         );
  OAI222X1 U1927 ( .A0(n1736), .A1(n1737), .B0(n1737), .B1(n1738), .C0(n1736), 
        .C1(n1738), .Y(n1700) );
  INVX2 U1928 ( .A(n1739), .Y(n1738) );
  INVX2 U1929 ( .A(n1740), .Y(n1737) );
  INVX2 U1930 ( .A(n1741), .Y(n1736) );
  XOR3X2 U1931 ( .A(n1772), .B(n1773), .C(n1774), .Y(n1760) );
  XNOR3X2 U1932 ( .A(n1597), .B(n1764), .C(n1765), .Y(n1581) );
  OAI222X1 U1933 ( .A0(n2155), .A1(n1596), .B0(n2156), .B1(n1596), .C0(n2155), 
        .C1(n2156), .Y(n2134) );
  INVX2 U1934 ( .A(n2157), .Y(n2155) );
  NOR2X1 U1935 ( .A(n2152), .B(n2304), .Y(n2364) );
  XNOR3X2 U1936 ( .A(n2294), .B(n2295), .C(n2296), .Y(n1582) );
  OAI222X1 U1937 ( .A0(n1869), .A1(n1870), .B0(n1871), .B1(n1870), .C0(n1869), 
        .C1(n1871), .Y(n1796) );
  INVX2 U1938 ( .A(n1872), .Y(n1869) );
  XOR2X1 U1939 ( .A(n1681), .B(n2224), .Y(n1772) );
  INVX2 U1940 ( .A(n1743), .Y(n1710) );
  OAI22XL U1941 ( .A0(I1[13]), .A1(n1532), .B0(n1521), .B1(n1607), .Y(n1743)
         );
  OAI22XL U1942 ( .A0(n1608), .A1(n1534), .B0(I1[11]), .B1(n1520), .Y(n1810)
         );
  XOR3X2 U1943 ( .A(n1554), .B(n1595), .C(n1749), .Y(n1733) );
  XOR3X2 U1944 ( .A(n2158), .B(n2159), .C(n2160), .Y(n2131) );
  XNOR3X2 U1945 ( .A(n2204), .B(n2205), .C(n2206), .Y(n1583) );
  INVX2 U1946 ( .A(n1542), .Y(n2355) );
  XNOR3X2 U1947 ( .A(n1596), .B(n2156), .C(n2157), .Y(n1584) );
  NOR2X1 U1948 ( .A(n1964), .B(n2373), .Y(n2340) );
  XOR3X2 U1949 ( .A(n1598), .B(n1523), .C(n2083), .Y(n2077) );
  XNOR3X2 U1950 ( .A(n2066), .B(n2224), .C(n1969), .Y(n1585) );
  INVX2 U1951 ( .A(I1[7]), .Y(n2201) );
  XNOR3X2 U1952 ( .A(n1740), .B(n1739), .C(n1741), .Y(n1586) );
  XOR3X2 U1953 ( .A(n1681), .B(n2176), .C(n1682), .Y(n1676) );
  INVX2 U1954 ( .A(n1798), .Y(n1775) );
  OAI22XL U1955 ( .A0(I1[11]), .A1(n1534), .B0(n1520), .B1(n1608), .Y(n1798)
         );
  AND2X1 U1956 ( .A(n2117), .B(n2116), .Y(n2118) );
  BUFX2 U1957 ( .A(n1645), .Y(n1610) );
  XOR2X1 U1958 ( .A(n2389), .B(I1[5]), .Y(n1645) );
  INVX2 U1959 ( .A(n2371), .Y(n2351) );
  OAI22XL U1960 ( .A0(n1605), .A1(n1536), .B0(I1[9]), .B1(n1538), .Y(n2371) );
  OAI22XL U1961 ( .A0(I1[9]), .A1(n1536), .B0(n1538), .B1(n1605), .Y(n1872) );
  OAI222XL U1962 ( .A0(n1748), .A1(n1595), .B0(n1748), .B1(n1554), .C0(n1595), 
        .C1(n1554), .Y(n1718) );
  INVX2 U1963 ( .A(n1749), .Y(n1748) );
  OAI222X1 U1964 ( .A0(n2081), .A1(n2082), .B0(n2082), .B1(n1555), .C0(n2081), 
        .C1(n1555), .Y(n2078) );
  XNOR2X1 U1965 ( .A(n2116), .B(n2117), .Y(n1588) );
  NOR2BX1 U1966 ( .AN(n2318), .B(n2304), .Y(n2328) );
  OAI222XL U1967 ( .A0(n2176), .A1(n1680), .B0(n1681), .B1(n2176), .C0(n1681), 
        .C1(n1680), .Y(n1635) );
  INVX2 U1968 ( .A(n1682), .Y(n1680) );
  XOR3X2 U1969 ( .A(n2224), .B(n2310), .C(n2311), .Y(n1952) );
  OAI222X1 U1970 ( .A0(n2224), .A1(n2104), .B0(n2104), .B1(n2093), .C0(n2224), 
        .C1(n2093), .Y(n2083) );
  INVX2 U1971 ( .A(n2092), .Y(n2104) );
  INVX2 U1972 ( .A(n2386), .Y(n2379) );
  OAI22XL U1973 ( .A0(I1[7]), .A1(n1539), .B0(n1610), .B1(n1611), .Y(n2386) );
  XOR3X2 U1974 ( .A(n2081), .B(n1555), .C(n2082), .Y(n2073) );
  OAI222X1 U1975 ( .A0(n2112), .A1(n2110), .B0(n2112), .B1(n2166), .C0(n2166), 
        .C1(n2110), .Y(n2101) );
  CLKINVXL U1976 ( .A(n2109), .Y(n2112) );
  OAI22XL U1977 ( .A0(n1611), .A1(n1539), .B0(I1[7]), .B1(n1610), .Y(n2368) );
  XOR3X2 U1978 ( .A(n1964), .B(n1615), .C(n1641), .Y(n1651) );
  XNOR3X2 U1979 ( .A(n2224), .B(n2093), .C(n2092), .Y(n2082) );
  OAI222XL U1980 ( .A0(n1523), .A1(n1598), .B0(n2103), .B1(n1523), .C0(n2103), 
        .C1(n1598), .Y(n2023) );
  CLKINVXL U1981 ( .A(n2083), .Y(n2103) );
  OAI222XL U1982 ( .A0(n1964), .A1(n1640), .B0(n1964), .B1(n1615), .C0(n1615), 
        .C1(n1640), .Y(n1614) );
  INVX2 U1983 ( .A(n1641), .Y(n1640) );
  OAI222X1 U1984 ( .A0(n2224), .A1(n2086), .B0(n2224), .B1(n2067), .C0(n2086), 
        .C1(n2067), .Y(n2071) );
  INVX2 U1985 ( .A(n2068), .Y(n2086) );
  OAI222X1 U1986 ( .A0(n2069), .A1(n2084), .B0(n2085), .B1(n2084), .C0(n2085), 
        .C1(n2069), .Y(n2079) );
  INVX2 U1987 ( .A(n2070), .Y(n2084) );
  INVX2 U1988 ( .A(n2071), .Y(n2085) );
  OAI22X1 U1989 ( .A0(n1604), .A1(n1541), .B0(n1603), .B1(n1604), .Y(n2090) );
  XNOR2X1 U1990 ( .A(n2382), .B(I1[5]), .Y(n1589) );
  INVX2 U1991 ( .A(I1[5]), .Y(n2168) );
  XOR3X2 U1992 ( .A(n1646), .B(n2355), .C(n1616), .Y(n1644) );
  XOR2X1 U1993 ( .A(n2048), .B(n2105), .Y(n2058) );
  OAI22X1 U1994 ( .A0(n1604), .A1(n1541), .B0(n1603), .B1(n1604), .Y(n1981) );
  OAI22X1 U1995 ( .A0(I1[5]), .A1(n1541), .B0(n1603), .B1(n1604), .Y(n2063) );
  XOR3X2 U1996 ( .A(n2224), .B(n2067), .C(n2068), .Y(n2060) );
  XNOR3X2 U1997 ( .A(n2069), .B(n2070), .C(n2071), .Y(n1590) );
  XOR2X1 U1998 ( .A(n2048), .B(n2180), .Y(n2159) );
  INVX2 U1999 ( .A(n2199), .Y(n2180) );
  OAI22X1 U2000 ( .A0(n2168), .A1(n1541), .B0(n1603), .B1(I1[5]), .Y(n2199) );
  XOR2X1 U2001 ( .A(n2223), .B(n2105), .Y(n2193) );
  INVX2 U2002 ( .A(n2370), .Y(n2323) );
  OAI22X1 U2003 ( .A0(I1[5]), .A1(n1541), .B0(n1603), .B1(n1604), .Y(n2370) );
  INVX2 U2004 ( .A(n2325), .Y(n2310) );
  OAI22X1 U2005 ( .A0(n1604), .A1(n1541), .B0(I1[5]), .B1(n1603), .Y(n2325) );
  XOR2X1 U2006 ( .A(n2088), .B(n2224), .Y(n2070) );
  NAND2X1 U2007 ( .A(n2089), .B(n2090), .Y(n2088) );
  OAI22X1 U2008 ( .A0(n2168), .A1(n1541), .B0(n1603), .B1(n2168), .Y(n1797) );
  OAI221X1 U2009 ( .A0(n2028), .A1(n2029), .B0(n2030), .B1(n2031), .C0(n2032), 
        .Y(n2026) );
  OAI221X1 U2010 ( .A0(n2033), .A1(n2034), .B0(n2035), .B1(n2036), .C0(n2037), 
        .Y(n2032) );
  INVX2 U2011 ( .A(n2051), .Y(n2030) );
  INVX2 U2012 ( .A(n2041), .Y(n2033) );
  OAI22X1 U2013 ( .A0(n1604), .A1(n1541), .B0(n1603), .B1(n2168), .Y(n2151) );
  OAI22X1 U2014 ( .A0(n1603), .A1(n1604), .B0(n1604), .B1(n1541), .Y(n2228) );
  XNOR3X2 U2015 ( .A(n2224), .B(n2055), .C(n2054), .Y(n2028) );
  BUFX2 U2016 ( .A(n2162), .Y(n1601) );
  OAI22X1 U2017 ( .A0(n2168), .A1(n1541), .B0(n1603), .B1(n2168), .Y(n1711) );
  OAI222X1 U2018 ( .A0(n2049), .A1(n2050), .B0(n2224), .B1(n2050), .C0(n2224), 
        .C1(n2049), .Y(n2029) );
  XOR2X1 U2019 ( .A(n2048), .B(n2052), .Y(n2050) );
  INVX2 U2020 ( .A(n2061), .Y(n2052) );
  OAI22X1 U2021 ( .A0(n1541), .A1(n2168), .B0(n1603), .B1(I1[5]), .Y(n2061) );
  OAI222X1 U2022 ( .A0(n2224), .A1(n2055), .B0(n2055), .B1(n2054), .C0(n2224), 
        .C1(n2054), .Y(n2031) );
  XOR3X2 U2023 ( .A(n2224), .B(n2049), .C(n2050), .Y(n2034) );
  INVX2 U2024 ( .A(n2053), .Y(n2049) );
  OAI22X1 U2025 ( .A0(n2168), .A1(n1603), .B0(n2168), .B1(n1541), .Y(n2053) );
  INVX2 U2026 ( .A(n1713), .Y(n1683) );
  OAI2BB1X1 U2027 ( .A0N(n1603), .A1N(n1541), .B0(I1[5]), .Y(n1713) );
  INVX2 U2028 ( .A(n2048), .Y(n2045) );
  INVX2 U2029 ( .A(n2223), .Y(n1966) );
  OAI222X1 U2030 ( .A0(n1958), .A1(n1959), .B0(n1960), .B1(n1959), .C0(n1958), 
        .C1(n1960), .Y(n1930) );
  INVX2 U2031 ( .A(n1961), .Y(n1960) );
  INVX2 U2032 ( .A(n1963), .Y(n1958) );
  INVX2 U2033 ( .A(n1962), .Y(n1959) );
  XOR3X2 U2034 ( .A(n1594), .B(n1983), .C(n1985), .Y(n1962) );
  OAI222X1 U2035 ( .A0(n1571), .A1(n1599), .B0(n2207), .B1(n1571), .C0(n2207), 
        .C1(n1599), .Y(n2006) );
  INVX2 U2036 ( .A(n2208), .Y(n2207) );
  XOR3X2 U2037 ( .A(n2232), .B(n2231), .C(n2234), .Y(n2213) );
  OAI222XL U2038 ( .A0(n1964), .A1(n2277), .B0(n1968), .B1(n2277), .C0(n1968), 
        .C1(n1964), .Y(n2243) );
  XOR3X2 U2039 ( .A(n2243), .B(n2241), .C(n2244), .Y(n2237) );
  XNOR3X2 U2040 ( .A(n1961), .B(n1962), .C(n1963), .Y(n1592) );
  XNOR3X2 U2041 ( .A(n1599), .B(n1571), .C(n2208), .Y(n1593) );
  OAI222X1 U2042 ( .A0(n2240), .A1(n2241), .B0(n2242), .B1(n2241), .C0(n2240), 
        .C1(n2242), .Y(n2214) );
  INVX2 U2043 ( .A(n2244), .Y(n2240) );
  INVX2 U2044 ( .A(I1[15]), .Y(n1617) );
  XOR3X2 U2045 ( .A(n2277), .B(n1964), .C(n2225), .Y(n2206) );
  INVX2 U2046 ( .A(n2230), .Y(n1955) );
  OAI222X1 U2047 ( .A0(n2231), .A1(n2232), .B0(n2233), .B1(n2231), .C0(n2233), 
        .C1(n2232), .Y(n2230) );
  CLKINVXL U2048 ( .A(n2234), .Y(n2233) );
  INVX2 U2049 ( .A(n1982), .Y(n1928) );
  OAI222XL U2050 ( .A0(n1983), .A1(n1594), .B0(n1984), .B1(n1594), .C0(n1983), 
        .C1(n1984), .Y(n1982) );
  INVX2 U2051 ( .A(n1985), .Y(n1984) );
  OAI222X1 U2052 ( .A0(n1964), .A1(n1978), .B0(n1964), .B1(n2047), .C0(n1978), 
        .C1(n2047), .Y(n2158) );
  XOR2X1 U2053 ( .A(n2224), .B(n1681), .Y(n1802) );
  XOR2X1 U2054 ( .A(n2372), .B(n1615), .Y(n2353) );
  XOR3X2 U2055 ( .A(n2323), .B(n2224), .C(n2264), .Y(n1922) );
  XOR3X2 U2056 ( .A(n1979), .B(n1980), .C(n1981), .Y(n1946) );
  XOR2X1 U2057 ( .A(n1874), .B(n1615), .Y(n1871) );
  XOR2X1 U2058 ( .A(n2372), .B(n2152), .Y(n2373) );
  XOR3X2 U2059 ( .A(n2224), .B(n1746), .C(n2251), .Y(n1866) );
  XNOR3X2 U2060 ( .A(n1969), .B(n1965), .C(n1966), .Y(n1594) );
  OAI222XL U2061 ( .A0(n1964), .A1(n1965), .B0(n1966), .B1(n1965), .C0(n1964), 
        .C1(n1966), .Y(n1940) );
  OAI222XL U2062 ( .A0(n1746), .A1(n1619), .B0(n2224), .B1(n1746), .C0(n2224), 
        .C1(n1619), .Y(n1804) );
  OAI222X1 U2063 ( .A0(n2169), .A1(n2164), .B0(n2163), .B1(n2164), .C0(n2169), 
        .C1(n2163), .Y(n2157) );
  INVX2 U2064 ( .A(n2165), .Y(n2169) );
  CLKINVX2 U2065 ( .A(I1[16]), .Y(n2383) );
  OAI222X1 U2066 ( .A0(n2176), .A1(n1805), .B0(n1806), .B1(n1805), .C0(n2176), 
        .C1(n1806), .Y(n1765) );
  INVX2 U2067 ( .A(n1807), .Y(n1805) );
  NAND2BX1 U2068 ( .AN(n1615), .B(n1874), .Y(n1806) );
  NOR2X1 U2069 ( .A(n1681), .B(n2224), .Y(n1774) );
  OR2XL U2070 ( .A(n1681), .B(n1768), .Y(n1595) );
  OAI222X1 U2071 ( .A0(n1746), .A1(n1542), .B0(n2224), .B1(n1746), .C0(n2224), 
        .C1(n1542), .Y(n1868) );
  XOR3X2 U2072 ( .A(n2224), .B(n1746), .C(n2355), .Y(n2346) );
  XOR3X2 U2073 ( .A(n1812), .B(n1807), .C(n1806), .Y(n1794) );
  XNOR2X1 U2074 ( .A(n1969), .B(n1966), .Y(n1941) );
  NOR2X1 U2075 ( .A(n1964), .B(n2304), .Y(n1951) );
  OAI222X1 U2076 ( .A0(n2176), .A1(n1766), .B0(n1766), .B1(n1964), .C0(n2176), 
        .C1(n1964), .Y(n1749) );
  INVX2 U2077 ( .A(n1767), .Y(n1766) );
  XNOR3X2 U2078 ( .A(n2047), .B(n1978), .C(n1969), .Y(n1596) );
  XOR3X2 U2079 ( .A(n2163), .B(n2164), .C(n2165), .Y(n2117) );
  OAI222X1 U2080 ( .A0(n1977), .A1(n1978), .B0(n1746), .B1(n1978), .C0(n1746), 
        .C1(n1977), .Y(n1948) );
  XNOR3X2 U2081 ( .A(n2176), .B(n1964), .C(n1767), .Y(n1597) );
  OAI22XL U2082 ( .A0(n1606), .A1(n1618), .B0(I1[15]), .B1(n1519), .Y(n1682)
         );
  XOR3X2 U2083 ( .A(n1746), .B(n1977), .C(n2108), .Y(n1973) );
  NOR2X1 U2084 ( .A(n2106), .B(n1966), .Y(n2092) );
  OAI222X1 U2085 ( .A0(n1746), .A1(n2380), .B0(n1746), .B1(n2224), .C0(n2380), 
        .C1(n2224), .Y(n2295) );
  INVX2 U2086 ( .A(n2368), .Y(n2380) );
  OAI22XL U2087 ( .A0(I1[15]), .A1(n1618), .B0(n1519), .B1(n1606), .Y(n1641)
         );
  XOR3X2 U2088 ( .A(n1746), .B(n2224), .C(n2368), .Y(n2314) );
  OAI222XL U2089 ( .A0(n1978), .A1(n2224), .B0(n2105), .B1(n2224), .C0(n1978), 
        .C1(n2105), .Y(n2116) );
  XNOR3X2 U2090 ( .A(n2224), .B(n2105), .C(n2108), .Y(n1598) );
  BUFX2 U2091 ( .A(n1714), .Y(n1603) );
  XOR2X1 U2092 ( .A(n2382), .B(I1[3]), .Y(n1714) );
  INVX2 U2093 ( .A(I1[4]), .Y(n2382) );
  NAND2BX1 U2094 ( .AN(n2105), .B(n1874), .Y(n2110) );
  XOR2XL U2095 ( .A(n2304), .B(n2091), .Y(n2069) );
  XOR2X1 U2096 ( .A(n1874), .B(n2105), .Y(n2093) );
  INVX2 U2097 ( .A(n2096), .Y(n2081) );
  OAI2BB1X1 U2098 ( .A0N(n2097), .A1N(n2090), .B0(n2089), .Y(n2096) );
  XOR2X1 U2099 ( .A(n1746), .B(n2224), .Y(n2294) );
  NOR2X1 U2100 ( .A(n1746), .B(n2224), .Y(n2348) );
  INVX2 U2101 ( .A(n2276), .Y(n2224) );
  INVX2 U2102 ( .A(I1[3]), .Y(n2162) );
  OAI221X1 U2103 ( .A0(n2038), .A1(n2039), .B0(n2040), .B1(n2041), .C0(n2042), 
        .Y(n2037) );
  AND2X1 U2104 ( .A(n2046), .B(n2048), .Y(n2038) );
  INVX2 U2105 ( .A(n2043), .Y(n2042) );
  XOR2X1 U2106 ( .A(n2045), .B(n2047), .Y(n2039) );
  XOR2X1 U2107 ( .A(n1744), .B(n2224), .Y(n1739) );
  NOR2X1 U2108 ( .A(n2224), .B(n1744), .Y(n1709) );
  INVX2 U2109 ( .A(n1609), .Y(n2048) );
  NOR2X1 U2110 ( .A(n2047), .B(n2045), .Y(n2041) );
  OAI2BB1X1 U2111 ( .A0N(n2044), .A1N(n2045), .B0(n2162), .Y(n2043) );
  INVX2 U2112 ( .A(n2046), .Y(n2044) );
  INVX2 U2113 ( .A(n1609), .Y(n2223) );
  INVX2 U2114 ( .A(n2372), .Y(n2349) );
  INVX2 U2115 ( .A(n2372), .Y(n2304) );
  INVX2 U2116 ( .A(n2268), .Y(n2196) );
  INVX2 U2117 ( .A(n1609), .Y(n2268) );
  OAI222X1 U2118 ( .A0(n2215), .A1(n2216), .B0(n2217), .B1(n2216), .C0(n2215), 
        .C1(n2217), .Y(n1963) );
  INVX2 U2119 ( .A(n2220), .Y(n2215) );
  INVX2 U2120 ( .A(n2218), .Y(n2217) );
  INVX2 U2121 ( .A(n2219), .Y(n2216) );
  XNOR3X2 U2122 ( .A(n2218), .B(n2219), .C(n2220), .Y(n1599) );
  OAI222X1 U2123 ( .A0(n2166), .A1(n2221), .B0(n2152), .B1(n2221), .C0(n2166), 
        .C1(n2152), .Y(n1985) );
  XOR3X2 U2124 ( .A(n2304), .B(n1542), .C(n2276), .Y(n2241) );
  XOR3X2 U2125 ( .A(n2166), .B(n2152), .C(n2221), .Y(n2231) );
  XNOR2X1 U2126 ( .A(n2107), .B(n1810), .Y(n1807) );
  OR2X1 U2127 ( .A(n2107), .B(n1810), .Y(n1767) );
  INVX2 U2128 ( .A(n2181), .Y(n2047) );
  OAI22X1 U2129 ( .A0(I1[3]), .A1(n1543), .B0(n1602), .B1(n1601), .Y(n2181) );
  XNOR2X1 U2130 ( .A(n2381), .B(I1[3]), .Y(n1600) );
  OAI22X1 U2131 ( .A0(n1601), .A1(n1543), .B0(n1602), .B1(n1601), .Y(n2276) );
  OR2X1 U2132 ( .A(n2224), .B(n2349), .Y(n1965) );
  OAI22X1 U2133 ( .A0(n1601), .A1(n1543), .B0(n1602), .B1(n1601), .Y(n2097) );
  INVX2 U2134 ( .A(n2313), .Y(n1979) );
  OAI22X1 U2135 ( .A0(I1[3]), .A1(n1543), .B0(n1602), .B1(n1601), .Y(n2313) );
  INVX2 U2136 ( .A(n2281), .Y(n2277) );
  OAI22X1 U2137 ( .A0(n1602), .A1(n1601), .B0(n1601), .B1(n1543), .Y(n2281) );
  INVX2 U2138 ( .A(n2229), .Y(n1977) );
  OAI22X1 U2139 ( .A0(n1601), .A1(n1543), .B0(I1[3]), .B1(n1602), .Y(n2229) );
  INVX2 U2140 ( .A(n2171), .Y(n2164) );
  OAI22X1 U2141 ( .A0(n2162), .A1(n1543), .B0(n1602), .B1(I1[3]), .Y(n2171) );
  INVX2 U2142 ( .A(I1[2]), .Y(n2381) );
  OAI22X1 U2143 ( .A0(n2162), .A1(n1543), .B0(n1602), .B1(n2162), .Y(n1768) );
  INVX2 U2144 ( .A(n1776), .Y(n1744) );
  OAI2BB1X1 U2145 ( .A0N(n1602), .A1N(n1543), .B0(I1[3]), .Y(n1776) );
  BUFX2 U2146 ( .A(n2107), .Y(n1609) );
  OAI21X1 U2147 ( .A0(n2162), .A1(n1543), .B0(n1602), .Y(n2046) );
  INVX2 U2148 ( .A(n2107), .Y(n2372) );
  INVX2 U2149 ( .A(n2107), .Y(n1874) );
  OAI222X1 U2150 ( .A0(n1542), .A1(I1[1]), .B0(n2224), .B1(I1[1]), .C0(n2224), 
        .C1(n1542), .Y(n2220) );
  XOR2X1 U2151 ( .A(I1[1]), .B(n2224), .Y(n2221) );
  BUFX2 U2152 ( .A(n1777), .Y(n1602) );
  XOR2X1 U2153 ( .A(n2381), .B(I1[1]), .Y(n1777) );
  INVX2 U2154 ( .A(I1[1]), .Y(n2107) );
endmodule


module SNN_DW01_add_27_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   carry_8_, carry_7_, carry_6_, carry_5_, carry_4_, carry_3_, carry_2_,
         n1;

  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry_8_), .CO(SUM[9]), .S(SUM[8]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry_2_), .S(SUM[1]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_28_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_29 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:1] carry;

  ADDFX2 U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[2]), .Y(n7) );
  INVX2 U4 ( .A(B[3]), .Y(n6) );
  INVX2 U5 ( .A(B[4]), .Y(n5) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[6]), .Y(n3) );
  INVX2 U8 ( .A(B[1]), .Y(n8) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U10 ( .A(A[0]), .Y(n1) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module SNN_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:1] carry;

  ADDFX2 U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[2]), .Y(n7) );
  INVX2 U4 ( .A(B[3]), .Y(n6) );
  INVX2 U5 ( .A(B[4]), .Y(n5) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[6]), .Y(n3) );
  INVX2 U8 ( .A(B[1]), .Y(n8) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U10 ( .A(A[0]), .Y(n1) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module SNN_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:1] carry;

  ADDFX2 U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[2]), .Y(n7) );
  INVX2 U4 ( .A(B[3]), .Y(n6) );
  INVX2 U5 ( .A(B[4]), .Y(n5) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[6]), .Y(n3) );
  INVX2 U8 ( .A(B[1]), .Y(n8) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U10 ( .A(A[0]), .Y(n1) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module SNN_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:1] carry;

  ADDFX2 U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[2]), .Y(n7) );
  INVX2 U4 ( .A(B[3]), .Y(n6) );
  INVX2 U5 ( .A(B[4]), .Y(n5) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[6]), .Y(n3) );
  INVX2 U8 ( .A(B[1]), .Y(n8) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U10 ( .A(A[0]), .Y(n1) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module SNN_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:1] carry;

  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X2 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U5 ( .A(A[0]), .Y(n1) );
  INVX2 U6 ( .A(B[3]), .Y(n6) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[5]), .Y(n4) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[6]), .Y(n3) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
endmodule


module SNN_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:1] carry;

  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X2 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U5 ( .A(A[0]), .Y(n1) );
  INVX2 U6 ( .A(B[2]), .Y(n7) );
  INVX2 U7 ( .A(B[3]), .Y(n6) );
  INVX2 U8 ( .A(B[4]), .Y(n5) );
  INVX2 U9 ( .A(B[5]), .Y(n4) );
  INVX2 U10 ( .A(B[6]), .Y(n3) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
endmodule


module SNN_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:1] carry;

  XOR3X2 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(A[0]), .Y(n1) );
  INVX2 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U5 ( .A(B[2]), .Y(n7) );
  INVX2 U6 ( .A(B[3]), .Y(n6) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[5]), .Y(n4) );
  INVX2 U9 ( .A(B[6]), .Y(n3) );
  INVX2 U10 ( .A(B[7]), .Y(n2) );
  INVX2 U11 ( .A(B[0]), .Y(n9) );
endmodule


module SNN_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:1] carry;

  XOR3X2 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U2 ( .A(B[0]), .Y(n9) );
  INVX2 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U5 ( .A(A[0]), .Y(n1) );
  INVX2 U6 ( .A(B[3]), .Y(n6) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[5]), .Y(n4) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[6]), .Y(n3) );
  INVX2 U11 ( .A(B[7]), .Y(n2) );
endmodule

