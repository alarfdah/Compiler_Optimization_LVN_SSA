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
	loadI 	1 => %vr5
	i2i 	%vr5 => %vr4
	loadI 	10 => %vr6
	comp 	%vr4, %vr6 => %vr7
	testgt 	%vr7 => %vr8
	cbr 	%vr8 -> .L0

# Block No.: 1
.L1: nop
	i2i 	%vr0 => %vr9
	loadI 	-4 => %vr10
	add 	%vr9, %vr10 => %vr11
	sub 	%vr4, %vr5 => %vr12
	loadI 	4 => %vr13
	mult 	%vr12, %vr13 => %vr14
	sub 	%vr11, %vr14 => %vr15
	store 	%vr4 => %vr15
	add 	%vr4, %vr5 => %vr16
	i2i 	%vr16 => %vr4
	comp 	%vr4, %vr6 => %vr7
	testle 	%vr7 => %vr8
	cbr 	%vr8 -> .L1

# Block No.: 2
.L0: nop
	i2i 	%vr5 => %vr4
	comp 	%vr4, %vr6 => %vr7
	testgt 	%vr7 => %vr8
	cbr 	%vr8 -> .L2

# Block No.: 3
.L3: nop
	loadI 	5 => %vr17
	comp 	%vr4, %vr17 => %vr18
	testlt 	%vr18 => %vr19
	cbrne 	%vr19 -> .L4

# Block No.: 4
	i2i 	%vr0 => %vr9
	loadI 	-4 => %vr10
	add 	%vr9, %vr10 => %vr11
	sub 	%vr4, %vr5 => %vr12
	loadI 	4 => %vr13
	mult 	%vr12, %vr13 => %vr14
	sub 	%vr11, %vr14 => %vr15
	load 	%vr15 => %vr20
	iwrite	%vr20
	jumpI	-> .L5

# Block No.: 5
.L4: nop
	loadI 	0 => %vr21
	iwrite	%vr21

# Block No.: 6
.L5: nop
	add 	%vr4, %vr5 => %vr16
	i2i 	%vr16 => %vr4
	comp 	%vr4, %vr6 => %vr7
	testle 	%vr7 => %vr8
	cbr 	%vr8 -> .L3

# Block No.: 7
.L2: nop
	ret

# Block No.: 8
	# Exit Block: nop

