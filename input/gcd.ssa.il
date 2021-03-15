	.data
	.string .int_wformat, "%d\12"
	.string .float_wformat, "%f\12"
	.string .char_wformat, "%c\12"
	.string .string_wformat, "%s\12"
	.string .int_rformat, "%d"
	.string .float_rformat, "%f"
	.string .char_rformat, "%c"
	.string .string_rformat, "%s"
	.global main_fp, 4, 4
	.text
	.frame main, 8
# Block No.: 0
	loadI 	main_fp => %vr4_0
	store 	%vr0_0 => %vr4_0
	loadI 	-4 => %vr5_0
	addI 	%vr0_0, -4 => %vr6_0
	iread	%vr6_0
	loadI 	-8 => %vr7_0
	addI 	%vr0_0, -8 => %vr8_0
	iread	%vr8_0
	i2i 	%vr6_0 => %vr6_1
	load 	%vr6_1 => %vr9_0
	loadI 	0 => %vr10_0
	comp 	%vr9_0, %vr10_0 => %vr11_0
	testne 	%vr11_0 => %vr12_0
	i2i 	%vr8_0 => %vr8_1
	load 	%vr8_1 => %vr13_0
	comp 	%vr13_0, %vr10_0 => %vr14_0
	testne 	%vr14_0 => %vr15_0
	or 	%vr12_0, %vr15_0 => %vr16_0
	comp 	%vr16_0, %vr10_0 => %vr17_0
	testeq 	%vr17_0 => %vr18_0
	cbr 	%vr18_0 -> .L0

# Block No.: 1
.L1: nop
	icall gcd, %vr6_1, %vr8_1 => %vr19_0
	iwrite	%vr19_0
	i2i 	%vr6_1 => %vr6_2
	iread	%vr6_2
	i2i 	%vr8_1 => %vr8_2
	iread	%vr8_2
	i2i 	%vr6_2 => %vr6_3
	load 	%vr6_3 => %vr9_1
	comp 	%vr9_1, %vr10_0 => %vr11_1
	testne 	%vr11_1 => %vr12_1
	i2i 	%vr8_2 => %vr8_3
	load 	%vr8_3 => %vr13_1
	comp 	%vr13_1, %vr10_0 => %vr14_1
	testne 	%vr14_1 => %vr15_1
	or 	%vr12_1, %vr15_1 => %vr16_1
	cbr 	%vr16_1 -> .L1

# Block No.: 2
.L0: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame gcd, 4, %vr4_0, %vr5_0
# Block No.: 0
	load 	%vr5_0 => %vr6_0
	loadI 	0 => %vr7_0
	comp 	%vr6_0, %vr7_0 => %vr8_0
	testeq 	%vr8_0 => %vr9_0
	cbrne 	%vr9_0 -> .L2

# Block No.: 1
	load 	%vr4_0 => %vr10_0
	iret	%vr10_0

# Block No.: 2
	jumpI	-> .L3

# Block No.: 3
.L2: nop
	load 	%vr4_0 => %vr10_1
	mod 	%vr10_1, %vr6_0 => %vr11_0
	loadI 	-4 => %vr12_0
	addI 	%vr0_0, -4 => %vr13_0
	store 	%vr11_0 => %vr13_0
	icall gcd, %vr5_0, %vr13_0 => %vr14_0
	iret	%vr14_0

# Block No.: 4
.L3: nop
	ret

# Block No.: 5
	# Exit Block: nop

