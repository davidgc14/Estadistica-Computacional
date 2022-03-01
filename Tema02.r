## VECTORES Y MATRICES


# Funcion concatenación
v <- c(1,2,3,4,5)
w <- c(-1,0,v,6)

# Vector caracteres
carac <- c("uno", "dos")
mezcla <- c(w,carac)

# Asignación de nombre a los elementos de un vector
names(x) <- ("x1", "x2", "x3", "x4", "x5")

# secuencias regulares
1:10
seq(1,10) # sec(10) empieza automáticamente desde 1
seq(1,10,2)
seq(1,10,by=2) # saltos de distancia 2
seq(1,10,length.out(15)) # 15 elementos en el intervalo 1,10
seq(2, by=2, length.out(20)) # 20 primeros numeros pares

des <- seq(20,10) # admite vectores descendentes


# Vector mediante repetición 
rep(des, each=2) # repetir cada valor dos veces
rep(des, each=2, times=3) 
rep(1:5, times=1:5)


# Inicialización de vectores regulares
vector("numeric", 3)
vector("logic", 5)
vector("character", 2)
