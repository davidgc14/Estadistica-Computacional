# Comparación entre media y mediana

# Muestra contaminada
n <- 100
j <- rbinom(n,1,0.05) # 1's son los datos contaminados
x <- rnorm(n, 3*j, 1+2*j) # esto genera n valores de f1 o f2 dependiendo de j

# representamos un histograma de la muestra generada
hist(x,breaks='FD',freq=FALSE,main='Muestra contaminada')
# superponemos la densidad desde la que se generó
curve(0.95*dnorm(x,0,1)+0.05*dnorm(x,3,3),add=TRUE,col=2)




# Para mejor resultado promediamos muchos estudios iguales y promediamos
n<-100
j<-rbinom(n*nsim,1,0.05) # Sacamos 100*1000 valores, y almacenamos en matriz
muestras <- matrix(rnorm(n*nsim, 3*j, 1+2*j), nrow=nsim, ncol=n)

# Promediamos la media de toda la matriz (cada fila es una muestra)
medias<-apply(muestras,1,mean)
medianas<-apply(muestras,1,median)

summary(medias) # Nos indica el resumen de máximos y mínimos de las medias de las muestras

# Graficamos los valores de media y mediana
boxplot(medias,medianas,names=c('Media','Mediana'))
abline(h=0, col=2) # Vemos como la media se ve muy afectada por contaminaciones