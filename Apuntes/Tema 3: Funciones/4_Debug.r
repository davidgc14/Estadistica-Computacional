# ERRORES Y DEPURACIÓN #

# Función warning y Stop

log.natural <- function(x) {
    if (missing(x) || !is.numeric(x)) {
        stop("Debe proporcionar un argumento 'x' numérico") # para la ejecución de la función
    } else if (any(x<=0)) {
        x <- x[x > 0]
        warning("Se han eliminado los valores negativos o cero") # imprime mensaje pero continua con la ejecución
    }
    return(log(x))
}


# TRACEBACK

f <- function(x) {
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}

traceback() # indica los pasos que ha seguido hasta encontrar el error


# BROWSER

f <- function(x) {
    browser() # Permite debugear desde la terminal
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
mean(f(-2))
# desde la terminal podemos escribir get("n") para obtener valores de variables locales
# tambien permite cambiar los valores de las variables de manera interactiva

# Q corta el debug y para
# c corta el debug y termina



# DEBUG

f <- function(x) {
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
debug(f) # cuando se ejecute f se explora sólo la función f
mean(f(-2))

undebug(f) # se corta el debugueo automático

debugonce(f) # debuguea solo una vez, cuando se ejecute la función
# evitando así escribir el undebug

debug(f)
debug(mean) # se puede depurar en todos los niveles necesarios

 

