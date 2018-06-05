pollutantmean <-function(directory,pollutant,i=1:332)
{
setwd("C:\\Machine Learning\\datasciencecoursera")
Files_full<-list.files(directory, full.names = TRUE)
dat<-data.frame()
for(j in i)
   {
       dat<-rbind(dat,read.csv(Files_full[j]))
     }
mean(dat[,pollutant],na.rm = TRUE)
##dat[,weighted.mean(x, get(pollutant)), by=timeperiod]
##head(dat)
##tail(dat)
}