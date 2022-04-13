f <- function(x) x^2 - 5
plot(f, 0, 10)

f.prima<-function(x) 2*x
plot(f.prima, 0, 10)


#####################################
########## Ejercicio 0 ##############
#####################################

f <- function(x) x^3 - 2*x - 5
plot(f, -5, 5)
abline(h=0,col=2)

# el valor de la derivada es 0 en puntos próximos a la raíz

f.prima <- function(x) 3*x^2 - 2

# Newton-Raphson

cerca <- numeric()
cerca[1] <- 3

for (i in 1:10) {
    cerca[i+1] <- cerca[i] - f(cerca[i])/f.prima(cerca[i])
}
print(cerca)

# Ahora tomamos una raiz lejana

lejos <- numeric()
lejos[1] <- -5

for (i in 1:10) {
    lejos[i+1] <- lejos[i] - f(lejos[i])/f.prima(lejos[i])
}
print(lejos)

# Esta solución oscila y no converge


#####################################
########## Ejercicio 1 ##############
#####################################

algoritmo.NR <- function(f, f.prima, raiz, tol, maxit) {
    if (missing(tol) || !is.numeric(tol) || !is.function(f) || !is.function(f.prima) || !is.numeric(raiz) || !is.numeric(maxit)) {
        return(NA)
    }
    
    x0 <- raiz
    for (i in 1:maxit) {
        x1 <- x0 - f(x0)/f.prima(x0)
        if (abs(x1-x0) < tol) {
            if (i == maxit) {
                warning("Precisión alcanzada en la última iteración.
                        Considere aumentar iteraciones o bajar la tolerancia")

            }
            return(list(x1, abs(x1 - x0), i))
        }

        x0 <- x1
    }
    return(NA)
}


#####################################
########## Ejercicio 2 ##############
#####################################


# Comprobación de funcionamiento
f1 <- function(x) x^2 - 5
f1.prima<-function(x) 2*x
algoritmo.NR(f1, f1.prima, 3, 0.001, 20)

f2 <- function(x) x^3 - 2*x - 5
f2.prima <- function(x) 3*x^2 - 2
algoritmo.NR(f2, f2.prima, -5, 0.001, 20)
algoritmo.NR(f2, f2.prima, 4, 0.001, 20)


#####################################
########## Ejercicio 3-4 ############
#####################################


algoritmo.NR <- function(f, f.prima, raiz, tol=1e-5, maxit, dibuja=TRUE) {
    if (missing(tol) || !is.numeric(tol) || !is.function(f) || !is.function(f.prima) || !is.numeric(raiz) || !is.numeric(maxit)) {
        return(NA)
    }
    if (dibuja == TRUE) {
        plot(f, 0, 10)
        abline(h=0,col=2)
    }
    
    x0 <- raiz
    for (i in 1:maxit) {
        x1 <- x0 - f(x0)/f.prima(x0)
        if (abs(x1-x0) < tol) {
            if (i == maxit) {
                warning("Precisión alcanzada en la última iteración.
                        Considere aumentar iteraciones o bajar la tolerancia")

            }
            return(list(x1, abs(x1 - x0), i))
        }

        x0 <- x1
    }
    return(NA)
}



# RENOVACIÓN DEL ALGORITMO


#####################################
########## Ejercicio 1 ##############
#####################################
library(numDeriv)

algoritmo.NR.mod <- function(f, f.prima, raiz, tol=1e-5, maxit=20, dibuja=TRUE) {
    if (missing(f.prima)) {
        f.prima <- function(x) {
            genD(func=f, x)$D[1]

        }
    }

    if (!is.numeric(tol) ||  !is.numeric(raiz) || !is.numeric(maxit) || missing(raiz) || !is.function(f) || !is.function(f.prima)) {
        return(NA)
    }
    if (dibuja == TRUE) {
        plot(f, 0, 10)
        abline(h=0,col=2)
    }
    
    x0 <- raiz
    for (i in 1:maxit) {
        x1 <- x0 - f(x0)/f.prima(x0)
        if (abs(x1-x0) < tol) {
            if (i == maxit) {
                warning("Precisión alcanzada en la última iteración.
                        Considere aumentar iteraciones o bajar la tolerancia")

            }
            return(list(x1, abs(x1 - x0), i))
        }

        x0 <- x1
    }
    return(NA)
}


#####################################
########## Ejercicio 2 ##############
#####################################

f3 <- function(x) x^2 - 5
f3.prima <- function(x) 2*x
algoritmo.NR(f3, f3.prima, 3, 0.001, 20)
algoritmo.NR.mod(f3,, 3, 0.001, 20)