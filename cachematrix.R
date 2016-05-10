## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function that returns a list of functions
## Its puspose is to store a martix and a cached value of the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
## holds the cached value or NULL if nothing is cached
## initially nothing is cached so set it to NULL
    inv <- NULL
## store a matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
## returns the stored matrix
    get <- function() x
   setinverse <- function(inverse) 
## cache the given argument
    inv <<- inverse
## get the cached value
    getinverse <- function() inv
## return a list. Each named element of the list is a function
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



##The following function calculates the inverse of a "special" matrix created with makeCacheMatrix
cacheSolve <- function(x, ...) {
## get the cached value
    inv <- x$getinverse()
## if a cached value exists return it
    if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)
    }
## otherwise get the matrix, caclulate the inverse and store it in the cache
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
## return the inverse
    inv
}
        

