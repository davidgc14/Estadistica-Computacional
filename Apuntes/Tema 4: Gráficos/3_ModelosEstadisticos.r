##########################
####### REGRESIÓN ########
##########################


# Lineal simple

y ~ x # también se puede y ~ x + 1 indicando que hay una variable constante
y ~ x - 1 # cuando no hay valor constante. También se puede y ~ x + 0


# Regresión polinomial



############################
### AJUSTE MODELO LINEAL ###
############################

lm(formula, data) # formula: modelo lineal, data: data frame con datos por columnas
# devuelve un objeto tipo lista especial: tipo lm


# regresión de minimos cuadrados ponderados
weights() # Argumento opcional

