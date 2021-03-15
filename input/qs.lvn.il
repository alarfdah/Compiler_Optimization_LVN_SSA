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
	loadI 	main_fp => %vr4
	store 	%vr0 => %vr4
	loadI 	0 => %vr5
	loadI 	1 => %vr6
	loadI 	-1 => %vr7
	i2i 	%vr0 => %vr8
	loadI 	-4 => %vr9
	addI 	%vr0, -4 => %vr10
	loadI 	0 => %vr11
	loadI 	4 => %vr12
	loadI 	0 => %vr13
	subI 	%vr10, 0 => %vr14
	store 	%vr7 => %vr14
	loadI 	1000 => %vr15
	loadI 	20 => %vr16
	i2i 	%vr0 => %vr8
	i2i 	%vr10 => %vr10
	loadI 	20 => %vr17
	loadI 	80 => %vr18
	subI 	%vr10, 80 => %vr19
	store 	%vr15 => %vr19
	call readarray
	call writearray
	i2i 	%vr10 => %vr20
	loadI 	-88 => %vr21
	addI 	%vr0, -88 => %vr22
	store 	%vr6 => %vr22
	loadI 	19 => %vr23
	loadI 	-92 => %vr24
	addI 	%vr0, -92 => %vr25
	store 	%vr23 => %vr25
	call quicksort, %vr20, %vr22, %vr25
	call writearray
	ret

# Block No.: 1
	# Exit Block: nop

	.frame readarray, 0
# Block No.: 0
	loadI 	.string_const_0 => %vr5
	swrite	%vr5
	loadI 	1 => %vr6
	loadI 	1 => %vr4
	loadI 	20 => %vr7
	loadI 	1 => %vr8
	testge 	%vr8 => %vr9
	cbr 	%vr9 -> .L0

# Block No.: 1
.L1: nop
	iwrite	%vr4
	loadI 	main_fp => %vr10
	load 	%vr10 => %vr11
	loadI 	-4 => %vr12
	addI 	%vr11, -4 => %vr13
	loadI 	0 => %vr14
	subI 	%vr4, 0 => %vr15
	loadI 	4 => %vr16
	multI 	%vr15, 4 => %vr17
	sub 	%vr13, %vr17 => %vr18
	iread	%vr18
	loadI 	1 => %vr6
	addI 	%vr4, 1 => %vr19
	i2i 	%vr19 => %vr4
	loadI 	20 => %vr7
	comp 	%vr19, %vr7 => %vr8
	testlt 	%vr8 => %vr9
	cbr 	%vr9 -> .L1

# Block No.: 2
.L0: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame writearray, 0
# Block No.: 0
	loadI 	.string_const_1 => %vr5
	swrite	%vr5
	loadI 	1 => %vr6
	loadI 	1 => %vr4
	loadI 	20 => %vr7
	loadI 	1 => %vr8
	testge 	%vr8 => %vr9
	cbr 	%vr9 -> .L2

# Block No.: 1
.L3: nop
	loadI 	main_fp => %vr10
	load 	%vr10 => %vr11
	loadI 	-4 => %vr12
	addI 	%vr11, -4 => %vr13
	loadI 	0 => %vr14
	subI 	%vr4, 0 => %vr15
	loadI 	4 => %vr16
	multI 	%vr15, 4 => %vr17
	sub 	%vr13, %vr17 => %vr18
	load 	%vr18 => %vr19
	iwrite	%vr19
	loadI 	1 => %vr6
	addI 	%vr4, 1 => %vr20
	i2i 	%vr20 => %vr4
	loadI 	20 => %vr7
	comp 	%vr20, %vr7 => %vr8
	testlt 	%vr8 => %vr9
	cbr 	%vr9 -> .L3

# Block No.: 2
.L2: nop
	ret

# Block No.: 3
	# Exit Block: nop

	.frame partition, 0, %vr4, %vr5, %vr6
# Block No.: 0
	load 	%vr5 => %vr12
	loadI 	0 => %vr13
	subI 	%vr12, 0 => %vr14
	loadI 	4 => %vr15
	multI 	%vr14, 4 => %vr16
	sub 	%vr4, %vr16 => %vr17
	load 	%vr17 => %vr18
	i2i 	%vr18 => %vr9
	load 	%vr5 => %vr12
	loadI 	1 => %vr19
	subI 	%vr12, 1 => %vr20
	i2i 	%vr20 => %vr7
	load 	%vr6 => %vr21
	addI 	%vr21, 1 => %vr22
	i2i 	%vr22 => %vr8
	loadI 	.float_const_0 => %vr23
	fload 	%vr23 => %vr24
	f2i 	%vr24 => %vr25
	comp 	%vr24, %vr13 => %vr26
	testeq 	%vr26 => %vr27
	cbr 	%vr27 -> .L4

# Block No.: 1
.L5: nop
	loadI 	1 => %vr19
	subI 	%vr8, 1 => %vr28
	i2i 	%vr28 => %vr8
	loadI 	0 => %vr13
	subI 	%vr28, 0 => %vr29
	loadI 	4 => %vr15
	multI 	%vr29, 4 => %vr30
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	comp 	%vr32, %vr9 => %vr33
	testle 	%vr33 => %vr34
	cbr 	%vr34 -> .L6

# Block No.: 2
.L7: nop
	loadI 	1 => %vr19
	subI 	%vr8, 1 => %vr28
	i2i 	%vr28 => %vr8
	loadI 	0 => %vr13
	subI 	%vr28, 0 => %vr29
	loadI 	4 => %vr15
	multI 	%vr29, 4 => %vr30
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	comp 	%vr32, %vr9 => %vr33
	testgt 	%vr33 => %vr34
	cbr 	%vr34 -> .L7

# Block No.: 3
.L6: nop
	loadI 	1 => %vr19
	addI 	%vr7, 1 => %vr35
	i2i 	%vr35 => %vr7
	loadI 	0 => %vr13
	subI 	%vr35, 0 => %vr36
	loadI 	4 => %vr15
	multI 	%vr36, 4 => %vr37
	sub 	%vr4, %vr37 => %vr38
	load 	%vr38 => %vr39
	comp 	%vr39, %vr9 => %vr40
	testge 	%vr40 => %vr41
	cbr 	%vr41 -> .L8

# Block No.: 4
.L9: nop
	loadI 	1 => %vr19
	addI 	%vr7, 1 => %vr35
	i2i 	%vr35 => %vr7
	loadI 	0 => %vr13
	subI 	%vr35, 0 => %vr36
	loadI 	4 => %vr15
	multI 	%vr36, 4 => %vr37
	sub 	%vr4, %vr37 => %vr38
	load 	%vr38 => %vr39
	comp 	%vr39, %vr9 => %vr40
	testlt 	%vr40 => %vr41
	cbr 	%vr41 -> .L9

# Block No.: 5
.L8: nop
	comp 	%vr7, %vr8 => %vr42
	testlt 	%vr42 => %vr43
	cbrne 	%vr43 -> .L10

# Block No.: 6
	loadI 	0 => %vr13
	subI 	%vr7, 0 => %vr36
	loadI 	4 => %vr15
	multI 	%vr36, 4 => %vr37
	sub 	%vr4, %vr37 => %vr38
	load 	%vr38 => %vr39
	i2i 	%vr39 => %vr10
	subI 	%vr8, 0 => %vr29
	multI 	%vr29, 4 => %vr30
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	i2i 	%vr36 => %vr36
	i2i 	%vr37 => %vr37
	i2i 	%vr38 => %vr38
	store 	%vr32 => %vr38
	i2i 	%vr29 => %vr29
	i2i 	%vr30 => %vr30
	i2i 	%vr31 => %vr31
	store 	%vr39 => %vr31
	jumpI	-> .L11

# Block No.: 7
.L10: nop
	iret	%vr8

# Block No.: 8
.L11: nop
	loadI 	.float_const_0 => %vr23
	fload 	%vr23 => %vr24
	f2i 	%vr24 => %vr25
	cbr 	%vr24 -> .L5

# Block No.: 9
.L4: nop
	ret

# Block No.: 10
	# Exit Block: nop

	.frame quicksort, 8, %vr4, %vr5, %vr6
# Block No.: 0
	load 	%vr5 => %vr7
	load 	%vr6 => %vr8
	comp 	%vr7, %vr8 => %vr9
	testlt 	%vr9 => %vr10
	cbrne 	%vr10 -> .L12

# Block No.: 1
	icall partition, %vr4, %vr5, %vr6 => %vr11
	loadI 	-4 => %vr12
	addI 	%vr0, -4 => %vr13
	store 	%vr11 => %vr13
	i2i 	%vr13 => %vr13
	call quicksort, %vr4, %vr5, %vr13
	i2i 	%vr13 => %vr13
	load 	%vr13 => %vr14
	loadI 	1 => %vr15
	addI 	%vr14, 1 => %vr16
	loadI 	-8 => %vr17
	addI 	%vr0, -8 => %vr18
	store 	%vr16 => %vr18
	call quicksort, %vr4, %vr18, %vr6

# Block No.: 2
.L12: nop
	ret

# Block No.: 3
	# Exit Block: nop

