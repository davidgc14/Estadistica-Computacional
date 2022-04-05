# FAMILIA LAPPLY

lista <- list(  v1=1:10, # vector numerico
                v2=factor(), # vector tipo factor. Como no hemos puesto los niveles, tiene 0 niveles
                v3=letters[1:4]) # vector de las 4 letras del abecedario

# devuelve 3 componentes, uno para dada vector de la lista
lapply(lista, length)


df <- data.frame(matrix(1:6,2,3))

lapply(df, mean) # devuelve un vector con el promedio de cada columna
rowSums(df) # devuelve un vector con la suma de cada fila
# aunque sea funcion para matrices, tambien sirve para los data frames




# FAMILIA SAPPLY
# lapply pero con salida simplificada
sapply(lista, length, simplify=FALSE) # devuelve lo mismo que el lapply
sapply(lista, length)



# FAMILIA APPLY
 
A <- cbind(1:4,seq(0,1,length.out=4),(1:4)^2)

apply(A, 1, median) # devuelve la mediana por filas
apply(A, 2, median) # devuelve la mediana por columnas

apply(A, 2, var) # cuasivarianza por columnas


apply(A, c(1,2), sqrt) # realiza la raiz cuadrada de todos los elementos de la matriz



# FUNCION SPLIT

Orange # data frame de datos de 5 árboles y sus longitudes del tronco

arboles <- split(Orange, Orange$Tree) # el Tree es un tipo factor
# split me genera una lista de data frames, uno para cada arbol

lapply(arboles, head, n=2) # devuelve las primeras 2 filas de cada data frame, incluyendo la cabecera

# suma de las diagonales de la matriz
A <- matrix(1:9,3,3)
diagonales <- split(A,col(A)-row(A))

col(A) - row(A) # devuelve una matriz en la que cada diagonal tiene un valor diferente
# tenemos creado un criterio de clasificación, para pasarlo en split

col(A) + row(A) # misma matriz pero con las diagonales contrarias

col(A) - rev(row(A)) # otra posible solucion para las diagonales contrarias




# FUNCIONES DE AGRUPACION/CLASIFICACION

aggregate(Orange$age, by = list(Orange$Tree), summary)

by(Orange$age, Orange$Tree, summary)

apply(Orange$age,Orange$Tree,summary)