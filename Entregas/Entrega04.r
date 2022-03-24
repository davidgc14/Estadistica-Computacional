#############################################
############### EJERCICIO 1 #################
#############################################

# Apartado a)
censo <- read.csv("Census.csv", header=TRUE, as.is=c(2,5,7,8,9,10)) # Tenemos encabezado y separador de coma

# Apartado b)
str(censo)

# Apartado c)
lapply(censo,is.na)

# Apartado d)
colcompletas <- complete.cases(t(censo))

# Apartado e)
censo2 <- censo[,-c(colcompletas)] # Esto está mal
censo2 <- subset(censo, subset=colcompletas) # esto tambien

# Apartado f)
write.table(censo2, file="censo2.txt", col.names=TRUE, sep="\t")

# Apartado g)
datos3 <- read.table("censo2.txt", header=TRUE, sep="\t")



#############################################
############### EJERCICIO 2 #################
#############################################

# Apartado a)
matriz <- matrix(rnorm(50), nrow=10, ncol=5, dimnames=list(c(),c("col1", "col2", "col3", "col4", "col5")))
# También colnames(matriz) <- c("col1", "col2", "col3", "col4", "col5")

# Apartado b)
write.table(matriz, file="matriz.txt", col.names=TRUE, sep=",")

# Apartado c)
matrix2 <- read.table("matriz.txt", header=TRUE, sep=",")
attach(matrix2)



#############################################
############### EJERCICIO 3 #################
#############################################

# Apartado a)
olympics <- read.csv("Olympics100m.csv", header=TRUE, as.is=c(1,2,3))