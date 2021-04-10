    .data
numArray:   .word       5, 3, 12, 10, 4
size:       .word       5
outIndex:   .word       0
inIndex:    .word       0
index:      .word       0
hold:       .word       0
space:      .asciiz     " "
new_line:   .asciiz     "\n"

    .text

    .globl	main

main:

    lw		$s0, index              # Offset 1
    lw		$s1, size               # Size 1
    li      $s2, 0                  # Counter 1

for_loop_1:

    beq		$s1, $s2, end_for_1     
    lw      $t0, numArray($s0)      # Load array value
    addi    $s0, 4
    addi    $s2, 1

    li      $v0, 1                  # Print value to screen
    move    $a0, $t0
    syscall

    li      $v0, 4                  # Print spacing
    la      $a0, space
    syscall

    j       for_loop_1
    
end_for_1:

    lw		$s0, outIndex           # Offset out

    lw		$s1, size               # Size out
    addi    $s1, -1                 # Size - 1

    li      $s2, 0                  # Counter out

for_loop_out:

    lw		$s4, size               # Size in
    addi    $s4, -1
    sub     $s4, $s4, $s2

    beq		$s1, $s2, end_for_out   
    addi    $s0, 4
    addi    $s2, 1

    lw		$s3, inIndex            # Offset in

    li      $s5, 0                  # Counter in

for_loop_in:

    beq		$s4, $s5, end_for_in    # Array[index]
    lw      $t0, numArray($s3)

    addi    $s6, $s3, 4             # Array[index + 1]
    lw      $t1, numArray($s6)

    bgt		$t0, $t1, greater_than	# If $t0 > $t1

    j       other

greater_than:

    sw      $t0, hold       
    move 	$t0, $t1
    sw      $t1, numArray($s3)      # Sets array[index] to array[index + 1]

    lw      $t1, hold               
    sw      $t1, numArray($s6)      # Sets array[index + 1] to array[index]

other:

    addi    $s3, 4
    addi    $s5, 1

    j       for_loop_in

end_for_in:

    j       for_loop_out
    
end_for_out:

    li      $v0, 4                  # Print new line
    la      $a0, new_line
    syscall

    lw		$s0, index              # Offset 2
    lw		$s1, size               # Size 2
    li      $s2, 0                  # Counter 2

for_loop_2:

    beq		$s1, $s2, end_for_2     
    lw      $t0, numArray($s0)      # Load array value
    addi    $s0, 4
    addi    $s2, 1

    li      $v0, 1                  # Print value to screen
    move    $a0, $t0
    syscall

    li      $v0, 4                  # Print spacing
    la      $a0, space
    syscall

    j       for_loop_2
    
end_for_2:

    li      $v0, 4                  # Print new line
    la      $a0, new_line
    syscall
    
    li      $v0, 10
    syscall