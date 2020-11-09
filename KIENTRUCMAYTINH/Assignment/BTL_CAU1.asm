.data
	num: 		.word 16
	elems: 		.word  -80,-50, 4,-2,959,12,8,10,12,456,20,-0,0,-8945,1,-9912
	space: 	 	.asciiz" "
	endline: 	.asciiz"\n"
	truoc: 		.asciiz "Truoc khi sap xep: "
	sau: 		.asciiz "Sau khi sap xep: "
	
.text
.globl main
main:
##############################################################################
	#main of the program
	la $s0, elems		# In mang truoc khi chay quick Sort		   
    	li $v0, 4
   	la $a0, truoc		
    	syscall
    	
    	add $a0, $s0, $zero				   
    	addi $a1, $zero, 0			    
    	lw $a2, num				    
    	jal printArray
    	
    	add $a0, $s0, $zero	# $a0 = $s0: base address
    	addi $a1, $zero, 0	# $a1 = 0
    	lw $t9, num		
    	addi $t9, $t9, -1
    	add $a2, $t9, $zero	# $a2 = number - 1
    	jal Quick_Sort		# Goi ham quick sort
    
    	li $v0, 4		# In mang sau khi chay quick Sort
    	la $a0, sau
    	syscall
    	
    	add $a0, $s0, $zero				   
    	addi $a1, $zero, 0			    
    	lw $a2, num				    
    	jal printArray
    	
    	j exit
    	
exit:
	li $v0, 10
	syscall

###############################################################################
printArray:
# Push stack & set arguments
    	addi $sp, $sp, -20
    	sw $s0, 16($sp)
    	sw $t0, 12($sp)
    	sw $t1, 8($sp)
    	sw $t2, 4($sp)
    	sw $t3, 0($sp)

    	add $s0, $a0, $zero	# $s0 = base address
    	add $t0, $a1, $zero	# $t0 = a
    	add $t1, $a2, $zero  	# $t1 = b
    
loop:
    	bge $t0, $t1, Exit	# if a >= b then jump to exit print array
    	lw $t3, 0($s0)		# $t3 = arr[a]
    	addi $s0, $s0, 4
    	
    	move $a0, $t3	    	
    	li $v0, 1		# print(arr[a])
    	syscall
    	
    	li $v0, 4		# print(" ")
    	la $a0, space		
    	syscall
    	
    	addi $t0, $t0, 1	# a = a+1
    	j loop			# jump to loop until end of the array
Exit:
    	li $v0, 4		# print("\n")
    	la $a0, endline
    	syscall

# Pop stack
    	lw $t3, 0($sp)
    	lw $t2, 4($sp)
    	lw $t1, 8($sp)
    	lw $t0, 12($sp)
    	lw $s0, 16($sp)
    	addi $sp, $sp, 20
    	
    	jr $ra
    	
#############################################################################
Quick_Sort:
# Push stack & set arguments
	addi	$sp, $sp, -24	# Adjest sp
	sw	$s0, 0($sp)	# store s0
	sw	$s1, 4($sp)	# store s1
	sw	$s2, 8($sp)	# store s2
	sw	$a1, 12($sp)	# store a1
	sw	$a2, 16($sp)	# store a2
	sw	$ra, 20($sp)	# store ra

# set $s
	add	$s0, $a1, $zero	# l = left
	add	$s1, $a2, $zero	# r = right
	add	$s2, $a1, $zero	# p = pivot = left

# while (l < r)
While:
	bge	$s0, $s1, Exit_While
	
	# while (arr[l] >= arr[p] && l < right)
	While_a:
	sll	$t0, $s0, 2	# t0 =  l * 4
	add	$t0, $t0, $a0	# t0 = arr[l]
	lw	$t0, 0($t0)

	sll	$t1, $s2, 2	# t1 =  p * 4
	add	$t1, $t1, $a0	# t1 = arr[p]
	lw	$t1, 0($t1)
	# arr[l] >= arr[p]
	blt	$t0, $t1, Exit_While_a
	# l < right
	bgt	$s0, $a2, Exit_While_a
	# l++
	addi	$s0, $s0, 1
	j	While_a
	
	Exit_While_a:

	# while (arr[r] >= arr[p] && r > left)
	While_b:
	sll	$t0, $s1, 2	# t0 =  r * 4
	add	$t0, $t0, $a0	# t0 = arr[r]
	lw	$t0, 0($t0)
	
	sll	$t1, $s2, 2	# t1 =  p * 4
	add	$t1, $t1, $a0	# t1 = arr[p]
	lw	$t1, 0($t1)
	# arr[r] <= arr[p]
	bgt	$t0, $t1, Exit_While_b
	# r > left
	ble	$s1, $a1, Exit_While_b
	# r--
	addi	$s1, $s1, -1
	j	While_b
	
	Exit_While_b:

	# if (l >= r)
	blt	$s0, $s1, SWAP
	# SWAP (arr[p], arr[r])
	sll	$t6, $s2, 2	# t6 =  p * 4
	add	$t0, $t6, $a0	# t0 = arr[p]
	
	sll	$t6, $s1, 2	# t6 =  r * 4
	add	$t1, $t6, $a0	# t1 = arr[r]
	# Swap
	lw	$t2, 0($t0)
	lw	$t3, 0($t1)
	sw	$t3, 0($t0)
	sw	$t2, 0($t1)
	
	# recursive quick(arr, left, r - 1)
	# set arguments
	add	$a2, $s1, $zero
	addi	$a2, $a2, -1	# a2 = r - 1
	jal	Quick_Sort
	# pop stack
	lw	$a1, 12($sp)	# load a1
	lw	$a2, 16($sp)	# load a2
	lw	$ra, 20($sp)	# load ra
	
	# recursive quick(arr, r + 1, right)
	# set arguments
	add	$a1, $s1, $zero
	addi	$a1, $a1, 1	# a1 = r + 1
	jal	Quick_Sort
	# pop stack
	lw	$a1, 12($sp)	# load a1
	lw	$a2, 16($sp)	# load a2
	lw	$ra, 20($sp)	# load ra
	
	# return
	lw	$s0, 0($sp)	# load s0
	lw	$s1, 4($sp)	# load s1
	lw	$s2, 8($sp)	# load s2
	addi	$sp, $sp, 24	# Adjest sp
	jr	$ra

	SWAP:
	# SWAP (arr[l], arr[r])
	sll	$t6, $s0, 2	# t6 =  l * 4
	add	$t0, $t6, $a0	# t0 = arr[l]

	sll	$t6, $s1, 2	# t6 =  r * 4
	add	$t1, $t6, $a0	# t1 = arr[r]

	lw	$t2, 0($t0)
	lw	$t3, 0($t1)
	sw	$t3, 0($t0)
	sw	$t2, 0($t1)
	
	j	While
	
Exit_While:	
# Pop stack
	lw	$s0, 0($sp)		
	lw	$s1, 4($sp)		
	lw	$s2, 8($sp)		
	addi	$sp, $sp, 24		
	
	jr	$ra
 		
	
	
	
	
	
   		
	
	

	
    	
