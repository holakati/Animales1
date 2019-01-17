##### Iniciando la extracción de información: Página web escogida ###############

# Utilizando la libreria rvest
library(rvest)

#Se busca el url de la página y  se asigna a la variable el url
paginaAnimales <- 'https://listas.20minutos.es/lista/animales-representativos-de-paises-157885/'
paginawebAnimales <- read_html ( paginaAnimales )
paginawebAnimales

#Extracción del texto contenido de los animales y sus puntos 
contenidoWeb  <- html_nodes (paginawebAnimales , 'h3')
contenidoWeb
contenido2Web <- html_nodes (paginawebAnimales, '.recibidos')
contenido2Web

# viendo el contenido de la posición 3 de la variable contenidoWeb y contenido2Web
print ( contenidoWeb [ 3 ])
print (contenido2Web [3])

# Limpiando el texto de los animales en contenidoWeb 
contenidoWeb <- gsub("<h3>","",contenidoWeb)
contenidoWeb <- gsub("</h3>","",contenidoWeb)
print(contenidoWeb)

#Limpiando el texto de los puntos o votos de cada animal en contenido2web
contenido2Web <- gsub("<strong>","",contenido2Web)
contenido2Web <- gsub("</strong>","",contenido2Web)
contenido2Web <- gsub("recibidos","", contenido2Web)
contenido2Web <- gsub("<span class=\"\">","", contenido2Web)
contenido2Web <- gsub("</span>","",contenido2Web)
print(contenido2Web)

# Viendo que tiene la posición 1 la variable contenidoWeb
print ( contenidoWeb [ 1 ])

# Viendo que tiene la posición 2 la variable contenido2Web
print (contenido2Web [2])

#pasando la info  de los animales a un marco de datos
dfanimales <- as.data.frame(contenidoWeb)
dfanimales

#pasando la info de los votos de cada animal a un marco de datos
dfvotos <- as.data.frame(contenido2Web)
dfvotos

#Unir los 2 data frame
AnimalesyVotos <- as.data.frame (contenido2Web, contenidoWeb)


