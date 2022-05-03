##############################
########## POINTS ############
##############################
# superposición de puntos

set.seed(12)
# Construimos la función de primer nivel
plot(rnorm(10), main="Tres muestras de una normal estandar",
                pch=17, ylim=c(-3,3)) # En este caso la Y será la densidad, y x los valores 1:10
                # En eje x tenemos el indice del vector

# Función points nos permite superponer puntos, variando la semilla
points(rnorm(10), pch=17, col=2)
points(rnorm(10), pch=17, col=3)


##############################
###### LINES/ABLINES #########
##############################
# superposición de lineas

# ABLINE
abline(a,b) # pendiente a y oordenada b
abline(h=y) # linea horizontal en altura y
abline(v=x) # linea vertical en altura x

x <- rnorm(10)
plot(x, main="Tres muestras de una normal estandar",
                pch=19, ylim=c(-3,3)) # En este caso la Y será la densidad, y x los valores 1:10
abline(h=0) # eje coordenadas

abline(h=3, col=2, lty=3, lwd=2)
abline(h=-3, col=2, lty=3, lwd=2)

lines(x, col=4, lwd=2) # unir con lineas los puntos



##############################
########## TEXT ##############
##############################
# Añadir texto a la gráfica

plot(x, main="Tres muestras de una normal estandar",
                ylim=c(-4,4), xlim=c(0,10), pch=19)
abline(h=0) # eje coordenadas
abline(h=3, col=2, lty=3, lwd=2)
abline(h=-3, col=2, lty=3, lwd=2)

# Probabilidades de que caiga en cada una de las zonas
pr3 <- round(pnorm(-3), 5) # P[X<-3] para X->N(0,1)

# los primeros números son coordenadas. Esas van a ojo
text(5, 3.5, paste0('probabilidad=', pr3) , col=2, pos=3)
text(0.2, 0, paste0('probabilidad=', 1-2*pr3), pos=3, srt=90) #srt es girar 90 grados
text(5, -3.5, paste0('probabilidad=', pr3), col=2)



##############################
########## LEGEND ############
##############################

x <- seq(0, 2 * pi, length = 100)

y1 <- cos(x)
y2 <- sin(x)
# Construimos el primer nivel con el coseno
plot(x, y1, type = "l", col = 2, lwd = 3,
            xlab = expression(group("[",list(0, 2*pi),"]")),
            ylab = "", main = "Seno y Coseno")

# Superponemos la siguiente función
lines(x, y2, col = 3, lwd = 3, lty = 2)

# Añadimos leyenda. Los dos primeros valores son las coordenadas
legend(0, -0.5, c("Coseno", "Seno"), col = 2:3, lty = 1:2, lwd = 3)
# col: vector de colores. lty: vector de tipos de lineas

# Oordenadas y abcisas
abline(v = pi, lty = 3)
abline(h = 0, lty = 3)

# añadimos valor del centro
points(pi, 0, pch = 17, col = 4)
text(pi, 0, expression(group("(",list(pi,0),")")), adj = c(0,0))


# OTRO EJEMPLO

radio <- seq(0, 5, by=0.1)
area <- pi*radio^2
perimetro <- 2*pi*radio
plot(radio, area, type='o', ylab='', pch=19, col=2)
lines(radio, perimetro, type='o', pch=17, col=4)
legend('topleft', legend = c('Área','Perímetro'), # TOPLEFT es una de las palabras reservadas para la leyenda
        lty = 1, pch = c(19,17), col = c(2,4), bt='n') # bt indicamos que no queremos caja de la leyenda

# PROBAR INTERACTIVO DONDE PONER LA LEYENDA
legend(locator(1), legend = c('Área','Perímetro'), # locator permite interactuar con el grafico e indicar donde poner la leyenda
        lty = 1, pch = c(19,17), col = c(2,4), bt='n') 


# EJERCICIO
# Poner leyenda al grafico de las normales

##############################
##### COSAS QUE AÑADIR #######
##############################

polygon
segments
arrows
grid
title
axis


##############################
######## PARÁMETROS ##########
##############################

# Multigráfica

par(mfrow = c(2, 2)) # matriz de 2x2 gráficos (se rellenan por filas)
curve(dnorm(x), -3, 3, main = 'Gráfico 1: Normal estándar')
curve(dt(x, df=10), -3, 3, main = 'Gráfico 2: t de Student')
curve(dchisq(x, df=5), 0, 20, main = 'Gráfico 3: chi-cuadrado')
curve(df(x, df1=20, df2=10), 0, 5, main = 'Gráfico 4: F de Snedecor')

# Otro ejemplo

par(mar=c(3.5,3.5,2.5,1.5),oma=c(1,1,1,1),mgp=c(1.5,0.5,0), cex.axis=0.8,cex.lab=0.8,cex.main=1,col.lab='blue',bty='n')
curve(dnorm(x), -3, 3, main = 'Gráfico 1: Normal estándar')
curve(dt(x, df=10), -3, 3, main = 'Gráfico 2: t de Student')
curve(dchisq(x, df=5), 0, 20, main = 'Gráfico 3: chi-cuadrado')
curve(df(x, df1=20, df2=10), 0, 5, main = 'Gráfico 4: F de Snedecor')
