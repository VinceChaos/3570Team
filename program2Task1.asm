#CS 2640. 04
#November 8, 2023
#Group: Vincent Perez, Cathy Ko, Guanlin Chen
#Program 2: Practice with Conditionals and Loops

#Task 1: Return letter grade from user input

#Write an Assembly program that will return a letter grade given a Decimal int from the user. 
	#a user menu
	#a main label, a looping label, and an exit label
	#a way for the user to continue getting letter grades or choose to exit
	#invalid input handling (do NOT just print an error message and exit the program; 
	#re-prompt the user until a correct input is entered)

.data
    menuSelection: .asciiz "\n ------------ MAIN MENU --------------\n \n (1) Get Letter Grade \n (2) Exit Program \n\n Enter '1' or '2' for your selection: "
    enterDecimalScore: .asciiz "\n\n Please enter a score as an integer value: "
    enterNewScore: .asciiz "\n\n Would you like to enter a new score? \n (Y)Yes   (N)No \n\n Enter 'Y' or 'N' for your selection: "
    exitMenu: .asciiz "\n\n The program will now exit. "
    invalidScore: .asciiz "\n\n Invalid Score! Please enter a decimal score between 0 and 100. \n\n"
    invalidInput: .asciiz "\n\n Invalid input. Please enter either 'Y' for Yes or 'N' for No. \n\n"
    extraScore: .asciiz "\n Extra credit! \n\n"
    A_grade: .asciiz "\n\n Letter Grade: A"
    B_grade: .asciiz "\n\n Letter Grade: B"
    C_grade: .asciiz "\n\n Letter Grade: C"
    D_grade: .asciiz "\n\n Letter Grade: D"
    F_grade: .asciiz "\n\n Letter Grade: F"
.text
.globl main

main:
	
    li $v0, 4 # syscall to print string
    la $a0, menuSelection
    syscall

    li $v0, 5 # syscall to print string
    syscall

    move $t0, $v0 # move the input into $t0

    beq $t0, 1, getLetterGrade # if user chose 1, go to getLetterGrade
    beq $t0, 2, exit # if user chose 2, go to exit

    j main_loop # otherwise, jump back to main_loop

getLetterGrade:
    li $v0, 4 # syscall to print string
    la $a0, enterDecimalScore
    syscall

    li $v0, 5 # syscall for read int
    syscall

    move $t1, $v0 # move the input into $t1

    blt $t1, 0, invalid_score # if the score is less than 0, invalid
    bgt $t1, 100, extra_credit # if the score is greater than 100, extra credit

    bge $t1, 90, print_A_grade # if the score is greater than or equal to 90, it's an A
    bge $t1, 80, print_B_grade # if the score is greater than or equal to 80, it's a B
    bge $t1, 70, print_C_grade # if the score is greater than or equal to 70, it's a C
    bge $t1, 60, print_D_grade # if the score is greater than or equal to 60, it's a D

    # If the score is less than 60, F grade
    print_F_grade:
        li $v0, 4 # syscall to print string
        la $a0, F_grade
        syscall
        j new_score
        j main_loop # jump back to main_loop

    print_D_grade:
        li $v0, 4 # syscall to print string
        la $a0, D_grade
        syscall
        j new_score
        j main_loop # jump back to main_loop

    print_C_grade:
        li $v0, 4 # syscall to print string
        la $a0, C_grade
        syscall
        j new_score
        j main_loop # jump back to main_loop

    print_B_grade:
        li $v0, 4 # syscall to print string
        la $a0, B_grade
        syscall
        j new_score
        j main_loop # jump back to main_loop

    print_A_grade:
        li $v0, 4 # syscall to print string
        la $a0, A_grade
        syscall
        j new_score
        j main_loop # jump back to main_loop
        
new_score:
    #prompt the user if they want to continue with a new score
    li $v0, 4
    la $a0, enterNewScore #print the prompt
    syscall
    
    li $v0, 12 #syscall to read character
    syscall
    
    move $t1, $v0
    
    beq $t1, 'Y', getLetterGrade #if user wants to test a new score, loop through getLetterGrade
    beq $t1, 'N', exit           #if user wants to quit, exit the program
    
    #Check for invalid input of "Y' or 'N'
    bne $t1, 'Y', invalid_input
    bne $t1, 'N', invalid_input

    syscall
    j new_score
 

invalid_score:
    li $v0, 4 # syscall to print string
    la $a0, invalidScore
    syscall
    j new_score
    j main_loop # jump back to main_loop
    
invalid_input:
    li $v0, 4 # syscall to print string
    la $a0, invalidInput
    syscall
    j new_score
    j main_loop
    
extra_credit:
    li $v0, 4 # syscall to print string
    la $a0, extraScore 
    syscall
    j new_score
    j main_loop

exit:
    li $v0, 4 # syscall to print string
    la $a0, exitMenu
    syscall

    li $v0, 10 # syscall for exit
    syscall

main_loop:
    j main # jump back to main
   

   




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
