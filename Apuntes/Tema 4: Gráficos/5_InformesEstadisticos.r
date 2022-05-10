# Renderizado de documento para exportacion de html
# (desde RStudio)

library(rmarkdown)

render("prueba.Rmd")

# Se crea un fichero intermedio que despues se elimina
# Para que no borre este archivo introducimos lo siguiente

render("prueba.Rmd", clean = FALSE)

# Para abrir el documento html en el buscador
browseURL(url=render('ejemplo1.Rmd'))
