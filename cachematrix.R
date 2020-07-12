# Basically th first function defines a list with three functions
# The list is what is returned when the function is called
# The second function calls the three function previously defined to apply solve() to the data

# datas() calls the matrix in the argument
# inverse() calls the variable that will store the matrix resulted from solve() function
# calc_inverse calls solve() and applies it to the original matrix (argument of the function)

makeCacheMatrix <- function(matriz){
    answer <- c()
    datas <- function() matriz
    inverse <- function() answer
    calc_inverse <- function(solve) answer <<- solve
    list(datas = datas, calc_inverse = calc_inverse, inverse = inverse)
}

# This function is the one which actually calculates the inverse matrix
# inverse() calls the variable that will store the matrix resulted from solve() function
# calc_inverse() calls solve() and applies it to the original matrix (argument of the function)

cacheSolve <- function(matriz){
    answer <- matriz$inverse()
    if(length(answer)!=0){
        message("Using already computed data")
        answer
    }
    datas <- matriz$datas()
    answer <- solve(datas)
    matriz$calc_inverse(answer)
    answer
}