setwd("C:\\Machine Learning\\datasciencecoursera")
if(!file.exists(".\\C3Q4")){dir.create(".\\C3Q4")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,dest=".//C3Q4//C3Q4Q1.CSV")
QData<-read.csv(".//C3Q4//C3Q4Q1.CSV")
head(QData)
splitNames <- strsplit(names(QData),"wgtp")
splitNames[[123]]


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,dest=".//C3Q4//C3Q4Q2.CSV")
QData2<-read.csv(".//C3Q4//C3Q4Q2.CSV")
head(QData2)
names(QData2)
class(QData2)
library(dplyr)
tblData2<-tbl_df(QData2)
tblData2
tblData2<-filter(tblData2, X != "")
tblData2<-filter(tblData2, Gross.domestic.product.2012 !="")
gdp <- as.numeric(gsub(",", "", tblData2$X.3), na.rm=TRUE)
mean(gdp,na.rm=TRUE)
tblData2

isUnited <- grepl("^United", tblData2$X.2)
summary(isUnited)

setNames(tblData2, c("X"), c("CountryCode"))


fileUrl1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1,dest=".//C3Q4//C3Q4Q4.CSV")
QData4<-read.csv(".//C3Q4//C3Q4Q4.CSV")
tblData3<-tbl_df(QData4)
dtMerge<- merge(tblData2,tblData3,all="TRUE", by=c("CountryCode"))
tblData3
dt <- merge(dtGDP, dtEd, all = TRUE, by = c("CountryCode"))
isFiscalYearEnd <- grepl("fiscal year end", tolower(dt$Special.Notes))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd, isJune)

library(quantmod) amzn = getSymbols("AMZN",auto.assign=FALSE) sampleTimes = index(amzn)
sampleTimes <- index(amzn)
addmargins(table(year(sampleTimes), weekdays(sampleTimes)))
