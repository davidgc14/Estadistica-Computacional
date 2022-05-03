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