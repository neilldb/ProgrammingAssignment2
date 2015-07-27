## The following functions are associated with the Coursera R Programming course assignment 2
## Matrix inversion can be a costly computation.  Some benefit may be derived by caching the
## inverse of a matrix rather than computing it repeatedly.  The functions below cache the 
## inverse of a matrix.


## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinver <- function(solve) m <<- solve
        getinver <- function() m
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinver()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinver(m)
        m
}
