###############################################
################### F. PLOT ###################
###############################################

# DataFrame con dos columnas, x e y
plot(cars)

# control completo
plot(cars,  type = "b", # p, l, c, h, o, s...
            main = "Distancia vs Velocidad",
            xlab = "Velocidad", ylab = "Distancia",
            xlim = c(0, 25), ylim = c(0, 130),
            col = "green", 
            # puntos:
            pch = 21, # código de forma de los puntos
            bg = "blue", # color de fondo de punto
            cex = 1.5, # tamaño de los puntos
            lty = 3, # linea continua - discontinua
            lwd = 5) # grosor de la linea

# Añadir expresión matemática en la etiqueta de la leyenda
plot(cars,  main = expression(Energía == m * c^2 * sqrt(5)))

# Impresión de data frame matricial
plot(AirPassengers) 
class(AirPassengers) # tipo ts, especial configurado para ser impreso en gráfica

# Impresión de data frame con factores
plot(ChickWeight$Diet)

###############################################

# Vector de colores 
colors()

# Vector reducido de colores (8 coordenadas ciclicas)
palette()

# vector de colores del arcoiris
rainbow(20)



###############################################
################# F. AUXILIARES ###############
###############################################

# Función curve
curve(x^3 - 3*x, -2, 2, ylab = expression(f(x) == x^3-3*x))

# Superposición de funciones
curve(x+0, -2, 2, col = 'red', add = TRUE)

#----------------------------------------------

# función symbols
x <- runif(10)
symbols(1:10, x, circles = x, bg = rainbow(10))

#----------------------------------------------

# Función points, añade a gráfico existente
points(rnorm(10), pch=4, col=4)

# Función lines, añade a gráfico existente
lines(rnorm(10), lty=1, col=2)

# Abline, añade lineas horizontales - verticales
abline(v=0, h=1, col=c(5,2)) # linea horizontal y vertical

#----------------------------------------------

# Texto
text(-1.5, 0,"Función", pos=3, srt=45)

# Unir texto calculado
paste0('probabilidad=', 1-2*rnorm(1))

# Unir texto para fórmula
expression(group("[",list(0, 2*pi),"]"))

# Leyenda
legend(0, -0.5, c("Coseno", "Seno"), col = 2:3, lty = 1:2, lwd = 3)
legend('topleft', c("Hola", "Paco"))

#----------------------------------------------

# Multigráfica
par(mfrow=c(2,2)) # 2x2 rellenando por filas
curve(dnorm(x),       -3, 3, main='Gráfico 1')
curve(dnorm(x, 0, 3), -3, 3, main='Gráfico 2')
curve(dnorm(x, 1, 3), -3, 3, main='Gráfico 3')
curve(dnorm(x, 1, 7), -3, 3, main='Gráfico 4')

# 'par' te modifica los parametros gráficos por defecto

# Superposición de gráficas
par(new=TRUE)

#----------------------------------------------

# Crear un dispositivo gráfico
X11()

# Consulta de dispositivos gráficos activos
dev.list()

# Dispositivo activo
dev.cur()

# Establecer dispositivo activo
dev.set(2)

# Cerrar dispositivo actual
dev.off()

# Cerrar todos los dispositivos
graphics.off()

# Exportar gráfico a archivo
png('grafico.png')
pdf('grafico.pdf')



###############################################
################# HISTOGRAMA ##################
###############################################

# Para representación de datos tipo continuo
hist(rnorm(100))

# Información sobre el histograma
hist(rnorm(100),plot = FALSE)

# Modificación de amplitud de barras
hist(rnorm(100), breaks = 10)
hist(rnorm(100), breaks = c(seq(-4, 0, 0.1), seq(0.5, 4, 0.5)))

# Versión suavizada del histograma, para superponer
lines(density(rnorm(100)),col='blue')



###############################################
################# QQ-PLOT #####################
###############################################

# proporciona info sobre aproximación de datos a la normal
qqnorm(rnorm(100))

# Mientras más alineación, mejor aproximados están
qqline(rnorm(100))

# Contraste de hipótesis, para ver si se aproxima por normales
# Test de Kolmogorov Smirnov
ks.test(rnorm(100), pnorm, mean = mean(rnorm(100)), sd = sd(rnorm(100)))

# Test de Shapiro Wilks
shapiro.test(rnorm(100)) # Se acepta la hipótesis nula en ambos casos (p-valor)



###############################################
################# BOXPLOT #####################
###############################################

# Representación de datos tipo continuo
boxplot(rnorm(100)) # Los puntos exteriores son datos anomalos
# La caja son los cuartiles del 1 al 3
# La línea es la mediana, la amplitud es el rango de la variable

# Superposición en el histograma
hist(rnorm(1000))

par(new = TRUE) # Para que se superponga la siguiente
boxplot(rnorm(1000), horizontal = TRUE, axes = FALSE)

# Comparativa entre dos variables continuas
boxplot(rnorm(1000), rnorm(1000, mean = 3, sd = 5))

# Comparativa entre elementos de factores en una variable
boxplot(salary~gender) # Factores: género. Conjunto de datos: Salary

# Distinción con dos factores
boxplot(salary~gender*jobcat)



# Regresión lineal
plot(salary, startsal)
mod <- lm(salary~startsal)
abline(mod)


###############################################
############ VAR. CUALITATIVAS ################
###############################################

# Valores aleatorios en variable tipo factor
aleatorios <- sample(1:5,100, replace = TRUE)
factor <- factor(aleatorios)

# Clasificación de valores
tabla <- table(factor)

# Frecuencia de la clasificación de valores
fi <- prop.table(tabla)

# COnstrucción de tablade frecuencias
data.frame(tabla, Freq.rel = as.numeric(fi))

# Diagrama de barras
barplot(tabla)

# Diagrama de sectores
pie(tabla)

# Diagrama de barras apilado
paridad <- factor(aleatorios%%2)
tab <- table(factor, paridad)
addmargins(tab) # Añadir sumas acumuladas a una tabla

barplot(tab)

# Diagrama de barras de dos factores uno al lado del otro
barplot(tab, beside = TRUE)
