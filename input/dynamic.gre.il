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
	.frame main, 1820
# Block No.: 0
	loadI 	0 => %vr9
	loadI 	1 => %vr10
	i2i 	%vr0 => %vr11
	loadI 	-4 => %vr12
	add 	%vr11, %vr12 => %vr13
	sub 	%vr10, %vr10 => %vr14
	loadI 	4 => %vr15
	mult 	%vr14, %vr15 => %vr16
	sub 	%vr13, %vr16 => %vr17
	store 	%vr9 => %vr17
	loadI 	2 => %vr18
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr18, %vr10 => %vr19
	mult 	%vr19, %vr15 => %vr20
	sub 	%vr13, %vr20 => %vr21
	store 	%vr10 => %vr21
	loadI 	3 => %vr22
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr22, %vr10 => %vr23
	mult 	%vr23, %vr15 => %vr24
	sub 	%vr13, %vr24 => %vr25
	store 	%vr18 => %vr25
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr15, %vr10 => %vr26
	mult 	%vr26, %vr15 => %vr27
	sub 	%vr13, %vr27 => %vr28
	store 	%vr22 => %vr28
	loadI 	5 => %vr29
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr29, %vr10 => %vr30
	mult 	%vr30, %vr15 => %vr31
	sub 	%vr13, %vr31 => %vr32
	store 	%vr15 => %vr32
	loadI 	6 => %vr33
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr33, %vr10 => %vr34
	mult 	%vr34, %vr15 => %vr35
	sub 	%vr13, %vr35 => %vr36
	store 	%vr29 => %vr36
	loadI 	7 => %vr37
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr37, %vr10 => %vr38
	mult 	%vr38, %vr15 => %vr39
	sub 	%vr13, %vr39 => %vr40
	store 	%vr33 => %vr40
	loadI 	8 => %vr41
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr41, %vr10 => %vr42
	mult 	%vr42, %vr15 => %vr43
	sub 	%vr13, %vr43 => %vr44
	store 	%vr37 => %vr44
	loadI 	9 => %vr45
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr45, %vr10 => %vr46
	mult 	%vr46, %vr15 => %vr47
	sub 	%vr13, %vr47 => %vr48
	store 	%vr41 => %vr48
	loadI 	10 => %vr49
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr49, %vr10 => %vr50
	mult 	%vr50, %vr15 => %vr51
	sub 	%vr13, %vr51 => %vr52
	store 	%vr45 => %vr52
	loadI 	11 => %vr53
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr53, %vr10 => %vr54
	mult 	%vr54, %vr15 => %vr55
	sub 	%vr13, %vr55 => %vr56
	store 	%vr41 => %vr56
	loadI 	12 => %vr57
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr57, %vr10 => %vr58
	mult 	%vr58, %vr15 => %vr59
	sub 	%vr13, %vr59 => %vr60
	store 	%vr37 => %vr60
	loadI 	13 => %vr61
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr61, %vr10 => %vr62
	mult 	%vr62, %vr15 => %vr63
	sub 	%vr13, %vr63 => %vr64
	store 	%vr33 => %vr64
	loadI 	14 => %vr65
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr65, %vr10 => %vr66
	mult 	%vr66, %vr15 => %vr67
	sub 	%vr13, %vr67 => %vr68
	store 	%vr29 => %vr68
	loadI 	15 => %vr69
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr69, %vr10 => %vr70
	mult 	%vr70, %vr15 => %vr71
	sub 	%vr13, %vr71 => %vr72
	store 	%vr15 => %vr72
	loadI 	16 => %vr73
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr73, %vr10 => %vr74
	mult 	%vr74, %vr15 => %vr75
	sub 	%vr13, %vr75 => %vr76
	store 	%vr22 => %vr76
	loadI 	17 => %vr77
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr77, %vr10 => %vr78
	mult 	%vr78, %vr15 => %vr79
	sub 	%vr13, %vr79 => %vr80
	store 	%vr18 => %vr80
	loadI 	18 => %vr81
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr81, %vr10 => %vr82
	mult 	%vr82, %vr15 => %vr83
	sub 	%vr13, %vr83 => %vr84
	store 	%vr10 => %vr84
	loadI 	19 => %vr85
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr85, %vr10 => %vr86
	mult 	%vr86, %vr15 => %vr87
	sub 	%vr13, %vr87 => %vr88
	store 	%vr9 => %vr88
	i2i 	%vr0 => %vr11
	loadI 	-80 => %vr89
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr16 => %vr91
	store 	%vr9 => %vr91
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr20 => %vr92
	store 	%vr10 => %vr92
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr24 => %vr93
	store 	%vr22 => %vr93
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr27 => %vr94
	store 	%vr29 => %vr94
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr31 => %vr95
	store 	%vr37 => %vr95
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr35 => %vr96
	store 	%vr45 => %vr96
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr39 => %vr97
	store 	%vr53 => %vr97
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr43 => %vr98
	store 	%vr15 => %vr98
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr47 => %vr99
	store 	%vr22 => %vr99
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr51 => %vr100
	store 	%vr18 => %vr100
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr55 => %vr101
	store 	%vr10 => %vr101
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr59 => %vr102
	store 	%vr45 => %vr102
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr63 => %vr103
	store 	%vr41 => %vr103
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr67 => %vr104
	store 	%vr37 => %vr104
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr71 => %vr105
	store 	%vr33 => %vr105
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr90, %vr75 => %vr106
	store 	%vr9 => %vr106
	loadI 	20 => %vr107
	i2i 	%vr107 => %vr8
	i2i 	%vr10 => %vr4
	add 	%vr4, %vr10 => %vr108
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr108, %vr10 => %vr109
	mult 	%vr109, %vr15 => %vr110
	sub 	%vr13, %vr110 => %vr111
	load 	%vr111 => %vr112
	comp 	%vr112, %vr9 => %vr113
	testeq 	%vr113 => %vr114
	cbr 	%vr114 -> .L0

# Block No.: 1
.L1: nop
	sub 	%vr4, %vr10 => %vr115
	mult 	%vr10, %vr8 => %vr116
	add 	%vr116, %vr4 => %vr117
	i2i 	%vr0 => %vr11
	loadI 	-144 => %vr118
	add 	%vr11, %vr118 => %vr119
	sub 	%vr117, %vr10 => %vr120
	mult 	%vr120, %vr15 => %vr121
	sub 	%vr119, %vr121 => %vr122
	store 	%vr115 => %vr122
	add 	%vr4, %vr10 => %vr108
	i2i 	%vr108 => %vr4
	add 	%vr4, %vr10 => %vr108
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	sub 	%vr108, %vr10 => %vr109
	mult 	%vr109, %vr15 => %vr110
	sub 	%vr13, %vr110 => %vr111
	load 	%vr111 => %vr112
	comp 	%vr112, %vr9 => %vr113
	testne 	%vr113 => %vr114
	cbr 	%vr114 -> .L1

# Block No.: 2
.L0: nop
	i2i 	%vr10 => %vr5
	add 	%vr5, %vr10 => %vr123
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr123, %vr10 => %vr124
	mult 	%vr124, %vr15 => %vr125
	sub 	%vr90, %vr125 => %vr126
	load 	%vr126 => %vr127
	comp 	%vr127, %vr9 => %vr128
	testeq 	%vr128 => %vr129
	cbr 	%vr129 -> .L2

# Block No.: 3
.L3: nop
	sub 	%vr5, %vr10 => %vr130
	mult 	%vr5, %vr8 => %vr131
	add 	%vr131, %vr10 => %vr132
	i2i 	%vr0 => %vr11
	loadI 	-144 => %vr118
	add 	%vr11, %vr118 => %vr119
	sub 	%vr132, %vr10 => %vr133
	mult 	%vr133, %vr15 => %vr134
	sub 	%vr119, %vr134 => %vr135
	store 	%vr130 => %vr135
	add 	%vr5, %vr10 => %vr123
	i2i 	%vr123 => %vr5
	add 	%vr5, %vr10 => %vr123
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	sub 	%vr123, %vr10 => %vr124
	mult 	%vr124, %vr15 => %vr125
	sub 	%vr90, %vr125 => %vr126
	load 	%vr126 => %vr127
	comp 	%vr127, %vr9 => %vr128
	testne 	%vr128 => %vr129
	cbr 	%vr129 -> .L3

# Block No.: 4
.L2: nop
	i2i 	%vr18 => %vr6
	comp 	%vr6, %vr5 => %vr136
	testgt 	%vr136 => %vr137
	cbr 	%vr137 -> .L4

# Block No.: 5
.L5: nop
	i2i 	%vr18 => %vr7
	comp 	%vr7, %vr4 => %vr138
	testgt 	%vr138 => %vr139
	cbr 	%vr139 -> .L6

# Block No.: 6
.L7: nop
	sub 	%vr6, %vr10 => %vr140
	mult 	%vr140, %vr8 => %vr141
	sub 	%vr7, %vr10 => %vr142
	add 	%vr141, %vr142 => %vr143
	i2i 	%vr0 => %vr11
	loadI 	-144 => %vr118
	add 	%vr11, %vr118 => %vr119
	sub 	%vr143, %vr10 => %vr144
	mult 	%vr144, %vr15 => %vr145
	sub 	%vr119, %vr145 => %vr146
	load 	%vr146 => %vr147
	mult 	%vr6, %vr8 => %vr148
	add 	%vr148, %vr7 => %vr149
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr149, %vr10 => %vr150
	mult 	%vr150, %vr15 => %vr151
	sub 	%vr119, %vr151 => %vr152
	store 	%vr147 => %vr152
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr89 => %vr90
	mult 	%vr140, %vr15 => %vr153
	sub 	%vr90, %vr153 => %vr154
	load 	%vr154 => %vr155
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr12 => %vr13
	mult 	%vr142, %vr15 => %vr156
	sub 	%vr13, %vr156 => %vr157
	load 	%vr157 => %vr158
	comp 	%vr155, %vr158 => %vr159
	testne 	%vr159 => %vr160
	cbrne 	%vr160 -> .L8

# Block No.: 7
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr149, %vr10 => %vr150
	mult 	%vr150, %vr15 => %vr151
	sub 	%vr119, %vr151 => %vr152
	load 	%vr152 => %vr161
	add 	%vr161, %vr10 => %vr162
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr119, %vr151 => %vr152
	store 	%vr162 => %vr152

# Block No.: 8
.L8: nop
	sub 	%vr6, %vr10 => %vr140
	mult 	%vr140, %vr8 => %vr141
	add 	%vr141, %vr7 => %vr163
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr163, %vr10 => %vr164
	mult 	%vr164, %vr15 => %vr165
	sub 	%vr119, %vr165 => %vr166
	load 	%vr166 => %vr167
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr149, %vr10 => %vr150
	mult 	%vr150, %vr15 => %vr151
	sub 	%vr119, %vr151 => %vr152
	load 	%vr152 => %vr161
	comp 	%vr167, %vr161 => %vr168
	testlt 	%vr168 => %vr169
	cbrne 	%vr169 -> .L9

# Block No.: 9
	sub 	%vr6, %vr10 => %vr140
	mult 	%vr140, %vr8 => %vr141
	add 	%vr141, %vr7 => %vr163
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr163, %vr10 => %vr164
	mult 	%vr164, %vr15 => %vr165
	sub 	%vr119, %vr165 => %vr166
	load 	%vr166 => %vr167
	add 	%vr167, %vr10 => %vr170
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr119, %vr151 => %vr152
	store 	%vr170 => %vr152

# Block No.: 10
.L9: nop
	add 	%vr148, %vr142 => %vr171
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr171, %vr10 => %vr172
	mult 	%vr172, %vr15 => %vr173
	sub 	%vr119, %vr173 => %vr174
	load 	%vr174 => %vr175
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr119, %vr151 => %vr152
	load 	%vr152 => %vr161
	comp 	%vr175, %vr161 => %vr176
	testlt 	%vr176 => %vr177
	cbrne 	%vr177 -> .L10

# Block No.: 11
	sub 	%vr7, %vr10 => %vr142
	add 	%vr148, %vr142 => %vr171
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr171, %vr10 => %vr172
	mult 	%vr172, %vr15 => %vr173
	sub 	%vr119, %vr173 => %vr174
	load 	%vr174 => %vr175
	add 	%vr175, %vr10 => %vr178
	i2i 	%vr0 => %vr11
	add 	%vr11, %vr118 => %vr119
	sub 	%vr119, %vr151 => %vr152
	store 	%vr178 => %vr152

# Block No.: 12
.L10: nop
	add 	%vr7, %vr10 => %vr179
	i2i 	%vr179 => %vr7
	comp 	%vr7, %vr4 => %vr138
	testle 	%vr138 => %vr139
	cbr 	%vr139 -> .L7

# Block No.: 13
.L6: nop
	add 	%vr6, %vr10 => %vr180
	i2i 	%vr180 => %vr6
	comp 	%vr6, %vr5 => %vr136
	testle 	%vr136 => %vr137
	cbr 	%vr137 -> .L5

# Block No.: 14
.L4: nop
	mult 	%vr5, %vr8 => %vr131
	add 	%vr131, %vr4 => %vr181
	i2i 	%vr0 => %vr11
	loadI 	-144 => %vr118
	add 	%vr11, %vr118 => %vr119
	sub 	%vr181, %vr10 => %vr182
	mult 	%vr182, %vr15 => %vr183
	sub 	%vr119, %vr183 => %vr184
	load 	%vr184 => %vr185
	iwrite	%vr185
	ret

# Block No.: 15
	# Exit Block: nop

