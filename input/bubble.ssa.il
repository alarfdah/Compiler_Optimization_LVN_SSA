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
	.frame main, 60
# Block No.: 0
	loadI 	32 => %vr8_0
	loadI 	1 => %vr9_0
	i2i 	%vr0_0 => %vr10_0
	loadI 	-4 => %vr11_0
	addI 	%vr0_0, -4 => %vr12_0
	loadI 	0 => %vr13_0
	loadI 	4 => %vr14_0
	loadI 	0 => %vr15_0
	subI 	%vr12_0, 0 => %vr16_0
	store 	%vr8_0 => %vr16_0
	loadI 	11 => %vr17_0
	loadI 	2 => %vr18_0
	i2i 	%vr0_0 => %vr10_1
	i2i 	%vr12_0 => %vr12_1
	loadI 	1 => %vr19_0
	loadI 	4 => %vr20_0
	subI 	%vr12_1, 4 => %vr21_0
	store 	%vr17_0 => %vr21_0
	loadI 	111 => %vr22_0
	loadI 	3 => %vr23_0
	i2i 	%vr0_0 => %vr10_2
	i2i 	%vr12_1 => %vr12_2
	loadI 	2 => %vr24_0
	loadI 	8 => %vr25_0
	subI 	%vr12_2, 8 => %vr26_0
	store 	%vr22_0 => %vr26_0
	loadI 	88 => %vr27_0
	i2i 	%vr0_0 => %vr10_3
	i2i 	%vr12_2 => %vr12_3
	loadI 	3 => %vr28_0
	loadI 	12 => %vr29_0
	subI 	%vr12_3, 12 => %vr30_0
	store 	%vr27_0 => %vr30_0
	loadI 	5 => %vr31_0
	i2i 	%vr0_0 => %vr10_4
	i2i 	%vr12_3 => %vr12_4
	loadI 	4 => %vr32_0
	loadI 	16 => %vr33_0
	subI 	%vr12_4, 16 => %vr34_0
	store 	%vr17_0 => %vr34_0
	loadI 	44 => %vr35_0
	loadI 	6 => %vr36_0
	i2i 	%vr0_0 => %vr10_5
	i2i 	%vr12_4 => %vr12_5
	loadI 	5 => %vr37_0
	loadI 	20 => %vr38_0
	subI 	%vr12_5, 20 => %vr39_0
	store 	%vr35_0 => %vr39_0
	loadI 	33 => %vr40_0
	loadI 	7 => %vr41_0
	i2i 	%vr0_0 => %vr10_6
	i2i 	%vr12_5 => %vr12_6
	loadI 	6 => %vr42_0
	loadI 	24 => %vr43_0
	subI 	%vr12_6, 24 => %vr44_0
	store 	%vr40_0 => %vr44_0
	loadI 	8 => %vr45_0
	i2i 	%vr0_0 => %vr10_7
	i2i 	%vr12_6 => %vr12_7
	loadI 	7 => %vr46_0
	loadI 	28 => %vr47_0
	subI 	%vr12_7, 28 => %vr48_0
	store 	%vr40_0 => %vr48_0
	loadI 	22 => %vr49_0
	loadI 	9 => %vr50_0
	i2i 	%vr0_0 => %vr10_8
	i2i 	%vr12_7 => %vr12_8
	loadI 	8 => %vr51_0
	loadI 	32 => %vr52_0
	subI 	%vr12_8, 32 => %vr53_0
	store 	%vr49_0 => %vr53_0
	loadI 	77 => %vr54_0
	loadI 	10 => %vr55_0
	i2i 	%vr0_0 => %vr10_9
	i2i 	%vr12_8 => %vr12_9
	loadI 	9 => %vr56_0
	loadI 	36 => %vr57_0
	subI 	%vr12_9, 36 => %vr58_0
	store 	%vr54_0 => %vr58_0
	loadI 	45 => %vr59_0
	i2i 	%vr0_0 => %vr10_10
	i2i 	%vr12_9 => %vr12_10
	loadI 	10 => %vr60_0
	loadI 	40 => %vr61_0
	subI 	%vr12_10, 40 => %vr62_0
	store 	%vr59_0 => %vr62_0
	loadI 	65 => %vr63_0
	loadI 	12 => %vr64_0
	i2i 	%vr0_0 => %vr10_11
	i2i 	%vr12_10 => %vr12_11
	loadI 	11 => %vr65_0
	loadI 	44 => %vr66_0
	subI 	%vr12_11, 44 => %vr67_0
	store 	%vr63_0 => %vr67_0
	loadI 	76 => %vr68_0
	loadI 	13 => %vr69_0
	i2i 	%vr0_0 => %vr10_12
	i2i 	%vr12_11 => %vr12_12
	loadI 	12 => %vr70_0
	loadI 	48 => %vr71_0
	subI 	%vr12_12, 48 => %vr72_0
	store 	%vr68_0 => %vr72_0
	loadI 	87 => %vr73_0
	loadI 	14 => %vr74_0
	i2i 	%vr0_0 => %vr10_13
	i2i 	%vr12_12 => %vr12_13
	loadI 	13 => %vr75_0
	loadI 	52 => %vr76_0
	subI 	%vr12_13, 52 => %vr77_0
	store 	%vr73_0 => %vr77_0
	loadI 	34 => %vr78_0
	loadI 	15 => %vr79_0
	i2i 	%vr0_0 => %vr10_14
	i2i 	%vr12_13 => %vr12_14
	loadI 	14 => %vr80_0
	loadI 	56 => %vr81_0
	subI 	%vr12_14, 56 => %vr82_0
	store 	%vr78_0 => %vr82_0
	loadI 	1 => %vr4_0
	loadI 	1 => %vr83_0
	testgt 	%vr83_0 => %vr84_0
	cbr 	%vr84_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 5->%vr4_2)
	i2i 	%vr4_1 => %vr7_0
	addI 	%vr4_1, 1 => %vr85_0
	i2i 	%vr85_0 => %vr5_0
	comp 	%vr85_0, %vr79_0 => %vr86_0
	testgt 	%vr86_0 => %vr87_0
	cbr 	%vr87_0 -> .L2

# Block No.: 2
.L3: nop
	(phi):  %vr7_1 = (1->%vr7_0, 4->%vr7_3)
	(phi):  %vr5_1 = (1->%vr5_0, 4->%vr5_2)
	i2i 	%vr0_0 => %vr10_15
	addI 	%vr0_0, -4 => %vr12_15
	subI 	%vr5_1, 1 => %vr88_0
	multI 	%vr88_0, 4 => %vr89_0
	sub 	%vr12_15, %vr89_0 => %vr90_0
	load 	%vr90_0 => %vr91_0
	i2i 	%vr0_0 => %vr10_16
	i2i 	%vr12_15 => %vr12_16
	subI 	%vr7_1, 1 => %vr92_0
	multI 	%vr92_0, 4 => %vr93_0
	sub 	%vr12_16, %vr93_0 => %vr94_0
	load 	%vr94_0 => %vr95_0
	comp 	%vr91_0, %vr95_0 => %vr96_0
	testlt 	%vr96_0 => %vr97_0
	cbrne 	%vr97_0 -> .L4

# Block No.: 3
	i2i 	%vr5_1 => %vr7_2

# Block No.: 4
.L4: nop
	(phi):  %vr7_3 = (2->%vr7_1, 3->%vr7_2)
	addI 	%vr5_1, 1 => %vr98_0
	i2i 	%vr98_0 => %vr5_2
	comp 	%vr98_0, %vr79_0 => %vr86_1
	testle 	%vr86_1 => %vr87_1
	cbr 	%vr87_1 -> .L3

# Block No.: 5
.L2: nop
	(phi):  %vr7_4 = (1->%vr7_0, 4->%vr7_3)
	i2i 	%vr0_0 => %vr10_17
	addI 	%vr0_0, -4 => %vr12_17
	subI 	%vr4_1, 1 => %vr99_0
	multI 	%vr99_0, 4 => %vr100_0
	sub 	%vr12_17, %vr100_0 => %vr101_0
	load 	%vr101_0 => %vr102_0
	i2i 	%vr102_0 => %vr6_0
	i2i 	%vr0_0 => %vr10_18
	i2i 	%vr12_17 => %vr12_18
	subI 	%vr7_4, 1 => %vr92_1
	multI 	%vr92_1, 4 => %vr93_1
	sub 	%vr12_18, %vr93_1 => %vr94_1
	load 	%vr94_1 => %vr95_1
	i2i 	%vr0_0 => %vr10_19
	i2i 	%vr12_18 => %vr12_19
	i2i 	%vr99_0 => %vr99_1
	i2i 	%vr100_0 => %vr100_1
	i2i 	%vr101_0 => %vr101_1
	store 	%vr95_1 => %vr101_1
	i2i 	%vr0_0 => %vr10_20
	i2i 	%vr12_19 => %vr12_20
	i2i 	%vr92_1 => %vr92_2
	i2i 	%vr93_1 => %vr93_2
	i2i 	%vr94_1 => %vr94_2
	store 	%vr102_0 => %vr94_2
	addI 	%vr4_1, 1 => %vr85_1
	i2i 	%vr85_1 => %vr4_2
	comp 	%vr85_1, %vr74_0 => %vr83_1
	testle 	%vr83_1 => %vr84_1
	cbr 	%vr84_1 -> .L1

# Block No.: 6
.L0: nop
	loadI 	1 => %vr4_3
	loadI 	1 => %vr103_0
	testgt 	%vr103_0 => %vr104_0
	cbr 	%vr104_0 -> .L5

# Block No.: 7
.L6: nop
	(phi):  %vr4_4 = (6->%vr4_3, 7->%vr4_5)
	i2i 	%vr0_0 => %vr10_21
	addI 	%vr0_0, -4 => %vr12_21
	subI 	%vr4_4, 1 => %vr99_2
	multI 	%vr99_2, 4 => %vr100_2
	sub 	%vr12_21, %vr100_2 => %vr101_2
	load 	%vr101_2 => %vr102_1
	iwrite	%vr102_1
	addI 	%vr4_4, 1 => %vr85_2
	i2i 	%vr85_2 => %vr4_5
	comp 	%vr85_2, %vr79_0 => %vr103_1
	testle 	%vr103_1 => %vr104_1
	cbr 	%vr104_1 -> .L6

# Block No.: 8
.L5: nop
	ret

# Block No.: 9
	# Exit Block: nop

