.data
	integerArray: 	.word 12, 45, 54, 87, 123, 456, 29, 8, 7, 1
	input: 		.asciiz "Please input an integer number that is greater than 0 and less than 10: "
	output:		.asciiz "\nValue of element at index: "
.text
main:
	#Initial base address
	la $s0, integerArray
	
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall
	 
	add $t0, $v0,$zero 	#index
	add $t1, $t1, $zero 	#loop count variable
	
loop:	
	slt $t9 , $t1, $t0
	beq $t9, $zero, exit
	add $s0,$s0,4
	lw $t2 ,0($s0)
	addi $t1,$t1,1			
	j loop				
exit:
	li $v0,4
	la $a0,output
	syscall
	
	add $a0,$t2,$zero
	li $v0,1
	syscall
	
	li $v0,10
	syscall	