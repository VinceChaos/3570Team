#Task 1: Return a Letter Grade from User Input

#Write an Assembly program that will return a letter grade given a Decimal int from the user. Include the following:
	#a user menu
	#a main label, a looping label, and an exit label
	#a way for the user to continue getting letter grades or choose to exit
	#invalid input handling (do NOT just print an error message and exit the program; 
	#re-prompt the user until a correct input is entered)

.data
    # Define menu and other string data here
    mainMenu: .asciiz "\n\n\nPlease choose an option: \n 1: Get Letter Grade \n 2: Exit Program \n\n Enter '1' or '2' for your selection: "
    enterDecimalScore: .asciiz "\n\n Enter a score as an integer value: "
    exitMenu: .asciiz "\n\n Exiting..."
    invalidScore: .asciiz "\n\n Invalid input! Please enter a decimal score between 0 and 100. \n\n"
    A_grade: .asciiz "\n\n Letter Grade: A"
    B_grade: .asciiz "\n\n Letter Grade: B"
    C_grade: .asciiz "\n\n Letter Grade: C"
    D_grade: .asciiz "\n\n Letter Grade: D"
    F_grade: .asciiz "\n\n Letter Grade: F"
.text
.globl main

main:
    li $v0, 4 # syscall for print string
    la $a0, mainMenu
    syscall

    li $v0, 5 # syscall for read int
    syscall

    move $t0, $v0 # move the input into $t0

    beq $t0, 1, getLetterGrade # if user chose 1, go to getLetterGrade
    beq $t0, 2, exit # if user chose 2, go to exit

    j main_loop # otherwise, jump back to main_loop

getLetterGrade:
    li $v0, 4 # syscall for print string
    la $a0, enterDecimalScore
    syscall

    li $v0, 5 # syscall for read int
    syscall

    move $t1, $v0 # move the input into $t1

    blt $t1, 0, invalid_score # if the score is less than 0, it's invalid
        bgt $t1, 100, invalid_score # if the score is greater than 100, it's invalid

    bge $t1, 90, print_A_grade # if the score is greater than or equal to 90, it's an A
    bge $t1, 80, print_B_grade # if the score is greater than or equal to 80, it's a B
    bge $t1, 70, print_C_grade # if the score is greater than or equal to 70, it's a C
    bge $t1, 60, print_D_grade # if the score is greater than or equal to 60, it's a D

    # If the score is less than 60, it's an F
    print_F_grade:
        li $v0, 4 # syscall for print string
        la $a0, F_grade
        syscall
        j main_loop # jump back to main_loop

    print_D_grade:
        li $v0, 4 # syscall for print string
        la $a0, D_grade
        syscall
        j main_loop # jump back to main_loop

    print_C_grade:
        li $v0, 4 # syscall for print string
        la $a0, C_grade
        syscall
        j main_loop # jump back to main_loop

    print_B_grade:
        li $v0, 4 # syscall for print string
        la $a0, B_grade
        syscall
        j main_loop # jump back to main_loop

    print_A_grade:
        li $v0, 4 # syscall for print string
        la $a0, A_grade
        syscall
        j main_loop # jump back to main_loop

invalid_score:
    li $v0, 4 # syscall for print string
    la $a0, invalidScore
    syscall
    j main_loop # jump back to main_loop

exit:
    li $v0, 4 # syscall for print string
    la $a0, exitMenu
    syscall

    li $v0, 10 # syscall for exit
    syscall

main_loop:
    j main # jump back to main
   





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
