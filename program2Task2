#CS 2640. 04
#November 8, 2023
#Group: Vincent Perez, Cathy Ko, Guanlin Chen
#Program 2: Practice with Conditionals and Loops

#Task 2: Advanced Math: x to the power of y

#Write a program in Assembly that takes in two ints from a user. One int will be 'x' and the other will be 'y'. 
#Make sure that user will know which value is 'x' and 'y'. Find the result of 'x' to the power of 'y'. 
#Output the result to the user. 

	
.data
    xInput: .asciiz "Enter a number for 'x': "
    yInput: .asciiz "Enter a number for 'y': "
    output: .asciiz "'x' to the power of 'y' is: "
    newline: .asciiz "\n"
    
.text

.globl main

main:
    # Prompt the user to enter x
    li $v0, 4
    la $a0, xInput
    syscall

    # Get the user input for x
    li $v0, 5
    syscall
    move $t0, $v0

    # Prompt the user to enter y
    li $v0, 4
    la $a0, yInput
    syscall

    # Get the user input for y
    li $v0, 5
    syscall
    move $t1, $v0

    # Calculate x to the power of y
    move $t2, $t0 # copy x to t2
    li $t3, 1     # initialize result to 1
    
loopCounter:
        beq $t1, $zero, exit # break if y is 0
        mult $t2, $t3        # t3 = t2 * t3
        mflo $t3             # load the result from LO
        addi $t1, $t1, -1    # decrement y
        j loopCounter        # continue to power loop
        
exit:
    # Print the result message
    li $v0, 4
    la $a0, output
    syscall

    # Print the result
    li $v0, 1
    move $a0, $t3
    syscall

    # Print a newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall
