.data
	a: .asciiz"\nInput a: "
	b: .asciiz"\nInput b: "
	c: .asciiz"\nInput c: "
	d: .asciiz"\nInput d: "
	f: .asciiz"\nResult of f: "
	g: .asciiz"\nResult of g: "
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
	
	#Result
	add $s0,$t0,$t1
	sub $s1,$t2,$t3
	addi $s2,$s1,-2
	sub $t5,$s0,$s2
	
	li $v0,4
	la $a0,f
	syscall
	
	add $a0,$t5,$zero
	li $v0,1
	syscall
	
	##########
	add $s4,$t0,$t1
	add $s5,$s4,$s4
	add $s6,$s5,$s4
	
	add $s7,$t2,$t3
	add $s7,$s7,$s7
	
	sub $t6,$s6,$s7
	
	li $v0,4
	la $a0,g
	syscall
	
	add $a0,$t6,$zero
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	 
