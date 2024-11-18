# Assignment 2: Classify
## `abs.s`  
This function uses the sub instruction to convert a negative integer to a positive one.  
e.g. 0 - (-5) = 5  
## `argmax.s` 
This function uses two registers to store the maximum value and its index.  
* `t0` : Stores the maximum number.
* `t1` : Stores the corresponding index.  
## `dot.s`  
To properly access the correct position in memory, the stride for both matrix0 and matrix1 is calculated.  
Afterward, the program checks whether the multiplicand is less than zero and performs the multiplication if valid.  
## `matmul.s`  
This function implements matrix multiplication by iterating over the rows and columns.  
* The outer loop count is incremented, and the memory location is updated to point to the first element of the next row in `matrix0`.  
* At the end, the function restores the data from the stack to the registers using outer_loop_end and return.  
## `relu.s`  
This function applies the ReLU (Rectified Linear Unit) activation.  
* If the number is less than zero, it stores 0 at the current memory address.  
* After the computation, it increments the counter `t1` by 1 and updates the memory address pointer by 4.
## `read_matrix.s` & `write_matrix.s` & `classify.s`  
The `mul` operation is added to each of these functions.  
All inputs to the `mul` operation are all non-negative, so we simply implement it by adding m to the zero-initialized register n times.(e.g. $m \times n$)  
## Result
![result](https://hackmd.io/_uploads/rJoLq0_fJx.png)