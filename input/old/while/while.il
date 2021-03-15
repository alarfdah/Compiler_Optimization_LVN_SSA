	.data
	.string	.int_wformat "%d\12"
	.string	.float_wformat "%f\12"
	.string	.char_wformat "%c\12"
	.string	.string_wformat "%s\12"
	.string	.int_rformat "%d"
	.string	.float_rformat "%f"
	.string	.char_rformat "%c"
	.string	.string_rformat "%s"
	.text
	.frame	main 0
	loadI	1  => %vr6
	i2i	%vr6  => %vr4
	loadI	10  => %vr7
	comp	%vr4 %vr7 => %vr8
	testgt	%vr8  => %vr9
	cbr	%vr9  => .L0
.L1:	nop
	iwrite	%vr4
	loadI	1  => %vr6
	add	%vr4 %vr6 => %vr10
	i2i	%vr10  => %vr4
	loadI	10  => %vr7
	comp	%vr4 %vr7 => %vr8
	testle	%vr8  => %vr9
	cbr	%vr9  => .L1
.L0:	nop
	iwrite	%vr4
	loadI	1  => %vr6
	i2i	%vr6  => %vr5
	loadI	10  => %vr7
	comp	%vr5 %vr7 => %vr11
	testgt	%vr11  => %vr12
	cbr	%vr12  => .L2
.L3:	nop
	loadI	1  => %vr6
	i2i	%vr6  => %vr4
	loadI	10  => %vr7
	comp	%vr4 %vr7 => %vr8
	testgt	%vr8  => %vr9
	cbr	%vr9  => .L4
.L5:	nop
	mult	%vr4 %vr5 => %vr13
	iwrite	%vr13
	loadI	1  => %vr6
	add	%vr4 %vr6 => %vr10
	i2i	%vr10  => %vr4
	loadI	10  => %vr7
	comp	%vr4 %vr7 => %vr8
	testle	%vr8  => %vr9
	cbr	%vr9  => .L5
.L4:	nop
	loadI	1  => %vr6
	add	%vr5 %vr6 => %vr14
	i2i	%vr14  => %vr5
	loadI	10  => %vr7
	comp	%vr5 %vr7 => %vr11
	testle	%vr11  => %vr12
	cbr	%vr12  => .L3
.L2:	nop
	ret
