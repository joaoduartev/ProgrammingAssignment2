# Basically the first function defines a list with three functions
# The list is what is returned when the function is called
# The second function calls the three function previously defined to apply solve() to the data

# dados() calls the matrix in the argument
# inversa() calls the variable that will store the matrix resulted from solve() function
# calc_inversa calls solve() and applies it to the original matrix (argument of the function)

makeCacheMatrix <- function(matriz){
    resposta <- c()
    dados <- function() matriz
    inversa <- function() resposta
    calc_inversa <- function(solve) resposta <<- solve
    list(dados = dados, calc_inversa = calc_inversa, inversa = inversa)
}

# This function is the one which actually calculates the inverse matrix
# inversa() calls the variable that will store the matrix resulted from solve() function
# calc_inversa() calls solve() and applies it to the original matrix (argument of the function)

cacheSolve <- function(matriz){
    resposta <- matriz$inversa()
    if(length(resposta)!=0){
        message("Using already computed data")
        resposta
    }
    dados <- matriz$dados()
    resposta <- solve(dados)
    matriz$calc_inversa(resposta)
    resposta
}