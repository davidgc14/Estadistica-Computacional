#############################################
############### EJERCICIO 1 #################
#############################################

# Almacena una matriz cuadrada de dimensión 3 con coeficientes
# ordenados por columnas del 1 al 9
A<-matrix(1:9,3,3)

# Almacena un vector de dimensión 3 con coeficientes ordenados 
# del 1 al 3
x<-1:3

# En la siguiente operación se interpreta 'x' como una matriz de
# dimensión 3x1, y 'A' como una matriz de dimensión 3x3, luego se puede
# realizar el producto
A%*%x

# Por lo comentado en el apartado anterior, la linea siguiente no tiene sentido
A%*%t(x)

# Esta operación tambien devuelve error por ser x vector columna
x%*%A

# Aquí multiplicamos el vector fila x por la matriz A, siendo posible 
# realizar el producto
t(x)%*%A

# Aquí tenemos la suma de los cuadrados de los elementos del vector x.
t(x)%*%x



#############################################
############### EJERCICIO 2 #################
#############################################

# Sistema 1
solve(2,2)
# 2x = 2

# Sistema 2
A<-matrix(c(3,1,4,2),2,2)
b<-c(12,8)
solve(A,b)
#   ( 3    4 ) (x) = ( 12)
#   ( 1    2 ) (y)   ( 8 )

# Sistema 3
solve(A,diag(2))
#   ( 3    4 ) (x_11) = ( 1 )
#   ( 1    2 ) (x_21)   ( 0 )
#                                   Y devuelve la matriz   x_11  x_12
#   ( 3    4 ) (x_12) = ( 0 )                              x_21  x_22
#   ( 1    2 ) (x_22)   ( 1 )



#############################################
############### EJERCICIO 3 #################
#############################################

A <- matrix(c(10,7,8,7,7,5,6,5,8,6,10,9,7,5,9,10),4,4)
b <- c(32,23,33,31)

solve(A,b) # Solución (1 1 1 1)
solve(A,b + 0.05) # Solución (0.40 2.00 0.75 1.15)
solve(A,b - 0.1)  # Solución (-0.2  3.0  0.5  1.3)
# Vemos que una pequeña diferencia en los términos independientes puede
# repeructir significativamente en la solución del sistema.




#############################################
############### EJERCICIO 4 #################
#############################################

A <- matrix(c(10,7,8,7,7,5,6,5,8,6,10,9,7,5,9,10),4,4)
b <- c(32,23,33,31)

kappa(A) # Valor de kappa
rcond(A)

r <- eigen(A) # Valor de los autovalores y autovectores

kapAprox <- abs(r$values[1] / r$values[length(r$values)])
rcoAprox <- 1/kapAprox
# Devuelve las aproximaciones de las funciones de kappa y rcond (la funcion predeterminada)
# Aquí hemos forzado la solución exacta



#############################################
############### EJERCICIO 5 #################
#############################################

n <- 5
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n,0,0.1)

# Apartado 1
X <- matrix(c(rep(1, times=n), rep(x, times=n)), n, n+1)
B <- rep(1, times=n+1)
Y <- X %*% B

# Apartado 2
prodInv <- inverse(t(X) %*% X)

# Apartado 3
B_Gorro <- prodInv %*% t(X) %*% Y