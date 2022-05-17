# Toda integración se puede ver como una aproximación de una media

#############################
#### INTEGRAL DEFINIDA ######
#############################


######### EJEMPLO ###########


h <- function(x) (4*x^4) * (x>0 & x<1)
curve(h,0,1)

nsim <- 1000 # número de simulaciones
x <- runif(nsim) # x1,...,xn
hx <- sapply(x,h) # h(x1),...h(xn)
mean(hx) # la aproximación final

# Graficamos la simulación (como en los casos anteriores)
estim <- cumsum(hx)/(1:nsim)
estim.err <- sqrt(cumsum((hx-estim)^2))/(1:nsim)
plot(1:nsim,estim,type='l',ylab='Aproximación y límites de error', 
                            xlab='Número de simulaciones')
z <- qnorm(0.025,lower.tail = FALSE)
lines(estim - z*estim.err,col='blue',lwd=2,lty=3)
lines(estim + z*estim.err,col='blue',lwd=2,lty=3)
abline(h=4/5,col=2)



#############################
#### INTEGRAL INDEFINIDA ####
#############################

