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
xyplot(price~carat|color*cut, data=diamonds,strip=FALSE,pch=20,xlab=myxlab,ylab = myylab,main=mymain)
xyplot(price~carat|color*cut, data=diamonds,pch=20,xlab=myxlab,ylab = myylab,main=mymain)

## Working with Colors
sample(colors(),10)
pal<-colorRamp(c("red","blue"))
##p7 <- colorRamp("red","blue")  Error
pal(0)
pal(1)
pal(0.5)
pal(seq(0,1,len=6))

p1<-colorRampPalette(c("red","blue"))
p1(2)
p1(6)
0xcc
p2(2)
showMe(p1(20))
showMe(p2(20))
showMe(p2(2))

p3<-colorRampPalette(c("blue","green"),alpha=0.5)
p3(5)

plot(x,y,pch=19,col=rgb(0,0.5,0.5))
plot(x,y,pch=19,col=rgb(0,0.5,0.5,0.3))  ## fourth argument 0.3 is alpha

cols<-brewer.pal(3,"BuGn")
showMe(cols)
pal<-colorRampPalette(cols)
showMe(pal(3))
showMe(pal(20))
image(volcano,col=pal(20))
image(volcano,col=p1(20))


## GGPLOT2 ####
