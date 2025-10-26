.data 
    prompt: .asciiz "Enter first number: "
    positiveResultMsg: .asciiz "The number is positive.\n"
    negativeResultMsg: .asciiz "The number is negative.\n"
    equalResultMsg: .asciiz "The number is zero.\n"

.text
main:

    # Prompt for a number
    li $v0, 4                  # syscall for print string
    la $a0, prompt
    syscall
    # Read the number
    li $v0, 5                  # syscall for read integer
    syscall
    move $t0, $v0              # store the number in $t0
    
    beq $t0 , $zero , zero_case
    blez $t0 , negative_case
    bgtz $t0 , positive_case
    
    

zero_case:
    li $v0 , 4
    la $a0 , equalResultMsg
    syscall
    j end

positive_case:
    li $v0 , 4
    la $a0 , positiveResultMsg
    syscall
    j end

negative_case: 
    li $v0 , 4
    la $a0 , negativeResultMsg
    syscall
    j end

end:
    li $v0 , 10 
    syscall
    
