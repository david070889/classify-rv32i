.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate  
    blt a3, t0, error_terminate   
    blt a4, t0, error_terminate  

    li t0, 0            
    li t1, 0
    li t2, 0

stride1:
    addi t2, t2, 4
    addi a3, a3, -1
    bne a3, zero, stride1
    add a3, a3, t2
    li t2, 0

stride2:
    addi t2, t2, 4
    addi a4, a4, -1
    bne a4, zero, stride2
    add a4, a4, t2
    li t2, 0

    
loop_start:
    bge t1, a2, loop_end
    # TODO: Add your own implementation
    lw t2, 0(a0)
    lw t3, 0(a1)
    addi t1, t1, 1
    add a0, a0, a3
    add a1, a1, a4
    j mul


mul:
    beq t3, zero, loop_start
    beq t2, zero, loop_start
    blt t2, zero, neg_num
    add t0, t0, t3 
    addi t2, t2, -1
    j mul

neg_num:
    beq t2, zero, loop_start
    sub t0, t0, t3 
    addi t2, t2, 1
    j neg_num

loop_end:
    mv a0, t0
    jr ra

error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
