### makeCacheMatrix produces an individual matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
  x <<- y
  j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}
##The function cacheSolve produces the inverse of the individual matrix that the prior makeCacheMatrix function returned.
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){
  message("getting cached data")
  return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}