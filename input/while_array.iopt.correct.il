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
	loadI 	1 => %vr4
	loadI 	10 => %vr6
	loadI 	1 => %vr7

# Block No.: 1
.L1: nop
	addI 	%vr0, -4 => %vr11 		# deleted
	subI 	%vr4, 1 => %vr12		# deleted
	multI 	%vr12, 4 => %vr14		# deleted
	sub 	%vr11, %vr14 => %vr15	# deleted
	store 	%vr4 => %vr15
	addI 	%vr4, 1 => %vr16		# deleted
	i2i 	%vr16 => %vr4			# deleted
	comp 	%vr16, %vr6 => %vr7		# deleted
	testle 	%vr7 => %vr8			# deleted
	cbr 	%vr8 -> .L1

# Block No.: 2
.L0: nop
	loadI 	1 => %vr4
	loadI 	1 => %vr7
	testgt 	%vr7 => %vr8

# Block No.: 3
.L3: nop
	loadI 	5 => %vr17
	comp 	%vr4, %vr17 => %vr18	# deleted
	testlt 	%vr18 => %vr19			# deleted
	cbrne 	%vr19 -> .L4			# deleted

# Block No.: 4
	addI 	%vr0, -4 => %vr11
	subI 	%vr4, 1 => %vr12
	multI 	%vr12, 4 => %vr14
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
	addI 	%vr4, 1 => %vr16
	i2i 	%vr16 => %vr4
	comp 	%vr16, %vr6 => %vr7		# deleted
	testle 	%vr7 => %vr8			# deleted
	cbr 	%vr8 -> .L3				# deleted

# Block No.: 7
.L2: nop
	ret

