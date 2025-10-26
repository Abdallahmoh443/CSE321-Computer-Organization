.data
    firstNumPrompt: .asciiz "Enter the first number: "
    secondNumPrompt: .asciiz "Enter the second number: "
    thirdNumPrompt: .asciiz "Enter the third number: "
    fourthNumPrompt: .asciiz "Enter the fourth number: "
    quotient: .asciiz "The average quotient is: "
    remainder: .asciiz "The average remainder is: "
    newLine: .asciiz "\n"   


.text
main:
    j get_numbers
    j calculate_avg
    j print_results
    j exit





get_numbers:
    # Prompt for the first number
    li $v0, 4                  
    la $a0, firstNumPrompt
    syscall
    # Read the first number
    li $v0, 5                  
    syscall
    move $t0, $v0              
    # Prompt for the second number
    li $v0, 4                  
    la $a0, secondNumPrompt     
    syscall
    # Read the second number
    li $v0, 5
    syscall
    move $t1, $v0              
    # Prompt for the third number
    li $v0, 4
    la $a0, thirdNumPrompt
    syscall
    # Read the third number
    li $v0, 5
    syscall
    move $t2, $v0              
    # Prompt for the fourth number
    li $v0, 4
    la $a0, fourthNumPrompt
    syscall
    # Read the fourth number
    li $v0, 5
    syscall
    move $t3, $v0              


calculate_avg:
    # Add the four numbers
    add $t4, $t0, $t1          # $t4 = firstNum + secondNum
    add $t4, $t4, $t2          # $t4 = $t4 + thirdNum
    add $t4, $t4, $t3          # $t4 = $t4 + fourthNum
    # Calculate the average 
    li $t5, 4                   # divisor
    div $t4, $t5                # divide sum by 4
    mflo $t6                    # move quotient (average) to $t6
    mfhi $t7                    # move remainder to $t7


print_results:
    # Print the quotient prompt
    li $v0, 4                  
    la $a0, quotient
    syscall
    # Print the average quotient
    move $a0, $t6              # move average to $a0 for printing
    li $v0, 1                  
    syscall
    li $v0, 4
    la $a0, newLine
    syscall
    # Print the remainder prompt
    li $v0, 4
    la $a0, remainder
    syscall
    # Print the average remainder
    move $a0, $t7              # move remainder to $a0 for printing
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall

exit:
    # Exit program
    li $v0, 10                 
    syscall 
