## VECTORES Y MATRICES

runif(10) # Vector aleatorio distribución uniforme

# Funcion concatenación
v <- c(1,2,3,4,5)
w <- c(-1,0,v,6)

# Vector caracteres
carac <- c("uno", "dos")
mezcla <- c(w,carac)

# Asignación de nombre a los elementos de un vector
names(x) <- ("x1", "x2", "x3", "x4", "x5")

# secuencias regulares
1:10
seq(1,10) # sec(10) empieza automáticamente desde 1
seq(1,10,2)
seq(1,10,by=2) # saltos de distancia 2
seq(1,10,length.out(15)) # 15 elementos en el intervalo 1,10
seq(2, by=2, length.out(20)) # 20 primeros numeros pares

des <- seq(20,10) # admite vectores descendentes


# Vector mediante repetición 
rep(des, each=2) # repetir cada valor dos veces
rep(des, each=2, times=3) 
rep(1:5, times=1:5)


# Inicialización de vectores regulares
vector("numeric", 3)
vector("logic", 5)
vector("character", 2)

# Union de vectores numericos con caracteres
paste(c("X","Y"), 1:10, sep="")

# vectores predeterminados
letters[1:10]

# Acceder a posiciones del vector
v[2]
v[c(1,3,4)]

# Acceder al vector salvo posiciones determinadas
X <- -5:5
X[-2]
X[X<3 & X>0]

peso <- c(60,70,55,65)
sexo <- c("F", "M", "F", "M")
peso[sexo == "F"] # imprime los pesos de las mujeres

# Localizacion de datos faltantes en un vector
s <- c(1:8, NA, 10)
is.na(s)
s[is.na(s)] <- 0 # corregir los datos faltantes

# Funciones con datos faltantes
s <- c(1:8, NA, 10)
mean(s) #devuelve NA
mean(s, na.rm=TRUE)

########################################################################

# OPERACIONES ENTRE VECTORES

# Operaciones elemento a elemento
x+y 
x*y
x^2

FALSE*x == 0

# Evalucación de funciones
x <- (1:10)/10
(x<3)*(2*x) + (x>=3 & x<0.7)*x^2 + (x>0.7)*2

# Funciones predeterminadas
x <- c(1,2,5,10,3,6)
help(Math)

prod(x)
cumprod(x) # SUma acumulada
sum(x)
cumsum(x)
max(x)
which.max(x) # Posiciones donde se encunetra el máximo
sort(x)
order(x) # Devuelve la posicion del vector ordenado en el vector original
mean(x)
mode(x) # tipologia del dato
length(x)

# Distribuciones
x<- runif(20) # DIstribucion uniforme en 0,1
set.seed(1) # FIjar la semilla de la distribucion


########################################################################

# OPERACIONES ENTRE MATRICES


# Construcción de una matriz
A <- matrix(1:10,nrow=2,ncol=5,byrow=TRUE) # El byrow es FALSE por defecto

# Construcción de matrices por filas o columnas
cbind(1:3,4:6,7:9)
rbind(1:3,4:6,7:9)

# Asignación de nombres a las columnas y a las filas
rownames(A) <- c('fila.1','fila.2','fila.3')
colnames(A) <- c('col.1','col.2','col.3')

# Acceso a componentes de la matriz
A[1:2,1:2] 
A[,1] # Primera columna
A[1,] # Primera fila
 
# Eliminación de componentes de una matriz
A[,-1] # Eliminar primera columna
A[-1,] # Eliminar primera fila
A[-1,-1] # Eliminar ambas

# Formas alternativas de construcción de matriz
x <- array(1:24,dim=c(3,4,2)) # Matriz tridimensional

# Multiplicación elemento a elemento
A*B

# Multiplicación matricial
A %*% B
 
# Valores y vectores propios
eigen(A)
 
# Transpuesta
t(A)
 
# Inversa
solve(A)
chol2inv(chol(A)) # Inversa mediante Choleski
 
# Resolución de sistema matricial
solve(A,b)
 
# Sumas por filas/columnas, medias por filas/columnas
rowSums(A)
colMeans(A)

# Producto interior
outer(A,B,*) # A %o% B

# Ordenación de columnas determinadas
A[order(A[,1]),] #primera columna


