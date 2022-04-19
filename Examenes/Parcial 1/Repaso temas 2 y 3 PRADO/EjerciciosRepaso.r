# Ejercicios de repaso del archivo subido a la página de prado
# Ensayo de examen parcial 1

###################################
######### Ejercicio 1 #############
###################################

set.seed(1)
x <- runif(10)

# 1.1

mx <- mean(x)
pos.media <- which.max(abs(x-mx))
print(x[pos.media] + " es el valor más cercano de la media, en la posición " + pos.media)


# 1.2

long <- length(x[x<mx])


# 1.3

sort(x)[-c(1:long)]


# 1.4

A <- matrix(c(x,abs(x-mx)), ncol=2)


###################################
######### Ejercicio 2 #############
###################################


# 2.1

hatco <- read.table("hatco.txt", header = TRUE, sep="\t")
