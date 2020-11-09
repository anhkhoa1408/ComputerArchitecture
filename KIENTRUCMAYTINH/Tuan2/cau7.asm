.data
	integerArray:	.space 40
	input:		.asciiz "Input 10 element: \n"
	sum: 		.asciiz "Sum of all element: "
.text
main:
	add $s0,$zero,$zero #sum
	la $s1, integerArray
	
	#input
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall
	add $t0,$v0,$zero
	
	li $v0,5
	syscall
	add $t1,$v0,$zero
	
	li $v0,5
	syscall
	add $t2,$v0,$zero
	
	li $v0,5
	syscall
	add $t3,$v0,$zero
	
	li $v0,5
	syscall
	add $t4,$v0,$zero
	
	li $v0,5
	syscall
	add $t5,$v0,$zero
	
	li $v0,5
	syscall
	add $t6,$v0,$zero
	
	li $v0,5
	syscall
	add $t7,$v0,$zero
	
	li $v0,5
	syscall
	add $t8,$v0,$zero
	
	li $v0,5
	syscall
	add $t9,$v0,$zero
	
	#store
	sw $t0,($s1)
	sw $t1,4($s1)
	sw $t2,8($s1)
	sw $t3,12($s1)
	sw $t4,16($s1)
	sw $t5,20($s1)
	sw $t6,24($s1)
	sw $t7,28($s1)
	sw $t8,32($s1)
	sw $t9,36($s1)
	
	#Sum
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	
	lw $s2,($s1)
	addi $s1,$s1,4
	add $s0,$s0,$s2
	#Result
	li $v0,4
	la $a0,sum
	syscall
	
	add $a0,$s0,$zero
	li $v0,1
	syscall
