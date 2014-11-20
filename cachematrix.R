## These are used to stored a Matrix and in ts inverse
## Used to save time

## Used to store a Matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
   # inverse is null, in case getinverse before it is stored.
    In <- NULL
    # stores Matrix - resets Inverse as a new matrix.
    set <- function(y) {
        M <<- y
        In <<- NULL 
    }
    # gets Matrix
    get <- function() M
    setinverse <- function(Inverse) In <<- Inverse
    getinverse <- function() In
    # returns functions to get Matrix and its Inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Will take the cach in x, which holds the Matrix and returns its inverse (either stored or calculated)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## Get stored invers, if present
    Inv <- x$getinverse()
    if(!is.null(Inv)) {
        message("getting cached data")
        return(Inv)
    }
    ## otherwise clculte inverse
    Matrix1 <- x$get()
    Inv <- Solve(Matrix1, ...)
    x$setinverse(Inv)
    Inv
}
