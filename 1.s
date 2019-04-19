.data


.text
.globl main
.ent main
main:
	#address of num1


li $a1, 2
li $a2, 5


jal first_func

add $t5, $v0, $zero


li $v0, 10
syscall

.end main


first_func:


mult $a2, $a1

mflo $t1

add $v0, $t1, $zero


jr $ra