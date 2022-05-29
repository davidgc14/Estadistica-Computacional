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



###########################################
############## DIAG. MODELO ###############
###########################################

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
