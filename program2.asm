#Task 1: Return a Letter Grade from User Input

#Write an Assembly program that will return a letter grade given a Decimal int from the user. Include the following:
	#a user menu
	#a main label, a looping label, and an exit label
	#a way for the user to continue getting letter grades or choose to exit
	#invalid input handling (do NOT just print an error message and exit the program; 
	#re-prompt the user until a correct input is entered)

main:

li $v0, 5
syscall
move $a0, $v0

li $t0, 0
li $t1, 10

loop:
beq $t0, $t1, exit

slti $t2, $a0, 90
bne $t2, 1, exit

slti $t3, $a0, 80
bne $t3, 1, exit

slti $t4, $a0, 70
bne $t4, 1, exit

slti $t5, $a0, 60
bne $t5, 1, exit

slti $t6, $a0, 0
bne $t6, 1, exit






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
    li $t3, 1 # initialize result to 1
    
loopCounter:
        beq $t1, $zero, exit # break if y is 0
        mult $t2, $t3 # t3 = t2 * t3
        mflo $t3 # load the result from LO
        addi $t1, $t1, -1 # decrement y
        j loopCounter # continue to power loop
        
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
