# FUNCIONES BÁSICAS

#f <- function(argumentos) {
#    sentencias
#
#    valor devuelto # obligatoriamente la última sentencia
#}

f.suma2 <- function(a,b) { # suma de dos OBJETOS
    a + b
}

f.suma2(3,4) # = 7
f.suma2(1,NA) # = NA
f.suma2(1:10,2) # recicla y suma dos vectores
f.suma2(diag(3), 1:3)
f.suma2(1) # ERROR faltan argumentos

f.suma2 <- function(a=0,b=0) { # añadimos valor por defecto para evitar errores
    a + b
}
f.suma2(1) # esto ya no da error

f1 <- function(x,y) { # Esta función siempre va a devolver 24, por ser la última sentencia
    x + y
    24
}

f1 <- function(x,y) { # Podemos forzar la devolución del resultado
    return(x + y)
    24
}

f2 <- function(x,y) { # Podemos forzar la devolución del resultado
    x^2
    return(list(suma=x+y, resta=x-y))
    y^2
}

# EJERCICIO PROPUESTO EN TEORIA
f.media1 <- function(vector) {
    vperdidos <- length(vector[is.na(vector)]) 
    # vperdidos <- sum(is.na(vector)) 

    vector[is.na(vector)] <- 0
    media <- sum(vector) / (length(vector) - vperdidos)
    return(c(media, vperdidos))
}

f.media2 <- function(xi, ni=1) {
    tamano <- sum(ni)

    if (tamano == 0) {
       return(list(0,0))

    } else {
        media <- sum(xi * ni) / tamano
        return(list(media, tamano))
    }
}