###########################################
############### EJERCICIO 1 ###############
###########################################

# Importación de archivo
employee <- read.table("Employee.txt", header = TRUE, as.is = NA)
# Conversión de los nombres del factor seleccionado
levels(employee$gender) <- c('female','male')

# Añadimos el DF al espacio de búsqueda
attach(employee) # Nos evita el uso de employee$ para referirnos a las variables



###########################################
############### EJERCICIO 2 ###############
###########################################

x1 <-seq(15000, 40000, by=5000)
x2 <-seq(50000, 80000, by=10000)
x3 <-seq(100000, 140000, by=20000)

hist(salary, breaks=c(x1,x2,x3))
lines(density(salary),col='blue')

curve(dnorm(x, mean(salary), sqrt(var(salary))), col = 'red', lty = 2, add = TRUE)

legend('topright', c('Salario', 'Distribución Normal'), lty = 1:2, col = c('blue', 'red'))

