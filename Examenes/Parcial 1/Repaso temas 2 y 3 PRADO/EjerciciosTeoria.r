# Pág. 14 Tema2_2.pdf
# Hallar la menor desviación de la media de una distribución uniforme de 100 valores

x <- runif(100)
media <- mean(x)

desviaciones <- abs(x-media)

which.min(desviaciones)



# Pág. 7 Tema3.pdf
# Crea una función que calcule la media de un vector de n elementos. La función tendrá como nombre 
# media1 y un único argumentox (el vector). El cálculo de la media lo debes hacer descartando posibles 
# valores perdidos ( NA ) en el vector. Como resultado la función devolverá un objeto de tipo vector con 
# dos elementos: la media calculada y el número de valores perdidos que había en el vector.

