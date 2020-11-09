.data
	a: .asciiz"\nNhap a: "
	b: .asciiz"\nNhap b: "
	c: .asciiz"\nNhap c: "
	d: .asciiz"\nNhap d: "
	e: .asciiz"\nNhap e: "
	space: .asciiz" "
.text
main:
	#Input a
	li $v0,4
	la $a0,a
	syscall
	
	li $v0,5
	syscall
	
	add $t0,$v0,$zero
	
	#Input b
	li $v0,4
	la $a0,b
	syscall
	
	li $v0,5
	syscall
	
	add $t1,$v0,$zero
	
	#Input c
	li $v0,4
	la $a0,c
	syscall
	
	li $v0,5
	syscall
	
	add $t2,$v0,$zero
	
	#Input d
	li $v0,4
	la $a0,d
	syscall
	
	li $v0,5
	syscall
	
	add $t3,$v0,$zero
	
	#Input e
	li $v0,4
	la $a0,e
	syscall
	
	li $v0,5
	syscall
	
	add $t4,$v0,$zero
	
	#Output
	add $a0,$t4,$zero
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	add $a0,$t3,$zero
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	add $a0,$t2,$zero
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	add $a0,$t1,$zero
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	add $a0,$t0,$zero
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	li $v0,10
	syscall
