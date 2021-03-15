	.data
	.string .int_wformat, "%d\12"
	.string .float_wformat, "%f\12"
	.string .char_wformat, "%c\12"
	.string .string_wformat, "%s\12"
	.string .int_rformat, "%d"
	.string .float_rformat, "%f"
	.string .char_rformat, "%c"
	.string .string_rformat, "%s"
	.float .float_const_0, 0.01
	.global main_fp, 4, 4
	.text
	.frame main, 40
# Block No.: 0
	loadI 	main_fp => %vr4_0
	store 	%vr0_0 => %vr4_0
	loadI 	-4 => %vr5_0
	addI 	%vr0_0, -4 => %vr6_0
	call init, %vr6_0
	i2i 	%vr6_0 => %vr6_1
	call writearray, %vr6_1
	loadI 	1 => %vr7_0
	loadI 	1 => %vr4_1
	loadI 	10 => %vr8_0
	loadI 	1 => %vr9_0
	testgt 	%vr9_0 => %vr10_0
	cbr 	%vr10_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_2 = (0->%vr4_1, 1->%vr4_3)
	i2i 	%vr0_0 => %vr11_0
	addI 	%vr0_0, -4 => %vr12_0
	subI 	%vr4_2, 1 => %vr13_0
	loadI 	4 => %vr14_0
	multI 	%vr13_0, 4 => %vr15_0
	sub 	%vr12_0, %vr15_0 => %vr16_0
	load 	%vr16_0 => %vr17_0
	mult 	%vr17_0, %vr4_2 => %vr18_0
	i2i 	%vr0_0 => %vr11_1
	i2i 	%vr12_0 => %vr12_1
	i2i 	%vr13_0 => %vr13_1
	i2i 	%vr15_0 => %vr15_1
	i2i 	%vr16_0 => %vr16_1
	store 	%vr18_0 => %vr16_1
	i2i 	%vr0_0 => %vr11_2
	i2i 	%vr12_1 => %vr12_2
	i2i 	%vr13_1 => %vr13_2
	i2i 	%vr15_1 => %vr15_2
	i2i 	%vr16_1 => %vr16_2
	call inc, %vr16_2
	addI 	%vr4_2, 1 => %vr19_0
	i2i 	%vr19_0 => %vr4_3
	comp 	%vr19_0, %vr8_0 => %vr9_1
	testle 	%vr9_1 => %vr10_1
	cbr 	%vr10_1 -> .L1

# Block No.: 2
.L0: nop
	call writearray, %vr6_1
	ret

# Block No.: 3
	# Exit Block: nop

	.frame init, 0, %vr8_0
# Block No.: 0
	loadI 	1 => %vr9_0
	loadI 	1 => %vr4_0
	loadI 	10 => %vr10_0
	loadI 	10 => %vr5_0
	loadI 	1 => %vr11_0
	testgt 	%vr11_0 => %vr12_0
	cbr 	%vr12_0 -> .L2

# Block No.: 1
.L3: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	(phi):  %vr5_1 = (0->%vr5_0, 1->%vr5_2)
	i2f 	%vr4_1 => %vr13_0
	loadI 	.float_const_0 => %vr14_0
	fload 	%vr14_0 => %vr15_0
	fmult 	%vr4_1, %vr15_0 => %vr16_0
	i2f 	%vr5_1 => %vr17_0
	fadd 	%vr16_0, %vr5_1 => %vr18_0
	f2i 	%vr18_0 => %vr19_0
	subI 	%vr4_1, 1 => %vr20_0
	loadI 	4 => %vr21_0
	multI 	%vr20_0, 4 => %vr22_0
	sub 	%vr8_0, %vr22_0 => %vr23_0
	store 	%vr18_0 => %vr23_0
	addI 	%vr4_1, 1 => %vr24_0
	i2i 	%vr24_0 => %vr4_2
	addI 	%vr5_1, 1 => %vr25_0
	i2i 	%vr25_0 => %vr5_2
	comp 	%vr24_0, %vr10_0 => %vr11_1
	testle 	%vr11_1 => %vr12_1
	cbr 	%vr12_1 -> .L3

# Block No.: 2
.L2: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame writearray, 0, %vr4_0
# Block No.: 0
	loadI 	1 => %vr5_0
	loadI 	0 => %vr6_0
	loadI 	4 => %vr7_0
	loadI 	0 => %vr8_0
	subI 	%vr4_0, 0 => %vr9_0
	load 	%vr9_0 => %vr10_0
	iwrite	%vr10_0
	loadI 	2 => %vr11_0
	loadI 	1 => %vr12_0
	loadI 	4 => %vr13_0
	subI 	%vr4_0, 4 => %vr14_0
	load 	%vr14_0 => %vr15_0
	iwrite	%vr15_0
	loadI 	3 => %vr16_0
	loadI 	2 => %vr17_0
	loadI 	8 => %vr18_0
	subI 	%vr4_0, 8 => %vr19_0
	load 	%vr19_0 => %vr20_0
	iwrite	%vr20_0
	loadI 	3 => %vr21_0
	loadI 	12 => %vr22_0
	subI 	%vr4_0, 12 => %vr23_0
	load 	%vr23_0 => %vr24_0
	iwrite	%vr24_0
	loadI 	5 => %vr25_0
	loadI 	4 => %vr26_0
	loadI 	16 => %vr27_0
	subI 	%vr4_0, 16 => %vr28_0
	load 	%vr28_0 => %vr29_0
	iwrite	%vr29_0
	loadI 	6 => %vr30_0
	loadI 	5 => %vr31_0
	loadI 	20 => %vr32_0
	subI 	%vr4_0, 20 => %vr33_0
	load 	%vr33_0 => %vr34_0
	iwrite	%vr34_0
	loadI 	7 => %vr35_0
	loadI 	6 => %vr36_0
	loadI 	24 => %vr37_0
	subI 	%vr4_0, 24 => %vr38_0
	load 	%vr38_0 => %vr39_0
	iwrite	%vr39_0
	loadI 	8 => %vr40_0
	loadI 	7 => %vr41_0
	loadI 	28 => %vr42_0
	subI 	%vr4_0, 28 => %vr43_0
	load 	%vr43_0 => %vr44_0
	iwrite	%vr44_0
	loadI 	9 => %vr45_0
	loadI 	8 => %vr46_0
	loadI 	32 => %vr47_0
	subI 	%vr4_0, 32 => %vr48_0
	load 	%vr48_0 => %vr49_0
	iwrite	%vr49_0
	loadI 	10 => %vr50_0
	loadI 	9 => %vr51_0
	loadI 	36 => %vr52_0
	subI 	%vr4_0, 36 => %vr53_0
	load 	%vr53_0 => %vr54_0
	iwrite	%vr54_0
	ret

# Block No.: 1
	# Exit Block: nop

	.frame inc, 0, %vr4_0
# Block No.: 0
	load 	%vr4_0 => %vr5_0
	loadI 	1 => %vr6_0
	addI 	%vr5_0, 1 => %vr7_0
	store 	%vr7_0 => %vr4_0
	ret

# Block No.: 1
	# Exit Block: nop

