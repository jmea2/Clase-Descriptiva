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


# GRAFICOS DE DISPERSION
# Escriba un nuevo comando ggplot() que utilice listado de vigilancia surv. 
# Utilice geom_point(), y dos variables continuas: age_years y ht_cm asignadas al eje X y al eje Y, respectivamente.

############ coloque y ejecute aqui su codigo para el grafico de barras



###############################################################

# Espero halla salido el grafico, de no ser asi, revisa la sintaxis, ¿qué te falto ?, ¿qué hiciste mal?
  
# A continuación, añada el parámetro de estética color = y asígnela dinámicamente a la columna age_cat.

############ coloque y ejecute aqui su codigo para el grafico de barras




###############################################################
# Esto parece más estético, pero en realidad no es tan útil. Sin embargo, 
# sirve para mostrar que las categorías de edad se alinean con los valores continuos.
# 
# ¿Qué pasa si asignas dinámicamente la estética color = a la columna gender? 


############ coloque y ejecute aqui su codigo para el grafico de barras



###############################################################
# ¿Es capaz de ver algún patrón en los datos? Sigue siendo difícil.

height_plot <- ggplot(data = surv, mapping = aes(x = age_years, y = ht_cm, color = gender))+
  geom_point()

ggMarginal(height_plot)


# Añadiendo medias suavizadas a un gráfico de dispersión
# Por último, intente otro gráfico de dispersión, utilizando date_report en el eje X y diff 
# en el eje Y. Añade geom_smooth() para ver una línea de tendencia.

############ coloque y ejecute aqui su codigo para el grafico de barras



###############################################################

# fin




