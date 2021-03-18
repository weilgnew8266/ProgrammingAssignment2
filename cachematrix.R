## These functions are written for completion of Programming Assignment 2: Lexical Scoping


## This function, 'makeCacheMatrix', creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inv_m <- NULL                         ## Create inv_m as NULL to hold the inverse matrix            
    
    ## Define the set function to assign the value of the matrix in parent environment
    set <- function(y) {                  
      x <<- y                             ## Assign the new matrix value in parent environment  
      inv_m <<- NULL                      ## reset the value of inverse matrix, inv_m to NULL
    }
    
    ## Define the get function to retrieve the matrix
    get <- function() x                   
    
    ## Define the setInverse function to set the matrix value in parent environment
    setInverse <- function(inverse) inv_m <<- inservse  
                                                        
    ## Define the getInverse function to retrieve the local inverse matrix value, inv_m
    getInverse <- function() inv_m                      
    
    ## Create a list to access the functions 
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by 
## `makeCacheMatrix` above. If the inverse has already been calculated 
## (and the matrix has not changed), then `cacheSolve` should retrieve the 
## inverse from the cache.
cacheSolve <- function(x, ...) {
    inv_m <- x$getInverse()               ## Retrieve the inverse matrix from the cache
    
    ## If the inverse matrix is available, return the inverse matrix from cache 
    if(!is.null(inv_m)) {
      message("getting cached data")
      return(inv_m)
    }
    
    data <- x$get()                       ## Get the new matrix 
    inv_m <- solve(data, ...)             ## Calculate the inverse of the matrix
    x$setInverse(inv_m)                   ## Set the new value of inverse matrix
    inv_m
}
