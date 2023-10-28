#CS 2640. 04
#October 28, 2023
#Vincent Perez, Cathy Ko, Guanlin Chen
#Program 1: Getting Familiar with Assembly
#Task 1: Get 2 int values from the user, held in register $s0, $s1, and return the int values to the user
#Task 2: Using the user input from the register $s0 and $s1, perform arithmetic operations
#Task 3: Check for conditons: if 2 int values are the same, output "User inputs are the same" 
#If 2 int values are different, output "User inputs are different"

.data
	input1: .asciiz "Enter first integer: "
	input2: .asciiz "Enter second integer: "
	output1: .asciiz "First Output: "
	output2: .asciiz "Second Output: "
	sum: .asciiz "The addition of the two inputs is: "
	difference: .asciiz "The subtraction of the two inputs is: "
	product: .asciiz "The multiplication of the two inputs is: "
	quotient: .asciiz "The division of the two inputs is: "
	newline: .asciiz "\n"
	sameInput: .asciiz "User inputs are the same"
	diffInput: .asciiz "User inputs are different"

.text
.globl main

# Task 1
main:
# USER INPUT
	# Prompt for first integer value
	li $v0, 4
	la $a0, input1
	syscall
	
	# Get first integer value from user
	li $v0, 5
	syscall
	move $s0, $v0   # Move the user input to $s0 register
	
	# Prompt for second integer value
	li $v0, 4
	la $a0, input2
	syscall

	# Get second integer value from user
	li $v0, 5
	syscall
	move $s1, $v0   # Move the user input to $s1 register
    
#USER OUTPUT
	# Print the first user input back to the user
	li $v0, 4
	la $a0, output1 
	syscall

	# Move the first user input to $a0 for printing
	li $v0, 1
	move $a0, $s0   
	syscall

	# Entering a new line for a cleaner look
	li $v0, 4
	la $a0, newline 
	syscall

	# Print the second user input back to the user
	li $v0, 4
	la $a0, output2 
	syscall

	# Move the second user input to $a0 for printing
	li $v0, 1
	move $a0, $s1   
	syscall

	# Entering a new line for a cleaner look
	li $v0, 4
	la $a0, newline 
	syscall
    
# Task 2

	# Perform Arithmetic Functions on the two inputs
	add $t0, $s0, $s1 
	sub $t1, $s0, $s1 
	mul $t2, $s0, $s1 
	div  $t3, $s0, $s1 

	# Move and Print the addition result
	li $v0, 4
	la $a0, sum
	syscall
  	li $v0, 1
   	move $a0, $t0
   	syscall
   	
   	# Entering a new line for a cleaner look
	li $v0, 4
	la $a0, newline 
	syscall

	# Move and Print the subtraction result
	li $v0, 4
	la $a0, difference
	syscall
	li $v0, 1
	move $a0, $t1
	syscall

	# Entering a new line for a cleaner look
	li $v0, 4
	la $a0, newline 
	syscall
    
	# Move and Print the multiplication result
	li $v0, 4
	la $a0, product
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	# Entering a new line for a cleaner look
	li $v0, 4
	la $a0, newline 
	syscall

	# Move and Print the division result
	li $v0, 4
	la $a0, quotient
	syscall
        li $v0, 1
    	move $a0, $t3
    	syscall

	# Entering a new line for a cleaner look
	li $v0, 4
    	la $a0, newline 
    	syscall
    	
# Task 3
	beq $s0, $s1, sameInputs # checks if input1 == input2, if true, sameInputs
   	bne $s0, $s1, diffInputs # checks if input1 != input2, if true, diffInputs

	# Print the appropriate message based on the condition met
	sameInputs:
    	li $v0, 4
    	la $a0, sameInput
    	syscall
    	j exit

	diffInputs:
	li $v0, 4
	la $a0, diffInput
	syscall

# Exit the program
exit:	
	li $v0, 10
	syscall
