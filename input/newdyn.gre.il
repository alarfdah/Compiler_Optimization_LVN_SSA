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
	i2i 	%vr8 => %vr5
	i2i 	%vr8 => %vr4
	loadI 	1 => %vr9
	i2i 	%vr9 => %vr6
	comp 	%vr6, %vr5 => %vr10
	testgt 	%vr10 => %vr11
	cbr 	%vr11 -> .L0

# Block No.: 1
.L1: nop
	sub 	%vr6, %vr9 => %vr12
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr9 => %vr14
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	add 	%vr15, %vr16 => %vr17
	sub 	%vr14, %vr9 => %vr18
	loadI 	4 => %vr19
	mult 	%vr18, %vr19 => %vr20
	sub 	%vr17, %vr20 => %vr21
	store 	%vr12 => %vr21
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	add 	%vr15, %vr22 => %vr23
	mult 	%vr12, %vr19 => %vr24
	sub 	%vr23, %vr24 => %vr25
	store 	%vr6 => %vr25
	add 	%vr6, %vr9 => %vr26
	i2i 	%vr26 => %vr6
	comp 	%vr6, %vr5 => %vr10
	testle 	%vr10 => %vr11
	cbr 	%vr11 -> .L1

# Block No.: 2
.L0: nop
	i2i 	%vr9 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testgt 	%vr27 => %vr28
	cbr 	%vr28 -> .L2

# Block No.: 3
.L3: nop
	sub 	%vr7, %vr9 => %vr29
	mult 	%vr9, %vr5 => %vr30
	add 	%vr30, %vr7 => %vr31
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	add 	%vr15, %vr16 => %vr17
	sub 	%vr31, %vr9 => %vr32
	loadI 	4 => %vr19
	mult 	%vr32, %vr19 => %vr33
	sub 	%vr17, %vr33 => %vr34
	store 	%vr29 => %vr34
	loadI 	2 => %vr35
	mult 	%vr35, %vr7 => %vr36
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	add 	%vr15, %vr22 => %vr23
	mult 	%vr29, %vr19 => %vr37
	sub 	%vr23, %vr37 => %vr38
	store 	%vr36 => %vr38
	add 	%vr7, %vr9 => %vr39
	i2i 	%vr39 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testle 	%vr27 => %vr28
	cbr 	%vr28 -> .L3

# Block No.: 4
.L2: nop
	loadI 	2 => %vr35
	i2i 	%vr35 => %vr6
	comp 	%vr6, %vr5 => %vr10
	testgt 	%vr10 => %vr11
	cbr 	%vr11 -> .L4

# Block No.: 5
.L5: nop
	i2i 	%vr35 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testgt 	%vr27 => %vr28
	cbr 	%vr28 -> .L6

# Block No.: 6
.L7: nop
	sub 	%vr6, %vr9 => %vr12
	mult 	%vr12, %vr5 => %vr40
	sub 	%vr7, %vr9 => %vr29
	add 	%vr40, %vr29 => %vr41
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	add 	%vr15, %vr16 => %vr17
	sub 	%vr41, %vr9 => %vr42
	loadI 	4 => %vr19
	mult 	%vr42, %vr19 => %vr43
	sub 	%vr17, %vr43 => %vr44
	load 	%vr44 => %vr45
	mult 	%vr6, %vr5 => %vr13
	add 	%vr13, %vr7 => %vr46
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr46, %vr9 => %vr47
	mult 	%vr47, %vr19 => %vr48
	sub 	%vr17, %vr48 => %vr49
	store 	%vr45 => %vr49
	i2i 	%vr0 => %vr15
	loadI 	-124 => %vr22
	add 	%vr15, %vr22 => %vr23
	mult 	%vr12, %vr19 => %vr24
	sub 	%vr23, %vr24 => %vr25
	load 	%vr25 => %vr50
	i2i 	%vr0 => %vr15
	loadI 	-4 => %vr51
	add 	%vr15, %vr51 => %vr52
	mult 	%vr29, %vr19 => %vr37
	sub 	%vr52, %vr37 => %vr53
	load 	%vr53 => %vr54
	comp 	%vr50, %vr54 => %vr55
	testne 	%vr55 => %vr56
	cbrne 	%vr56 -> .L8

# Block No.: 7
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr46, %vr9 => %vr47
	mult 	%vr47, %vr19 => %vr48
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	add 	%vr57, %vr9 => %vr58
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr17, %vr48 => %vr49
	store 	%vr58 => %vr49

# Block No.: 8
.L8: nop
	sub 	%vr6, %vr9 => %vr12
	mult 	%vr12, %vr5 => %vr40
	add 	%vr40, %vr7 => %vr59
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr59, %vr9 => %vr60
	mult 	%vr60, %vr19 => %vr61
	sub 	%vr17, %vr61 => %vr62
	load 	%vr62 => %vr63
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr46, %vr9 => %vr47
	mult 	%vr47, %vr19 => %vr48
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	comp 	%vr63, %vr57 => %vr64
	testlt 	%vr64 => %vr65
	cbrne 	%vr65 -> .L9

# Block No.: 9
	sub 	%vr6, %vr9 => %vr12
	mult 	%vr12, %vr5 => %vr40
	add 	%vr40, %vr7 => %vr59
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr59, %vr9 => %vr60
	mult 	%vr60, %vr19 => %vr61
	sub 	%vr17, %vr61 => %vr62
	load 	%vr62 => %vr63
	add 	%vr63, %vr9 => %vr66
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr17, %vr48 => %vr49
	store 	%vr66 => %vr49

# Block No.: 10
.L9: nop
	add 	%vr13, %vr29 => %vr67
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr67, %vr9 => %vr68
	mult 	%vr68, %vr19 => %vr69
	sub 	%vr17, %vr69 => %vr70
	load 	%vr70 => %vr71
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr17, %vr48 => %vr49
	load 	%vr49 => %vr57
	comp 	%vr71, %vr57 => %vr72
	testlt 	%vr72 => %vr73
	cbrne 	%vr73 -> .L10

# Block No.: 11
	sub 	%vr7, %vr9 => %vr29
	add 	%vr13, %vr29 => %vr67
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr67, %vr9 => %vr68
	mult 	%vr68, %vr19 => %vr69
	sub 	%vr17, %vr69 => %vr70
	load 	%vr70 => %vr71
	add 	%vr71, %vr9 => %vr74
	i2i 	%vr0 => %vr15
	add 	%vr15, %vr16 => %vr17
	sub 	%vr17, %vr48 => %vr49
	store 	%vr74 => %vr49

# Block No.: 12
.L10: nop
	add 	%vr7, %vr9 => %vr39
	i2i 	%vr39 => %vr7
	comp 	%vr7, %vr4 => %vr27
	testle 	%vr27 => %vr28
	cbr 	%vr28 -> .L7

# Block No.: 13
.L6: nop
	add 	%vr6, %vr9 => %vr26
	i2i 	%vr26 => %vr6
	comp 	%vr6, %vr5 => %vr10
	testle 	%vr10 => %vr11
	cbr 	%vr11 -> .L5

# Block No.: 14
.L4: nop
	mult 	%vr5, %vr5 => %vr75
	add 	%vr75, %vr4 => %vr76
	i2i 	%vr0 => %vr15
	loadI 	-244 => %vr16
	add 	%vr15, %vr16 => %vr17
	sub 	%vr76, %vr9 => %vr77
	loadI 	4 => %vr19
	mult 	%vr77, %vr19 => %vr78
	sub 	%vr17, %vr78 => %vr79
	load 	%vr79 => %vr80
	iwrite	%vr80
	ret

# Block No.: 15
	# Exit Block: nop

