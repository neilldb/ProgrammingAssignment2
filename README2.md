# Cache Matrix Inverse

Here's a brief outline to describe how to run the script:

1. Call makeCacheMatrix() and assign it to the desired function name [i.e., matr <- makeCacheMatrix()].  This code will create the four required functions to set and get the matrix and set and get its inverse.
1. An invertable matrix must be available, such as: matrix1 <- matrix(c(1,3,0,0,1,2,0,0,0,0,2,1,0,0,5,2),4,4)
1. This matrix must then be stored in the cached location with the following: matr$set(matrix1)
1. The matrix can be recovered with a call to: matr$get()
1. To solve for the inverse, call cachesolve() with the matrix function name as argument: cacheSolve(matr)
1. A repeat call to cachesolve() will access the cached copy (and print a message)
1. The inverse is cleared from matr when matr$set(anymatrix) is executed
