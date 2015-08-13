## The following functions are associated with the Coursera R Programming course assignment 2
## Matrix inversion can be a costly computation.  Some benefit may be derived by caching the
## inverse of a matrix rather than computing it repeatedly.  The functions below cache the 
## inverse of a matrix.
##

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(matx = matrix()) {
        inv <- NULL
        set <- function(y) {
                matx <<- y
                inv <<- NULL
        }
        get <- function() matx
        setinver <- function(invmat) inv <<- invmat
        getinver <- function() inv
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinver()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinver(inv)
        inv
}
##