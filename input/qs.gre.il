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
	sub 	%vr5, %vr6 => %vr7
	i2i 	%vr0 => %vr8
	loadI 	-4 => %vr9
	add 	%vr8, %vr9 => %vr10
	sub 	%vr5, %vr5 => %vr11
	loadI 	4 => %vr12
	mult 	%vr11, %vr12 => %vr13
	sub 	%vr10, %vr13 => %vr14
	store 	%vr7 => %vr14
	loadI 	1000 => %vr15
	loadI 	20 => %vr16
	i2i 	%vr0 => %vr8
	add 	%vr8, %vr9 => %vr10
	sub 	%vr16, %vr5 => %vr17
	mult 	%vr17, %vr12 => %vr18
	sub 	%vr10, %vr18 => %vr19
	store 	%vr15 => %vr19
	call readarray
	call writearray
	add 	%vr0, %vr9 => %vr20
	loadI 	-88 => %vr21
	add 	%vr0, %vr21 => %vr22
	store 	%vr6 => %vr22
	loadI 	19 => %vr23
	loadI 	-92 => %vr24
	add 	%vr0, %vr24 => %vr25
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
	i2i 	%vr6 => %vr4
	loadI 	20 => %vr7
	comp 	%vr4, %vr7 => %vr8
	testge 	%vr8 => %vr9
	cbr 	%vr9 -> .L0

# Block No.: 1
.L1: nop
	iwrite	%vr4
	loadI 	main_fp => %vr10
	load 	%vr10 => %vr11
	loadI 	-4 => %vr12
	add 	%vr11, %vr12 => %vr13
	loadI 	0 => %vr14
	sub 	%vr4, %vr14 => %vr15
	loadI 	4 => %vr16
	mult 	%vr15, %vr16 => %vr17
	sub 	%vr13, %vr17 => %vr18
	iread	%vr18
	add 	%vr4, %vr6 => %vr19
	i2i 	%vr19 => %vr4
	comp 	%vr4, %vr7 => %vr8
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
	i2i 	%vr6 => %vr4
	loadI 	20 => %vr7
	comp 	%vr4, %vr7 => %vr8
	testge 	%vr8 => %vr9
	cbr 	%vr9 -> .L2

# Block No.: 1
.L3: nop
	loadI 	main_fp => %vr10
	load 	%vr10 => %vr11
	loadI 	-4 => %vr12
	add 	%vr11, %vr12 => %vr13
	loadI 	0 => %vr14
	sub 	%vr4, %vr14 => %vr15
	loadI 	4 => %vr16
	mult 	%vr15, %vr16 => %vr17
	sub 	%vr13, %vr17 => %vr18
	load 	%vr18 => %vr19
	iwrite	%vr19
	add 	%vr4, %vr6 => %vr20
	i2i 	%vr20 => %vr4
	comp 	%vr4, %vr7 => %vr8
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
	sub 	%vr12, %vr13 => %vr14
	loadI 	4 => %vr15
	mult 	%vr14, %vr15 => %vr16
	sub 	%vr4, %vr16 => %vr17
	load 	%vr17 => %vr18
	i2i 	%vr18 => %vr9
	load 	%vr5 => %vr12
	loadI 	1 => %vr19
	sub 	%vr12, %vr19 => %vr20
	i2i 	%vr20 => %vr7
	load 	%vr6 => %vr21
	add 	%vr21, %vr19 => %vr22
	i2i 	%vr22 => %vr8
	loadI 	.float_const_0 => %vr23
	fload 	%vr23 => %vr24
	f2i 	%vr24 => %vr25
	comp 	%vr25, %vr13 => %vr26
	testeq 	%vr26 => %vr27
	cbr 	%vr27 -> .L4

# Block No.: 1
.L5: nop
	sub 	%vr8, %vr19 => %vr28
	i2i 	%vr28 => %vr8
	sub 	%vr8, %vr13 => %vr29
	mult 	%vr29, %vr15 => %vr30
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	comp 	%vr32, %vr9 => %vr33
	testle 	%vr33 => %vr34
	cbr 	%vr34 -> .L6

# Block No.: 2
.L7: nop
	sub 	%vr8, %vr19 => %vr28
	i2i 	%vr28 => %vr8
	sub 	%vr8, %vr13 => %vr29
	mult 	%vr29, %vr15 => %vr30
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	comp 	%vr32, %vr9 => %vr33
	testgt 	%vr33 => %vr34
	cbr 	%vr34 -> .L7

# Block No.: 3
.L6: nop
	add 	%vr7, %vr19 => %vr35
	i2i 	%vr35 => %vr7
	sub 	%vr7, %vr13 => %vr36
	mult 	%vr36, %vr15 => %vr37
	sub 	%vr4, %vr37 => %vr38
	load 	%vr38 => %vr39
	comp 	%vr39, %vr9 => %vr40
	testge 	%vr40 => %vr41
	cbr 	%vr41 -> .L8

# Block No.: 4
.L9: nop
	add 	%vr7, %vr19 => %vr35
	i2i 	%vr35 => %vr7
	sub 	%vr7, %vr13 => %vr36
	mult 	%vr36, %vr15 => %vr37
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
	load 	%vr38 => %vr39
	i2i 	%vr39 => %vr10
	sub 	%vr4, %vr30 => %vr31
	load 	%vr31 => %vr32
	sub 	%vr4, %vr37 => %vr38
	store 	%vr32 => %vr38
	store 	%vr10 => %vr31
	jumpI	-> .L11

# Block No.: 7
.L10: nop
	iret	%vr8

# Block No.: 8
.L11: nop
	f2i 	%vr24 => %vr25
	cbr 	%vr25 -> .L5

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
	add 	%vr0, %vr12 => %vr13
	store 	%vr11 => %vr13
	call quicksort, %vr4, %vr5, %vr13
	load 	%vr13 => %vr14
	loadI 	1 => %vr15
	add 	%vr14, %vr15 => %vr16
	loadI 	-8 => %vr17
	add 	%vr0, %vr17 => %vr18
	store 	%vr16 => %vr18
	call quicksort, %vr4, %vr18, %vr6

# Block No.: 2
.L12: nop
	ret

# Block No.: 3
	# Exit Block: nop

