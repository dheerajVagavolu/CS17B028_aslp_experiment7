.data

float1: .double 6.67
float2: .double 2.718
float3: .double 3.14
m: .double 0.0

.text
main:

l.d $f0, float1

l.d $f1, float2

l.d $f2, float3

l.d $f3, m

jal first_function



li $v0, 10
syscall

.end main

first_function:

addi $sp, $sp, -4
sw $ra, 0($sp)

mul.s $f0, $f0, $f3

jal second

add $v0, $a0, $zero

lw $ra, 0($sp)

addi $sp, $sp, 4
jr $ra


second:

addi $sp, $sp, -4
sw $ra, 0($sp)

mul.s $f4, $f0, $f0
mul.s $f5, $f4, $f0
add.s $f0, $f4, $f5

jal third

lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra


third:
addi $sp, $sp, -4
sw $ra, 0($sp)

mul.s $f6, $f0, $f0
mul.s $f6, $f6, $f0
add.s $f0, $f0, $f1 

jal fourth

lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

fourth:
addi $sp, $sp, -4
sw $ra, 0($sp)

mul.s $f0, $f0, $f0
mul.s $f0, $f0, $f0
add.s $f0, $f0, $f2


lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra
