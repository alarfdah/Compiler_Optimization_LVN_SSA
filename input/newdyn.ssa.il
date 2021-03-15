	.data
	.string .int_wformat, "%d\12"
	.string .float_wformat, "%f\12"
	.string .char_wformat, "%c\12"
	.string .string_wformat, "%s\12"
	.string .int_rformat, "%d"
	.string .float_rformat, "%f"
	.string .char_rformat, "%c"
	.string .string_rformat, "%s"
	.text
	.frame main, 3960
# Block No.: 0
	loadI 	30 => %vr8_0
	loadI 	30 => %vr5_0
	loadI 	30 => %vr4_0
	loadI 	1 => %vr9_0
	loadI 	1 => %vr6_0
	loadI 	1 => %vr10_0
	testgt 	%vr10_0 => %vr11_0
	cbr 	%vr11_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr6_1 = (0->%vr6_0, 1->%vr6_2)
	subI 	%vr6_1, 1 => %vr12_0
	mult 	%vr6_1, %vr5_0 => %vr13_0
	addI 	%vr13_0, 1 => %vr14_0
	i2i 	%vr0_0 => %vr15_0
	loadI 	-244 => %vr16_0
	addI 	%vr0_0, -244 => %vr17_0
	subI 	%vr14_0, 1 => %vr18_0
	loadI 	4 => %vr19_0
	multI 	%vr18_0, 4 => %vr20_0
	sub 	%vr17_0, %vr20_0 => %vr21_0
	store 	%vr12_0 => %vr21_0
	i2i 	%vr0_0 => %vr15_1
	loadI 	-124 => %vr22_0
	addI 	%vr0_0, -124 => %vr23_0
	i2i 	%vr12_0 => %vr12_1
	multI 	%vr12_1, 4 => %vr24_0
	sub 	%vr23_0, %vr24_0 => %vr25_0
	store 	%vr6_1 => %vr25_0
	addI 	%vr6_1, 1 => %vr26_0
	i2i 	%vr26_0 => %vr6_2
	comp 	%vr26_0, %vr5_0 => %vr10_1
	testle 	%vr10_1 => %vr11_1
	cbr 	%vr11_1 -> .L1

# Block No.: 2
.L0: nop
	loadI 	1 => %vr7_0
	comp 	%vr7_0, %vr4_0 => %vr27_0
	testgt 	%vr27_0 => %vr28_0
	cbr 	%vr28_0 -> .L2

# Block No.: 3
.L3: nop
	(phi):  %vr7_1 = (2->%vr7_0, 3->%vr7_2)
	subI 	%vr7_1, 1 => %vr29_0
	multI 	%vr5_0, 1 => %vr30_0
	add 	%vr30_0, %vr7_1 => %vr31_0
	i2i 	%vr0_0 => %vr15_2
	loadI 	-244 => %vr16_1
	addI 	%vr0_0, -244 => %vr17_1
	subI 	%vr31_0, 1 => %vr32_0
	loadI 	4 => %vr19_1
	multI 	%vr32_0, 4 => %vr33_0
	sub 	%vr17_1, %vr33_0 => %vr34_0
	store 	%vr29_0 => %vr34_0
	loadI 	2 => %vr35_0
	multI 	%vr7_1, 2 => %vr36_0
	i2i 	%vr0_0 => %vr15_3
	loadI 	-124 => %vr22_1
	addI 	%vr0_0, -124 => %vr23_1
	i2i 	%vr29_0 => %vr29_1
	multI 	%vr29_1, 4 => %vr37_0
	sub 	%vr23_1, %vr37_0 => %vr38_0
	store 	%vr36_0 => %vr38_0
	addI 	%vr7_1, 1 => %vr39_0
	i2i 	%vr39_0 => %vr7_2
	comp 	%vr39_0, %vr4_0 => %vr27_1
	testle 	%vr27_1 => %vr28_1
	cbr 	%vr28_1 -> .L3

# Block No.: 4
.L2: nop
	loadI 	2 => %vr35_1
	loadI 	2 => %vr6_3
	comp 	%vr6_3, %vr5_0 => %vr10_2
	testgt 	%vr10_2 => %vr11_2
	cbr 	%vr11_2 -> .L4

# Block No.: 5
.L5: nop
	(phi):  %vr6_4 = (4->%vr6_3, 13->%vr6_5)
	loadI 	2 => %vr7_3
	comp 	%vr7_3, %vr4_0 => %vr27_2
	testgt 	%vr27_2 => %vr28_2
	cbr 	%vr28_2 -> .L6

# Block No.: 6
.L7: nop
	(phi):  %vr7_4 = (5->%vr7_3, 12->%vr7_5)
	subI 	%vr6_4, 1 => %vr12_2
	mult 	%vr12_2, %vr5_0 => %vr40_0
	subI 	%vr7_4, 1 => %vr29_2
	add 	%vr40_0, %vr29_2 => %vr41_0
	i2i 	%vr0_0 => %vr15_4
	loadI 	-244 => %vr16_2
	addI 	%vr0_0, -244 => %vr17_2
	subI 	%vr41_0, 1 => %vr42_0
	loadI 	4 => %vr19_2
	multI 	%vr42_0, 4 => %vr43_0
	sub 	%vr17_2, %vr43_0 => %vr44_0
	load 	%vr44_0 => %vr45_0
	mult 	%vr6_4, %vr5_0 => %vr13_1
	add 	%vr13_1, %vr7_4 => %vr46_0
	i2i 	%vr0_0 => %vr15_5
	i2i 	%vr17_2 => %vr17_3
	subI 	%vr46_0, 1 => %vr47_0
	multI 	%vr47_0, 4 => %vr48_0
	sub 	%vr17_3, %vr48_0 => %vr49_0
	store 	%vr45_0 => %vr49_0
	i2i 	%vr0_0 => %vr15_6
	loadI 	-124 => %vr22_2
	addI 	%vr0_0, -124 => %vr23_2
	i2i 	%vr12_2 => %vr12_3
	multI 	%vr12_3, 4 => %vr24_1
	sub 	%vr23_2, %vr24_1 => %vr25_1
	load 	%vr25_1 => %vr50_0
	i2i 	%vr0_0 => %vr15_7
	loadI 	-4 => %vr51_0
	addI 	%vr0_0, -4 => %vr52_0
	i2i 	%vr29_2 => %vr29_3
	multI 	%vr29_3, 4 => %vr37_1
	sub 	%vr52_0, %vr37_1 => %vr53_0
	load 	%vr53_0 => %vr54_0
	comp 	%vr50_0, %vr54_0 => %vr55_0
	testne 	%vr55_0 => %vr56_0
	cbrne 	%vr56_0 -> .L8

# Block No.: 7
	mult 	%vr6_4, %vr5_0 => %vr13_2
	add 	%vr13_2, %vr7_4 => %vr46_1
	i2i 	%vr0_0 => %vr15_8
	addI 	%vr0_0, -244 => %vr17_4
	subI 	%vr46_1, 1 => %vr47_1
	multI 	%vr47_1, 4 => %vr48_1
	sub 	%vr17_4, %vr48_1 => %vr49_1
	load 	%vr49_1 => %vr57_0
	addI 	%vr57_0, 1 => %vr58_0
	i2i 	%vr13_2 => %vr13_3
	i2i 	%vr46_1 => %vr46_2
	i2i 	%vr0_0 => %vr15_9
	i2i 	%vr17_4 => %vr17_5
	i2i 	%vr47_1 => %vr47_2
	i2i 	%vr48_1 => %vr48_2
	i2i 	%vr49_1 => %vr49_2
	store 	%vr58_0 => %vr49_2

# Block No.: 8
.L8: nop
	subI 	%vr6_4, 1 => %vr12_4
	mult 	%vr12_4, %vr5_0 => %vr40_1
	add 	%vr40_1, %vr7_4 => %vr59_0
	i2i 	%vr0_0 => %vr15_10
	addI 	%vr0_0, -244 => %vr17_6
	subI 	%vr59_0, 1 => %vr60_0
	multI 	%vr60_0, 4 => %vr61_0
	sub 	%vr17_6, %vr61_0 => %vr62_0
	load 	%vr62_0 => %vr63_0
	mult 	%vr6_4, %vr5_0 => %vr13_4
	add 	%vr13_4, %vr7_4 => %vr46_3
	i2i 	%vr0_0 => %vr15_11
	i2i 	%vr17_6 => %vr17_7
	subI 	%vr46_3, 1 => %vr47_3
	multI 	%vr47_3, 4 => %vr48_3
	sub 	%vr17_7, %vr48_3 => %vr49_3
	load 	%vr49_3 => %vr57_1
	comp 	%vr63_0, %vr57_1 => %vr64_0
	testlt 	%vr64_0 => %vr65_0
	cbrne 	%vr65_0 -> .L9

# Block No.: 9
	subI 	%vr6_4, 1 => %vr12_5
	mult 	%vr12_5, %vr5_0 => %vr40_2
	add 	%vr40_2, %vr7_4 => %vr59_1
	i2i 	%vr0_0 => %vr15_12
	addI 	%vr0_0, -244 => %vr17_8
	subI 	%vr59_1, 1 => %vr60_1
	multI 	%vr60_1, 4 => %vr61_1
	sub 	%vr17_8, %vr61_1 => %vr62_1
	load 	%vr62_1 => %vr63_1
	addI 	%vr63_1, 1 => %vr66_0
	mult 	%vr6_4, %vr5_0 => %vr13_5
	add 	%vr13_5, %vr7_4 => %vr46_4
	i2i 	%vr0_0 => %vr15_13
	i2i 	%vr17_8 => %vr17_9
	subI 	%vr46_4, 1 => %vr47_4
	multI 	%vr47_4, 4 => %vr48_4
	sub 	%vr17_9, %vr48_4 => %vr49_4
	store 	%vr66_0 => %vr49_4

# Block No.: 10
.L9: nop
	mult 	%vr6_4, %vr5_0 => %vr13_6
	subI 	%vr7_4, 1 => %vr29_4
	add 	%vr13_6, %vr29_4 => %vr67_0
	i2i 	%vr0_0 => %vr15_14
	addI 	%vr0_0, -244 => %vr17_10
	subI 	%vr67_0, 1 => %vr68_0
	multI 	%vr68_0, 4 => %vr69_0
	sub 	%vr17_10, %vr69_0 => %vr70_0
	load 	%vr70_0 => %vr71_0
	i2i 	%vr13_6 => %vr13_7
	add 	%vr13_7, %vr7_4 => %vr46_5
	i2i 	%vr0_0 => %vr15_15
	i2i 	%vr17_10 => %vr17_11
	subI 	%vr46_5, 1 => %vr47_5
	multI 	%vr47_5, 4 => %vr48_5
	sub 	%vr17_11, %vr48_5 => %vr49_5
	load 	%vr49_5 => %vr57_2
	comp 	%vr71_0, %vr57_2 => %vr72_0
	testlt 	%vr72_0 => %vr73_0
	cbrne 	%vr73_0 -> .L10

# Block No.: 11
	mult 	%vr6_4, %vr5_0 => %vr13_8
	subI 	%vr7_4, 1 => %vr29_5
	add 	%vr13_8, %vr29_5 => %vr67_1
	i2i 	%vr0_0 => %vr15_16
	addI 	%vr0_0, -244 => %vr17_12
	subI 	%vr67_1, 1 => %vr68_1
	multI 	%vr68_1, 4 => %vr69_1
	sub 	%vr17_12, %vr69_1 => %vr70_1
	load 	%vr70_1 => %vr71_1
	addI 	%vr71_1, 1 => %vr74_0
	i2i 	%vr13_8 => %vr13_9
	add 	%vr13_9, %vr7_4 => %vr46_6
	i2i 	%vr0_0 => %vr15_17
	i2i 	%vr17_12 => %vr17_13
	subI 	%vr46_6, 1 => %vr47_6
	multI 	%vr47_6, 4 => %vr48_6
	sub 	%vr17_13, %vr48_6 => %vr49_6
	store 	%vr74_0 => %vr49_6

# Block No.: 12
.L10: nop
	addI 	%vr7_4, 1 => %vr39_1
	i2i 	%vr39_1 => %vr7_5
	comp 	%vr39_1, %vr4_0 => %vr27_3
	testle 	%vr27_3 => %vr28_3
	cbr 	%vr28_3 -> .L7

# Block No.: 13
.L6: nop
	addI 	%vr6_4, 1 => %vr26_1
	i2i 	%vr26_1 => %vr6_5
	comp 	%vr26_1, %vr5_0 => %vr10_3
	testle 	%vr10_3 => %vr11_3
	cbr 	%vr11_3 -> .L5

# Block No.: 14
.L4: nop
	mult 	%vr5_0, %vr5_0 => %vr75_0
	add 	%vr75_0, %vr4_0 => %vr76_0
	i2i 	%vr0_0 => %vr15_18
	loadI 	-244 => %vr16_3
	addI 	%vr0_0, -244 => %vr17_14
	subI 	%vr76_0, 1 => %vr77_0
	loadI 	4 => %vr19_3
	multI 	%vr77_0, 4 => %vr78_0
	sub 	%vr17_14, %vr78_0 => %vr79_0
	load 	%vr79_0 => %vr80_0
	iwrite	%vr80_0
	ret

# Block No.: 15
	# Exit Block: nop

