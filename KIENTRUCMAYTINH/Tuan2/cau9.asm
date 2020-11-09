.data
	integerArray:	.space 40
	input:		.asciiz "Input 10 element: \n"
	space:		.asciiz " "
	print_array:	.asciiz "The array after reserve: "
.text
main:
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
	
	#store array
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
	
	#print
	li $v0, 4                
  	la $a0, print_array
  	syscall
	
	add $s2,$s2,$zero
print: 	bgt $s2, 9, exit

	li $v0, 1                
	lw $a0, 36($s1)            
	syscall

  	li $v0, 4                
  	la $a0, space
  	syscall

	addi $s2, $s2, 1
	addi $s1, $s1, -4
	j print
exit:	
	li $v0,10
	syscall
