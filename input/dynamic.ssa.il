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
	.frame main, 1820
# Block No.: 0
	loadI 	0 => %vr9_0
	loadI 	1 => %vr10_0
	i2i 	%vr0_0 => %vr11_0
	loadI 	-4 => %vr12_0
	addI 	%vr0_0, -4 => %vr13_0
	loadI 	0 => %vr14_0
	loadI 	4 => %vr15_0
	loadI 	0 => %vr16_0
	subI 	%vr13_0, 0 => %vr17_0
	store 	%vr9_0 => %vr17_0
	loadI 	2 => %vr18_0
	i2i 	%vr0_0 => %vr11_1
	i2i 	%vr13_0 => %vr13_1
	loadI 	1 => %vr19_0
	loadI 	4 => %vr20_0
	subI 	%vr13_1, 4 => %vr21_0
	store 	%vr10_0 => %vr21_0
	loadI 	3 => %vr22_0
	i2i 	%vr0_0 => %vr11_2
	i2i 	%vr13_1 => %vr13_2
	loadI 	2 => %vr23_0
	loadI 	8 => %vr24_0
	subI 	%vr13_2, 8 => %vr25_0
	store 	%vr18_0 => %vr25_0
	i2i 	%vr0_0 => %vr11_3
	i2i 	%vr13_2 => %vr13_3
	loadI 	3 => %vr26_0
	loadI 	12 => %vr27_0
	subI 	%vr13_3, 12 => %vr28_0
	store 	%vr22_0 => %vr28_0
	loadI 	5 => %vr29_0
	i2i 	%vr0_0 => %vr11_4
	i2i 	%vr13_3 => %vr13_4
	loadI 	4 => %vr30_0
	loadI 	16 => %vr31_0
	subI 	%vr13_4, 16 => %vr32_0
	store 	%vr15_0 => %vr32_0
	loadI 	6 => %vr33_0
	i2i 	%vr0_0 => %vr11_5
	i2i 	%vr13_4 => %vr13_5
	loadI 	5 => %vr34_0
	loadI 	20 => %vr35_0
	subI 	%vr13_5, 20 => %vr36_0
	store 	%vr29_0 => %vr36_0
	loadI 	7 => %vr37_0
	i2i 	%vr0_0 => %vr11_6
	i2i 	%vr13_5 => %vr13_6
	loadI 	6 => %vr38_0
	loadI 	24 => %vr39_0
	subI 	%vr13_6, 24 => %vr40_0
	store 	%vr33_0 => %vr40_0
	loadI 	8 => %vr41_0
	i2i 	%vr0_0 => %vr11_7
	i2i 	%vr13_6 => %vr13_7
	loadI 	7 => %vr42_0
	loadI 	28 => %vr43_0
	subI 	%vr13_7, 28 => %vr44_0
	store 	%vr37_0 => %vr44_0
	loadI 	9 => %vr45_0
	i2i 	%vr0_0 => %vr11_8
	i2i 	%vr13_7 => %vr13_8
	loadI 	8 => %vr46_0
	loadI 	32 => %vr47_0
	subI 	%vr13_8, 32 => %vr48_0
	store 	%vr41_0 => %vr48_0
	loadI 	10 => %vr49_0
	i2i 	%vr0_0 => %vr11_9
	i2i 	%vr13_8 => %vr13_9
	loadI 	9 => %vr50_0
	loadI 	36 => %vr51_0
	subI 	%vr13_9, 36 => %vr52_0
	store 	%vr45_0 => %vr52_0
	loadI 	11 => %vr53_0
	i2i 	%vr0_0 => %vr11_10
	i2i 	%vr13_9 => %vr13_10
	loadI 	10 => %vr54_0
	loadI 	40 => %vr55_0
	subI 	%vr13_10, 40 => %vr56_0
	store 	%vr41_0 => %vr56_0
	loadI 	12 => %vr57_0
	i2i 	%vr0_0 => %vr11_11
	i2i 	%vr13_10 => %vr13_11
	loadI 	11 => %vr58_0
	loadI 	44 => %vr59_0
	subI 	%vr13_11, 44 => %vr60_0
	store 	%vr37_0 => %vr60_0
	loadI 	13 => %vr61_0
	i2i 	%vr0_0 => %vr11_12
	i2i 	%vr13_11 => %vr13_12
	loadI 	12 => %vr62_0
	loadI 	48 => %vr63_0
	subI 	%vr13_12, 48 => %vr64_0
	store 	%vr33_0 => %vr64_0
	loadI 	14 => %vr65_0
	i2i 	%vr0_0 => %vr11_13
	i2i 	%vr13_12 => %vr13_13
	loadI 	13 => %vr66_0
	loadI 	52 => %vr67_0
	subI 	%vr13_13, 52 => %vr68_0
	store 	%vr29_0 => %vr68_0
	loadI 	15 => %vr69_0
	i2i 	%vr0_0 => %vr11_14
	i2i 	%vr13_13 => %vr13_14
	loadI 	14 => %vr70_0
	loadI 	56 => %vr71_0
	subI 	%vr13_14, 56 => %vr72_0
	store 	%vr15_0 => %vr72_0
	loadI 	16 => %vr73_0
	i2i 	%vr0_0 => %vr11_15
	i2i 	%vr13_14 => %vr13_15
	loadI 	15 => %vr74_0
	loadI 	60 => %vr75_0
	subI 	%vr13_15, 60 => %vr76_0
	store 	%vr22_0 => %vr76_0
	loadI 	17 => %vr77_0
	i2i 	%vr0_0 => %vr11_16
	i2i 	%vr13_15 => %vr13_16
	loadI 	16 => %vr78_0
	loadI 	64 => %vr79_0
	subI 	%vr13_16, 64 => %vr80_0
	store 	%vr18_0 => %vr80_0
	loadI 	18 => %vr81_0
	i2i 	%vr0_0 => %vr11_17
	i2i 	%vr13_16 => %vr13_17
	loadI 	17 => %vr82_0
	loadI 	68 => %vr83_0
	subI 	%vr13_17, 68 => %vr84_0
	store 	%vr10_0 => %vr84_0
	loadI 	19 => %vr85_0
	i2i 	%vr0_0 => %vr11_18
	i2i 	%vr13_17 => %vr13_18
	loadI 	18 => %vr86_0
	loadI 	72 => %vr87_0
	subI 	%vr13_18, 72 => %vr88_0
	store 	%vr9_0 => %vr88_0
	i2i 	%vr0_0 => %vr11_19
	loadI 	-80 => %vr89_0
	addI 	%vr0_0, -80 => %vr90_0
	subI 	%vr90_0, 0 => %vr91_0
	store 	%vr9_0 => %vr91_0
	i2i 	%vr0_0 => %vr11_20
	i2i 	%vr90_0 => %vr90_1
	subI 	%vr90_1, 4 => %vr92_0
	store 	%vr10_0 => %vr92_0
	i2i 	%vr0_0 => %vr11_21
	i2i 	%vr90_1 => %vr90_2
	subI 	%vr90_2, 8 => %vr93_0
	store 	%vr22_0 => %vr93_0
	i2i 	%vr0_0 => %vr11_22
	i2i 	%vr90_2 => %vr90_3
	subI 	%vr90_3, 12 => %vr94_0
	store 	%vr29_0 => %vr94_0
	i2i 	%vr0_0 => %vr11_23
	i2i 	%vr90_3 => %vr90_4
	subI 	%vr90_4, 16 => %vr95_0
	store 	%vr37_0 => %vr95_0
	i2i 	%vr0_0 => %vr11_24
	i2i 	%vr90_4 => %vr90_5
	subI 	%vr90_5, 20 => %vr96_0
	store 	%vr45_0 => %vr96_0
	i2i 	%vr0_0 => %vr11_25
	i2i 	%vr90_5 => %vr90_6
	subI 	%vr90_6, 24 => %vr97_0
	store 	%vr53_0 => %vr97_0
	i2i 	%vr0_0 => %vr11_26
	i2i 	%vr90_6 => %vr90_7
	subI 	%vr90_7, 28 => %vr98_0
	store 	%vr15_0 => %vr98_0
	i2i 	%vr0_0 => %vr11_27
	i2i 	%vr90_7 => %vr90_8
	subI 	%vr90_8, 32 => %vr99_0
	store 	%vr22_0 => %vr99_0
	i2i 	%vr0_0 => %vr11_28
	i2i 	%vr90_8 => %vr90_9
	subI 	%vr90_9, 36 => %vr100_0
	store 	%vr18_0 => %vr100_0
	i2i 	%vr0_0 => %vr11_29
	i2i 	%vr90_9 => %vr90_10
	subI 	%vr90_10, 40 => %vr101_0
	store 	%vr10_0 => %vr101_0
	i2i 	%vr0_0 => %vr11_30
	i2i 	%vr90_10 => %vr90_11
	subI 	%vr90_11, 44 => %vr102_0
	store 	%vr45_0 => %vr102_0
	i2i 	%vr0_0 => %vr11_31
	i2i 	%vr90_11 => %vr90_12
	subI 	%vr90_12, 48 => %vr103_0
	store 	%vr41_0 => %vr103_0
	i2i 	%vr0_0 => %vr11_32
	i2i 	%vr90_12 => %vr90_13
	subI 	%vr90_13, 52 => %vr104_0
	store 	%vr37_0 => %vr104_0
	i2i 	%vr0_0 => %vr11_33
	i2i 	%vr90_13 => %vr90_14
	subI 	%vr90_14, 56 => %vr105_0
	store 	%vr33_0 => %vr105_0
	i2i 	%vr0_0 => %vr11_34
	i2i 	%vr90_14 => %vr90_15
	subI 	%vr90_15, 60 => %vr106_0
	store 	%vr9_0 => %vr106_0
	loadI 	20 => %vr107_0
	loadI 	20 => %vr8_0
	loadI 	1 => %vr4_0
	loadI 	2 => %vr108_0
	i2i 	%vr0_0 => %vr11_35
	i2i 	%vr13_18 => %vr13_19
	loadI 	1 => %vr109_0
	loadI 	4 => %vr110_0
	i2i 	%vr21_0 => %vr111_0
	load 	%vr21_0 => %vr112_0
	comp 	%vr112_0, %vr9_0 => %vr113_0
	testeq 	%vr113_0 => %vr114_0
	cbr 	%vr114_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	subI 	%vr4_1, 1 => %vr115_0
	multI 	%vr8_0, 1 => %vr116_0
	add 	%vr116_0, %vr4_1 => %vr117_0
	i2i 	%vr0_0 => %vr11_36
	loadI 	-144 => %vr118_0
	addI 	%vr0_0, -144 => %vr119_0
	subI 	%vr117_0, 1 => %vr120_0
	multI 	%vr120_0, 4 => %vr121_0
	sub 	%vr119_0, %vr121_0 => %vr122_0
	store 	%vr115_0 => %vr122_0
	addI 	%vr4_1, 1 => %vr108_1
	i2i 	%vr108_1 => %vr4_2
	addI 	%vr108_1, 1 => %vr108_2
	i2i 	%vr0_0 => %vr11_37
	addI 	%vr0_0, -4 => %vr13_20
	subI 	%vr108_2, 1 => %vr109_1
	multI 	%vr109_1, 4 => %vr110_1
	sub 	%vr13_20, %vr110_1 => %vr111_1
	load 	%vr111_1 => %vr112_1
	comp 	%vr112_1, %vr9_0 => %vr113_1
	testne 	%vr113_1 => %vr114_1
	cbr 	%vr114_1 -> .L1

# Block No.: 2
.L0: nop
	(phi):  %vr4_3 = (0->%vr4_0, 1->%vr4_2)
	loadI 	1 => %vr5_0
	loadI 	2 => %vr123_0
	i2i 	%vr0_0 => %vr11_38
	addI 	%vr0_0, -80 => %vr90_16
	loadI 	1 => %vr124_0
	loadI 	4 => %vr125_0
	subI 	%vr90_16, 4 => %vr126_0
	load 	%vr126_0 => %vr127_0
	comp 	%vr127_0, %vr9_0 => %vr128_0
	testeq 	%vr128_0 => %vr129_0
	cbr 	%vr129_0 -> .L2

# Block No.: 3
.L3: nop
	(phi):  %vr5_1 = (2->%vr5_0, 3->%vr5_2)
	subI 	%vr5_1, 1 => %vr130_0
	mult 	%vr5_1, %vr8_0 => %vr131_0
	addI 	%vr131_0, 1 => %vr132_0
	i2i 	%vr0_0 => %vr11_39
	loadI 	-144 => %vr118_1
	addI 	%vr0_0, -144 => %vr119_1
	subI 	%vr132_0, 1 => %vr133_0
	multI 	%vr133_0, 4 => %vr134_0
	sub 	%vr119_1, %vr134_0 => %vr135_0
	store 	%vr130_0 => %vr135_0
	addI 	%vr5_1, 1 => %vr123_1
	i2i 	%vr123_1 => %vr5_2
	addI 	%vr123_1, 1 => %vr123_2
	i2i 	%vr0_0 => %vr11_40
	addI 	%vr0_0, -80 => %vr90_17
	subI 	%vr123_2, 1 => %vr124_1
	multI 	%vr124_1, 4 => %vr125_1
	sub 	%vr90_17, %vr125_1 => %vr126_1
	load 	%vr126_1 => %vr127_1
	comp 	%vr127_1, %vr9_0 => %vr128_1
	testne 	%vr128_1 => %vr129_1
	cbr 	%vr129_1 -> .L3

# Block No.: 4
.L2: nop
	(phi):  %vr5_3 = (2->%vr5_0, 3->%vr5_2)
	loadI 	2 => %vr6_0
	comp 	%vr6_0, %vr5_3 => %vr136_0
	testgt 	%vr136_0 => %vr137_0
	cbr 	%vr137_0 -> .L4

# Block No.: 5
.L5: nop
	(phi):  %vr6_1 = (4->%vr6_0, 13->%vr6_2)
	loadI 	2 => %vr7_0
	comp 	%vr7_0, %vr4_3 => %vr138_0
	testgt 	%vr138_0 => %vr139_0
	cbr 	%vr139_0 -> .L6

# Block No.: 6
.L7: nop
	(phi):  %vr7_1 = (5->%vr7_0, 12->%vr7_2)
	subI 	%vr6_1, 1 => %vr140_0
	mult 	%vr140_0, %vr8_0 => %vr141_0
	subI 	%vr7_1, 1 => %vr142_0
	add 	%vr141_0, %vr142_0 => %vr143_0
	i2i 	%vr0_0 => %vr11_41
	loadI 	-144 => %vr118_2
	addI 	%vr0_0, -144 => %vr119_2
	subI 	%vr143_0, 1 => %vr144_0
	multI 	%vr144_0, 4 => %vr145_0
	sub 	%vr119_2, %vr145_0 => %vr146_0
	load 	%vr146_0 => %vr147_0
	mult 	%vr6_1, %vr8_0 => %vr148_0
	add 	%vr148_0, %vr7_1 => %vr149_0
	i2i 	%vr0_0 => %vr11_42
	i2i 	%vr119_2 => %vr119_3
	subI 	%vr149_0, 1 => %vr150_0
	multI 	%vr150_0, 4 => %vr151_0
	sub 	%vr119_3, %vr151_0 => %vr152_0
	store 	%vr147_0 => %vr152_0
	i2i 	%vr0_0 => %vr11_43
	addI 	%vr0_0, -80 => %vr90_18
	i2i 	%vr140_0 => %vr140_1
	multI 	%vr140_1, 4 => %vr153_0
	sub 	%vr90_18, %vr153_0 => %vr154_0
	load 	%vr154_0 => %vr155_0
	i2i 	%vr0_0 => %vr11_44
	addI 	%vr0_0, -4 => %vr13_21
	i2i 	%vr142_0 => %vr142_1
	multI 	%vr142_1, 4 => %vr156_0
	sub 	%vr13_21, %vr156_0 => %vr157_0
	load 	%vr157_0 => %vr158_0
	comp 	%vr155_0, %vr158_0 => %vr159_0
	testne 	%vr159_0 => %vr160_0
	cbrne 	%vr160_0 -> .L8

# Block No.: 7
	mult 	%vr6_1, %vr8_0 => %vr148_1
	add 	%vr148_1, %vr7_1 => %vr149_1
	i2i 	%vr0_0 => %vr11_45
	addI 	%vr0_0, -144 => %vr119_4
	subI 	%vr149_1, 1 => %vr150_1
	multI 	%vr150_1, 4 => %vr151_1
	sub 	%vr119_4, %vr151_1 => %vr152_1
	load 	%vr152_1 => %vr161_0
	addI 	%vr161_0, 1 => %vr162_0
	i2i 	%vr148_1 => %vr148_2
	i2i 	%vr149_1 => %vr149_2
	i2i 	%vr0_0 => %vr11_46
	i2i 	%vr119_4 => %vr119_5
	i2i 	%vr150_1 => %vr150_2
	i2i 	%vr151_1 => %vr151_2
	i2i 	%vr152_1 => %vr152_2
	store 	%vr162_0 => %vr152_2

# Block No.: 8
.L8: nop
	subI 	%vr6_1, 1 => %vr140_2
	mult 	%vr140_2, %vr8_0 => %vr141_1
	add 	%vr141_1, %vr7_1 => %vr163_0
	i2i 	%vr0_0 => %vr11_47
	addI 	%vr0_0, -144 => %vr119_6
	subI 	%vr163_0, 1 => %vr164_0
	multI 	%vr164_0, 4 => %vr165_0
	sub 	%vr119_6, %vr165_0 => %vr166_0
	load 	%vr166_0 => %vr167_0
	mult 	%vr6_1, %vr8_0 => %vr148_3
	add 	%vr148_3, %vr7_1 => %vr149_3
	i2i 	%vr0_0 => %vr11_48
	i2i 	%vr119_6 => %vr119_7
	subI 	%vr149_3, 1 => %vr150_3
	multI 	%vr150_3, 4 => %vr151_3
	sub 	%vr119_7, %vr151_3 => %vr152_3
	load 	%vr152_3 => %vr161_1
	comp 	%vr167_0, %vr161_1 => %vr168_0
	testlt 	%vr168_0 => %vr169_0
	cbrne 	%vr169_0 -> .L9

# Block No.: 9
	subI 	%vr6_1, 1 => %vr140_3
	mult 	%vr140_3, %vr8_0 => %vr141_2
	add 	%vr141_2, %vr7_1 => %vr163_1
	i2i 	%vr0_0 => %vr11_49
	addI 	%vr0_0, -144 => %vr119_8
	subI 	%vr163_1, 1 => %vr164_1
	multI 	%vr164_1, 4 => %vr165_1
	sub 	%vr119_8, %vr165_1 => %vr166_1
	load 	%vr166_1 => %vr167_1
	addI 	%vr167_1, 1 => %vr170_0
	mult 	%vr6_1, %vr8_0 => %vr148_4
	add 	%vr148_4, %vr7_1 => %vr149_4
	i2i 	%vr0_0 => %vr11_50
	i2i 	%vr119_8 => %vr119_9
	subI 	%vr149_4, 1 => %vr150_4
	multI 	%vr150_4, 4 => %vr151_4
	sub 	%vr119_9, %vr151_4 => %vr152_4
	store 	%vr170_0 => %vr152_4

# Block No.: 10
.L9: nop
	mult 	%vr6_1, %vr8_0 => %vr148_5
	subI 	%vr7_1, 1 => %vr142_2
	add 	%vr148_5, %vr142_2 => %vr171_0
	i2i 	%vr0_0 => %vr11_51
	addI 	%vr0_0, -144 => %vr119_10
	subI 	%vr171_0, 1 => %vr172_0
	multI 	%vr172_0, 4 => %vr173_0
	sub 	%vr119_10, %vr173_0 => %vr174_0
	load 	%vr174_0 => %vr175_0
	i2i 	%vr148_5 => %vr148_6
	add 	%vr148_6, %vr7_1 => %vr149_5
	i2i 	%vr0_0 => %vr11_52
	i2i 	%vr119_10 => %vr119_11
	subI 	%vr149_5, 1 => %vr150_5
	multI 	%vr150_5, 4 => %vr151_5
	sub 	%vr119_11, %vr151_5 => %vr152_5
	load 	%vr152_5 => %vr161_2
	comp 	%vr175_0, %vr161_2 => %vr176_0
	testlt 	%vr176_0 => %vr177_0
	cbrne 	%vr177_0 -> .L10

# Block No.: 11
	mult 	%vr6_1, %vr8_0 => %vr148_7
	subI 	%vr7_1, 1 => %vr142_3
	add 	%vr148_7, %vr142_3 => %vr171_1
	i2i 	%vr0_0 => %vr11_53
	addI 	%vr0_0, -144 => %vr119_12
	subI 	%vr171_1, 1 => %vr172_1
	multI 	%vr172_1, 4 => %vr173_1
	sub 	%vr119_12, %vr173_1 => %vr174_1
	load 	%vr174_1 => %vr175_1
	addI 	%vr175_1, 1 => %vr178_0
	i2i 	%vr148_7 => %vr148_8
	add 	%vr148_8, %vr7_1 => %vr149_6
	i2i 	%vr0_0 => %vr11_54
	i2i 	%vr119_12 => %vr119_13
	subI 	%vr149_6, 1 => %vr150_6
	multI 	%vr150_6, 4 => %vr151_6
	sub 	%vr119_13, %vr151_6 => %vr152_6
	store 	%vr178_0 => %vr152_6

# Block No.: 12
.L10: nop
	addI 	%vr7_1, 1 => %vr179_0
	i2i 	%vr179_0 => %vr7_2
	comp 	%vr179_0, %vr4_3 => %vr138_1
	testle 	%vr138_1 => %vr139_1
	cbr 	%vr139_1 -> .L7

# Block No.: 13
.L6: nop
	addI 	%vr6_1, 1 => %vr180_0
	i2i 	%vr180_0 => %vr6_2
	comp 	%vr180_0, %vr5_3 => %vr136_1
	testle 	%vr136_1 => %vr137_1
	cbr 	%vr137_1 -> .L5

# Block No.: 14
.L4: nop
	mult 	%vr5_3, %vr8_0 => %vr131_1
	add 	%vr131_1, %vr4_3 => %vr181_0
	i2i 	%vr0_0 => %vr11_55
	loadI 	-144 => %vr118_3
	addI 	%vr0_0, -144 => %vr119_14
	subI 	%vr181_0, 1 => %vr182_0
	multI 	%vr182_0, 4 => %vr183_0
	sub 	%vr119_14, %vr183_0 => %vr184_0
	load 	%vr184_0 => %vr185_0
	iwrite	%vr185_0
	ret

# Block No.: 15
	# Exit Block: nop

