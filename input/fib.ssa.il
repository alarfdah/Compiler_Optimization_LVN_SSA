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
	.frame main, 0
# Block No.: 0
	loadI 	1 => %vr8_0
	loadI 	1 => %vr6_0
	loadI 	0 => %vr9_0
	loadI 	0 => %vr7_0
	loadI 	0 => %vr5_0
	loadI 	1 => %vr4_0
	loadI 	20 => %vr10_0
	loadI 	1 => %vr11_0
	testgt 	%vr11_0 => %vr12_0
	cbr 	%vr12_0 -> .L0

# Block No.: 1
.L1: nop
	(phi):  %vr4_1 = (0->%vr4_0, 1->%vr4_2)
	(phi):  %vr7_1 = (0->%vr7_0, 1->%vr7_2)
	(phi):  %vr5_1 = (0->%vr5_0, 1->%vr5_2)
	(phi):  %vr6_1 = (0->%vr6_0, 1->%vr6_2)
	iwrite	%vr5_1
	add 	%vr7_1, %vr6_1 => %vr13_0
	i2i 	%vr13_0 => %vr5_2
	i2i 	%vr7_1 => %vr6_2
	i2i 	%vr13_0 => %vr7_2
	addI 	%vr4_1, 1 => %vr14_0
	i2i 	%vr14_0 => %vr4_2
	comp 	%vr14_0, %vr10_0 => %vr11_1
	testle 	%vr11_1 => %vr12_1
	cbr 	%vr12_1 -> .L1

# Block No.: 2
.L0: nop
	ret

# Block No.: 3
	# Exit Block: nop

