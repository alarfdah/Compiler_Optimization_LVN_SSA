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
	.frame main, 60
# Block No.: 0
	loadI 	32 => %vr8
	addI 	%vr0, -4 => %vr12
	subI 	%vr12, 0 => %vr16
	store 	%vr8 => %vr16
	loadI 	11 => %vr17
	i2i 	%vr12 => %vr12
	subI 	%vr12, 4 => %vr21
	store 	%vr17 => %vr21
	loadI 	111 => %vr22
	i2i 	%vr12 => %vr12
	subI 	%vr12, 8 => %vr26
	store 	%vr22 => %vr26
	loadI 	88 => %vr27
	i2i 	%vr12 => %vr12
	subI 	%vr12, 12 => %vr30
	store 	%vr27 => %vr30
	i2i 	%vr12 => %vr12
	subI 	%vr12, 16 => %vr34
	store 	%vr17 => %vr34
	loadI 	44 => %vr35
	i2i 	%vr12 => %vr12
	subI 	%vr12, 20 => %vr39
	store 	%vr35 => %vr39
	loadI 	33 => %vr40
	i2i 	%vr12 => %vr12
	subI 	%vr12, 24 => %vr44
	store 	%vr40 => %vr44
	i2i 	%vr12 => %vr12
	subI 	%vr12, 28 => %vr48
	store 	%vr40 => %vr48
	loadI 	22 => %vr49
	i2i 	%vr12 => %vr12
	subI 	%vr12, 32 => %vr53
	store 	%vr49 => %vr53
	loadI 	77 => %vr54
	i2i 	%vr12 => %vr12
	subI 	%vr12, 36 => %vr58
	store 	%vr54 => %vr58
	loadI 	45 => %vr59
	i2i 	%vr12 => %vr12
	subI 	%vr12, 40 => %vr62
	store 	%vr59 => %vr62
	loadI 	65 => %vr63
	i2i 	%vr12 => %vr12
	subI 	%vr12, 44 => %vr67
	store 	%vr63 => %vr67
	loadI 	76 => %vr68
	i2i 	%vr12 => %vr12
	subI 	%vr12, 48 => %vr72
	store 	%vr68 => %vr72
	loadI 	87 => %vr73
	loadI 	14 => %vr74
	i2i 	%vr12 => %vr12
	subI 	%vr12, 52 => %vr77
	store 	%vr73 => %vr77
	loadI 	34 => %vr78
	loadI 	15 => %vr79
	i2i 	%vr12 => %vr12
	subI 	%vr12, 56 => %vr82
	store 	%vr78 => %vr82
	loadI 	1 => %vr4
	loadI 	1 => %vr83
	testgt 	%vr83 => %vr84
	cbr 	%vr84 -> .L0

# Block No.: 1
.L1: nop
	i2i 	%vr4 => %vr7
	addI 	%vr4, 1 => %vr85
	i2i 	%vr85 => %vr5
	comp 	%vr85, %vr79 => %vr86
	testgt 	%vr86 => %vr87
	cbr 	%vr87 -> .L2

# Block No.: 2
.L3: nop
	addI 	%vr0, -4 => %vr12
	subI 	%vr5, 1 => %vr88
	multI 	%vr88, 4 => %vr89
	sub 	%vr12, %vr89 => %vr90
	load 	%vr90 => %vr91
	i2i 	%vr12 => %vr12
	subI 	%vr7, 1 => %vr92
	multI 	%vr92, 4 => %vr93
	sub 	%vr12, %vr93 => %vr94
	load 	%vr94 => %vr95
	comp 	%vr91, %vr95 => %vr96
	testlt 	%vr96 => %vr97
	cbrne 	%vr97 -> .L4

# Block No.: 3
	i2i 	%vr5 => %vr7

# Block No.: 4
.L4: nop
	addI 	%vr5, 1 => %vr98
	i2i 	%vr98 => %vr5
	comp 	%vr98, %vr79 => %vr86
	testle 	%vr86 => %vr87
	cbr 	%vr87 -> .L3

# Block No.: 5
.L2: nop
	addI 	%vr0, -4 => %vr12
	subI 	%vr4, 1 => %vr99
	multI 	%vr99, 4 => %vr100
	sub 	%vr12, %vr100 => %vr101
	load 	%vr101 => %vr102
	i2i 	%vr12 => %vr12
	subI 	%vr7, 1 => %vr92
	multI 	%vr92, 4 => %vr93
	sub 	%vr12, %vr93 => %vr94
	load 	%vr94 => %vr95
	i2i 	%vr101 => %vr101
	store 	%vr95 => %vr101
	i2i 	%vr94 => %vr94
	store 	%vr102 => %vr94
	addI 	%vr4, 1 => %vr85
	i2i 	%vr85 => %vr4
	comp 	%vr85, %vr74 => %vr83
	testle 	%vr83 => %vr84
	cbr 	%vr84 -> .L1

# Block No.: 6
.L0: nop
	loadI 	1 => %vr4
	loadI 	1 => %vr103
	testgt 	%vr103 => %vr104
	cbr 	%vr104 -> .L5

# Block No.: 7
.L6: nop
	addI 	%vr0, -4 => %vr12
	subI 	%vr4, 1 => %vr99
	multI 	%vr99, 4 => %vr100
	sub 	%vr12, %vr100 => %vr101
	load 	%vr101 => %vr102
	iwrite	%vr102
	addI 	%vr4, 1 => %vr85
	i2i 	%vr85 => %vr4
	comp 	%vr85, %vr79 => %vr103
	testle 	%vr103 => %vr104
	cbr 	%vr104 -> .L6

# Block No.: 8
.L5: nop
	ret

# Block No.: 9
	# Exit Block: nop

