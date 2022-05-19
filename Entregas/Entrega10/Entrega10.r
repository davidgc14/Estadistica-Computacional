## Entrega 10


##############################
######## Ejercicio 1 #########
##############################

## Aproximar mediante simulación la probabilidad de P(x²+y² <= 1)

# simulación
nsim <- 1000
set.seed(1)
x <- runif(nsim,-1,1)
y <- runif(nsim,-1,1)
suceso <- (x+y <= 1)

# aproximación
mean(suceso)

# error de estimación
sd(suceso)/sqrt(nsim)

# Valor real
pi/4

# Estudio de convergencia
estim <- cumsum(suceso)/(1:nsim)
plot(1:nsim,estim,type='l',
                ylab='Aproximación y límites de error',
                xlab='Número de simulaciones',
                main=expression(P(X+Y<=1)),
                ylim=c(0,2))
# Errores de estimación
estim.err<-sqrt(cumsum((suceso-estim)^2))/(1:nsim)

# Limites de error
z<-qnorm(0.025,lower.tail = FALSE)
lines(estim-z*estim.err,lty=3,lwd=2,col='blue')
lines(estim+z*estim.err,lty=3,lwd=2,col='blue')
abline(h=pi/4,lty=2,col=2)



##############################
######## Ejercicio 2 #########
##############################

f1 <- function(x) dbeta(x, 2.5, 5)
curve(f1,0.2,0.4)

nsim <- 1000
# calculamos la aproximación
set.seed(1)
x <- runif(nsim, 0.2,0.4) # x1,...,xn
f1x <- sapply(x, f1) # f1(x1),...f1(xn)
mx <- mean(f1x)*0.2 # Se multiplica por la amplitud del intervalo

# Valor real
integrate(f1,0.2,0.4)


# Gráfica de convergencia
# valores estimados
f1x. <- sapply(x, f1)*0.2 # Multiplicamos por la amplitud del intervalo
estim <- cumsum(f1x.)/(1:nsim)
# errores de estimación
estim.err <- sqrt(cumsum((f1x.-estim)^2))/(1:nsim)
plot(1:nsim,estim,type='l',
                ylab='Aproximación y límites de error',
                xlab='Número de simulaciones')
# Extremos de error
z <- qnorm(0.025,lower.tail = FALSE)
lines(estim - z*estim.err,col='blue',lwd=2,lty=3)
lines(estim + z*estim.err,col='blue',lwd=2,lty=3)
abline(h=mx, col=2)

# Otra forma de plantear la primera integral
x <- rbeta(nsim, 2.5, 5)
cc <- function(x) (x>0.2 & x<0.4)
cx <- cc(x)
mx <- mean(cx)




## Segunda integral
f2 <- function(x) sin(x)*exp(-x)*dbeta(x,2.5,5)

# Aproximación
x <- rbeta(nsim, 2.5, 5)
f2x <- sapply(x, f2)
cc <- function(x) sin(x)*exp(-x)
mx <- mean(cc(x))

# Valor real
integrate(f2,-Inf,Inf)




##############################
######## Ejercicio 3 #########
##############################

nsim<-5000 # número de simulaciones

# simulamos ahora nsim valores de S_N:
lam <- 17
mu <- 3.5
sig <- 1.1

S <- double(nsim) # para almacenar los valores simulados
set.seed(1)
for (i in 1:nsim) {
    n <- rpois(1,lam)
    if (n > 0) 
        S[i] <- sum(rlnorm(n,mu,sig))
}

# Aproximación de la media
EX <- mean(S)
# Convergencia
estim <- cumsum(S)/(1:nsim)
plot(1:nsim,estim,type='l',
                ylab='Aproximación y límites de error',
                xlab='Número de simulaciones')
abline(h=EX,col=2)

# Aproximación de la varianza
VX <- var(S)

