# Ejercicio propuesto practica 6

dif.eq <- function(x1,r,n) {
    if (missing(x1)||!is.numeric(x1)) { 
        stop("Debe proporcionar un argumento 'x1' numérico")
    } else if (missing(r)||!is.numeric(r)) { 
        stop("Debe proporcionar un argumento 'r' numérico")
    } else if (missing(n)||!is.numeric(n) || n<1) {
        stop("Debe proporcionar un argumento 'n' numérico positivo")
    }

    if (n == 1) {
        warning("No se ha calculado ninguna iteración")
        return(x1)
    } 

    x <- numeric(n)
    x[1] <- x1

    for (i in 2:n) {
        x[i] <- r * x[i-1] * (1 - x[i-1])
    }
    return(x)
}


# Impresión de ejemplos
v <- dif.eq(0.95,2.99,500)
plot(1:500,v)



dif.eq2 <- function(x1,r) {
    if (missing(x1)||!is.numeric(x1)) { 
        stop("Debe proporcionar un argumento 'x1' numérico")
    } else if (missing(r)||!is.numeric(r)) { 
        stop("Debe proporcionar un argumento 'r' numérico")
    } 

    x <- numeric()
    x[1] <- x1
    x[2] <- r * x[1] * (1 - x[1])

    error <- abs(x[2] - x[1])
    i <- 2

    while (error >= 0.02 || i <= 10) {
        i <- i + 1
        x[i] <- r * x[i-1] * (1 - x[i-1])
    }
    if (i > 100) stop("No se ha encontrado una convergencia")
    else if (i == 100) {
        warning("Se ha alcanzado el número máximo de iteraciones")
        return(x)
    } else {
        return(x)
    }

    return(x)
}
