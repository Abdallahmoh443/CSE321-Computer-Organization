.data
    enterPrompt: .asciiz "Enter No.of numbers (n) to get the avg : "
    enterNumber: .asciiz "Enter a number: "
    newLine: .asciiz "\n"
    quotient: .asciiz "The average quotient is: "
    remainder: .asciiz "The average remainder is: "

.text
main:
    
    # sum initialization
    move $t0, $zero

    # prompt for number of inputs
    li $v0, 4
    la $a0, enterPrompt
    syscall
    li $v0, 5
    syscall
    move $t1, $v0          # t1 = n (number of inputs)  

    move $t2, $zero        # t2 = counter i = 0
    
    for_loop:
        bge $t2, $t1,end_for
        # prompt for each number
        li $v0, 4
        la $a0, enterNumber
        syscall
        li $v0, 5
        syscall
        add $t0, $t0, $v0      # sum += number
        addi $t2, $t2, 1       # i++
        j for_loop
    end_for:
        # calculate quotient and remainder
        div $t0, $t1            # sum / n
        mflo $t3                 # quotient in t3
        mfhi $t4                 # remainder in t4

        # print quotient
        li $v0, 4
        la $a0, quotient
        syscall
        move $a0, $t3
        li $v0, 1
        syscall

        # print new line
        li $v0, 4
        la $a0, newLine
        syscall

        # print remainder
        li $v0, 4
        la $a0, remainder
        syscall
        move $a0, $t4
        li $v0, 1
        syscall

        # print new line
        li $v0, 4
        la $a0, newLine
        syscall

    # exit program
    li $v0, 10
    syscall
        
