    .data
num1:   .word   0
num2:   .word   0
max:    .word   0
msg:    .asciiz     "Enter an integer"
msg2:   .asciiz     "The bigger value is"

    .text

    .globl	main

main:

    li  $v0, 4          # Print msg to screen
    la  $a0, msg
    syscall

    li  $v0, 5          # Prompt user for num1
    syscall
    sw  $v0, num1

    li  $v0, 4          # Print msg to screen
    la  $a0, msg
    syscall

    li  $v0, 5          # Prompt user for num2
    syscall
    sw  $v0, num2

    lw  $s0, num1       # Load num1 and num2 into registers
    lw  $s1, num2

    bgt     $s0, $s1, L1    # If num1 > num2, jump to L1
    
    lw  $t0, num2           # Set max to num2
    sw  $t0, max
    j   L2

L1: 
    lw  $t0, num1       # Set max to num1
    sw  $t0, max

L2: 
    li  $v0, 4          # Print msg2 to screen
    la  $a0, msg2
    syscall

    lw  $t0, max        

    li      $v0, 1      # Print max to screen
    move    $a0, $t0
    syscall
    
    li  $v0, 10         # End the program
    syscall
