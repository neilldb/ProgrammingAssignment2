## The following functions are associated with the Coursera R Programming course assignment 2
##
## Matrix inversion can be a costly computation.  Some benefit may be derived by caching the
## inverse of a matrix rather than computing it repeatedly.  The functions below cache the 
## inverse of a matrix.
##
##
## This function creates a special "matrix" object that can cache its inverse
##
makeCacheMatrix <- function(matx = matrix()) {
## Clear the inverse matrix in case it was set previously
##
        inv <- NULL
## The first function "$set" allows the invertible matrix to be cached for retrieval and clears 
## any previously cached inverted matrix
##
        set <- function(y) {
                matx <<- y
                inv <<- NULL
        }
## The second function "$get" returns the cached matrix
##
        get <- function() matx
## The third function $setinver is used by the function cacheSolve to cache the inverse matrix
##
        setinver <- function(invmat) inv <<- invmat
## The fourth function $getinver returns the cached inverse matrix
##
        getinver <- function() inv
## The list of functions is returned
##
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)
}

## This function computes the inverse of a cached matrix, or retrieves the cached inverse if
## previously computed. The argument "x" is the name of functions created by makeCacheMatrix
##
cacheSolve <- function(x, ...) {
## Retrieve the cached inverse matrix, or a null object if not previously computed
##
        inv <- x$getinver()
## Test if inverse previously computed, and if so, return the inverse 
##
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
## Compute, cache and return the inverse if not previously computed and cached
##
        data <- x$get()
        inv <- solve(data)
        x$setinver(inv)
        inv
}
##