.data 
    newLine: .asciiz "\n"

.text
main:
    li $t0, 1              # Initialize counter to 1    
    li $t1, 11             # Set the limit to 10

    while:
        beq $t0 , $t1 , end_while

        li $v0 , 1
        move $a0 , $t0
        syscall

        li $v0 , 4
        la $a0 , newLine
        syscall

        addi $t0 ,$t0,1

        j while
    
    end_while:
        j end
    
    end:
        li $v0 , 10 
        syscall
    
