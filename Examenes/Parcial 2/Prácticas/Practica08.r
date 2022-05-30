###########################################
############### EJERCICIO 1 ###############
###########################################

hatco <- read.csv("hatco2.csv", header = TRUE, as.is = NA)
attach(hatco)


###########################################
############### EJERCICIO 2 ###############
###########################################

# posible relación dos a dos
plot(hatco[,c(6:13)])
# La velocidad, flexprec (un poco) y servconj



###########################################
############### EJERCICIO 3 ###############
###########################################

fit <- lm(fidelidad~velocidad+
                    precio+
                    flexprec+
                    imgfabri+
                    servconj+
                    imgfvent+
                    calidadp, hatco)

# Homocedasticidad
ei.std <- rstandard(fit)
plot(fit$fitted.values, ei.std, main="", 
                                xlab="valores ajustados", 
                                ylab="residuos estandarizados")

plot(hatco[,6], ei.std, main="", 
                                xlab="variable", 
                                ylab="residuos estandarizados")
abline(h=0, col="red")


# Incorrelación

library(lmtest)
dwtest(fit)


# Normalidad

ks.test(rs, pnorm) # p-valor alto = normal
qqnorm(rs) # comprobación gráfica de la conclusión


# Linealidad

library(car)
crPlots(fit)

###############################################
################ DATOS ANÓMALOS ###############
###############################################

# Detección de dtos con errores muy grandes
which(abs(rs)>2) # Devuelve empresas anómalas

# Medición de la influencia
cooks.distance(fit) # Influencia de cada variable

# Medición de aislamiento
hatvalues(fit)

# Observación de datos de aislamiento y anomalía en gráfica
influenceIndexPlot(fit) # influencia, residuo, anomalía y aislamiento

# Eliminación de datos anómalos
hatco <- hatco[-c(7,100),] # Eliminamos las empresas 7 y 100
fit2 <- lm(fidelidad ~ velocidad+precio+flexprec+imgfabri+servconj+imgfvent+calidadp, hatco)



###############################################
########## SELEC. VAR. EXPLICATIVAS ###########
###############################################

# Multicolinealidad: variables redundantes. Confirmación de si hay
R <- cor(hatco[,6:12]) # No deben haber dats elevados
ai <- eigen(R)$values ; sqrt(max(ai)/min(ai)) # Índice de condicionamiento
vif(fit2) # factor de inflado de varianza

# Eliminación de variables no explicativas
step(fit2) # Forward
step(fit2, direction = 'both') # ida y vuelta
