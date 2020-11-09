.data
	array: 	.space 40
	input: 	.asciiz"Input an integer: "
	Sum:	.asciiz"Sum of all integer number: "
.text
	la $s0, array		#base address
	add $t0, $zero, $zero
	add $t1, $zero, $zero 	#loop counter for loop input
	add $t2, $zero, $zero	#loop counter for sum
	add $t3, $zero, $zero	
	
loop:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	sw $t0, ($s0)
	add $t2, $t2, $t0
	addi $t1, $t1, 1
	ble $t0, 0, exit
	addi $s0, $s0, 4
	j loop
	
exit:	
	li $v0, 4
	la $a0, Sum
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
		
			
				
										
