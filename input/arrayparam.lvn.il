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
	loadI 	main_fp => %vr4
	store 	%vr0 => %vr4
	loadI 	-4 => %vr5
	addI 	%vr0, -4 => %vr6
	call init, %vr6
	i2i 	%vr6 => %vr6
	call writearray, %vr6
	loadI 	1 => %vr7
	loadI 	1 => %vr4
	loadI 	10 => %vr8
	loadI 	1 => %vr9
	testgt 	%vr9 => %vr10
	cbr 	%vr10 -> .L0

# Block No.: 1
.L1: nop
	i2i 	%vr0 => %vr11
	loadI 	-4 => %vr5
	addI 	%vr0, -4 => %vr12
	loadI 	1 => %vr7
	subI 	%vr4, 1 => %vr13
	loadI 	4 => %vr14
	multI 	%vr13, 4 => %vr15
	sub 	%vr12, %vr15 => %vr16
	load 	%vr16 => %vr17
	mult 	%vr17, %vr4 => %vr18
	i2i 	%vr0 => %vr11
	i2i 	%vr12 => %vr12
	i2i 	%vr13 => %vr13
	i2i 	%vr15 => %vr15
	i2i 	%vr16 => %vr16
	store 	%vr18 => %vr16
	i2i 	%vr0 => %vr11
	i2i 	%vr12 => %vr12
	i2i 	%vr13 => %vr13
	i2i 	%vr15 => %vr15
	i2i 	%vr16 => %vr16
	call inc, %vr16
	addI 	%vr4, 1 => %vr19
	i2i 	%vr19 => %vr4
	loadI 	10 => %vr8
	comp 	%vr19, %vr8 => %vr9
	testle 	%vr9 => %vr10
	cbr 	%vr10 -> .L1

# Block No.: 2
.L0: nop
	loadI 	-4 => %vr5
	addI 	%vr0, -4 => %vr6
	call writearray, %vr6
	ret

# Block No.: 3
	# Exit Block: nop

	.frame init, 0, %vr8
# Block No.: 0
	loadI 	1 => %vr9
	loadI 	1 => %vr4
	loadI 	10 => %vr10
	loadI 	10 => %vr5
	loadI 	1 => %vr11
	testgt 	%vr11 => %vr12
	cbr 	%vr12 -> .L2

# Block No.: 1
.L3: nop
	i2f 	%vr4 => %vr13
	loadI 	.float_const_0 => %vr14
	fload 	%vr14 => %vr15
	fmult 	%vr4, %vr15 => %vr16
	i2f 	%vr5 => %vr17
	fadd 	%vr16, %vr5 => %vr18
	f2i 	%vr18 => %vr19
	loadI 	1 => %vr9
	subI 	%vr4, 1 => %vr20
	loadI 	4 => %vr21
	multI 	%vr20, 4 => %vr22
	sub 	%vr8, %vr22 => %vr23
	store 	%vr18 => %vr23
	addI 	%vr4, 1 => %vr24
	i2i 	%vr24 => %vr4
	addI 	%vr5, 1 => %vr25
	i2i 	%vr25 => %vr5
	loadI 	10 => %vr10
	comp 	%vr24, %vr10 => %vr11
	testle 	%vr11 => %vr12
	cbr 	%vr12 -> .L3

# Block No.: 2
.L2: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame writearray, 0, %vr4
# Block No.: 0
	loadI 	1 => %vr5
	loadI 	0 => %vr6
	loadI 	4 => %vr7
	loadI 	0 => %vr8
	subI 	%vr4, 0 => %vr9
	load 	%vr9 => %vr10
	iwrite	%vr10
	loadI 	2 => %vr11
	loadI 	1 => %vr12
	loadI 	4 => %vr13
	subI 	%vr4, 4 => %vr14
	load 	%vr14 => %vr15
	iwrite	%vr15
	loadI 	3 => %vr16
	loadI 	2 => %vr17
	loadI 	8 => %vr18
	subI 	%vr4, 8 => %vr19
	load 	%vr19 => %vr20
	iwrite	%vr20
	loadI 	3 => %vr21
	loadI 	12 => %vr22
	subI 	%vr4, 12 => %vr23
	load 	%vr23 => %vr24
	iwrite	%vr24
	loadI 	5 => %vr25
	loadI 	4 => %vr26
	loadI 	16 => %vr27
	subI 	%vr4, 16 => %vr28
	load 	%vr28 => %vr29
	iwrite	%vr29
	loadI 	6 => %vr30
	loadI 	5 => %vr31
	loadI 	20 => %vr32
	subI 	%vr4, 20 => %vr33
	load 	%vr33 => %vr34
	iwrite	%vr34
	loadI 	7 => %vr35
	loadI 	6 => %vr36
	loadI 	24 => %vr37
	subI 	%vr4, 24 => %vr38
	load 	%vr38 => %vr39
	iwrite	%vr39
	loadI 	8 => %vr40
	loadI 	7 => %vr41
	loadI 	28 => %vr42
	subI 	%vr4, 28 => %vr43
	load 	%vr43 => %vr44
	iwrite	%vr44
	loadI 	9 => %vr45
	loadI 	8 => %vr46
	loadI 	32 => %vr47
	subI 	%vr4, 32 => %vr48
	load 	%vr48 => %vr49
	iwrite	%vr49
	loadI 	10 => %vr50
	loadI 	9 => %vr51
	loadI 	36 => %vr52
	subI 	%vr4, 36 => %vr53
	load 	%vr53 => %vr54
	iwrite	%vr54
	ret

# Block No.: 1
	# Exit Block: nop

	.frame inc, 0, %vr4
# Block No.: 0
	load 	%vr4 => %vr5
	loadI 	1 => %vr6
	addI 	%vr5, 1 => %vr7
	store 	%vr7 => %vr4
	ret

# Block No.: 1
	# Exit Block: nop

