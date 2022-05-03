################################
##### REGRESIÓN LINEAL #########
################################

# Forbes

library(MASS)
plot(forbes$bp, forbes$pres, main = "Forbes", xlab = "Temperatura", ylab = "Presión")

fit <- lm(pres ~ bp, data = forbes) # datos de la recta de regresión
names(fit) # nombres de los parámetros

abline(fit, col = 'red') # linea de regresión. Se sobreescribe en plot


# estudiamos la bondad del ajuste. 
summary(fit) # Observamos R² que nos indica lo bien que están ajustados los datos


# Realiza un ejemplo de regresion lineal e imprime el grafico

anova(fit) # Anova proporciona los cálculos intermedios

# Estudios de coordenadas y pendientes
confint(fit)

# Realización de predicciones con el modelo
predict(fit, newdata =data.frame(bp=200), interval='confidence', se.fit=TRUE) # predicción de la presión para una temperatura de 0 y 100


# Impresión del error de predicción y de precisión

x0 <- data.frame(bp=seq(min(forbes$bp), max(forbes$bp), length.out=20))
pred.m <- predict(fit, newdata=x0, interval='confidence', se.fit=T)
pred.p <- predict(fit, newdata=x0, interval='prediction', se.fit=T)
matplot(x0$bp, cbind(pred.m$fit, pred.p$fit[, -1]), lty=c(1, 2, 2, 3, 3), col=c(1, 2, 2, 4, 4), type='l', xlab='temperatura', ylab='presión', main='')
legend('topleft', c('Media', 'Predicción'),  lty=c(2, 3), col=c(2, 4), bt='n')
points(forbes$bp, forbes$pres)



################################
##### VARIANZA DE UNA VIA ######
################################

# Ratas en 4 dietas

library(faraway)
data(coagulation)
boxplot(coag~diet, data=coagulation)

lm(coag~diet, data=coagulation)
