
######################### Ejercicio Practio para clase sobre visualizacion de datos ######################
# Isntructor: Jorge Mario Estrada Alvarez MSc.
# Curso de R para el análisis de datos de la vigilancia epidemiológica y 
# datos asociados a investigación epidemiológica
# Creando visualizaciones con ggplot2

# librerias a usar durante esta sesion
install.packages("pacman")

pacman::p_load(tidyverse, cowplot, ggExtra, gghighlight, rio)

# Ejecutar la siguiente linea con el fin de descargar los datos de esta sesion.

surv <- import("https://raw.githubusercontent.com/jmea2/R-Epi_Campo/main/surv.csv")


# FACETAS
# Ese histograma apilado puede ser difícil de interpretar.
# escriba un codigo para un histograma de la variable age_years y coloca un relleno dinamico sobre la variable
# genero y ejecuta el codigo

# Espero que el grafico halla salido !!!!

################ escriba en este espacio su codigo/comando



#######################


# En R, el “facetado” es el proceso de crear 
# un gráfico más pequeño para cada categoría de una variable (también llamado “múltiplos pequeños”).
# 
# Esto se hace añadiendo el comando facet_wrap() al comando ggplot. Dentro de esta función, escriba 
# el siguiente simbolo (~) y el nombre de la columna que se desea facetear (debe ser variable categorica) 
# en el lado derecho.

# pista: el facet debe ir despues de la geometria adicionado: + facet_wrap(~ columna/variable) 
################ escriba en este espacio su codigo/comando



###########################################################


# fin
