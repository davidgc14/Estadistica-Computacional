pdf("Gráfico--edades.pdf")
 
edades <- c(20, 33, 40, 12, 50, 26, 18, 79, 47, 23, 8)
plot(edades, main = "Edades", xlab = "Nº de orden", ylab = "Años")
 
dev.off()