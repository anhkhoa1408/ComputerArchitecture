.data
	Input: .asciiz"\nNhap vao mot so nguyen: "
	Output: .asciiz"\nGia tri xuat ra: "
.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0, 5 
	syscall
	
	add $t0,$v0,$zero
	addi $t0,$t0,1
	
	li $v0,4
	la $a0,Output
	syscall
	
	add $a0,$0,$t0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
