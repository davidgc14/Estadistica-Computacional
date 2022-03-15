# LISTAS. CREACIÓN

# Relatamos los elementos d la lista (se pueden mezclar tipos)
A <- matrix(1:6,3,2)
m1 <- rowMeans(A)
m2 <- colMeans(A)
minA <- min(A)
maxA <- max(A)
nomb <- c('col1', 'col2', 'col3')
cond <- A > mean(A) + sd(A)

lista <- list(A, m1, m2, minA, maxA, nomb, cond) # metemos en la lista todo lo que queramos

# También le podemos añadir nombres a las componentes, en vez de sus coordenadas
lista <- list(matriz=A, med_fil=m1, med_col=m2, minimo=minA, maximo=maxA, nombres=nomb, cond=cond)


# HERRAMIENTAS

class(lista) # o tambien typeof(lista) devuelve lo mismo

length(lista)

lapply(lista, class) # devuelve el tipo de archivo de cada componente
lapply(lista, mean) # devuelve la media de cada componente (EN FORMA DE LISTA)
sapply(lista, mean) # igual, pero en horizontal (EN FORMA DE VECTOR)

ulista <- unlist(lista) # destruye la lista y lo convierte en un vector de tipo caracter

# OTRA FORMA DE CREACIÓN
lista2 <- vector(mode='list', length=6) # vectores y listas tienen mucho en común


# ACCESO A LOS ELEMENTOS

lista[[1]] # acceso a un elemento de la lista
lista[['matriz']] # devuelve la misma matriz anterior, ya que le habíamos atribuido un nombre a cada componente
lista$matriz # devuelve lo mismo

lista[1] # devuelve una lista: La matriz y su nombre


# MÁS HERRAMIENTAS

lista[[7]] <- !lista[[7]] # cambia el valor de la condición

lista[[8]] # sale error de que no existe
lista[[8]] <- list(1:10,6) # añade un nuevo elemento a la lista (MEMORIA DINÁMICA)

c(lista, lista2) # concatena dos listas

matrix(1:4,2,2, dimnames=list(c('fil1','fil2'),c('col1','col2'))) # crea una matriz con nombres en las filas y columnas

A <- diag(3) # crea una matriz diagonal
eigen(A) # calcula los autovalores y autovectores de la matriz en forma de LISTA

x <- rnorm(100) # crea un vector de 100 números aleatorios con distribución normal
hist(x) # crea un histograma de los números aleatorios

resultado <- hist(x) # guarda el histograma en una variable de tipo lista con toda la info

# comprobemos que está bien definido y que la frecuencia acumulada vale 1
resultado$density
dif <- diff(resultado$breaks) # caclulo de amplitud de intervalos
sum(dif * resultado$density) # suma de los intervalos multiplicados por la frecuencia