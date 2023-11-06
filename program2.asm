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
