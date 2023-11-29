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


#### SINTAXIS BASICS DEL HISTOGRAMA   geom_histogram()
# 
# Haz un histograma de fechas básico asignando el eje X a la columna date_onset. 
# Cambia su coloración por defecto a “darkgreen” (“verde oscuro”).

################ escriba en este espacio su codigo/comando



#######################

# ADVERTENCIAS Y ERRORES
# Mira en tu consola de R, donde se imprime el comando que has ejecutado. Ves una advertencia, escrita en rojo?
# En R, se da un “warning” si R pudo ejecutar tu comando, pero encontró algo inesperado que cree que debes saber.
# Por el contrario, un “error” significa que R no pudo ejecutar su comando.

#################  PREGUNTA #########################

# ¿Qué significa esta advertencia (se han eliminado XX filas que contienen valores no finitos)?

# Que esos casos tenían un sentido del humor infinitamente malo
# Esos casos tenían valores de fecha fuera del rango del gráfico
# Que esos casos tenían valores de date_onset que faltaban y, por tanto, no se podían trazar.
# Ese ggplot acaba de eliminar esas filas de su dataframe del listado

# Histogramas apilados
# Ahora intenta hacer un histograma para la columna “age_years”, con el “relleno” 
# asignado dinámicamente al gender

################ escriba en este espacio su codigo/comando



#######################

# intervalos en el histograma
# Los histogramas muestran “barras”, pero no hay espacio entre ellas. Esto se debe a 
# que la variable es continua. Aun así, se puede ajustar el tamaño y la frecuencia de los “bins” 
# (barras de un mismo ancho) del histograma.
# 
# Intente ejecutar el histograma con los siguientes ajustes (uno a la vez):
  
# bins = 100 dentro de geom_histogram()
# bins = 15 dentro de geom_histogram()
# bin_width = 5 dentro de geom_histogram()

################ escriba en este espacio su codigo/comando



#######################


# fin
