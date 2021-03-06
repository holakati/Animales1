##### Iniciando la extracci�n de informaci�n: P�gina web escogida ###############

# Utilizando la libreria rvest
library(rvest)

### Para graficar los ingredientes se  instala 
#install.packages('ggplot2')
library('ggplot2')

#==================== usando simplegreensmoothies.com ====================#

#Se busca el url de la p�gina y  se asigna a la variable
paginasimplegreen <- 'http://simplegreensmoothies.com/category/recipes/green-smoothies'

#Leyendo el html de la p�gina 1
webpagesimplegreen <- read_html(paginasimplegreen)

# Extracci�n del texto contenido en la clase donde se encuentran los titulos
contenidosimplegreen <- html_nodes(webpagesimplegreen,".grid-title a")

# viendo el contenido de la variable contenidosimplegreen
print(contenidosimplegreen)

#viendo el contenido de la posici�n 1 en la variable contenidosimplegreen
print(contenidosimplegreen[1])

# Extrayendo el texto de contenidosimplegreen
textosimplegreen <- html_text(contenidosimplegreen)
print (textosimplegreen)

# Tabla de los titulos de la p�gina 2
tabla_titulos <- table(textosimplegreen)

# Transformando a data frame la tabla creada con los t�tulos
titulobatidos <- as.data.frame(tabla_titulos)

# Unificando los t�tulos
todosLosTitulosbatidos <- ""
for(i in 1 : length(textosimplegreen)){
  todosLosTitulosbatidos <- paste(todosLosTitulosbatidos,"",textosimplegreen[[i]])
}
#Se muestran los t�tulos
print(todosLosTitulosbatidos)

# Se dividen las palabras para poder ordenarlas
splitEspacioBatidos<-strsplit(todosLosTitulosbatidos," ") 

# Se muestran todas las palabras vistas en los titulos de los batidos
unlistbatidos<-unlist(splitEspacioBatidos)

# Se ordenan las palabras por orden alfab�tico y se asigna la frecuencia de cada una
tablapalabras<-table(unlistbatidos)

# Se realiza la lista final con las palabras ordenadas en orden alfab�tico
# y con la frecuencia de cada una
PalabrasContadas<-as.data.frame(tablapalabras)

#Se guarda la lista realizada anteriormente en formato csv
write.csv(PalabrasContadas, file="PalabrasContadas.csv")

#Se hace grafico de barra
PalabrasContadas%>%
  ggplot() +
  aes(x=unlistbatidos, y=Freq) +
  geom_bar(stat="identity")

#Fin




