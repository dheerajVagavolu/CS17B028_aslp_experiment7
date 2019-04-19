.data
    result: .asciiz "Fact(x) = "
.text
main:

    # function call
    li      $a0, 5
    jal      factorial       # jump factorial and save position to $ra
    move      $t0, $v0        # $t0 = $v0
    # show prompt
    li        $v0, 4
    la        $a0, result
    syscall
    # print the result
    li        $v0, 1        # system call #1 - print int
    move      $a0, $t0        # $a0 = $t0
    syscall                # execute
    # return 0
    li        $v0, 10        # $v0 = 10
    syscall


.text
factorial:
    # base case -- still in parent's stack segment
    # adjust stack pointer to store return address and argument
    addi    $sp, $sp, -8
    # save $s0 and $ra
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, 0, else
    addi    $v0, $zero, 1    # return 1
    j fact_return

else:
    # backup $a0
    move    $s0, $a0
    addi    $a0, $a0, -1 # x -= 1
    jal     factorial
   
    multu   $s0, $v0 
    mflo    $v0
fact_return:
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra