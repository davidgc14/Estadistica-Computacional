#############################
#######  Ejercicio 1  #######
#############################

x1 <- 1:5
x2 <- x1 + 1
x3 <- x2 + 1

lista <- list(x1=x1, x2=x2, x3=x3)

# 1.1
x <- runif(10)
# añadir x a la lista
# lista[[length(lista) + 1]] <- x
lista$x <- x


# 1.2
y <- rnorm(10)
lista$y <- y


# 1.3
sumaL <- lapply(lista, sum) # devuelve una lista
sumaS <- sapply(lista, sum) # devuelve un vector


# 1.4
reg<-lm(y~x)
class(reg)
typeof(reg)
summary(reg) # información del modelo de regresión