## The objective of the functions in this R script is to implement 
## a basic cache mechanism for inverse matrix computations. The
## functions ensure that the matrix inverse computation is only done
## one time using the solve function from the stats package 
## when the cache detects no inverse instances for the requested
## matrix in the cache. The cache maintains an inverse instance data 
## for each matrix instance requested after the first time. Subsequent
## calls for inverse matrix computation return a cached data for 
## the inverse if the cache detects that candidate matrix has not 
## changed without attempting to recompute the inverse. The cache matrix
## object can retain matrix inverse instances for multiple distinct
## matrix instances. Each cacheMatrix instance encapsulates the
## its own inverse matrix data.
##
## Asumption: The candidate matrix is invertible
## 
## The makeCacheMatrix function is a constructor of an abstract representation
## of a acacheable matrix instance. The function initializes the cache
## representation and provides definition of accessor functions:
## The get() and set() functions facilitate caching of the input matrix
## instances. The getInverse() and setInverse() functions facilitate
## caching of the inverse matrix data associated with the input
## matrix instances. The internal variable invMat is initialized to NULL
## and subsequently tracks the state of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {      
        invMat <- NULL
        set <- function(y) {
                x <<- y
                invMat <<- NULL
        }
        get <- function() {x}
        setInverse <- function(z) {invMat <<- z}
        getInverse <- function() {invMat}
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)

}

## The cacheSolve function provides the actual caching mechanism. The internal
## variable invMat is shared between the two functions for managing the cache
## state for each matrix instance. If the invMat is detected as NULL for a given
## matrix (first time), the stats function solve is called to compute the
## inverse of the input matrix and sets the invMat to the computed value. 
## Subsequent calls for matrix inversion for the same matrix instance will
## detect non-null values of invMat and return the cached value without the
## need to call solve() function again.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        invMat <- x$getInverse()
        if(!is.null(invMat)) {
                message("returning cached inverse data")
                return(invMat)
        }
        data <- x$get()
        invMat <- solve(data, ...)
        x$setInverse(invMat)
        invMat
}



