.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================

argmax:
    li t6, 1
    blt a1, t6, handle_error  # If a1 (number of elements) < 1, jump to handle_error

    lw t0, 0(a0)              # Load the first value from the array into t0 as the initial max value

    li t1, 0                  # Initialize t1 as the index of the max value (starting at 0)
    li t2, 1                  # Initialize t2 as the current index for comparison (starting at 1)
    
loop_start:
    # TODO: Add your own implementation
    beq t2, a1, finish        # If t2 (current index) == a1 (total length), jump to finish
    addi a0, a0, 4            # Move to the next element in the array (increment address by 4 bytes)
    lw t3, 0(a0)              # Load the next element from the array into t3
    bgt t3, t0, Replaced      # If t3 (new value) > t0 (current max), jump to Replaced
    addi t2, t2, 1            # Increment t2 (current index) by 1
    j loop_start              # Jump back to the start of the loop

Replaced:
    mv t0, t3                 # Update t0 with t3 (new max value)
    mv t1, t2                 # Update t1 with t2 (new max index)
    addi t2, t2, 1            # Increment t2 (current index) by 1
    j loop_start              # Jump back to the start of the loop

finish:
    mv a0, t1                 # Move the index of the max value (t1) into a0
    ret                       # Return to test_argmax

handle_error:
    li a0, 36                 # Set error code 36 in a0 (indicating an error)
    j exit