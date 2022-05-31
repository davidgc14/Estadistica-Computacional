# Ejercicios de repaso del archivo subido a la página de prado
# Ensayo de examen parcial 1

###################################
######### Ejercicio 1 #############
###################################

set.seed(1)
x <- runif(10)

# 1.1

mx <- mean(x)
pos.media <- which.max(abs(x-mx))
print(x[pos.media] + " es el valor más cercano de la media, en la posición " + pos.media)


# 1.2

long <- length(x[x<mx])


# 1.3

sort(x)[-c(1:long)]


# 1.4

A <- matrix(c(x,abs(x-mx)), ncol=2)



###################################
######### Ejercicio 2 #############
###################################


# 2.1

hatco <- read.table("hatco.txt", header = TRUE)


# 2.2

hatco <- within(hatco,{
    x8 <- factor(x8, labels=c("pequeña", "grande"))
})


# 2.3

hatco <- within(hatco,{
    cliente <- as.character(hatco$cliente)
})
# Así mejor
hatco$cliente <- as.character(hatco$cliente)


# 2.4

hatco.clasificado <- split(hatco, hatco$x8)
longitud.peq <- length(hatco.clasificado$pequeña$x8)
longitud.grande <- length(hatco.clasificado$grande$x8)

hatco.clasificado$pequeña[sample(1:longitud.peq,1),]
hatco.clasificado$grande[sample(1:longitud.grande,1),]


# 2.5

fidelidad.mx <- mean(hatco$y)
fidelidad.mx.peq <- mean(hatco.clasificado$pequeña$y)
fidelidad.mx.grande <- mean(hatco.clasificado$grande$y)


# 2.6

sum(hatco.clasificado$pequeña$y > fidelidad.mx.peq)
sum(hatco.clasificado$grande$y > fidelidad.mx.grande)


# 2.7

# scale(hatco, scale=FALSE)



###################################
######### Ejercicio 3 #############
###################################


# 3.1

#sin recursividad
prog.aritm <- function(a1, n=1, d) {
    
    # Control de errores
    if(!is.numeric(n) || !is.numeric(d) || !is.numeric(a1)){
        stop("Revise que los valores entrantes sean numéricos")
    }else if (n < 2) {
       warning("El valor de n es inferior a 2, 
                no se calculará ninguna iteración.")
       return(list(a1, a1, a1))
    }
    
    vector <- numeric(n)
    vector[1] <- a1

    for (i in 2:n) {
        vector[i] <- vector[i-1] + d
        # vector[i] <- a1 + d*i
    }

    return(list(vector, sum(vector), prod(vector)))
}


# prog.aritm.R <- function(a1, n=1, d) {

#     # Control de errores
#     if(!is.numeric(n) || !is.numeric(d) || !is.numeric(a1)){
#         stop("Revise que los valores entrantes sean numéricos")
#     }

#     vector <- numeric(n)
#     vector[1] <- a1
    
#     if (n < 2) {
#        return(list(vector, sum(vector), prod(vector)))
#     } else {
#         return(prog.aritm.R(a1,n-1,d))
#     }
    

#     for (i in 2:n) {
#         vector[i] <- vector[i-1] + d
#         # vector[i] <- a1 + d*i
#     }

#     return(list(vector, sum(vector), prod(vector)))
# }


prog.aritm2 <- function(a1, n=1, d, explicit=FALSE) {
    
    # Control de errores
    if(!is.numeric(n) || !is.numeric(d) || !is.numeric(a1)){
        stop("Revise que los valores entrantes sean numéricos")
    }else if (n < 2) {
       warning("El valor de n es inferior a 2, 
                no se calculará ninguna iteración.")
       return(list(a1, a1, a1))
    } else if (d == 0) {
        warning("El valor de d es 0,
                se tendrá una sucesión constante")
        return(list(rep(a1,times=n), n*a1, a1^n))
    }
    
    vector <- numeric(n)
    vector[1] <- a1

    for (i in 2:n) {
        vector[i] <- vector[i-1] + d
        # vector[i] <- a1 + d*i
    }

    if (explicit) {
        sum <- n * (vector[1] + vector[n]) * 0.5
        prod <- (d^n) * (gamma(n + vector[1]/d) / gamma(vector[1]/d))
        return(list(vector, sum, prod))
    } else{
        return(list(vector, sum(vector), prod(vector)))
    }
}
