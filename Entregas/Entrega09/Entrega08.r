#' PREVIO
library(knitr)

#' Creamos el documento RMD
spin("Entrega08.r", knit=FALSE)




## Ejercicio 1


#' importamos guardando los caracteres como factores
hatco <- read.csv("hatco2.csv", header=TRUE, as.is=NA)

within(hatco, {
    hatco$empresa <- factor(hatco$empresa)
})

str(hatco)


## Ejercicio 2


#' Observamos la posible relación entre las variables
plot(hatco[,c(6:13)])
#' Vemos que algunas de las variables están relacionadas de manera lineal,
#' pero no todas tienen relación entre si


#' Ajustamos el modelo de regresión lineal múltiple
mod1<-lm(fidelidad~
    velocidad + precio + flexprec + imgfabri + servconj + imgfvent + calidadp,
    hatco)

#' los valores estimados se obtienen de los coeficientes anteriores
summary(mod1) #' tambien se pueden ver aquí o simplemente con mod1

#' Donde la variable estimada ofrece una estimación de la fideidad de un producto

#' en la útlima linea del summary aparece el valor de la p-valor, que nos indica
#' que el modelo es significativo

#' Tambien podemos observar el valor de R², que nos indica la relación entre
#' la variable fiabilidad y las variables que construyen el modelo (explicativas). Es explicado en un 77%

anova(mod1) 



## Ejercicio 3


plot(hatco[, c(2:7)])

mod2 <- lm(fidelidad ~ tamano + adquisic + tindustr + tsitcomp + velocidad + precio, hatco)
mod2
summary(mod2)
anova(mod2)
#' El R^2 ronda el 80%
#' al nivel de significación 5%, todas las variables del mod2 son significativas 
#' salvo tindustr (con p-valor 0.13 > 0.05)




## Ejercicio 4


#' Veamos si podemos prescindir del término constante
summary(mod1)
#' Vemos que el p-valor del término constante es 0.044 < 0.05, luego no se rechaza a este nivel de significación
#' Si el nivel de significación fuera 0.01, sí se rechazaría el término constante


#' Faltan los ejercicios del 5 en adelante. 
#' Eliminados para poder hacer la práctica 9, debido a fallos