#############################################
############### EJERCICIO 1 #################
#############################################

x1 <- c(1:5)
x2 <- x1 + 1
x3 <- x2 + 1

lista <- list(x1,x2,x3)

# Apartado a)
x <- runif(10)
lista[[length(lista)+1]] <- x

# Apartado b)
y <- rnorm(10)
lista[[length(lista)+1]] <- y

# Apartado c)
lapply(lista, sum) # devuelve una lista
sapply(lista, sum) # devuelve un vector numérico

# Apartado d)
reg <- lm(y~x)
typeof(reg) # devuelve el tipo de dato (lista)
is.list(reg)

# Apartado e)
lapply(lista, typeof)

# Apartado f)
M <- matrix(data = c(reg$residuals, reg$fitted.values, x, y),length(x), 4, dimnames = list(c('Residuals', 'Fitted Values', 'x', 'y')))
# ERROR
# habría que haber usado la función "cbind"



#############################################
############### EJERCICIO 2 #################
#############################################

xi <- c(1.2, 1.8, 2.2, 2.5, 1.1)
yi <- c(15, 18, 10, 12, 16)
ni <- c(12, 23, 5, 9, 11)

df <- data.frame(xi, yi, ni)

# Apartado a)
n <- sum(df$ni)

# Apartado b)
xMed <- (1/n) * sum(xi * ni)
yMed <- (1/n) * sum(yi * ni)

sx2 <- (1/(n-1)) * sum(ni * (xi - xMed)^2)
sy2 <- (1/(n-1)) * sum(ni * (yi - yMed)^2)

# Apartado c)
x <- c(rep(xi, times=ni))
y <- c(rep(yi, times=ni))
datos.n <- data.frame(x, y)

# Apartado d)
all.equal(mean(datos.n[[1]]), xMed)
all.equal(mean(datos.n[[2]]), yMed)
all.equal(var(datos.n[[1]]), sx2)
all.equal(var(datos.n[[2]]), sy2)

# Apartado e)
transform(datos.n, zx = (xi - xMed) / sx2, zy = (yi - yMed) / sy2)
