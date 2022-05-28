###############################################
################### F. PLOT ###################
###############################################

# DataFrame con dos columnas, x e y
plot(cars)

# control completo
plot(cars,  type = "b", # p, l, c, h, o, s...
            main = "Distancia vs Velocidad",
            xlab = "Velocidad", ylab = "Distancia",
            xlim = c(0, 25), ylim = c(0, 130),
            col = "green", 
            # puntos:
            pch = 21, # código de forma de los puntos
            bg = "blue", # color de fondo de punto
            cex = 1.5, # tamaño de los puntos
            lty = 3, # linea continua - discontinua
            lwd = 5) # grosor de la linea

# Añadir expresión matemática en la etiqueta de la leyenda
plot(cars,  main = expression(Energía == m * c^2 * sqrt(5)))

# Impresión de data frame matricial
plot(AirPassengers)

# Impresión de data frame con factores
plot(ChickWeight$Diet)

# Vector de colores 
colors()

# Vector reducido de colores
palette()


###############################################
################# ADHERIDOS ###################
###############################################

# Función curve
curve(x^3 - 3*x, -2, 2, ylab = expression(f(x) == x^3-3*x))

# Superposición de funciones
curve(x+0, -2, 2, col = 'red', add = TRUE)
