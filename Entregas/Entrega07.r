#####################################
########### Ejercicio 1 #############
#####################################

# importación del archivo de los datos
employee <- read.table('Employee.txt', header=TRUE, as.is=NA)
class(employee) # confirmamos que es un data.frame

# poner nombre al factor gender del data.frame employee
employee$gender <- factor(gender, labels=c("female", "male"))

attach(employee) # lo adjuntamos para poder usar sus funciones

hist(salary) # con ello accedemos directamente al gráfico


#####################################
########### Ejercicio 2 #############
#####################################

hist(salary,breaks=100) # podemos indicar el número de intervalos

x1 <- seq(15000, 40000, by=5000)
x2 <- seq(50000, 80000, by=10000)
x3 <- seq(100000, 140000, by=20000)
hist(salary, breaks=c(x1,x2,x3)) # podemos indicar una partición arbitraria
lines(density(salary),col='blue') # superponemos la densidad

# componemos ahora el gráfico anterior con la función de densidad de la normal con media y desviación
# estandar de los salarios
curve(dnorm(x, mean=mean(salary), sd=0.5*sd(salary)),min(salary),max(salary), add=TRUE, col='red')



#####################################
########### Ejercicio 2 #############
#####################################

# Realizar el análisis de startsal y age

summary(startsal)

hist(startsal, probability=TRUE, main="Salario inicial", axes=FALSE) # AXES indica que no aparezca el eje vertical de alturas
axis(1) # Añade el eje horizontal con medidas
lines(density(startsal), col='red', lwd=2)
par(new=TRUE) ## Para que el próximo gráfico se superponga al anterior
boxplot(startsal, horizontal=TRUE, axes=FALSE, lwd=2)

# Comparación entre salario inicial y edad
boxplot(startsal~age)
boxplot(startsal~minority)
boxplot(startsal~jobcat)
# A continuación salario con una doble clasificación
boxplot(age~gender*jobcat)



#####################################
########### Ejercicio 3 #############
#####################################

# Análisis conjunto de variables salary y startsal

plot(startsal,salary)

#modelización lineal de los datos
mod <- lm(salary~startsal) # almacena la pendiente y la ordenada en el origen

abline(mod, col='red') # dibuja la recta de regresión


# Apartado 1. Relación entre salary y age
boxplot(salary~age) # Una mejor forma de ver la distribución de los datos



#####################################
########### Ejercicio 4 #############
#####################################

tab <- table(minority) # tabla de frecuencias por factores
tab.fi <- prop.table(tab) # frecuencias relativas

# Guardamos los datos en una tabla de frecuencias
data.frame(tab, Freq.rel=as.numeric(tab.fi))

barplot(tab)
par(new=TRUE) # superponemos los dos graficos
pie(tab)



#####################################
########### Ejercicio 5 #############
#####################################

# Construye una tabla de contingencia que muestre la clasificación de los individuos según
# jobcat y minority. Representa un diagrama de barras que muestre dicha clasificación.

tab2 <- table(jobcat,minority)
addmargins(tab2) # añade una fila y una columna más con las sumas marginales

barplot(tab2)

barplot(tab2, beside=TRUE)
