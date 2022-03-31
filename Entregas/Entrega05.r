muestra <- scan()

# 25.03 18.59 47.20 80.20 187.67
# 95.94 35.07 145.38 9.52 128.14
# 136.69 180.82 49.67 33.41 4.16
# 94.87 102.25 11.04 35.14 151.15
# 17.14 81.94 20.01 125.26 7.11
# 61.36 55.59 10.80 31.88 16.39
# 45.95 4.98 23.20 8.78 30.68
# 22.65 13.19 40.62 2.78 35.41
# 8.63 17.04 8.02 126.54 2.11
# 136.93 17.39 37.73 84.53 14.22

logl <- function(theta) {
    a<-theta[1]
    b<-theta[2]
    l<-sum(log(dgamma(x=muestra,shape=a,scale=b)))

    return(-l)
}


# Establecer valores iniciales para los parámetros
b0 <- a0 <- 1
res1 <- optim(par=c(a0,b0),fn=logl)
res1$par

# Otros resultados que devuelve la lista res:
res1$par
res1$value
res1$counts
res1$convergence
res1$message
res1$hessian


# Instalamos y cargamos el paquete Rsolnp
install.packages("Rsolnp")
library(Rsolnp)

# Aplicamos la optimización mediante solnp del paquete Rsolnp
res2 <- solnp(pars=c(a0,b0), fun=logl, LB=c(0,0))
# dicha lista tiene más parametros que la función optim

# Método alternativo con la función Gamma, alterando valores iniciales
xMed <- mean(muestra)
a1 <- var(muestra)/xMed
b1 <- xMed/a1
res3 <- solnp(pars=c(a1,b1), fun=logl, LB=c(0,0))


# Instalamos y cargamos el paquete maxLik 
install.packages("maxLik")
library(maxLik)

logl2 <- function(theta){ # Modificamos la función para que busque el máximo
    -logl(theta)
}

res4 <- maxLik(logl2, start=c(1,1))
res4$estimate

# Cambiamos los valores de entrada
res5 <- maxLik(logl2, start=c(a1,b1))
res5$estimate


# Implementamos restricción de Ax + B > 0
A <- matrix(c(1,0,0,1),2)
B <- c(0,0)
maxLik(logl2, start=c(1,1), constraints=list(ineqA=A, ineqB=B))


# Resolución de ecuaciones normales
f<-function(a) {
    log(a) - digamma(a) - log(mean(muestra)) + mean(log(muestra))
}
res6 <- uniroot(f,c(0.1,100))


###########################################
############## PARTE 2 ####################
###########################################

# Creación de funciones estadísticas elementales

# Función media

medias <- function(x) {
    x[is.na(x)] <- 0
    long <- length(x)
    if (long == 0) {
        return(list(0,0,0))
    } else {
        arit <- sum(x)/long
        geom <- sign(prod(x)) * prod(abs(x)) ^ (1/long)
        # arm
        if ((x != 0) != rep(TRUE, times=long)) { # if (min(x) <= 0)
            arm <- 0
        } else {
            arm <- long/sum(1/x)
        }
        return(list(arit,geom,arm))
    }
}


# Función mediana

mediana <- function(x) {
    x <- sort(x)
    long <- length(x)
    if (long%%2 == 0) {
        return(mean(c(x[long/2], x[(long/2) + 1])))
    } else {
        return(x[(long/2) + (1/2)])
    }
}

# Función cuantiles