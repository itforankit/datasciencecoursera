setwd("E:\\MachineLearning\\datasciencecoursera")
library(swirl)
install_from_swirl("Exploratory Data Analysis")
swirl()
##Lattice Graphs##
head(airquality)
xyplot(Ozone~Wind,data=airquality)
xyplot(Ozone~Wind,data=airquality,col="red",pch=8,main="Big Apple Data")
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")
xyplot(Ozone ~ Wind|as.factor(Month), data = airquality, layout=c(5,1))
xyplot(Ozone ~ Wind|Month, data = airquality, layout=c(5,1))
p<-xyplot(Ozone~Wind,data=airquality)
print(p)
names(p)
p[["formula"]]
p[["x.limits"]]
table(f)
xyplot(y~x|f,layout=c(2,1))
myedit("plot1.R")
source(pathtofile("plot1.R"),local=TRUE)
source(pathtofile("plot2.R"),local=TRUE)
str(diamonds)
table(diamonds$color)
table(diamonds$color,diamonds$cut)
myedit("myLabels.R")
source(pathtofile("myLabels.R"),local=TRUE)





