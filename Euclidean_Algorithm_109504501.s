##
## Write Euclidean algorithm by MIPS instruction
##


#############################
#  data segment  #
#############################

    .data
inputa:	.asciiz	"Input a:"
inputb:	.asciiz	"Input b:"
output:	.asciiz "GCD(a,b):"
error:	.asciiz "a and b need > 0\n"


#############################
#  text segment  #
#############################

    .text
# INPUT
main:
    # Get input a = $s0
    li	$v0, 4
    la	$a0, inputa
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    # Get input b = $s1
    li	$v0, 4
    la	$a0, inputb
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

# CHECK IF INPUT > 0 (TODO: fill this procedure as an exercise)
L1:
    ble $s0, 0x0, Error
    ble $s1, 0x0, Error
    move $s2, $s0
    move $s3, $s1

# EUCLIDEAN ALGORITHM (TODO: fill this procedure as an exercise)
L2:
   beq $s3, 0x0, L3
   div $s2, $s3
   move $s2, $s3
   mfhi $s3
   b L2
   
# OUTPUT
L3:
    # Print output and GCD(a,b)
    li	$v0, 4
    la	$a0, output
    syscall
    li $v0, 1
    move $a0, $s2
    syscall

#EXIT
Exit:
    # Exit program
    li $v0, 10
    syscall

#ERROR
Error:
    # Print error and back to main
    li	$v0, 4
    la	$a0, error
    syscall
    b main
