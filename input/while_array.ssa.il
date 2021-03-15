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
	.frame main, 40
# Block No.: 0
	loadI 	1 => %vr5_0
	loadI 	1 => %vr4_0
	loadI 	10 => %vr6_0
	loadI 	1 => %vr7_0
	testgt 	%vr7_0 => %vr8_0
	cbr 	%vr8_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	i2i 	%vr0_0 => %vr9_0
	loadI 	-4 => %vr10_0
	addI 	%vr0_0, -4 => %vr11_0
	subI 	%vr4_1, 1 => %vr12_0
	loadI 	4 => %vr13_0
	multI 	%vr12_0, 4 => %vr14_0
	sub 	%vr11_0, %vr14_0 => %vr15_0
	store 	%vr4_1 => %vr15_0
	addI 	%vr4_1, 1 => %vr16_0
	i2i 	%vr16_0 => %vr4_2
	comp 	%vr16_0, %vr6_0 => %vr7_1
	testle 	%vr7_1 => %vr8_1
	cbr 	%vr8_1 -> .L1

# Block No.: 2
.L0: nop
	loadI 	1 => %vr4_3
	loadI 	1 => %vr7_2
	testgt 	%vr7_2 => %vr8_2
	cbr 	%vr8_2 -> .L2

# Block No.: 3
.L3: nop
	(phi):  %vr4_4 = (2->%vr4_3, 6->%vr4_5)
	loadI 	5 => %vr17_0
	comp 	%vr4_4, %vr17_0 => %vr18_0
	testlt 	%vr18_0 => %vr19_0
	cbrne 	%vr19_0 -> .L4

# Block No.: 4
	i2i 	%vr0_0 => %vr9_1
	loadI 	-4 => %vr10_1
	addI 	%vr0_0, -4 => %vr11_1
	subI 	%vr4_4, 1 => %vr12_1
	loadI 	4 => %vr13_1
	multI 	%vr12_1, 4 => %vr14_1
	sub 	%vr11_1, %vr14_1 => %vr15_1
	load 	%vr15_1 => %vr20_0
	iwrite	%vr20_0
	jumpI	-> .L5

# Block No.: 5
.L4: nop
	loadI 	0 => %vr21_0
	iwrite	%vr21_0

# Block No.: 6
.L5: nop
	addI 	%vr4_4, 1 => %vr16_1
	i2i 	%vr16_1 => %vr4_5
	comp 	%vr16_1, %vr6_0 => %vr7_3
	testle 	%vr7_3 => %vr8_3
	cbr 	%vr8_3 -> .L3

# Block No.: 7
.L2: nop
	ret

# Block No.: 8
	# Exit Block: nop

