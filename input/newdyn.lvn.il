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
	.frame main, 3960
# Block No.: 0
	loadI 	30 => %vr8
	loadI 	30 => %vr5
	loadI 	30 => %vr4
	loadI 	1 => %vr9
	loadI 	1 => %vr6
	loadI 	1 => %vr10
	testgt 	%vr10 => %vr11
	cbr 	%vr11 -> .L0

# Block No.: 1
.L1: nop
	loadI 	1 => %vr9
	subI 	%vr6, 1 => %vr12
	mult 	%vr6, %vr5 => %vr13
	addI 	%vr13, 1 => %vr14
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr14, 1 => %vr18
	loadI 	4 => %vr19
	multI 	%vr18, 4 => %vr20
	sub 	%vr17, %vr20 => %vr21
	store 	%vr12 => %vr21
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	addI 	%vr0, -124 => %vr23
	i2i 	%vr12 => %vr12
	multI 	%vr12, 4 => %vr24
	sub 	%vr23, %vr24 => %vr25
	store 	%vr6 => %vr25
	addI 	%vr6, 1 => %vr26
	i2i 	%vr26 => %vr6
	comp 	%vr26, %vr5 => %vr10
	testle 	%vr10 => %vr11
	cbr 	%vr11 -> .L1

# Block No.: 2
.L0: nop
	loadI 	1 => %vr9
	loadI 	1 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testgt 	%vr27 => %vr28
	cbr 	%vr28 -> .L2

# Block No.: 3
.L3: nop
	loadI 	1 => %vr9
	subI 	%vr7, 1 => %vr29
	multI 	%vr5, 1 => %vr30
	add 	%vr30, %vr7 => %vr31
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr31, 1 => %vr32
	loadI 	4 => %vr19
	multI 	%vr32, 4 => %vr33
	sub 	%vr17, %vr33 => %vr34
	store 	%vr29 => %vr34
	loadI 	2 => %vr35
	multI 	%vr7, 2 => %vr36
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	addI 	%vr0, -124 => %vr23
	i2i 	%vr29 => %vr29
	multI 	%vr29, 4 => %vr37
	sub 	%vr23, %vr37 => %vr38
	store 	%vr36 => %vr38
	addI 	%vr7, 1 => %vr39
	i2i 	%vr39 => %vr7
	comp 	%vr39, %vr4 => %vr27
	testle 	%vr27 => %vr28
	cbr 	%vr28 -> .L3

# Block No.: 4
.L2: nop
	loadI 	2 => %vr35
	loadI 	2 => %vr6
	comp 	%vr6, %vr5 => %vr10
	testgt 	%vr10 => %vr11
	cbr 	%vr11 -> .L4

# Block No.: 5
.L5: nop
	loadI 	2 => %vr35
	loadI 	2 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testgt 	%vr27 => %vr28
	cbr 	%vr28 -> .L6

# Block No.: 6
.L7: nop
	loadI 	1 => %vr9
	subI 	%vr6, 1 => %vr12
	mult 	%vr12, %vr5 => %vr40
	subI 	%vr7, 1 => %vr29
	add 	%vr40, %vr29 => %vr41
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr41, 1 => %vr42
	loadI 	4 => %vr19
	multI 	%vr42, 4 => %vr43
	sub 	%vr17, %vr43 => %vr44
	load 	%vr44 => %vr45
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	subI 	%vr46, 1 => %vr47
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	store 	%vr45 => %vr49
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	addI 	%vr0, -124 => %vr23
	i2i 	%vr12 => %vr12
	multI 	%vr12, 4 => %vr24
	sub 	%vr23, %vr24 => %vr25
	load 	%vr25 => %vr50
	i2i 	%vr0 => %vr15
	loadI 	-4 => %vr51
	addI 	%vr0, -4 => %vr52
	i2i 	%vr29 => %vr29
	multI 	%vr29, 4 => %vr37
	sub 	%vr52, %vr37 => %vr53
	load 	%vr53 => %vr54
	comp 	%vr50, %vr54 => %vr55
	testne 	%vr55 => %vr56
	cbrne 	%vr56 -> .L8

# Block No.: 7
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	loadI 	1 => %vr9
	subI 	%vr46, 1 => %vr47
	loadI 	4 => %vr19
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	addI 	%vr57, 1 => %vr58
	i2i 	%vr13 => %vr13
	i2i 	%vr46 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	i2i 	%vr47 => %vr47
	i2i 	%vr48 => %vr48
	i2i 	%vr49 => %vr49
	store 	%vr58 => %vr49

# Block No.: 8
.L8: nop
	loadI 	1 => %vr9
	subI 	%vr6, 1 => %vr12
	mult 	%vr12, %vr5 => %vr40
	add 	%vr40, %vr7 => %vr59
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr59, 1 => %vr60
	loadI 	4 => %vr19
	multI 	%vr60, 4 => %vr61
	sub 	%vr17, %vr61 => %vr62
	load 	%vr62 => %vr63
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	subI 	%vr46, 1 => %vr47
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	comp 	%vr63, %vr57 => %vr64
	testlt 	%vr64 => %vr65
	cbrne 	%vr65 -> .L9

# Block No.: 9
	loadI 	1 => %vr9
	subI 	%vr6, 1 => %vr12
	mult 	%vr12, %vr5 => %vr40
	add 	%vr40, %vr7 => %vr59
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr59, 1 => %vr60
	loadI 	4 => %vr19
	multI 	%vr60, 4 => %vr61
	sub 	%vr17, %vr61 => %vr62
	load 	%vr62 => %vr63
	addI 	%vr63, 1 => %vr66
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	subI 	%vr46, 1 => %vr47
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	store 	%vr66 => %vr49

# Block No.: 10
.L9: nop
	mult 	%vr6, %vr5 => %vr13
	loadI 	1 => %vr9
	subI 	%vr7, 1 => %vr29
	add 	%vr13, %vr29 => %vr67
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr67, 1 => %vr68
	loadI 	4 => %vr19
	multI 	%vr68, 4 => %vr69
	sub 	%vr17, %vr69 => %vr70
	load 	%vr70 => %vr71
	i2i 	%vr13 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	subI 	%vr46, 1 => %vr47
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	comp 	%vr71, %vr57 => %vr72
	testlt 	%vr72 => %vr73
	cbrne 	%vr73 -> .L10

# Block No.: 11
	mult 	%vr6, %vr5 => %vr13
	loadI 	1 => %vr9
	subI 	%vr7, 1 => %vr29
	add 	%vr13, %vr29 => %vr67
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	subI 	%vr67, 1 => %vr68
	loadI 	4 => %vr19
	multI 	%vr68, 4 => %vr69
	sub 	%vr17, %vr69 => %vr70
	load 	%vr70 => %vr71
	addI 	%vr71, 1 => %vr74
	i2i 	%vr13 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	i2i 	%vr17 => %vr17
	subI 	%vr46, 1 => %vr47
	multI 	%vr47, 4 => %vr48
	sub 	%vr17, %vr48 => %vr49
	store 	%vr74 => %vr49

# Block No.: 12
.L10: nop
	loadI 	1 => %vr9
	addI 	%vr7, 1 => %vr39
	i2i 	%vr39 => %vr7
	comp 	%vr39, %vr4 => %vr27
	testle 	%vr27 => %vr28
	cbr 	%vr28 -> .L7

# Block No.: 13
.L6: nop
	loadI 	1 => %vr9
	addI 	%vr6, 1 => %vr26
	i2i 	%vr26 => %vr6
	comp 	%vr26, %vr5 => %vr10
	testle 	%vr10 => %vr11
	cbr 	%vr11 -> .L5

# Block No.: 14
.L4: nop
	mult 	%vr5, %vr5 => %vr75
	add 	%vr75, %vr4 => %vr76
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	addI 	%vr0, -244 => %vr17
	loadI 	1 => %vr9
	subI 	%vr76, 1 => %vr77
	loadI 	4 => %vr19
	multI 	%vr77, 4 => %vr78
	sub 	%vr17, %vr78 => %vr79
	load 	%vr79 => %vr80
	iwrite	%vr80
	ret

# Block No.: 15
	# Exit Block: nop

