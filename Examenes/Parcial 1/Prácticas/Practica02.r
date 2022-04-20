# Ejercicio propuesto

n <- 3
v <- 1:n
A <- matrix(data = c(v,v^2,v^3), nrow = n, ncol = n)
A <- matrix(rep(v, times=n)^rep(1:n, each=n, times=1), nrow = n, ncol = n)

b <- A %*% rep(1, times=n) 

x <- solve(A, b)

sistemaN <- function(n) {
    if (missing(n) || !is.numeric(n) || n < 1) {
        stop("n debe ser un entero positivo")
    }

    v <- 1:n

    A <- matrix(rep(v, times=n)^rep(1:n, each=n, times=1), nrow = n, ncol = n)
    b <- A %*% rep(1, times=n)

    x <- solve(A, b)
    # print(A)
    # print(b)
    maximo <- max(abs(x - 1))
    print("Máxima diferencia con la solución teórica: " ); print(maximo)
    return(x)
}

rcond(A) # para estudiar el mal condicionamiento
