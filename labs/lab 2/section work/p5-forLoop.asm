.data

prompt: .asciiz "Enter a number : "
result: .asciiz "The sum = "
newLine: .asciiz "\n"

.text
main:

    move $t1, $zero          # Initialize sum to 0
    
    li $v0, 4                # syscall for print string
    la $a0, prompt
    syscall
    li $v0, 5                # syscall for read integer
    syscall
    move $t0, $v0            

    move $t2,$zero
    for:
        beq $t0 , $t2 , end_for
        addi $t2 , 1
        add $t1 , $t1 , $t2
        j for

    end_for:
        li $v0, 4                # syscall for print string
        la $a0, result
        syscall
        li $v0 , 1
        move $a0 , $t1
        syscall
        j exit

exit:
    li $v0, 10
    syscall