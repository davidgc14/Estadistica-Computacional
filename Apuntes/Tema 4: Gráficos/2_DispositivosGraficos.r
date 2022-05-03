# Función para generar un dispositivo gráfico vacío
# Se pueden meter parametros para indicar dimensiones 

# Windows
windows()

# Unix
X11()

# MacOS
quartz()



#############################
######## EXPORTACION ########
#############################

pdf()
postscript()
jpeg()
png()
bmp()



#############################
######### MANEJO ############
#############################

# Funciones de control de dispositivos gráficos





# Ejemplo de trabajo

    # Bloque 1: Generación de datos para los gráficos
    x <- seq(0,2*pi,length.out=20)
    set.seed(2)
    y1 <- sin(x) + 0.3*rnorm(20)
    y2 <- sin(x) + 0.15*rnorm(20)

    # Bloque 2: Iniciar un dispositivo gráfico (número 2) y representar (x,y1)
    X11()
    plot(x, y1, type='o', pch=15, col=2)
    
    # Bloque 3: Iniciar otro dispositivo gráfico (número 3) y representar (x,y2)
    X11()
    plot(x, y2, type='o', pch=16, col=4)
    dev.list() # Lista de dispositivos
    dev.cur() # Número del dispositivo actual
    
    # Bloque 4: Añadir la curva $f(x)=sen(x)$ a ambos gráficos
    # primero en rojo en el dispositivo 2
    dev.set(3) # cambiar a dispositivo activo 3
    curve(sin(x), add=TRUE, col=2, lty=3)
    # después en azul el dispositivo 4
    dev.set(4) # esto no sería necesario (4 es el dispositivo actual)
    curve(sin(x), add=TRUE, col=4, lty=3)
    
    # Bloque 5: Comparar las dos gráficas en un nuevo dispositivo (4)
    # en este caso será un fichero con nombre 'graf.pdf'
    pdf('graf.pdf') # genera el archivo sobre el que vamos a escribir
    par(bty='n') # eliminamos los bordes de la grafica. Aqui se pueden modificar muchas cosas
    plot(x, y1, pch=15, col=2, ylab='')
    points(x, y2, pch=16, col=4)
    # añadimos segmentos entre los puntos
    segments(x,y1,x,y2,col='purple')
    # y la curva f(x)=sen(x) de referencia
    curve(sin(x),add=TRUE,lty=3)
    
    dev.off() # cerramos el dispositivo actual (el pdf)



#############################
####### ADICIONALES #########
#############################

