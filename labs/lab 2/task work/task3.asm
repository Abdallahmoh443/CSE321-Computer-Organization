.data
    prompt: .asciiz "Enter a number (1-3): "
    case1: .asciiz "You selected Case 1\n"
    case2: .asciiz "You selected Case 2\n"
    case3: .asciiz "You selected Case 3\n"
    default: .asciiz "Invalid selection\n"
    newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $t1, 1
    li $t2, 2
    li $t3, 3
    
    beq $t0, $t1, case_1
    beq $t0, $t2, case_2
    beq $t0, $t3, case_3
    j default_case

case_1:
    li $v0, 4
    la $a0, case1
    syscall
    j end_switch

case_2:
    li $v0, 4
    la $a0, case2
    syscall
    j end_switch

case_3:
    li $v0, 4
    la $a0, case3
    syscall
    j end_switch

default_case:
    li $v0, 4
    la $a0, default
    syscall

end_switch:
    li $v0, 10
    syscall