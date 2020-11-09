.data
	array: .word 0,4,5,7,1234,468,2,-56,-8,-9
	input: .asciiz "Please input k: "
	wrong_input: .asciiz "Please input again: "
.text
main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	
	la $s0, array 		#base address
	move $s1, $v0		#value k
	
	move $a0, $s0
	move $a1, $s1
	jal swap
	
	j exit
	
swap:
	addi $sp, $sp, -20
	sw $s2, 16($sp)
    	sw $s1, 12($sp)
    	sw $t0, 8($sp)
    	sw $t1, 4($sp)
    	sw $t2, 0($sp)

    	move $t0, $a0		# $t0 = data
    	move $t1, $a1
    	addi $t2, $t1, 1   	# $t1 = a
    				#t2 = a+1
    
    	sll $t1, $t1, 2		# $t1 = t1 * 4
    	add $t1, $t0, $t1	# $t1 = data + t1 * 4
    	lw $s1, 0($t1)		# $s1 = data[a]
    
 
    	sll $t2, $t2, 2		# $t2 = t2 * 4
    	add $t2, $t0, $t2	# $t2 = data + t2 * 4
    	lw $s2, 0($t2)		# $s2 = data[b]
    
    	sw $s2, 0($t1)		# data[a] = $s2
    	sw $s1, 0($t2)		# data[b] = $s1
    
    # Phuc hoi cac thanh ghi sau khi goi ham
    	lw $t2, 0($sp)
    	lw $t1, 4($sp)
    	lw $t0, 8($sp)
    	lw $s1, 12($sp)
	sw $s2, 16($sp)
	
    	addi $sp, $sp, 20
    	jr $ra

exit:
	li $v0, 10
	syscall