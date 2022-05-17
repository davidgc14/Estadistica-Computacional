################################
######## DISTRIBUCIONES ########
################################

# Distribución normal
rnorm(n=10,mean=10,sd=2)

# Distribución uniforme
runif(10)



# Muestra sin reemplazo
sample(1:5, 5) # estamos realizando una permutación

# Muestra con reemplazo
sample(1:5, 10, prob=c(0.4,0.6)) # En prob indicamos la función masa de probabilidad

# Forma de obtener n pruebas de una función con valores aleatorios distintos
mx <- numeric()
for (i in 1:10) {
    set.seed(i)
    x <- rnorm(100, mean=2)
    mx[i] <- mean(x)
}
mean(mx)

# Poisson de media 1
rpois(n=10,lambda=1) 

# Distribución de poisson
dpois(x=0:10,lambda=3)

# Distribución acumulada de poisson (percentiles)
ppois(x=0:10,lambda=3)

# Inversa de distribución de densidad de la normal (quantiles)
qnorm(0.025,lower.tail = FALSE) # lower tail para descartar la parta izquierda y quedarnos con la parte derecha



################################
########## SIMULACIÓN ##########
################################

# Simulación de lanzamiento de moneda
sample(c(cara=1, cruz=0), 1, replace=TRUE, prob=c(0.5,0.5)) # vector dicotómico, número de lanzamientos, reemplazo, probabilidad

# Simulación de 10 lanzamientos
x <- sample(c(cara=1, cruz=0), 10, replace=TRUE, prob=c(0.5,0.5))
mean(x) # aproximación de media de la variable cara

x <- sample(c(cara=1, cruz=0), 100, replace=TRUE, prob=c(0.5,0.5))
mean(x) # cuanto mayor es la muestra, mejor es la aproximación de la media

# Simulación de 1000 lanzamientos
nsim <- 1000
x <- sample(c(cara=1, cruz=0), nsim, replace=TRUE, prob=c(0.5,0.5))
mean(x)

# Impresión de aproximación en límite de la media según aumentan los lanzamientos
n <- 1:nsim
plot(n, cumsum(x)/n, type="l", ylab='Proporción de caras', xlab='Número de lanzamientos', ylim=c(0,1))
abline(h=0.5,lty=2,col=2) # Dibujamos linea de referencia



################################
##### DETECCIÓN DE ERRORES #####
################################

# Ejemplo con distribución de cauchy
gr.cauchy <- function(ss=1, nsim=10000) {
    set.seed(ss)
    x <- rcauchy(nsim)
    n <- 1:nsim
    plot(n, cumsum(x)/n,type='l', ylab='Media muestral', 
                                    xlab='Número de simulaciones', 
                                    main='Secuencia de medias de una Cauchy')
    abline(h=0,lty=2,col=2)
} 
gr.cauchy(ss=1)

# Veamos que ocurre con otras semillas
gr.cauchy(ss=2)
gr.cauchy(ss=3) # las gráficas son completamente aleatorias y no convergen. No cumplen la ley de los grandes números



################################
##### DISTRIBUCIÓN NORMAL ######
################################

set.seed(1)
nsim <- 1000
x <- rnorm(nsim)

# Media experimental (la teórica sería 0)
mean(x)

# Error estándar
sd(x) / sqrt(nsim)

# error máximo admisible al nivel de confianza 0.95
qnorm(0.975) * sd(x) / sqrt(nsim)


# Estudiamos su convergencia #####################################################
n <- 1:nsim
x <- x[n]
# medias muestrales para n=1,2,...,nsim
estim <- cumsum(x)/n
# correspondientes errores de estimación
# por simplicidad con varianza muestral en lugar de cuasivarianza
estim.err <- sqrt(cumsum((x-estim)^2))/n
# gráfico de convergencia
plot(n,estim, type='l',xlab='Número de simulaciones',
                        ylab='Aproximación de la media y error',
                        ylim=c(-1,1))
# media teórica:
abline(h=0,col=2)
# intevalos de confianza (1-alpha=0.95)
z <- qnorm(0.975)
lines(estim-z*estim.err,lty=3,lwd=2,col='blue')
lines(estim+z*estim.err,lty=3,lwd=2,col='blue')

# Tenemos los limites superiores e inferiores de la media, según aumentan las experimentaciones.
# este error nunca se hará muy pequeño, debido a la grandeza de la varianza( que es uno)


################################
######## EJERCICIO #############
################################

determina.n <- function(epsilon, sigma, alpha) {
    z <- qnorm(alpha/2, lower.tail = FALSE)
    n <- (z*sigma/epsilon)^2
    return(n)
}

# 1.
# 2.
# 3.