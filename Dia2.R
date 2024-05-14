
######################################## Dia 2 ###################################

##################################################################################
################ SIEMPRE HAY MAS DE UNA FORMA DE HACER ALGO ######################
##################################################################################
dat<- data.frame(t=seq(0, 2*pi, by=0.1) )
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
dat$y=yhrt(dat$t)
dat$x=xhrt(dat$t)
with(dat, plot(x,y, type="l", col="red"))
text(0,0,"Bienvenidos al mundo de R", cex=2)

rm(dat,xhrt, yhrt)

# cargue herramientas ------------------------------------------------------------

if (!require("pacman")) {
   install.packages("pacman")
}

p_load(rio,
       dplyr,
       lubridate,
       readxl,
       stringr)

# Es lo mismo que ................................................................

library(rio)
library(dplyr)
library(lubridate)
library(readxl)
library(stringr)
# cargue de datos ----------------------------------------------------------------

#####se puede hacer manual (NO LO HAGAN) .........................................

data <- read_excel("data/Datos_2022_210.xlsx")

rm(data)

data <- import("data/Datos_2022_210.xlsx", which = "Esta_es")

# revision de datos --------------------------------------------------------------

#####se puede hacer manual (NO LO HAGAN) .........................................

glimpse(data)

summary(data)

# ajuste bases -------------------------------------------------------------------

### Para nuestro ejercicio buscaremos los casos para un unico departamento, ademas
#seleccionaremos solo las variables de nuestro interes, asignaremos nuevos nombres
#### a las columnas mejoraremos la distribucion de nuestra tabla y haremos ajustes 
#condicionados a nuestra tabla


# seleccionar --------------------------------------------------------------------

data_limp <- select(data, c("FEC_NOT", "SEMANA", "ANO", "EDAD", "UNI_MED", "nombre_nacionalidad", 
                       "SEXO", "COD_DPTO_O", "COD_MUN_O", "OCUPACION","TIP_SS", "PER_ETN",
                       "FEC_HOS", "FEC_CON", "confirmados","Departamento_ocurrencia","Municipio_ocurrencia"))

# filtrar ------------------------------------------------------------------------

?filter

data_limp_antioquia <- filter(data_limp, COD_DPTO_O == "05")


# Organizar Columnas -------------------------------------------------------------

?relocate

data_limp_antioquia <- data_limp_antioquia %>% 
   relocate(c("Departamento_ocurrencia","COD_DPTO_O", "Municipio_ocurrencia","COD_MUN_O") , .before = FEC_NOT)


# Organizar filas ----------------------------------------------------------------

data_limp_antioquia <- arrange(data_limp_antioquia, desc(Municipio_ocurrencia))


# renombrar columnas -------------------------------------------------------------

data_limp_antioquia <- rename(data_limp_antioquia, SEGURIDAD_SOCIAL = TIP_SS)


# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------

################################todo eso es lo mismo que

rm(data_limp_antioquia)

data_limp_antioquia <- data %>% 
   select("FEC_NOT", "SEMANA", "ANO", "EDAD", "UNI_MED", "nombre_nacionalidad", 
          "SEXO", "COD_DPTO_O", "COD_MUN_O", "OCUPACION","TIP_SS", "PER_ETN",
          "FEC_HOS", "FEC_CON", "confirmados","Departamento_ocurrencia","Municipio_ocurrencia") %>% 
   filter(COD_DPTO_O == "05") %>% 
   relocate(c("Departamento_ocurrencia","COD_DPTO_O", "Municipio_ocurrencia","COD_MUN_O") , .before = FEC_NOT) %>% 
   arrange(desc(Municipio_ocurrencia)) %>% 
   rename(SEGURIDAD_SOCIAL = TIP_SS)

###################### Transformacion de variables ###############################


# modificacion variables ---------------------------------------------------------

# case_when

case_when(data_limp_antioquia$UNI_MED == "1" ~ "años",
          data_limp_antioquia$UNI_MED == "2" ~ "Meses",
          data_limp_antioquia$UNI_MED == "3" ~ "Dias",
          data_limp_antioquia$UNI_MED == "4" ~ "Horas",
          data_limp_antioquia$UNI_MED == "5" ~ "Minutos",
          TRUE ~ NA)

# Creacion de variables ----------------------------------------------------------

## mutate e if_else
data_limp_antioquia <- mutate(data_limp_antioquia, confirmados_text = ifelse(data_limp_antioquia$confirmados == "1", "si", "no"))


# combinar crear y modificar una variable ----------------------------------------

data_limp_antioquia <- data_limp_antioquia %>%
   mutate(UNIDAD_TIEMPO = case_when(data_limp_antioquia$UNI_MED == "1" ~ "años",
                                     data_limp_antioquia$UNI_MED == "2" ~ "Meses",
                                     data_limp_antioquia$UNI_MED == "3" ~ "Dias",
                                     data_limp_antioquia$UNI_MED == "4" ~ "Horas",
                                     data_limp_antioquia$UNI_MED == "5" ~ "Minutos",
                                     TRUE ~ NA))

# Generacion factores ------------------------------------------------------------

data_limp_antioquia <- data_limp_antioquia %>% 
   mutate(sexo = factor(SEXO, 
                        levels = c("F", "M"),
                        labels = c("Feminino", "Masculino")))

# Ver informacion resumen --------------------------------------------------------

############# identificar informacion unica #################################

n_distinct(data_limp_antioquia$Municipio_ocurrencia)

#valores unicos

unique(data_limp_antioquia$Municipio_ocurrencia)

# tabla conteo

table(data_limp_antioquia$Municipio_ocurrencia)

##### se acuerdan que podemos organizar
freq_muni <- as.data.frame(table(data_limp_antioquia$Municipio_ocurrencia))
top10 <- head(arrange(freq_muni, desc(Freq)), 10)

colnames(top10) <- c("Departamento", "Frecuencia")


# ajuste fechas ------------------------------------------------------------------

# Mes-Día-Año (Month-Day-Year)
class(data_limp_antioquia$FEC_NOT)

as_date(data_limp_antioquia$FEC_NOT)
data_limp_antioquia$FEC_NOT <-ymd(data_limp_antioquia$FEC_NOT)

# Solo el mes
data_limp_antioquia <- data_limp_antioquia %>% 
   mutate(mes_notific = month(FEC_NOT))

data_limp_antioquia %>% 
   count(mes_notific)

# Solo el año 
data_limp_antioquia <- data_limp_antioquia %>% 
   mutate(ano_notific = year(FEC_NOT))

data_limp_antioquia %>% 
   count(ano_notific)


#data_limp_antioquia$FEC_NOT <- format(data_limp_antioquia$FEC_NOT, "%d-%m-%Y")

# Año epidemiológico
epiyear("2022/01/01")
year("2022/01/01")
epiyear("2021/12/31")

# Semana epidemiológica 
epiweek("2021/12/31")
epiweek("2022/01/01")


data_limp_antioquia$Semana_epi <- epiweek(data_limp_antioquia$FEC_NOT)

table(data_limp_antioquia$SEMANA == data_limp_antioquia$Semana_epi)

# Muestars aleatoreas
sample_n(data_limp_antioquia, size = 510)


# Manipulacion basica de datos de texto ------------------------------------------

##### pegar texto#########

data_limp_antioquia$DIVIPOLA <-  paste(data_limp_antioquia$COD_DPTO_O,data_limp_antioquia$COD_MUN_O, sep = "")

##### combinar text #####

data_limp_antioquia$territorio <- str_c(data_limp_antioquia$Departamento_ocurrencia, data_limp_antioquia$Municipio_ocurrencia, sep =  " - ")

###### modificar texto #########
str_to_lower(data_limp_antioquia$territorio)
str_to_upper(data_limp_antioquia$sexo)
str_to_title(data_limp_antioquia$territorio)
str_to_sentence(data_limp_antioquia$territorio)

######### Extraer ###############

str_sub(data_limp_antioquia$DIVIPOLA, start = 1, end = 2)
str_sub(data_limp_antioquia$DIVIPOLA, start = 3, end = 5)

######## contar ################

table(str_count(data_limp_antioquia$UNIDAD_TIEMPO, pattern = "añ"))
table(str_count(data_limp_antioquia$UNIDAD_TIEMPO, pattern = "Mes"))
table(str_count(data_limp_antioquia$UNIDAD_TIEMPO, pattern = "D"))

###### detectar ##########
table(str_detect(data_limp_antioquia$nombre_nacionalidad, pattern = "VEN"))


# exportacion --------------------------------------------------------------------

export(data_limp_antioquia, file = "salida/BD_final.xlsx")
