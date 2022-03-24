# LECTURA DE DATOS DE FICHEROS

# Documento de ayuda: Data Import/Export

read.table("datos.txt", header=TRUE, sep="\t") # Por defecto el separador es espacio

getwd() # obtiene el directorio actual

datos <- read.table("datos.txt", header=TRUE) # lee el fichero

# ver informacion de datos
class(datos)
typeof(datos)
lapply(datos, class)
str(datos)

# Importa tratando a las columnas que no son para la primera columna, como tipo factor (para las que son de tipo caracter)
datos <- read.table("datos.txt", header=TRUE, as.is=c(1)) 

# Importación de datos CSV
datos <- read.table("datos.csv", header=TRUE, sep=",")
datos <- read.csv("datos.csv", header=TRUE) # separador de coma por defecto
datos <- read.csv2("datos.csv", header=TRUE) # separador de punto y coma por defecto


# Función SCAN

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
            ) # lee el fichero y lo almacena en forma de lista
datos <- as.date.frame(datos) # convierte la lista en un data frame

vector <- scan() # pide por pantalla los elementos del vector


# Desde paquetes de R

data() # muestra las listas de datos disponibles
data(volcano) # crea una copia de la lista de datos para poder ser manipulada

library() # listar los paquetes disponibles
search() # listar paquetes cargados en memoria

data(package="boot") # muestra la lista de datos disponibles en el paquete boot
data(coal, package="boot") # carga solamente la lista de datos Coal  

# También podemos cargar el paquete entero y después importar los datos que queramos
library(boot) # carga el paquete boot y lo podemos ver con search
search() # lista paquetes cargados en memoria (se ha añadido boot)

coal # podemos llamar directamente ahora a la lista de datos coal, ya que el paquete entero está cargado


# Funciones Attach y Detach

# teniendo datos importado, podemos hacer calculos en el
mean(datos$salario) # calcula la media de los salarios del archivo datos.txt

# modo alternativo (no recomendado en general)
attach(datos) # carga los datos en memoria, en el entorno de search()
mean(salario) # calcula la media en base a los datos cargados en memoria

# with tambien es interesante

detach(datos) # elimina los datos de memoria
mean(salario) # ahora esto devuelve un error



# EXPORTACION DE DATOS A FICHEROS

write.table(cars[1:3,], file="cars.txt") # separado por espacios por defecto, y con los nombres de filas y columnas
read.table("cars.txt", header=TRUE) # tenemos que indicar que tiene cabecera

write.table(cars[1:3,], file="cars.txt", col.names=FALSE) # sin nombres de columnas

# Función write

# vector
write(runif(10), "runif.txt") # exporta un vector de 10 elementos aleatorios, por defecto en 5 columnas
write(runif(10), "runif.txt", ncolumns=2) # exporta en 2 columnas

# matriz
write(cars[1:3,], "cars2.txt") # devuelve error por no ser una matriz
write(as.matrix(cars[1:3,]), "cars2.txt") # ahora si, pero por defecto la guarda traspuesta y en 5 columnas
write(t(as.matrix(cars[1:3,])), "cars2.txt", ncolumns=2) # ahora si la exporta de manera correcta

# Funcion unlink
unlink('datos.txt') # Borra el fichero del directorio

