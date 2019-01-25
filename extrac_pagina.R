##### Iniciando la extracción de información: Página web escogida ###############

# Utilizando la libreria rvest
library(rvest)

### Para graficar los ingredientes se  instala 
#install.packages('ggplot2')
library('ggplot2')

#==================== usando simplegreensmoothies.com ====================#

#Se busca el url de la página y  se asigna a la variable
paginasimplegreen <- "http://simplegreensmoothies.com/category/recipes/green-smoothies/page/2"

#Leyendo el html de la página 2
webpagesimplegreen <- read_html(paginasimplegreen)

# Extracción del texto contenido en la clase donde se encuentran los titulos
contenidosimplegreen <- html_nodes(webpagesimplegreen,".grid-title a")

# viendo el contenido de la variable contenidosimplegreen
print(contenidosimplegreen)

#viendo el contenido de la posición 1 en la variable contenidosimplegreen
print(contenidosimplegreen[1])

# Extrayendo el texto de contenidosimplegreen
textosimplegreen <- html_text(contenidosimplegreen)
print (textosimplegreen)

# Tabla de los titulos de la página 2
tabla_titulos <- table(textosimplegreen)

# Transformando a data frame la tabla creada con los títulos
titulobatidos <- as.data.frame(tabla_titulos)

# Unificando los títulos
todosLosTitulosbatidos <- ""
for(i in 1 : length(textosimplegreen)){
  todosLosTitulosbatidos <- paste(todosLosTitulosbatidos,"",textosimplegreen[[i]])
}
#Se muestran los títulos
print(todosLosTitulosbatidos)

# Se dividen las palabras para poder ordenarlas
splitEspacioBatidos<-strsplit(todosLosTitulosbatidos," ") 

# Se muestran todas las palabras vistas en los titulos de los batidos
unlistbatidos<-unlist(splitEspacioBatidos)

# Se ordenan las palabras por orden alfabético y se asigna la frecuencia de cada una
tablapalabras<-table(unlistbatidos)

# Se realiza la lista final con las palabras ordenadas en orden alfabético
# y con la frecuencia de cada una
PalabrasContadas<-as.data.frame(tablapalabras)

#Se guarda la lista realizada anteriormente en formato csv
write.csv(PalabrasContadas, file="PalabrasContadas.csv")

#Se hace grafico de barra
PalabrasContadas%>%
  ggplot() +
  aes(x=unlistbatidos, y=Freq) +
  geom_bar(stat="identity")


