.data
heso: .float 2.0 
 xa: .float 0 
 ya: .float 0 
 xb: .float 0 
 yb: .float 0 
 xc: .float 0 
 yc: .float 0 
 xd: .float 0 
 yd: .float 0 
 sABC: .float 0 
 sACD: .float 0 
 nhapXa: .asciiz "Nhap vao hoanh do cua diem A: " 
 nhapYa: .asciiz "Nhap vao tung do cua diem A: " 
 nhapXb: .asciiz "Nhap vao hoanh do cua diem B: " 
 nhapYb: .asciiz "Nhap vao tung do cua diem B: " 
 nhapXc: .asciiz "Nhap vao hoanh do cua diem C: " 
 nhapYc: .asciiz "Nhap vao tung do cua diem C: " 
 nhapXd: .asciiz "Nhap vao hoanh do cua diem D: " 
 nhapYd: .asciiz "Nhap vao tung do cua diem D: " 
 ketqua: .asciiz "Dien tich cua tu giac ABCD la: "
endline: .asciiz "\n" 
 	.text 
 	.globl main 
 main: 
 	# Nhap hoanh do diem A 
 	li $v0, 4 
 	la $a0, nhapXa 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, xa 
  
 	# Nhap tung do diem A 
 	li $v0, 4 
 	la $a0, nhapYa 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, ya 
 	 
 	# Nhap hoanh do diem B 
 	li $v0, 4 
 	la $a0, nhapXb 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, xb 
 	 
 	# Nhap tung do diem B 
 	li $v0, 4 
 	la $a0, nhapYb 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, yb 
 	 
 	# Nhap hoanh do diem C 
 	li $v0, 4 
 	la $a0, nhapXc 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, xc 
 	 
 	# Nhap tung do diem C 
 	li $v0, 4 
 	la $a0, nhapYc 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, yc 
 	 
 	# Nhap hoanh do diem D 
 	li $v0, 4 
 	la $a0, nhapXd 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, xd 
 	 
 	# Nhap tung do diem D 
 	li $v0, 4 
 	la $a0, nhapYd 
 	syscall 
 	li $v0, 6 
 	syscall 
 	swc1 $f0, yd 
	
	#S_ABC
 	# Doc toa do 4 dinh A, B, C luu vao cac thanh ghi tu f1 toi f6 
 	lwc1 $f1, xa 
 	lwc1 $f2, ya 
 	lwc1 $f3, xb 
 	lwc1 $f4, yb 
 	lwc1 $f5, xc 
 	lwc1 $f6, yc 
	# Tinh dien tich tam giac ABC 
 	# S = 1/2|((xB-xA)(yC-yA) - (xC-xA)(yB-yA))| 
 	sub.s $f7, $f3, $f1		# f7 = xB - xA 
 	sub.s $f8, $f6, $f2		# f8 = yC - yA 
 	mul.s $f9, $f7, $f8		# f9 = (xB-xA)(yC-yA) 
 	 
 	sub.s $f7, $f5, $f1		# f7 = xC - xA 
 	sub.s $f8, $f4, $f2		# f8 = yB - yA 
 	mul.s $f10, $f7, $f8	# f10 = (xC-xA)(yB-yA) 
 	 
 	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false 
 	bc1t cm1				# if flag = true -> cm 
 	bc1f mc1				# if flag = false -> mc 
 cm1: 
 	sub.s $f11, $f10, $f9	# f11 = (xC-xA)(yB-yA) - (xB-xA)(yC-yA) 
 	j exit1 
 mc1: 
 	sub.s $f11, $f9, $f10	# f11 = (xB-xA)(yC-yA) - (xC-xA)(yB-yA) 
 	j exit1 
 exit1: 
  
 	lwc1 $f12, heso			# load f12 = 2.0 
 	div.s $f11, $f11, $f12	# f11 = f11 / 2.0 
 	swc1 $f11, sABC 
	
	# S_ACD
	# Doc toa do 4 dinh A, C, D luu vao cac thanh ghi tu f1 toi f6 
 	lwc1 $f1, xa 
 	lwc1 $f2, ya 
 	lwc1 $f3, xc 
 	lwc1 $f4, yc 
 	lwc1 $f5, xd 
 	lwc1 $f6, yd 
 	# Tinh dien tich tam giac ACD 
 	# S = 1/2((xC-xA)(yD-yA) - (xD-xA)(yC-yA)) 
 	sub.s $f7, $f3, $f1		# f7 = xC - xA 
 	sub.s $f8, $f6, $f2		# f8 = yD - yA 
 	mul.s $f9, $f7, $f8		# f9 = (xC-xA)(yD-yA) 
 	 
 	sub.s $f7, $f5, $f1		# f7 = xD - xA 
 	sub.s $f8, $f4, $f2		# f8 = yC - yA 
 	mul.s $f10, $f7, $f8	# f10 = (xD-xA)(yC-yA) 
 	 
 	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false 
 	bc1t cm2				# if flag = true -> cm 
 	bc1f mc2				# if flag = false ->mc 
 cm2: 
 	sub.s $f11, $f10, $f9	# f11 = (xC-xA)(yD-yA) - (xD-xA)(yC-yA) 
 	j exit2 
 mc2: 
 	sub.s $f11, $f9, $f10	# f11 = (xD-xA)(yC-yA) - (xC-xA)(yD-yA) 
 	j exit2
 exit2: 
 	lwc1 $f12, heso			# load f12 = 2.0 
 	div.s $f11, $f11, $f12	# f11 = f11 / 2.0 
 	swc1 $f11, sACD
 	
 	# Load dien tich 2 tam giac ABC, ACD vao cac thanh ghi f1, f2
 	lwc1 $f1, sABC 
 	lwc1 $f2, sACD
 	
 	#dien tich tu giac ABCD bang tong dien tich 2 tam giac ABC va ACD
 	add.s  $f5, $f1, $f2		#f5 = sABC + sABD 
 	 
 	li $v0, 4 
 	la $a0, ketqua 
 	syscall 
 	li $v0, 2
 	mov.s $f12, $f5 
 	syscall 
 	li $v0, 4 
 	la $a0, endline 
 	syscall 
 	 
 toExit: 
 	li $v0, 10 
 	syscall 


