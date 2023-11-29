
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


# Este ejercicio le guiará a través de un conjunto de tareas. Debe realizar estas tareas en 
# RStudio en su ordenador o computadora local

# En este ejercicio aprenderás:

# La sintaxis de la “gramática de los gráficos” utilizada por {ggplot2}
# Hacer histogramas sencillos, diagramas de caja (boxplot), gráficos de barras, diagramas de 
# dispersión y gráficos de líneas
# Ajuste del color, del relleno y la forma a través de los parámetros estéticos de la trama


# Graficos sencillos --------------------------------------------------------------------------

ggplot(data = surv)

# Este comando ha “abierto” el marco o lienzo del gráfico para que podamos añadir más elementos 
# encima de este (como columnas, líneas, etc.)

# Ahora que tenemos un lienzo, necesitamos decirle a R lo que queremos en el eje X y en el eje Y. 
# Las columnas que mapearemos a los ejes son simples ejemplos de la “estética” del gráfico. 
# Observe esta palabra "estética" - la raíz aes** (de aesthetics en inglés) se convierte en parte del siguiente 
# comando de R.

# El segundo argumento de ggplot() es mapping = aes(). Aquí es donde se mapean las columnas de los datos a 
# los componentes del gráfico. Específicamente, esto es para los componentes del gráfico que permiten variar 
# para cada fila de datos.
# 
# Por ejemplo, si “mapeamos” el eje Y a la columna edad_años, entonces cada fila de los datos será evaluada y 
# podrá colocarse en una altura diferente en el eje Y.

#  aes()
# El argumento mapping = aes() es atípico ya que debes proporcionarle los valores dentro de la función `aes().
# 
# mapping = aes(x = COLUMNA, y = COLUMNA)
# 
# Recuerde que este código está ocurriendo dentro de la función ggplot(). El propio mapping = aes() 
# ES el segundo argumento esperado para ggplot().
# 
# Intenta escribir un comando ggplot() en el que asignes el eje X a la columna district, 
# y el eje Y a la columna age_years, y luego responde a las preguntas sobre el gráfico que aparecen a continuación:

################# escribe en este esapcio el codigo y ejecutalo.... 



######################################################################

# Cuántos intérvalos hay en el eje X?
# 12
# 9
# 10
# 4

# ¿Cuál es el intervalo de la etiqueta del eje Y por defecto?
# 5
# 20
# 30
# 10

# Añadendo capas geométricas
# Ahora que tenemos nuestro lienzo, y hemos designado nuestros ejes… ¡podemos empezar a visualizar los datos!
#   
# Esto se hace añadiendo comandos geom_(), que crean cada uno un tipo diferente de visualización.
# 
# Hemos logrado hacer un componente completo del comando ggplot() - los paréntesis están cerrados, 
# y el comando puede ejecutarse sin error. Entonces, ¿cómo añadimos componentes adicionales al gráfico?
 
# Añadir componentes del comando con +
# El símbolo “más” o “suma” (+) conecta las diferentes líneas del comando ggplot(). En cierto modo, 
# es como el operador “Tubería” o “pipe”, pero enlaza comandos dentro del ggplot.

# Agrega el signo de suma, y en la nueva línea escribe geom_point(). A continuación, escriba y ejecute el comando

# pista: al anterior codigo agreguele con un + el geom_point()


################# escribe en este esapcio el codigo y ejecutalo.... 



######################################################################

# Puede agregar una sangría al nuevo comando, para indicar al lector que es un subcomponente de ggplot(), 
# pero el comando se ejecutará de cualquier manera.

# ¿Cuántos casos se registraron en el distrito Central I?
# 25
# 35
# No es posible saber
# 21

# Con una variable discreta en el eje X y una distribución continua en el eje Y, es difícil saber exactamente 
# cuántos casos hay. Cada punto representa un caso, pero podría estar viendo 5 puntos de la misma edad que se 
# superponen y se ocultan entre sí.

# Probemos otro geom para resolver este problema. Sustituye geom_point() por geom_jitter() y 
# vuelve a ejecutar el comando.

################ escriba en este espacio su codigo/comando



########################
# Diríjase al panel de ayuda de RStudio (junto al panel Plots) y busque “geom_jitter” en la barra de búsqueda 
# de la parte superior derecha
# Esta es la documentación en R de la función geom_jitter(). Cada función, ya sea en {base} R, o en 
# un paquete instalado, tiene documentación sobre sus funciones. Puede acceder a esta documentación sin 
# conexión - se almacena dentro de R una vez que el paquete es descargado.

# Tambien puede llamar la ayuda, escribiendo en la consola la funcion con el signo ? por delante y presionar enter:
?geom_jitter()

# Por ahora, haz lo siguiente:
# Lea la “Descripción” para entender exactamente lo que hace la función y evitar que se superpongan los puntos.

# Revise la lista de “Estética” cerca de la parte inferior. Se trata de otros aspectos estéticos que puedes 
# ajustar para variar la apariencia de esta capa geográfica.
# 
# Dentro de la función geom_jitter(), introduzca algunos de estos parámetros y pruebe con los siguentes ajustes:
#   
# color = "blue"
# size = 5
# shape = 4

################ escriba en este espacio su codigo/comando



#######################

# Dentro de gráfico en ggplot ¿Cúal cree que es la función del parametro alpha 
# como parte de la estética del gráfico? seleccione 1 opcion

# Ordenación alfabética
# Color del eje
# Transparencia
# Tamaño

# ¿Qué forma se produce al establecer shape= 3 dentro de geom_jitter()? seleccion 1 opcion
# Círculo
# Triángulo
# Más
# Cuadrado

# El gráfico tipo jitter o de fluctuación es interesante, pero vamos a añadirle alguna visualización estadística. 
# Añade geom_boxplot() debajo del comando geom_jitter(), no olvides usa el signo + para adicionarlo

################ escriba en este espacio su codigo/comando


#######################

# Imagino que ahora puedes ver dónde se encuentran los valores estadísticos resumidos de cada distrito, 
# como la mediana y los rangos intercuartílicos. Pero los puntos están ahora ocultos por los boxplots o 
# gráficos de caja.

# Agregar y ajustar la estética alpha = para los boxplots solamente. 
# ¿Qué valor de alfa le permite ver los gráficos más claros?


################ escriba en este espacio su codigo/comando



#######################

# Como alternativa, sustituya el geom_boxplot() por geom_violin(), y utilice el mismo nivel de alpha = que antes para 
# tener algo de transparencia.

################ escriba en este espacio su codigo/comando



#######################

# No hay mucha diferencia en las edades de los casos entre cada distrito… 
# probemos un gráfico de violín en otro momento. Prueba este código:

ggplot(data = surv, mapping = aes(x = gender, y = ht_cm))+
  geom_violin(alpha = 0.5, size = 2)



##############  QUIZ -Diagrama de violin ####################################
# ¿Qué hace aes(x = género, y = ht_cm) en este comando? selecciona 1 opcion

# “Establece el género como eje Y y la altura como eje X”
# Establece los ajustes esotéricos automatizados (AES)
# Establece el género como eje X y la altura como eje Y


# ¿Qué ajustó la estética ’size = ’ para estas parcelas de violín?

# Tamaño del violín
# Tamaño de la línea de borde
# Tamaño del gráfico
# Tamaño de las etiquetas del gráfico

#############################################################################


############################  PARA REFLEXIONAR ###################################

# Piensa en las siguientes preguntas:
#   
#   ¿Qué comunica el diagrama de violines que no comunica el boxplot?
#   ¿Qué comunica el diagrama de cajas que no comunica el diagrama de violines?
#   ¿Qué muestran los puntos que no muestran ni la caja ni el gráfico de violines?
#   ¿Cuál cree que es, en general, la mejor combinación de estas tres geometrías (puntos, boxplots, violines)?

##################### ESTETICA DINAMICA ######################################

# Hasta ahora, has estado editando estética como color, alfa, tamaño y forma asignándoles valores 
# estáticos como 3, “azul” o 0,2. Ahora, los asignaremos a columnas, y la visualización de cada punto 
# de los datos variará

# Volvamos a construir nuestro antiguo boxplot, con la estética color asignada estáticamente a “azul”, 
# y alfa asignada estáticamente a 0,5:
  
ggplot(data = surv, mapping = aes(x = district, y = age_years))+
  geom_jitter()+
  geom_boxplot(fill = "blue", alpha = 0.5)

# ¿Qué ocurre si ejecutas el comando anterior, pero sustituyes “blue” por el nombre de la columna: district?

################ escriba en el siguiente espacio su codigo/comando



#############################################################  Seleccione una opcion:

# Los gráficos de caja se reordenan por distrito
# Las cajas se convierten en la forma geográfica del distrito
# El relleno de las casillas (color) se hace diferente para cada distrito
# Hay un error de R que dice ‘object district not found’

######################################################################################
# ¿Qué hay que cambiar para que cada boxplot tenga un relleno (fill) diferente?:
# (explore una o varias opciones)

# Pruebe con otro nombre de columna
# Mueve esta parte del comando (‘fill = district’) dentro del aes()
# Pruebe el comando cinco veces más, como está escrito
# Reinicie R y vuelva a intentarlo

################ escriba en el siguiente espacio su codigo/comando que ha probado


##########################################################################

# Hay dos pasos importantes para resolver este error:
#   
# Cambia el valor “azul” por district (observa la falta de comillas alrededor de district)
# Mueve este argumento a dentro del mapping = aes() en la función superior ggplot().

# Dado que estamos asignando una columna al parametro de estética fill =, debe hacerse dentro del 
# “mapping” del ggplot. ¿Recuerdas cómo asignamos columnas al eje X y al eje Y? Esas asignaciones fueron 
# dinámicas también, y se encuentran dentro del mapping = aes()

################ escriba en este espacio su codigo/comando que ha probado


##########################################################################

#######  Color de los puntos

# ¿Cómo cambiarías el color de los puntos?

# Tenga en cuenta este matiz: Para los geoms que tienen área, como los gráficos de caja, 
# histogramas y gráficos de barras, el color interior se cambia con la estética fill=. 
# Sin embargo, la apariencia del color de los puntos (incluyendo geom_jitter()) 
# se cambia con el parametro de estética color=.

# Cambie el color de los puntos para que también varíen según el distrito, y establezca que el gráfico de 
# caja sea alpha = 0.2.

################ escriba en este espacio su codigo/comando que ha probado



##########################################################################

# Ahora, elimina el color = distritc del mapping = aes() - devuelve los puntos a su negro original.

# Vamos a añadir unas cuantas etiquetas rápidas para que nuestro diagrama de caja sea más claro.
# 
# Agregar después de un signo + labs() al final del comando, y luego proporcione los siguientes argumentos dentro de la función:
#   
# title = "Mi título"
# subtitle = "Subtítulo aquí"
# x = "Distrito"
# y = "Edad (años)"
# caption = "Brote de ébola, 2014"
# fill = "Distrito"

################ escriba en este espacio su codigo/comando que ha probado







##########################################################################


# Ahora mira el código de la solución anterior - ¿Qué tiene de diferente, aparte del nuevo comando labs()?
# Se ha escrito en un formato “más largo”. Para cualquier paréntesis, los argumentos se escriben después de 
# una nueva línea y una sangría. Esto puede leerse más fácilmente, como un índice de contenidos:
  ggplot(
    dataset
    column mappings (
      x-axis
      y-axis
      fill ))+
  geom_jitter()+
  geom_boxplot( alpha )+
  labs(
    title = ,
    subtitle = ,
    x =   , # axis label
    y = ,   # axis label
    caption = 
    legend = )
# La sangría y las nuevas líneas no afectarán a la ejecución del código, 
# pero ahora tienes espacio a la derecha para añadir # comentarios.
# Aunque puede llevar más tiempo escribir comentarios detallados, realmente puede ayudar a 
# las personas que en el futuro lean tu código y se pregunten qué estás haciendo (¡incluso para usted en el futuro!).

################ QUIZ ACERCA DE USO DE FILL ####################
# ¿En qué lado del gráfico está la leyenda, por defecto?

# Arriba-centro
# Parte inferior izquierda
# Parte inferior derecha
# Arriba a la derecha


# ¿Por qué utilizamos el parámetro de estética “fill=” para ajustar el título de la leyenda?

# Porque el relleno siempre ajusta la leyenda
# Porque la leyenda se creó cuando asignamos el relleno a una columna o variable del set de datos
# Porque el mundo ‘fill’ significa ‘leyenda’ en inglés antiguo
