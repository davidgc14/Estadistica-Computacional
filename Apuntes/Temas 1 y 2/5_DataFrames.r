# DATA FRAMES

# creamos primos la tabla de datos
dni<-c('22456715A','22456716B','22456717C','22456718D','22456719E')
edad<-c(45,35,52,60,25)
sexo<-factor(c('Hombre','Mujer','Hombre','Mujer','Hombre')) # factor de dos niveles
estudios<-factor(c('superior','superior','profesional','medio','profesional')) # factor de tres niveles
salario<-c(2500,1500,2000,1200,1800)

datos<-data.frame(dni,edad,sexo,estudios,salario) #creamos al data frame

datos<-data.frame(DNI=dni,AGE=edad,sexo,estudios,salario) # para actualizar los nombres de las columnas

str(datos) # muestra toda la info de datos

length(datos) # devuelve el número de columnas
nrow(datos) # devuelve el número de filas
ncol(datos) # devuelve el número de columnas

summary(datos) # muestra resumen estadístico completo de los datos. Objeto tipo TABLA (data frame especial)


# ACCEDER A LOS ELEMENTOS

datos[2] # accede a la segunda columna. Con corchete simple accede como si fuera una lista. Devuelve data-frame
datos[,2] # accede a la segunda columna. Todos los elementos de la segunda columna. Devuelve vector

datos[1:2, c('edad','estudios')] # dos primeras filas de las columnas edad y estudios

datos[datos$sexo == 'Hombre',] # muestra todas las filas de la columna sexo que contengan el valor Hombre

datos[,-1] # elimina la primera columna

datos[,-c(1,3)] # elimina las dos columnas indicadas

str(datos[2]) # devuelve data-frame
str(datos[,2]) # devuelve vector
str(datos[,2, drop=FALSE]) # mantiene la información del data-frame

datos[sample(1:5, 2, replace = FALSE),] # muestra dos individuos aleatoriamente
datos[sample(1:nrow(datos), 2, replace = FALSE),] # más generico

datos[sample(1:nrow(datos), 2, replace = FALSE),sample(1:ncol(datos), 2, replace = FALSE)] # también toma dos elementos aleatoriamente



# DATASETS, DEL PAQUETE PREDETERMINADO MTCARS

head(mtcars) # muestra las primeras 6 filas
tail(mtcars) # muestra las últimas 6 filas

subset(mtcars,subset= vs==0 & hp>90) # forma de obtener un subset de datos (manuales con mas de 90 caballos)

subset(mtcars,subset= vs==0 & hp>90, select=c(-'vs')) # como vs es todo cero, la podemos borrar
subset(mtcars,subset= vs==0 & hp>90, select=c(1:2)) # o seleccionar las dos columnas primeras

mtcars[mtcars$vs == 0 & mtcars$hp > 90,] # forma alternativa

transform(mtcars, hp=hp/100) # transforma la columna hp a otra proporcion

transform(mtcars, hp=hp/100, wt2=wt/21) # añade una columna con la proporción de peso

str(mtcars) #ya conocida

mtcars2 <- within(mtcars, {
    vs <- factor(vs, labels=c('V', 'S')) # transforma la columna vs a factor
    am <- factor(am, labels = c("automatic", "manual"))
    cyl <- ordered(cyl) # ordena la columna
    gear <- ordered(gear)
    carb <- ordered(carb)
}) # modificamos datos del propio dataframe. Lo lógico es primero hacer una copia y despues modificar

with(mtcars2, boxplot(mpg~vs)) # muestra una gráfica de las dos variables indicadas
boxplot(mtcars2$mpg, mtcars2$vs) # misma gráfica

# OTRAS FUNCIONES
# MERGE, MATCH, ...


# CONVERSION DE DATOS

is.matrix(mtcars)
is.data.frame(mtcars)

M <- as.matrix(mtcars) # Convertir a matriz