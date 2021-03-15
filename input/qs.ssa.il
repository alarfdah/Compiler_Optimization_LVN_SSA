	.data
	.string .int_wformat, "%d\12"
	.string .float_wformat, "%f\12"
	.string .char_wformat, "%c\12"
	.string .string_wformat, "%s\12"
	.string .int_rformat, "%d"
	.string .float_rformat, "%f"
	.string .char_rformat, "%c"
	.string .string_rformat, "%s"
	.string .string_const_0, "A?"
	.string .string_const_1, "A:"
	.float .float_const_0, 1.7
	.global main_fp, 4, 4
	.text
	.frame main, 92
# Block No.: 0
	loadI 	main_fp => %vr4_0
	store 	%vr0_0 => %vr4_0
	loadI 	0 => %vr5_0
	loadI 	1 => %vr6_0
	loadI 	-1 => %vr7_0
	i2i 	%vr0_0 => %vr8_0
	loadI 	-4 => %vr9_0
	addI 	%vr0_0, -4 => %vr10_0
	loadI 	0 => %vr11_0
	loadI 	4 => %vr12_0
	loadI 	0 => %vr13_0
	subI 	%vr10_0, 0 => %vr14_0
	store 	%vr7_0 => %vr14_0
	loadI 	1000 => %vr15_0
	loadI 	20 => %vr16_0
	i2i 	%vr0_0 => %vr8_1
	i2i 	%vr10_0 => %vr10_1
	loadI 	20 => %vr17_0
	loadI 	80 => %vr18_0
	subI 	%vr10_1, 80 => %vr19_0
	store 	%vr15_0 => %vr19_0
	call readarray
	call writearray
	i2i 	%vr10_1 => %vr20_0
	loadI 	-88 => %vr21_0
	addI 	%vr0_0, -88 => %vr22_0
	store 	%vr6_0 => %vr22_0
	loadI 	19 => %vr23_0
	loadI 	-92 => %vr24_0
	addI 	%vr0_0, -92 => %vr25_0
	store 	%vr23_0 => %vr25_0
	call quicksort, %vr20_0, %vr22_0, %vr25_0
	call writearray
	ret

# Block No.: 1
	# Exit Block: nop

	.frame readarray, 0
# Block No.: 0
	loadI 	.string_const_0 => %vr5_0
	swrite	%vr5_0
	loadI 	1 => %vr6_0
	loadI 	1 => %vr4_0
	loadI 	20 => %vr7_0
	loadI 	1 => %vr8_0
	testge 	%vr8_0 => %vr9_0
	cbr 	%vr9_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	iwrite	%vr4_1
	loadI 	main_fp => %vr10_0
	load 	%vr10_0 => %vr11_0
	loadI 	-4 => %vr12_0
	addI 	%vr11_0, -4 => %vr13_0
	loadI 	0 => %vr14_0
	subI 	%vr4_1, 0 => %vr15_0
	loadI 	4 => %vr16_0
	multI 	%vr15_0, 4 => %vr17_0
	sub 	%vr13_0, %vr17_0 => %vr18_0
	iread	%vr18_0
	addI 	%vr4_1, 1 => %vr19_0
	i2i 	%vr19_0 => %vr4_2
	comp 	%vr19_0, %vr7_0 => %vr8_1
	testlt 	%vr8_1 => %vr9_1
	cbr 	%vr9_1 -> .L1

# Block No.: 2
.L0: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame writearray, 0
# Block No.: 0
	loadI 	.string_const_1 => %vr5_0
	swrite	%vr5_0
	loadI 	1 => %vr6_0
	loadI 	1 => %vr4_0
	loadI 	20 => %vr7_0
	loadI 	1 => %vr8_0
	testge 	%vr8_0 => %vr9_0
	cbr 	%vr9_0 -> .L2

# Block No.: 1
.L3: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	loadI 	main_fp => %vr10_0
	load 	%vr10_0 => %vr11_0
	loadI 	-4 => %vr12_0
	addI 	%vr11_0, -4 => %vr13_0
	loadI 	0 => %vr14_0
	subI 	%vr4_1, 0 => %vr15_0
	loadI 	4 => %vr16_0
	multI 	%vr15_0, 4 => %vr17_0
	sub 	%vr13_0, %vr17_0 => %vr18_0
	load 	%vr18_0 => %vr19_0
	iwrite	%vr19_0
	addI 	%vr4_1, 1 => %vr20_0
	i2i 	%vr20_0 => %vr4_2
	comp 	%vr20_0, %vr7_0 => %vr8_1
	testlt 	%vr8_1 => %vr9_1
	cbr 	%vr9_1 -> .L3

# Block No.: 2
.L2: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame partition, 0, %vr4_0, %vr5_0, %vr6_0
# Block No.: 0
	load 	%vr5_0 => %vr12_0
	loadI 	0 => %vr13_0
	subI 	%vr12_0, 0 => %vr14_0
	loadI 	4 => %vr15_0
	multI 	%vr14_0, 4 => %vr16_0
	sub 	%vr4_0, %vr16_0 => %vr17_0
	load 	%vr17_0 => %vr18_0
	i2i 	%vr18_0 => %vr9_0
	loadI 	1 => %vr19_0
	subI 	%vr12_0, 1 => %vr20_0
	i2i 	%vr20_0 => %vr7_0
	load 	%vr6_0 => %vr21_0
	addI 	%vr21_0, 1 => %vr22_0
	i2i 	%vr22_0 => %vr8_0
	loadI 	.float_const_0 => %vr23_0
	fload 	%vr23_0 => %vr24_0
	f2i 	%vr24_0 => %vr25_0
	comp 	%vr24_0, %vr13_0 => %vr26_0
	testeq 	%vr26_0 => %vr27_0
	cbr 	%vr27_0 -> .L4

# Block No.: 1
.L5: nop
	(phi):  %vr7_1 = (0->%vr7_0, 8->%vr7_5)
	(phi):  %vr8_1 = (0->%vr8_0, 8->%vr8_5)
	subI 	%vr8_1, 1 => %vr28_0
	i2i 	%vr28_0 => %vr8_2
	subI 	%vr28_0, 0 => %vr29_0
	multI 	%vr29_0, 4 => %vr30_0
	sub 	%vr4_0, %vr30_0 => %vr31_0
	load 	%vr31_0 => %vr32_0
	comp 	%vr32_0, %vr9_0 => %vr33_0
	testle 	%vr33_0 => %vr34_0
	cbr 	%vr34_0 -> .L6

# Block No.: 2
.L7: nop
	(phi):  %vr8_3 = (1->%vr8_2, 2->%vr8_4)
	subI 	%vr8_3, 1 => %vr28_1
	i2i 	%vr28_1 => %vr8_4
	subI 	%vr28_1, 0 => %vr29_1
	multI 	%vr29_1, 4 => %vr30_1
	sub 	%vr4_0, %vr30_1 => %vr31_1
	load 	%vr31_1 => %vr32_1
	comp 	%vr32_1, %vr9_0 => %vr33_1
	testgt 	%vr33_1 => %vr34_1
	cbr 	%vr34_1 -> .L7

# Block No.: 3
.L6: nop
	(phi):  %vr8_5 = (1->%vr8_2, 2->%vr8_4)
	addI 	%vr7_1, 1 => %vr35_0
	i2i 	%vr35_0 => %vr7_2
	subI 	%vr35_0, 0 => %vr36_0
	multI 	%vr36_0, 4 => %vr37_0
	sub 	%vr4_0, %vr37_0 => %vr38_0
	load 	%vr38_0 => %vr39_0
	comp 	%vr39_0, %vr9_0 => %vr40_0
	testge 	%vr40_0 => %vr41_0
	cbr 	%vr41_0 -> .L8

# Block No.: 4
.L9: nop
	(phi):  %vr7_3 = (3->%vr7_2, 4->%vr7_4)
	addI 	%vr7_3, 1 => %vr35_1
	i2i 	%vr35_1 => %vr7_4
	subI 	%vr35_1, 0 => %vr36_1
	multI 	%vr36_1, 4 => %vr37_1
	sub 	%vr4_0, %vr37_1 => %vr38_1
	load 	%vr38_1 => %vr39_1
	comp 	%vr39_1, %vr9_0 => %vr40_1
	testlt 	%vr40_1 => %vr41_1
	cbr 	%vr41_1 -> .L9

# Block No.: 5
.L8: nop
	(phi):  %vr7_5 = (3->%vr7_2, 4->%vr7_4)
	comp 	%vr7_5, %vr8_5 => %vr42_0
	testlt 	%vr42_0 => %vr43_0
	cbrne 	%vr43_0 -> .L10

# Block No.: 6
	subI 	%vr7_5, 0 => %vr36_2
	multI 	%vr36_2, 4 => %vr37_2
	sub 	%vr4_0, %vr37_2 => %vr38_2
	load 	%vr38_2 => %vr39_2
	i2i 	%vr39_2 => %vr10_0
	subI 	%vr8_5, 0 => %vr29_2
	multI 	%vr29_2, 4 => %vr30_2
	sub 	%vr4_0, %vr30_2 => %vr31_2
	load 	%vr31_2 => %vr32_2
	i2i 	%vr36_2 => %vr36_3
	i2i 	%vr37_2 => %vr37_3
	i2i 	%vr38_2 => %vr38_3
	store 	%vr32_2 => %vr38_3
	i2i 	%vr29_2 => %vr29_3
	i2i 	%vr30_2 => %vr30_3
	i2i 	%vr31_2 => %vr31_3
	store 	%vr39_2 => %vr31_3
	jumpI	-> .L11

# Block No.: 7
.L10: nop
	iret	%vr8_5

# Block No.: 8
.L11: nop
	f2i 	%vr24_0 => %vr25_1
	cbr 	%vr24_0 -> .L5

# Block No.: 9
.L4: nop
	ret

# Block No.: 10
	# Exit Block: nop

	.frame quicksort, 8, %vr4_0, %vr5_0, %vr6_0
# Block No.: 0
	load 	%vr5_0 => %vr7_0
	load 	%vr6_0 => %vr8_0
	comp 	%vr7_0, %vr8_0 => %vr9_0
	testlt 	%vr9_0 => %vr10_0
	cbrne 	%vr10_0 -> .L12

# Block No.: 1
	icall partition, %vr4_0, %vr5_0, %vr6_0 => %vr11_0
	loadI 	-4 => %vr12_0
	addI 	%vr0_0, -4 => %vr13_0
	store 	%vr11_0 => %vr13_0
	i2i 	%vr13_0 => %vr13_1
	call quicksort, %vr4_0, %vr5_0, %vr13_1
	i2i 	%vr13_1 => %vr13_2
	load 	%vr13_2 => %vr14_0
	loadI 	1 => %vr15_0
	addI 	%vr14_0, 1 => %vr16_0
	loadI 	-8 => %vr17_0
	addI 	%vr0_0, -8 => %vr18_0
	store 	%vr16_0 => %vr18_0
	call quicksort, %vr4_0, %vr18_0, %vr6_0

# Block No.: 2
.L12: nop
	ret

# Block No.: 3
	# Exit Block: nop

