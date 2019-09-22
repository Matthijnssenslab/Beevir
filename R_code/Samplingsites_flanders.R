library(raster)
library(mapplots)
library(mapproj)

library(rgdal)

##PROVINCIENIVEAU
#bel <- getData('GADM', country='BEL', level=3)
#Flanders <- bel[bel$NAME_1 == "Vlaanderen", ]
#WestVl <- Flanders[Flanders$NAME_2 == "West-Vlaanderen",]
#OostVl <- Flanders[Flanders$NAME_2 == "Oost-Vlaanderen",]
#Limburg <- Flanders[Flanders$NAME_2 == "Limburg",]
#Vlbr <- Flanders[Flanders$NAME_2 == "Vlaams Brabant",]
#Antwerpen <- Flanders[Flanders$NAME_2 == "Antwerpen",]
#plot(WestVl, col = "grey44", xlim=range(2.5:6.5), ylim=range(50.5:51.5),border="white", main="Flanders")
#plot(OostVl, col="grey84", add=TRUE,border="white")
#plot(Limburg, col="grey74", add=TRUE,border="white")
#plot(Antwerpen, col="grey64", add=TRUE, border="white")
#plot(Vlbr, col="grey54", add=TRUE, border="white")
#map.scale(ratio=FALSE, metric=TRUE)

#provinces <- c("Limburg", "Antwerpen", "West-Vlaanderen", "Vlaams-Brabant", "Oost-Vlaanderen")
#coordinatesX <- c(5.431653, 4.720688, 3.062247, 4.575950, 3.818861)
#coordinatesY <- c(50.99968, 51.23156, 51.01051, 50.87062, 51.03629)
#samples <- c(48, 68, 59, 65, 60)
#labels <- c("L","A","W-V","V-B","O-V")
#numbers <- data.frame(provinces, coordinatesX, coordinatesY, samples, labels)

#provinces <- c("legend", "legend", "legend")
#labels <- c("n=20", "n=30", "n=40")
#coordinatesX <- c(4,4.7,5.5)
#coordinatesY <- c(50.5,50.5,50.5)
#samples <- c(25,50,75)
#numberslegend <- data.frame(provinces, coordinatesX, coordinatesY, samples, labels)

#numbersfin <- rbind(numbers, numberslegend)

#legend2 <- c(legend, 5, 50, 20)
#legend3 <- c(legend, 5, 50, 30)
#symbols(numbersfin$coordinatesX, numbersfin$coordinatesY, circles = numbersfin$samples, inches =0.5, add = TRUE, fg = "white", bg = "black")
#text(numbersfin$coordinatesX, numbersfin$coordinatesY, numbersfin$labels, col="white", cex=0.6)



#Flanders:
##GEMEENTENIVEAU
bel <- getData('GADM', country='BEL', level=4)
Flanders <- bel[bel$NAME_1 == "Vlaanderen", ]
WestVl <- Flanders[Flanders$NAME_2 == "West-Vlaanderen",]
OostVl <- Flanders[Flanders$NAME_2 == "Oost-Vlaanderen",]
Limburg <- Flanders[Flanders$NAME_2 == "Limburg",]
Vlbr <- Flanders[Flanders$NAME_2 == "Vlaams Brabant",]
Antwerpen <- Flanders[Flanders$NAME_2 == "Antwerpen",]
plot(WestVl, col = "grey44", xlim=range(2.5:6.5), ylim=range(50.5:51.5), border="white", main="Flanders")
plot(OostVl, col="grey84", border="white",add=TRUE)
plot(Limburg, col="grey74",border="white", add=TRUE)
plot(Antwerpen, col="grey64", border="white", add=TRUE)
plot(Vlbr, col="grey54", border="white", add=TRUE)

#subset for gemeente
#!!!!import gemeentelijst als gemeentelijstu (dataframe)!!!!
Gemeentes12u <- read.table("/Users/wd/Documents/Papers/Phagepaper/Code/inputdata/Commune_info/Gemeentes12u.txt", quote="\"", comment.char="")
samplesgemeente12 <- subset(Flanders, Flanders$NAME_4 %in% Gemeentes12u$V1)
samplescoord12 <- coordinates(samplesgemeente12)
points(samplescoord12[,1], samplescoord12[,2], col="black", bg="black", pch=21)

Gemeentes13u <- read.table("/Users/wd/Documents/Papers/Phagepaper/Code/inputdata/Commune_info/Gemeentes13u.txt", quote="\"", comment.char="")
samplesgemeente13 <- subset(Flanders, Flanders$NAME_4 %in% Gemeentes13u$V1)
samplescoord13 <- coordinates(samplesgemeente13)
points(samplescoord13[,1], samplescoord13[,2], col="red", bg="red", pch=21)

##Legend for gemeentes
points(6.25, 51.25, col="red", bg="red", pch=21)
text(6.5, 51.25, "2012")
points(6.25, 51, col="black", bg="black", pch=21)
text(6.5, 51, "2013")
scalebar(50, below="Kilometers")
#Situate in Europe
BEL <- getData('GADM', country='BEL', level=0)
europe <- readOGR(dsn="/Users/wd/Documents/Papers/Phagepaper/Code/inputdata/Maps/ne_110m_admin_0_countries.shp")
europe <- europe[europe$REGION_UN == 'Europe',]
plot(europe, col="grey84", border="white",xlim=range(10:15), ylim=range(35:75),main="Europe")
scalebar(500, below="Kilometers")
plot(BEL, add=T, col="chartreuse4", border="white")
