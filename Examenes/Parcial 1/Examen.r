###############################
######## Ejercicio 1 ##########
###############################


x <- seq(1, 100, by=2)


# 1.1
mx <- mean(x)
sx <- sd(x)


# 1.2
dx <- function(x) abs(x - mx) > sx

cantidad <- sum(dx(x)) # también se puede hacer sin la función


# 1.3
x <- x[-(abs(x - mx) > sx)] # no se hace así. No he podido pensarlo bien


# 1.4
m3 <- x[x %% 3 == 0]



###############################
######## Ejercicio 2 ##########
###############################


# 2.1
data(airquality, package="datasets")
aire <- airquality
str(aire)


# 2.2
lapply(lapply(aire, is.na), sum)


# 2.3
sum(sapply(lapply(aire, is.na), sum)) # cantidad a eliminar
# falta eliminar las filas. Lo he dejado para el final y no he tenido tiempo

# 2.4
aire$Month <- factor(aire$Month, labels=c("May", "Jun", "Jul", "Aug", "Sep"))


# 2.5
# medianas de las columnas Wind y Ozone Genéricas
median(aire$Wind)
median(aire$Ozone)

lapply(split(aire$Wind, aire$Month), median) # mediana del viendo por meses
lapply(split(aire$Ozone, aire$Month), median) # mediana del ozono por meses


# 2.6
aire.mayo <- subset(aire, Month == "May")



###############################
######## Ejercicio 3 ##########
###############################

# función para calcular los n primeros términos de una sucesión
proggeo <- function(a1, n=1, r) {
        if (missing(a1)||!is.numeric(a1)) { 
        stop("Debe proporcionar un argumento 'a1' numérico")
    } else if (missing(r)||!is.numeric(r)) { 
        stop("Debe proporcionar un argumento 'r' numérico")
    } else if (missing(n)||!is.numeric(n) || n<1) {
        stop("Debe proporcionar un argumento 'n' numérico positivo")
    }

    if (n == 1) {
        warning("No se calculará ninguna iteración")
    }

    v <- numeric(n)

    for (i in 1:n) {
        v[i] <- a1 * r ^ (i - 1)
    }

    # Funciones para el return
    suma1 <- sum(v)
    if (r == 1) {
        suma2 <- a1 * n
    } else {
        suma2 <- a1 * (1 - r^n) / (1 - r)
    }

    prod1 <- prod(v)
    if (r <= 0 || a1 <= 0) {
        prod2 <- NA
    } else {
        prod2 <- (sqrt((a1^2) * (r^(n-1))))^n
    }


    return(list(vector = v, suma1 = suma1, suma2 = suma2, prod1 = prod1, prod2 = prod2))
}


# Pruebas
proggeo(2,20,-0.5)
proggeo(2,20,0.5)
