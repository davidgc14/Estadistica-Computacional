# Funciones de medición

medias <- function(x) {
    if (!is.numeric(x)) stop("El vector debe ser numérico")
    
    x <- x[!is.na(x)]
    
    m.geo <- function (x) exp(mean(log(x)))
    
    m.arm <- function (x) 1/mean(1/x)
    
    mx.geo <- if(min(x)>0) m.geo(x) else NA
    
    mx.arm <- if(any(x==0)) NA else m.arm(x)
    
    if (is.na(mx.geo) || is.na(mx.arm)) warning("El vector tiene valores negativos o cero")
    return(list(media.aritm=mean(x), media.geom=mx.geo, media.arm=mx.arm))
}


mediana <- function(x) {
    if (missing(x)||!is.numeric(x)) {
        stop("Debe proporcionar un argumento 'x' numérico")
    }

    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)

    if (n%%2 == 0) {
        return((xord[n/2]+xord[1+ n/2])/2)
    } else {
        return(xord[ceiling(n/2)])
    }
}

> cuartiles <- function(x) {
    if (missing(x)||!is.numeric(x)) stop("Debe proporcionar un argumento 'x' numérico")
    
    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)

    ## Q1 ocupa la posición (n+1)/4 (interpolando si es decimal)
    pos.Q1 <- (n+1)/4
    i <- trunc(pos.Q1)
    Q1 <- x[i] + (pos.Q1-i)*(x[i+1]-x[i])
    
    ## Q2 es la mediana
    if (n%%2 == 0) {
        Q2 <- (xord[n/2]+xord[1+ n/2])/2
    } else {
        Q2 <- xord[ceiling(n/2)]
    }

    ## Q3 ocupa la posición 3*(n+1)/4 (interpolando si es decimal)
    pos.Q3 <- 3*(n+1)/4
    i <- trunc(pos.Q3)
    Q3 <- x[i]+ (pos.Q3-i)*(x[i+1]-x[i])
    
    return(list(Q1=Q1,Q2=Q2,Q3=Q3))
}

# función por defecto
quantile(1:10, probs=c(0.25, 0.5, 0.75))