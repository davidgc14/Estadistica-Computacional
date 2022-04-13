# BUCLES FOR

letters[1:10] # diez primeras letras

lista <- list(matrix(1:6,2,3), 1:2)

for (i in lista) {
    print(i)
}

# Formas de cortar el bucle

# next

for (i in 1:5) {
    if (i %% 2) {
        print(i)
    }
    else { # esto se puede omitir
       next
    }
}

# break

set.seed(1) # fijamos semilla
x <- runif(100) 
suma <- 0

for (i in 1:100) {
    suma <- suma + x[i]
    if (suma > 0.5) {
        print("Me paro en i = ", i)
        break
    }
}


# return

f <- function(x) {
    suma <- 0
    for (i in 1:100) {
        suma <- suma + x[i]
        if (suma > 1) {
            return(paste("Me paro en i = ", i))
        }
    }
    return(paste("La suma es ", suma))
}



# BUCLES WHILE

set.seed(1)
i <- suma <- 0
x <- numeric() # vector de numeros de longitud variable. A priori 0

while (suma < 1) {
    i <- i + 1
    x[i] <- runif(1, 0, 0.1) # uniforme en (0,0.1)
    suma <- suma + x[i]
}# Lo que hacemos es crear sobre la marcha valores nuevos, y su longitud será en función de la suma



# BUCLES REPEAT
# repeticiones infinitas

set.seed(1)
i <- suma <- 0
x <- numeric()

repeat { # a priori no tiene condicion de salida
    i <- i + 1
    x[i] <- runif(1, 0, 0.1)
    suma <- suma + x[i]
    if (suma > 0.5) {
        break
    }
}


# MEJORAS A LOS BUCLES

# sumas por columnas/filas de una matriz
M <- matrix(1:6,2,3)
rowSums(M)
colSums(M)
# no necesario hacer bucles anidados
