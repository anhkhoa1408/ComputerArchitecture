.data
	Input1: .asciiz"\Nhap vao so nguyen a: "
	Input2: .asciiz"\Nhap vao so nguyen b: "
	Sum: .asciiz"\nTong: "
.text
main:	
	#Input a
	li $v0,4
	la $a0,Input1
	syscall
	
	li $v0,5
	syscall
	
	add $t0,$v0,$zero
	
	#Input b
	li $v0,4
	la $a0,Input2
	syscall
	
	li $v0,5
	syscall
	
	add $t1,$v0,$zero
	
	#sum
	li $v0,4
	la $a0,Sum
	syscall
	
	add $t2,$t0,$t1
	add $a0,$t2,$zero
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	
	
