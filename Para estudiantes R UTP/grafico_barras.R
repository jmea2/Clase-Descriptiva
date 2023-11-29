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

# Ahora que ya has explorado los puntos, los diagramas jittered, de caja y los violines, 
# vamos a probar otros geoms o formas:
# Se podría utilizar un gráfico de barras para mostrar el número de casos notificados en cada distrito.
# 
# Intenta un comando usando el geom geom_bar().
# 
# Tenga en cuenta que sólo debe suministrar una estética x = - no hay necesidad de y = ya que el número de 
# filas en el conjunto de datos se contará individualmente.


# PISTA:   En este nuevo comando ggplot, elimine los comandos geom_jitter() y geom_boxplot(). 
#Sustitúyelos por un comando geom_bar().

############ coloque y ejecute aqui su codigo para el grafico de barras



########################################################################

# Las filas de los datos se han mostrado ahora como un gráfico de barras.
# 
# ¿Puedes cambiar las barras para que sean todas del color “lightblue” usando el argumento fill? 
# (piense: dónde debe colocarse este argumento, ya que “lightblue” es una asignación a un valor estático)

############ coloque y ejecute aqui su codigo para el grafico de barras




########################################################################

# ESTABLECER LA ESTETICA DE FORMA DINAMICA

# El gráfico anterior examinaba la edad como variable continua (en el eje Y).
# 
# ¿Cómo cambiaríamos el gráfico anterior que muestra la distribución de la edad en cada distrito?
# Cambie el gráfico para que la estética de “relleno” (fill) se asigne dinámicamente, a una columna 
# “categórica” del conjunto de datos.

# Revise en la base de datos como se llama esa variable que contiene la edad categorizada e intente con esa 
# crear el grarico de barras donde las barras muestre la distribucion de la edad por distrito (columna del grafico)

################# coloque y ejecute aqui su codigo para el grafico de barras



########################################################################

# ORDEN DE LAS BARRAS APILADAS
# ¿Y si quieres invertir el orden de las barras?
# Tal vez quiera la categoría de edad más joven en la parte inferior: le daremos este código:

# Deberia ser igual al que ud en el ejercicio anterior realizo , pero, ¿Que ve de diferente?

ggplot(data = surv, mapping = aes(x = district, fill = fct_rev(age_cat)))+
  geom_bar()

# BARRAS ADYACENTES
# geom_bar() acepta el argumento position =, que puede ser asignado al valor “dodge”. 
# Intente añadir este parámetro a geom_bar() ANTERIOR y vea qué ocurre (no olvide las comillas).

####################### coloque y ejecute aqui su codigo para el grafico de barras




##################################################

# acorde al script anterior, agregue a este grafico que ha consutrido, etiquetas a los Ejes, nonmbre a la leyenda

# fin



