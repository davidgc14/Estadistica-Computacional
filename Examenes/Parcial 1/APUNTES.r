###############################################
################## BÁSICOS ####################
###############################################


# Limpieza de variables del entorno
rm(list=ls())
 
# Variables ocupadas
ls()

# Comparación salvo Epsilon
all.equal(a,b)

# División entera
5 %/% 2

# Módulo
5 %% 2

# Tipología de dato
typeof(x)

# Comprobación de tipología
is.factor(x)
is.numeric(x)
is.data.frame(x)
is.list(x)

# Convertir a tipo factor
x <- as.factor(x)
x <- as.matrix(x,2,2) # dimesiones de la matriz
x <- as.data.frame(x)

# Ver si hay un valor perdido
missing(x)

# Impresión de texto por pantalla limpio
cat('hola\n')

# Impresión de mensaje de alerta
warning('Considere cambiar la variable x')
 
# Impresión de mensaje de error y parada del código
stop('Error')



###############################################
################ LIBRERÍAS ####################
###############################################


# Datasets disponibles
data()

# Paquetes cargados en memoria
search()

# Paquetes disponibles para importación
library()

# Cargar paquete al workspace
library(boot)

# Cargar una lista de datos de un paquete
data(coal, package="boot")



###############################################
################# VECTORES ####################
###############################################


# Construcción del vector 
v <- c(1,2,3)

# Vector secuenciado
seq(1, 10, by=2)

# Vector por repetición
rep(1:4, each = 2, times = 3)

# Asignación de nombres a las variables
names(v) <- c("x1", "x2", "x3")

# Vector de nombres 
paste(c("X","Y"), 1:10, sep="")

# Acceso a componentes
v[2]
v[c(1,3)]
v["x3"]

# Acceso a componentes con condicionante
v[v>2]

# Vectores predeterminados
letters[1:10]

# Vector numérico de tamaño fijo (o variable)
numeric(3)	# numeric()
 
 
# Identificación de datos faltantes (incluye NaN)
is.na(v)

# Media obviando datos faltantes
mean(s, na.rm=TRUE)
 
# Posición donde está el máximo
which.max(v)

# Suma acumulada
cumsum(v)

# Distribución uniforme en (0,1)
runif(20)

# Distribución normal
rnorm(20)

# Fijar la semilla de la distribución (para trabajar siempre con la misma
set.seed(1)

# Vector de tipo Factor
ej <- c("2","1","2","2","3","2")
ej.f <- factor(ej)

# Ejemplo atrivuyendo nombres a números
sexo.f <- factor(c(1,1,2,1,1,2,2,1,2,1),labels=c('hombre','mujer'))

# Convertir vector tipo factor en factor con asociación numérica
unclass(ej.f)

# Valores aleatorios
sample(1:5,2,replace=FALSE) # dos valores sin repetición
 


###############################################
################# MATRICES ####################
###############################################


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



###############################################
################## LISTAS #####################
###############################################


# Creación de la lista
lista <- list(Matriz, vector, x, nombres)

# Nombres a las componentes de la lista
names(lista) <- c('Matriz','Vector','numero','vectorNombre')

# Acceder a elementos de la lista
lista[[1]]	# devuelve la matriz
		# lista[['Matriz']]
		# lista$Matriz

lista[1] 	# Devuelve una lista de una componente
lista[2:3]

# Lista predeterminada: Histograma
x <- rnorm(100)
resultado <- hist(x)

# Herramientas para tipado
class(lista)
typeof(lista)

# Convertir la lista en vector de caracteres
unlist(lista)



###############################################
################ DATA FRAMES ##################
###############################################


# Creación de Data Frames
datos <- data.frame(dni,edad,sexo,estudios,salario)

# Toda la información del data frame por columnas
str(datos)

# Resumen estadístico de los datos
summary(datos) # tipo TABLA (data frame especial)

# Acceso a sub-data frame
datos[2]

# Acceso a subvector/matriz
datos[2:3,]

# Acceder según una característica
datos[datos$sexo=='Hombre',]

# Se le pueden aplicar funciones de matrices
rowSums(datos)



###############################################
################# DATA SETS ###################
###############################################


# Mostrar primeras 6 filas
head(mtcars)

# Mostrar últimas 6 filas
tail(mtcars)

# Obtener un subgrupo según condiciones
subset(mtcars,subset= vs==0 & hp>90) # subset de todo el dataframe
subset(mtcars,subset= vs==0 & hp>90, select=c(1:2)) # seleccionar las dos columnas primeras

# Modificar alguna columna (para proporciones)
transform(mtcars, hp=hp/100)

# Añadir nueva columna al data-set
transform(mtcars, hp=hp/100, wt2=wt/21)

# modificaciones de una copia del data-set
mtcars2 <- within(mtcars, {
	vs <- factor(vs, labels=c('V', 'S')) # convierte a factor
	am <- factor(am, labels = c("automatic", "manual"))
	cyl <- ordered(cyl) # ordena la columna
	gear <- ordered(gear)
	carb <- ordered(carb)
})

# Impresión de gráfica de dos variables indicadas
with(mtcars2, boxplot(mpg~vs))

# Forma clásica de impresión de gráficas
boxplot(mtcars2$mpg, mtcars2$vs)



###############################################
################# FICHEROS ####################
###############################################


# Obtención de directorio actual
getwd()

# Cambio de directorio
setwd("C:/Escritorio")

# Importación de fichero .txt con separación de espacio
read.table("datos.txt", header=TRUE)
read.table("datos.txt", header=TRUE, sep="\t")

# Importar tratando a todas las columnas menos la indicada como factores 
read.table("datos.txt", header=TRUE, as.is=c(1)) 

# Importación de fichero .csv con separación de comas
read.csv("datos.csv", header=TRUE)

# Importación de fichero .csv con separación de punto-coma
read.csv2("datos.csv", header=TRUE)

# Importación en forma de lista
datos <- scan(
	file="datos.txt", 
	skip=1,
	header=TRUE,
	what=list(
		DNI='',
		edad=0,
		sexo='',
		estudios='',
		salario=0)
)

# Información del archivo
class(datos)
typeof(datos)
lapply(datos, class)
str(datos)

# Acceso a variables del archivo importado
mean(datos$salario)

# Cargar archivo en memoria, en search()
attach(datos)
mean(salario) # Las variables del archivo se vuelven variables locales

# Eliminar los datos de la memoria
detach(datos)

# Petición de datos por pantalla
v <- scan()

# Exportar datos a ficheros con espacios por defecto
write.table(cars[1:3,], file="cars.txt")
write.table(cars[1:3,], file="cars.txt", col.names=FALSE) # Sin encabezado

# Exportar vector o matriz
write(runif(10), "runif.txt")
write(runif(10), "runif.txt", ncolumns=2) # en dos columnas

# Forma alternativa de exportar data frame mediante write
write(t(as.matrix(cars[1:3,])), "cars2.txt", ncolumns=2)

# Eliminar fichero del directorio
unlink("datos.txt")



###############################################
################# FUNCIONES ###################
###############################################


# Funciones con valor por defecto
f1 <- function(a=0,b=0) {
	a + b
}

# Se aplica la regla de reciclaje en caso de entrada de vector
f1(1:10,2)

# devuelve última instancia a menos que se retorne
f2 <- function(x) {
	return(x+2)
	24
}

# devolución de más de un resultado: en forma de lista
f3 <- function(x) {
	return(list(x+2, x+3))
}

# Asignación de nombres a las variables de salida
f4 <- function(x,y) {
	return(list(suma=x+y, resta=x-y))
}

# Control de eficiencia
t1 <- Sys.time()
fun.1(10000)
t2 <- Sys.time()
fun.2(10000)
t3 <- Sys.time()

tiempof1 <- t2-t1
tiempof2 <- t3-t2

# Funciones predeterminadas. Unir cadenas de caracteres
paste("Ma","no","lo",sep="-")

# Función gamma (integrales y factoriales)
gamma(20)



###############################################
############### CONDICIONANTES ################
###############################################


# If, condicionante simple con entrada de una variable
if(x>0) {
	x+1
} else {
	x-1
}

# Else if, condicionante anidado con entrada de una variable
if(x>0) {
	x+1
} else if(x<0) {
	x-1
} else if(x==0) {
	x
}

# Ifelse, condicionante anidado con entrada de varias variables (vectores)
ifelse(x>0, x+1, x-1) # condición; respuesta para TRUE; respuesta para FALSE

# Switch, escritura condicionante compacta de una variable
switch( x, # variable a comparar
		a = "opción 1", # if(x=="a")
		b = "opción 2",
		c = "opción 3",
		stop("Valor de x no válido"))
switch(x, 'uno','dos','tres','cuatro') # admite entrada numerica y comparar






###############################################
################### BUCLES ####################
###############################################


# Bucle for con salida natural
for(i in 1:10) {
	print(i)
}

# Bucle for con salida por break
for(i in 1:10) {
	if(i==5) {
		break
	}
	print(i) # esta sentencia no se llega a imprimir en la quinta
}

# Bucle for con salida por return
for(i in 1:10) {
	if(i==5) {
		return(i)
	}
}

# Bucle while (con vector de dimensión variable)
set.seed(1)
i <- suma <- 0
x <- numeric() # vector de numeros de longitud variable. A priori 0
while (suma < 1) {
    i <- i + 1
    x[i] <- runif(1, 0, 0.1) # uniforme en (0,0.1)
    suma <- suma + x[i]
}

# Bucle repeat (de repeticiones infinitas) sin condición de salida
repeat {
	print(i)
	if (i==10) {
		break
	}
} 



###############################################
################# S-L-APPLY ###################
###############################################


# Lapply, longitud de cada componente de la lista
lapply(lista, length)

# Lapply, media por columnas de un data frame
lapply(data.fr, mean)

# Lapply, devuelve dos primeras filas de una lista
lapply(lista, head, n=2)

# Lapply, sumar cada uno de los elementos de la lista
lapply(lista, sum)

# Sapply: función lapply pero con salida simplificada
sapply(lista, length)

# Sapply, forzando la no simplificación
sapply(lista, length, simplify=FALSE)

# Apply, para cálculos de matrices. Mediana por columnas y filas
apply(matriz, 2, median) # mediana por columnas
apply(matriz, 1, median) # mediana por filas

# Apply, cuasivarianza por columnas
apply(matriz, 2, var)

# Apply, raiz cuadrada de cada elemento
apply(matriz, c(1,2), sqrt)



###############################################
######### AGRUPACIÓN Y CLASIFICACIÓN ##########
###############################################


# Clasificación de datos de un dataframe en función de un factor
arboles <- split(Orange, Orange$Tree) # Devuelve una lista

# Separar en factores los elementos de las diagonales de una matriz
split(A,col(A)-row(A))
split(A,col(A)+row(A)) # las diagonales contrarias

# Clasificación por factores y características
by(Orange$age, Orange$Tree, summary)



###############################################
############## DEPURADO Y DEBUG ###############
###############################################


# Ruta de pasos hasta llegar a la salida por pantalla (al final del proceso)
traceback()

# Debugear desde terminal (incluirlo en medio del proceso)
f <- function(x) {
    browser() # permite modificar variables en el proceso. Q=quit,C=cut&continue
    u <- runif(n)
    return(u)
}

# Debugear sólo el código indicado
debug(f)

# Cortar el debugueo automático
undebug(f)

# Depurar solo una vez
debugonce(f)
