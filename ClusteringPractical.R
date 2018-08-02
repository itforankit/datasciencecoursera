setwd("C:\\Machine Learning\\datasciencecoursera")
library(swirl)
install_from_swirl("Exploratory Data Analysis")
swirl()

##ist with the argument dataFrame to compute the distances between all pairs of these points
dist(dataFrame)
distxy
hc<-hclust(distxy)
plot(hc)
plot(as.dendrogram(hc))
abline(h=1.5,col="blue")
abline(h=0.4,col="red")
abline(h=0.05,col="green")

dist(dFsm)
hc
heatmap(dataMatrix,col=cm.colors(25))

heatmap(mt)
mt
plot(denmt)
distmt

## K-Means Clustering
## We've created two 3-long vectors for you, cx and cy. These respectively hold the x- and y- coordinates for 3 proposed centroids
cmat
points(cx,cy,col=c("red","orange","purple"),pch=3,cex=2,lwd=2)
mdist(x,y,cx,cy)
apply(distTmp,2,which.min)
points(x,y,pch=19,cex=2,col=cols1[newClust])
tapply(x, newClust, mean)
tapply(y, newClust, mean)
points(newCx,newCy,col=cols1,pch=8,cex=2,lwd=2)
mdist(x,y,newCx,newCy)
apply(distTmp2,2,which.min)
points(x,y,pch=19,cex=2,col=cols1[newClust2])
tapply(x, newClust2, mean)
tapply(y, newClust2, mean)
points(finalCx,finalCy,col=cols1,pch=9,cex=2,lwd=2)

## In R we can perform above steps by using KMeans
kmeans(dataFrame,centers = 3)
kmObj$iter
plot(x,y,col=kmObj$cluster,pch=19,cex=2)
points(kmObj$centers,col=c("black","red","green"),pch=3,cex=3,lwd=3)

plot(x,y,col=kmeans(dataFrame,6)$cluster,pch=19,cex=2)
plot(x,y,col=kmeans(dataFrame,6)$cluster,pch=19,cex=2)

## Dimension Reduction
head(dataMatrix)
heatmap(dataMatrix)
myedit("addPatt.R")
source("addPatt.R",local = TRUE)
heatmap(dataMatrix)

mat
svd(mat)
matu %*% diag %*% t(matv)
scale(mat)
svd(scale(mat))
prcomp(scale(mat))
svd1$v[,1]
svd1$d

head(constantMatrix)
svd2$d
svd2$v[,1:2]

dim(faceData)
a1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
myImage(a1)
a2 <- svd1$u[,1:2] %*%  diag(svd1$d[1:2])  %*% t(svd1$v[,1:2])
myImage(svd1$u[,1:5] %*%  diag(svd1$d[1:5])  %*% t(svd1$v[,1:5]))
myImage(svd1$u[,1:10] %*%  diag(svd1$d[1:10])  %*% t(svd1$v[,1:10]))




