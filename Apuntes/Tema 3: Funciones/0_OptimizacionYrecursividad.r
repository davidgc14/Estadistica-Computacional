# EJEMPLOS DE FUNCIÓN FACTORIAL
# Pruebas con distintos mecanismos

factorial.d <- function(n) {
    if (missing(n) || !is.numeric(n)) { # filtro para valores erroneos
        return(NA)
    }

    n<-as.integer(n)
    fact<-1

    if (n>1) {
        for (i in 1:n) {
            fact <- fact*i
        }
        return(fact)
    }
}


# Version factorial reucursiva
factorial.r <- function(n) {
    if (missing(n) || !is.numeric(n)) { # filtro para valores erroneos
        return(NA)
    }

    n<-as.integer(n)

    if (n>1) {
        fact <- n*factorial.r(n-1) 
    } else {
        fact <- 1
    }   

    return(fact)
} # Hay peligro de que supere la capacidad de memoria debido al consumo excesivo de memoria



# Version con un vector
factorial.v <- function(n) {
    if (missing(n) || !is.numeric(n)) { # filtro para valores erroneos
        return(NA)
    }

    n<-as.integer(n)

    if (n>1) {
        fact <- prod(1:n)
    } else {
        fact <- 1
    }   

    return(fact)
} # Malo. Al guardar el vector en la memoria se relentiza mucho el proceso


# COMPROBACIÓN DE EFICIENCIA

t1 <- Sys.time()
factorial.r(100000)
t2 <- Sys.time()

factorial.v(100000)
t3 <- Sys.time()

tiempoR <- t2 - t1
tiempoV <- t3 - t2