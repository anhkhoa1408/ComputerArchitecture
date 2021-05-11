.data
	num: 		.word 16
	elems: 		.word 6553,5, 4,2,-959,6,-12,-12,-12,-12,456,20,0,-8945,-90000
	space: 	 	.asciiz	" "
	endline: 	.asciiz	"\n"
	truoc: 		.asciiz "Truoc khi sap xep: "
	sau: 		.asciiz "Sau khi sap xep: "
	nhap:		.asciiz "Xin nhap vao mot so nguyen: "
	xuat:		.asciiz "Chi so cua phan tu trong mang la: "
	khongtontai:	.asciiz "Khong ton tai phan tu trong mang"
.text
.globl main
main:
################################################################################
#main of the program
	# In mang truoc khi chay insertion sort	
	la 	$s0, elems			   
    	li 	$v0, 4
   	la 	$a0, truoc		
    	syscall
    	
    	# Print array
    	add 	$a0, $s0, $zero				   
    	addi 	$a1, $zero, 0			    
    	lw 	$a2, num				    
    	jal 	printArray
    	
    	# Insertion Sort
    	add 	$a0, $s0, $zero
    	lw 	$t9, num
    	addi 	$t9, $t9, -1
    	add 	$a1, $t9, $zero		# $a1 = number - 1
    	jal 	InsertionSort		# Goi ham insertion sort
    	
    	# Print array
    	la 	$s0, elems			   
    	li 	$v0, 4
   	la 	$a0, sau		
    	syscall
    	
    	add 	$a0, $s0, $zero					   
    	addi 	$a1, $zero, 0			    
    	lw 	$a2, num				    
    	jal 	printArray
    	
    	# Binary Search
    	li	$v0, 4			
    	la	$a0, nhap
    	syscall
    	li	$v0, 5
    	syscall
    	add	$t9, $v0, 0
    	add	$a3, $v0, $zero
    	add 	$a0, $s0, $zero
    	add	$a1, $zero, $zero
    	lw	$a2, num
    	jal	binarySearch

    	# Hien thong bao khong tim thay khi v0 = flag character = 'A'
    	beq	$v0, 'A', Not_Found_Message
    	
    	li	$v0, 4
    	la	$a0, xuat
    	syscall
    	
    	add	$a3, $v1, $zero
    	add 	$a0, $s0, $zero		#base
    	lw	$a1, num		#number of element
    	add	$a2, $t9, $zero		#find element
    	jal	findAtIndex
    	
    	li $v0, 10
    	syscall
    	
##########################################################################    	
printArray:
# Push stack & set arguments
    	addi 	$sp, $sp, -20
    	sw 	$s0, 16($sp)
    	sw 	$t0, 12($sp)
    	sw 	$t1, 8($sp)
    	sw 	$t2, 4($sp)
    	sw 	$t3, 0($sp)

    	add	$s0, $a0, $zero	# $s0 = data
    	add 	$t0, $a1, $zero	# $t0 = a
    	add 	$t1, $a2, $zero # $t1 = b
    
loop:
    	bge 	$t0, $t1, Exit	# if a >= b then jump to exit print array
    	lw 	$t3, 0($s0)	# $t3 = data[a]
    	addi 	$s0, $s0, 4
    	
    	move 	$a0, $t3	    	
    	li 	$v0, 1		# print(data[a])
    	syscall
    	
    	li 	$v0, 4		# print(" ")
    	la 	$a0, space		
    	syscall
    	
    	addi 	$t0, $t0, 1	# a = a+1
    	j 	loop		# jump to loop until end of the array
Exit:
    	li 	$v0, 4		# print("\n")
    	la 	$a0, endline
    	syscall

# Pop stack
    	lw 	$t3, 0($sp)
    	lw 	$t2, 4($sp)
    	lw 	$t1, 8($sp)
    	lw 	$t0, 12($sp)
    	lw 	$s0, 16($sp)
    	addi 	$sp, $sp, 20
    	
    	jr 	$ra
#############################################################    	
InsertionSort:
# Push stack & set arguments
	addi	$sp, $sp, -20		# Adjest sp
	sw	$s0, 0($sp)		# store s0
	sw	$s1, 4($sp)		# store s1
	sw	$a0, 8($sp)		# store a1
	sw	$a1, 12($sp)		# store a2
	sw	$ra, 16($sp)		# store ra
	
	add	$s0, $a0, $zero		# Base address of array
	add	$s1, $a1, $zero		# Number of element
	
	addi 	$t0, $zero, 1		#i
	addi	$t1, $zero, 0		#key
	addi 	$t2, $zero, 0		#j
	addi	$t3, $zero, 0		
	
For_loop:
	bgt 	$t0, $s1, Endfor	#
	addi 	$t2, $t0, -1		#j=i-1
	sll 	$t4, $t0, 2		#i=i*4
	add 	$t4, $s0, $t4		#arr[i] = base + i*4
	lw 	$t5, 0($t4)		#arr[i] = $t5

	While_Loop:
	blt	$t2, 0, End_While	#j<0 -> EndWhile
	sll 	$t6, $t2, 2		#j*4
	add	$t6, $s0, $t6		#arr[j] = base + j*4
	lw	$t7, 0($t6)		#arr[j] = $t7
	blt	$t7, $t5, End_While	#arr[j] < key = arr[i] -> endwhile
	sw	$t7, 4($t6)		#arr[j+1]=arr[j]
	addi	$t2, $t2, -1		#j=j-1
	j 	While_Loop
	
	
	
	End_While:
	sll 	$t6, $t2, 2		#j=j*4
	add	$t6, $s0, $t6		#arr[j] = base + j*4
	sw	$t5, 4($t6)		
	addi 	$t0, $t0, 1
	j 	For_loop

Endfor:
# Pop stack				
	lw	$s0, 0($sp)		# load s0
	lw	$s1, 4($sp)		# load s1
	lw	$a0, 8($sp)		# load a1
	lw	$a1, 12($sp)		# load a2
	lw	$ra, 16($sp)		# load ra
	addi	$sp, $sp, 20
	
	jr	$ra
	
##################################################
binarySearch:
# Push stack & set arguments
  	addi 	$sp, $sp, -4            	# Lower stack pointer
  	sw 	$ra, 0($sp)               	# Store return address
  	blt 	$a2, $a1, binaryFailed   	# If r < l then we failed

  	add 	$t0, $a1, $zero             	# Move left into t0
  	add 	$t1, $a2, $a1            	# Right + Left
  	srl 	$t0, $t1, 1              	# (Right + Left) / 2
  	sll 	$t1, $t0, 2              	# Convert index into word format
	add 	$t1, $t1, $a0            	# Add offset into array
  	lw 	$t1, 0($t1)               	# Load array element into memory
  	beq 	$t1, $a3, binaryFound    	# The element was found
  	bgt 	$t1, $a3, binaryGreater  	# The element is greater than the pointer
  	addi 	$a1, $t0, 1             	# Set left to mid+1

  	j 	binarySearch             	# Search with new variable
  	j 	binaryEnd

binaryFound:
  	add 	$v1, $t0, $0             	# Move mid answer into memory
  	j 	binaryEnd                  	# End

binaryGreater:
  	addi 	$a2, $t0, -1            	# Set right to mid-1
  	jal 	binarySearch            	# Search with new right
  	j 	binaryEnd

binaryFailed:
  	addi 	$v0, $zero, 'A'
  	j 	binaryEnd                  	# Load end

binaryEnd:
# Pop stack
  	lw 	$ra, 0($sp)               	# Load the return
  	addi 	$sp, $sp, 4             	
  	jr 	$ra                       	# Return
  	
  	
#####################################################
findAtIndex:
# Push stack & set arguments
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	addi	$t1, $zero, 0		# loop counter i = 0
	addi	$t2, $a3, 0		# loop counter j = m
	addi	$t3, $a0, 0
	addi	$t4, $a0, 0
	
	sll	$t7, $a3, 2		# $a3 = index m found after binary search
	add	$t7, $t7, $a0		# $t7 = arr[m]
loop1:
	bge	$t1, $a3, loop2
	addi	$t1, $t1, 1
	lw	$t5, 0($t3)
	addi	$t3, $t3, 4
	beq	$t5, $a2, printIndex1
	j 	loop1
	
loop2:
	bge	$t2, $a1, Exit_findAtIndex
	addi	$t2, $t2, 1
	lw	$t8, 0($t7)
	addi	$t7, $t7, 4
	beq	$t8, $a2, printIndex2
	j 	loop2
	
printIndex1:
	li	$v0, 4
	la	$a0, space
	syscall
	
	addi	$t6, $t1, -1
	add	$a0, $t6, $zero
	li	$v0, 1
	syscall
	
	j 	loop1

printIndex2:
	li	$v0, 4
	la	$a0, space
	syscall
	
	addi	$s6, $t2, -1
	add	$a0, $s6, $zero
	li	$v0, 1
	syscall
	
	j 	loop2

Exit_findAtIndex:
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr 	$ra
	
#####################################################
Not_Found_Message:
	li	$v0, 4
	la	$a0, khongtontai
	syscall
	
	li	$v0, 10
	syscall
