	.data
	.string .int_wformat, "%d\12"
	.string .float_wformat, "%f\12"
	.string .char_wformat, "%c\12"
	.string .string_wformat, "%s\12"
	.string .int_rformat, "%d"
	.string .float_rformat, "%f"
	.string .char_rformat, "%c"
	.string .string_rformat, "%s"
	.string .string_const_0, "SUCCESS"
	.text
	.frame main, 0
# Block No.: 0
	loadI 	1 => %vr6_0
	loadI 	1 => %vr4_0
	loadI 	10 => %vr7_0
	loadI 	1 => %vr8_0
	testgt 	%vr8_0 => %vr9_0
	cbr 	%vr9_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 3->%vr4_2)
	loadI 	0 => %vr10_0
	comp 	%vr4_1, %vr10_0 => %vr11_0
	testlt 	%vr11_0 => %vr12_0
	cbrne 	%vr12_0 -> .L2

# Block No.: 2
	mod 	%vr7_0, %vr10_0 => %vr13_0
	i2i 	%vr13_0 => %vr5_0

# Block No.: 3
.L2: nop
	addI 	%vr4_1, 1 => %vr14_0
	i2i 	%vr14_0 => %vr4_2
	comp 	%vr14_0, %vr7_0 => %vr8_1
	testle 	%vr8_1 => %vr9_1
	cbr 	%vr9_1 -> .L1

# Block No.: 4
.L0: nop
	loadI 	.string_const_0 => %vr15_0
	swrite	%vr15_0
	ret

# Block No.: 5
	# Exit Block: nop

