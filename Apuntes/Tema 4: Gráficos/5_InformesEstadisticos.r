# Renderizado de documento para exportacion de html
# (desde RStudio)

library(rmarkdown)

render("prueba.Rmd")

# Se crea un fichero intermedio que despues se elimina
# Para que no borre este archivo introducimos lo siguiente

render("prueba.Rmd", clean = FALSE) # no es necesario

# Para abrir el documento html en el buscador
browseURL(url=render('ejemplo1.Rmd'))

# Las ediciones en el documento se actualizan sobre la marcha en el
# documento preview

# Al indicar include=FALSE, se evita que aparezca en el documento
```{r setup, include=FALSE}


# Empezar con ``` es equivalente a $$
# Si usamos uno solo es equivalente a $ 