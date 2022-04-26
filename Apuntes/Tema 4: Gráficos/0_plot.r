##############################
########## PLOT ##############
##############################

plot(cars$speed, cars$dist) # plot(vectorX, vectorY)

head(cars) # información de los datos. Distancia de frenado en función de la velocidad


# Hay tabla de parámetros de la función en pagina 5 tema 4
plot(cars$speed, cars$dist, type="l") # ejemplo

plot(cars$speed, cars$dist, main="Diagrama de dispersión",
                            pch="21", col="blue", bg="cyan", cex="1.5",
                            xlab="Distancia de frenado (pies)",
                            ylab="Velocidad (millas por hora)") # ejemplo

colours() # Colores disponibles en R por nombre
palette() # COlores disponibles por numero del 1 al 8
rainbow(20) # Vector de 20 colores del arcoiris


# Area en función del radio de un circulo
radio <- 0:10
area <- pi * radio^2
plot(radio, area)
plot(radio, area, type="b",
    main="Área de un circulo", 
    xlab="Radio (r)", ylab="Area == pi*r^2") # otra forma. Imprime la formula


# Tipo de dato ts
class(AirPassengers)
# es un tipo predeterminado que está configurado para ser impreso en gráfica
plot(AirPassengers)

# Tipo de dato factor
class(ChickWeight$Diet)
plot(ChickWeight$Diet) # Imprime grafico de barras por defecto al imprimir factor

# Tipo de dato tabla
class(Titanic)
plot(Titanic) # Imprime grafico de mosaico


##############################
########## CURVE #############
##############################



# Impresión de funciones matematicas
curve(x^3-3*x) # imprime por defecto en el intervalo [0,1]
curve(x^3-3*x, -2, 2)
curve(x^3-3*x, -2, 2, ylab=expression(f(x)==x^3-3*x)) # imprime la funcion en la etiqueta ylab
                                    # imprime la notacion matematica

# Función de densidad de la normal
dnorm(0:10:1, 0, 1)

curve(dnorm(x, mean=10, sd=2), 4, 16, ylab="Densidad",
            main="Distribución normal")


# superposición de funciones
curve(x^2, -1, 1)
curve(x^4, col=2, add=TRUE) # col=2 es el color de la linea. No es necesario indicar el intervalo cuando se va a superponer


# EJERCICIO
curve(dnorm(x, mean=0, sd=0.5), -8, 8, ylab="Densidad",
            main="Distribución 1")
curve(dnorm(x, mean=0, sd=1),
            main="Distribución 2", col=2, add=TRUE)
curve(dnorm(x, mean=3, sd=1),
            main="Distribución 3", col=3, add=TRUE)

