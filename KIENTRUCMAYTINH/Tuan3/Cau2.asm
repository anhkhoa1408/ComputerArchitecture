.data
	input: 		.asciiz "Please input an integer : "
	wronginput:	.asciiz "Please input an another integer numbers"
	result: 	.asciiz "Result of a: "
.text
	addi $t0, $zero, 10 	#b
	addi $t1, $zero, 5	#c
	addi $s0, $zero, 0
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
		
	beq $v0, 0, case_1
	beq $v0, 1, case_2
	beq $v0, 2, case_3
	
	li $v0, 4
	la $a0, wronginput
	syscall
	
	j exit

 case_1:
 	add $s0, $t0, $t1
 	j Result
 case_2:
 	sub $s0, $t0, $t1
 	j Result
 case_3:
  	sub $s0, $t1, $t0
 	j Result
Result:
	li $v0, 4
	la $a0, result
	syscall
	
	add $a0, $s0, $zero
	li $v0, 1
	syscall

exit: 	li $v0, 10
	syscall
	
	
	
	
	
					
	
	
