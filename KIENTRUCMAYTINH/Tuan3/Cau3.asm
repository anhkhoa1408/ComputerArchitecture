.data
	array: 	.word 0,4,5,7,1234,468,2,-56,-8,-9
	input: 	.asciiz "Please input an integer number: "
	output:	.asciiz "Position of number is: "
	not_ex:	.asciiz "The number does not exist in the array"
.text
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	
	add $t0, $v0, $zero
	
	la $s0, array
	addi $t1, $zero, 0 #loop counter
	addi $t2, $zero, 0
	addi $t3, $zero, 0
	
loop:
	lw $t2, ($s0)
	beq $t2, $t0, exit1
	beq $t1, 10, exit2
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop	
	

exit1:
	li $v0, 4
	la $a0, output
	syscall
	
	add $a0, $t1, $zero
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
exit2:
	li $v0, 4
	la $a0, not_ex
	syscall
	
	li $v0, 10
	syscall