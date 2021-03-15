	.data
	.global main_fp, 4, 4
	.text
	.frame main, 0
	loadI	5 => %vr1
	addI	%vr2, 5 => %vr11
	i2i	%vr11 => %vr3
	loadI	3 => %vr4
	loadI	8 => %vr12
	loadI	8 => %vr6
	i2i	%vr2 => %vr7
	i2i	%vr11 => %vr13
