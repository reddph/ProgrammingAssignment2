source("cacheMatrix.R")

# The following is code to generate three cases of invertible matrices for unit testing of cachematrix.R
#
# Create multiple instances of invertible matrices for unit testing of cachematrix.R functions
# Courtesy to the following web publication to create large invertible matrix for testing the assignment code:
# Ref: https://matthewhr.wordpress.com/2013/09/01/how-to-construct-an-invertible-matrix-just-choose-large-diagonals/

# Test case 1: Use cacheMatrix.R functions to perform inverse of matrix[10,10]
# Test case 2: Use cacheMatrix.R functions to perform inverse of matrix[100,100]
# Test case 2: Use cacheMatrix.R functions to perform inverse of matrix[25,25]

mat1 <- matrix(rep(1,100),nrow=10,ncol=10)
for (i in 1:10) {
        for (j in 1:10) {
                if(i == j) {
                        mat1[i,j] <- i
                }
        }
}

# Test case 2: matrix[100,100]
mat2 <- matrix(rep(1,10000),nrow=100,ncol=100)
for (i in 1:100) {
        for (j in 1:100) {
                if(i == j) {
                        mat2[i,j] <- i
                }
        }
}

# Test case 3: matrix[25,25]
mat3 <- matrix(rep(1,625),nrow=25,ncol=25)
for (i in 1:100) {
        for (j in 1:25) {
                if(i == j) {
                        mat3[i,j] <- i
                }
        }
}

# create cache matrix instance from mat1
cmat1 <- makeCacheMatrix(mat1)

# call cacheSolve
imat1 <- cacheSolve(cmat1)
imat1

# [,1] [,2] [,3]       [,4]  [,5] [,6]       [,7]       [,8]   [,9]      [,10]
# [1,]  3.8289683   -1 -0.5 -0.3333333 -0.25 -0.2 -0.1666667 -0.1428571 -0.125 -0.1111111
# [2,] -1.0000000    1  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [3,] -0.5000000    0  0.5  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [4,] -0.3333333    0  0.0  0.3333333  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [5,] -0.2500000    0  0.0  0.0000000  0.25  0.0  0.0000000  0.0000000  0.000  0.0000000
# [6,] -0.2000000    0  0.0  0.0000000  0.00  0.2  0.0000000  0.0000000  0.000  0.0000000
# [7,] -0.1666667    0  0.0  0.0000000  0.00  0.0  0.1666667  0.0000000  0.000  0.0000000
# [8,] -0.1428571    0  0.0  0.0000000  0.00  0.0  0.0000000  0.1428571  0.000  0.0000000
# [9,] -0.1250000    0  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.125  0.0000000
# [10,] -0.1111111    0  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.1111111

imat1 <- cacheSolve(cmat1)
# Test result is as follows:

# returning cached inverse data

## Compare the inverse matrix with the direct call solve()
rimat1 <- solve(mat1)
# [,1] [,2] [,3]       [,4]  [,5] [,6]       [,7]       [,8]   [,9]      [,10]
# [1,]  3.8289683   -1 -0.5 -0.3333333 -0.25 -0.2 -0.1666667 -0.1428571 -0.125 -0.1111111
# [2,] -1.0000000    1  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [3,] -0.5000000    0  0.5  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [4,] -0.3333333    0  0.0  0.3333333  0.00  0.0  0.0000000  0.0000000  0.000  0.0000000
# [5,] -0.2500000    0  0.0  0.0000000  0.25  0.0  0.0000000  0.0000000  0.000  0.0000000
# [6,] -0.2000000    0  0.0  0.0000000  0.00  0.2  0.0000000  0.0000000  0.000  0.0000000
# [7,] -0.1666667    0  0.0  0.0000000  0.00  0.0  0.1666667  0.0000000  0.000  0.0000000
# [8,] -0.1428571    0  0.0  0.0000000  0.00  0.0  0.0000000  0.1428571  0.000  0.0000000
# [9,] -0.1250000    0  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.125  0.0000000
# [10,] -0.1111111    0  0.0  0.0000000  0.00  0.0  0.0000000  0.0000000  0.000  0.1111111

## compare the two outputs to make sure the cached result is identical to the non-cached
imat1 == rimat1

## boolean comparison output (should be all TRUE)

# [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
# [1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [3,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [4,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [5,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [6,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [7,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [8,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [9,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
#[10,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 
cmat2 <- makeCacheMatrix(mat2)
imat2 <- cacheSolve(cmat2)

imat2 <- cacheSolve(cmat2)
# Test result is as follows:

# returning cached inverse data
 
cmat3 <- makeCacheMatrix(mat3)
imat3 <- cacheSolve(cmat3)

imat3 <- cacheSolve(cmat3)
# Test result is as follows:

# returning cached inverse data

imat1 <- cacheSolve(cmat1)
# Test result is as follows:

# returning cached inverse data

