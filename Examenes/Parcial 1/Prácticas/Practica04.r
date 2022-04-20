#############################
######## Ejercicio 1 ########
#############################


# 1.1

# Almacenamiento selectivo de columnas de tipo factor
hatco <- read.table("hatco.txt", header=TRUE, sep="\t") 
hatco$x8 <- as.factor(hatco$x8)


#############################
######## Ejercicio 2 ########
#############################


# 2.1

M <- matrix(rnorm(50), nrow=10, ncol=5)
colnames(M) <- c("a", "b", "c", "d", "e")
