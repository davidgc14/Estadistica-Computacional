# Renderizado de documento para exportacion de html
# (desde RStudio)

library(rmarkdown)
library(knitr)

render("prueba.Rmd")

# Se crea un fichero intermedio que despues se elimina
# Para que no borre este archivo introducimos lo siguiente

render("prueba.Rmd", clean = FALSE) # no es necesario

# Para abrir el documento html en el buscador
browseURL(url=render('prueba.Rmd'))

# Las ediciones en el documento se actualizan sobre la marcha en el
# documento preview

# Al indicar include=FALSE, se evita que aparezca en el documento
```{r setup, include=FALSE}


# Empezar con ``` es equivalente a $$
# Si usamos uno solo es equivalente a $ 


# Convertir de Rmd a R
purl('prueba.Rmd', 'script_prueba.r')

# Convertir a script incluyendo cometarios
purl('prueba.Rmd', 'script_prueba.r', documentation = TRUE)


# Convertir de R a html y md
spin('script_prueba.r')

# Abrir en buscador
browseURL(url=spin('script_prueba.r'))


# Documento latex codificado para R con extension .Rnw