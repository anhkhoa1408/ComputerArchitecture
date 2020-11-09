.data
	integerArray: 	.word 12, 45, 54, 87, 123, 456, 29, 8, 7, 1
	sum: 		.asciiz"Sum of all array element: "
.text
main:
	#Initial
	add $t0,$zero,$zero #sum
	la $t1,integerArray #base address
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	
	lw $t2,($t1)
	addi $t1,$t1,4
	add $t0,$t0,$t2
	#Result
	li $v0,4
	la $a0,sum
	syscall
	
	add $a0,$t0,$zero
	li $v0,1
	syscall
