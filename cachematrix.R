## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This is a function do create such a invertible matrix you execute, where x is an ordinary matrix.
# And make the inverse of the matrix available in the cache environment
makeCacheMatrix <- function(x = matrix()) {
   m <- NULL                                         # Define function to set the value of the matrix. Clear the old inverse from the cache
        set <- function(y) {                         # Define function to set the value
                x <<- y                              # Assign a value to an object in an environment different from the current environment. 
                m <<- NULL                           # Clear the cache
        }
        get <- function() x                          # Define function to get the value of the matrix
        setinverse <- function(solve) m <<- solve    # Define function to set the inverse
        getinverse <- function() m                   # Define function to get the inverse   
        list(set = set, get = get,                   # Return the created functions to the working environment
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function that 

# This is a function do calculate the inverse of the matrix created in makeCacheMatrix
cacheSolve <- function(x, ...) {                     
   m <- x$getinverse()                              # Return inverted matrix from cache if it exists. Create the matrix in working environment
        if(!is.null(m)) {
                message("getting cached data")      # If the cache was empty, calculate cache and then return it
                return(m)                           # Display matrix in console
        }
        data <- x$get()                             # Get value of matrix
        m <- solve(data, ...)                       # Calculate inverse
        x$setinverse(m)                             # Set inverted matrix in cache
        m                                           # display matrix in console
        ## Return a matrix that is the inverse of 'x'
}
