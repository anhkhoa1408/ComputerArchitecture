.data
	integerArray: 	.word 12, 45, 54, 87, 123, 456, 29, 8, 7, 1
	sum_odd: 	.asciiz"Sum of all odd element: "
	sum_even: 	.asciiz"\nSum of all even element: "
.text
main:
	#Initial
	add $s0,$zero,$zero #sum_odd
	add $s1,$zero,$zero #sum_even
	la $t1,integerArray #base address
	la $t4,integerArray #base address
	
	#Sum of odd element
	lw $t2,4($t1)
	addi $t1,$t1,8
	add $s0,$s0,$t2
	
	lw $t2,4($t1)
	addi $t1,$t1,8
	add $s0,$s0,$t2
	
	lw $t2,4($t1)
	addi $t1,$t1,8
	add $s0,$s0,$t2
	
	lw $t2,4($t1)
	addi $t1,$t1,8
	add $s0,$s0,$t2
	
	lw $t2,4($t1)
	addi $t1,$t1,8
	add $s0,$s0,$t2
	
	#Result of odd element
	li $v0,4
	la $a0,sum_odd
	syscall
	
	add $a0,$s0,$zero
	li $v0,1
	syscall
	
	#Sum of even element
	lw $t3,($t4)
	addi $t4,$t4,8
	add $s1,$s1,$t3
	
	lw $t3,($t4)
	addi $t4,$t4,8
	add $s1,$s1,$t3
	
	lw $t3,($t4)
	addi $t4,$t4,8
	add $s1,$s1,$t3
	
	lw $t3,($t4)
	addi $t4,$t4,8
	add $s1,$s1,$t3
	
	lw $t3,($t4)
	addi $t4,$t4,8
	add $s1,$s1,$t3
	
	
	#Result of even element
	li $v0,4
	la $a0,sum_even
	syscall
	
	add $a0,$s1,$zero
	li $v0,1
	syscall
	
