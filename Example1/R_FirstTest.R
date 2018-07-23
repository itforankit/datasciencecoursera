setwd("C:\\Machine Learning\\datasciencecoursera\\Example1")
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data")
andy <- read.csv("diet_data/Andy.csv")

head(andy)
length(andy$Day)
class(andy)
dim(andy)
str(andy)
summary(andy)
names(andy)

##Finding teh weight on Day 30
##Same commands can be used for this output
andy[30,"Weight"]
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day==30)
##############

andy_s<-andy[1,"Weight"]
andy_E<-andy[30,"Weight"]
andy_loss<-andy_s-andy_E

## File Operations
Files<-list.files("diet_data")
Files
Files[1]
Files[2:4]
head[read.csv(Files[2])]  ## Will show error as David.CSV does exist in Diet_data folder and we are in Workding Dir

Files_full<-list.files("diet_data", full.names = TRUE)
Files_full
head(read.csv(Files_full[2]))
###############

## Binding data from multiple files
andy_david <- rbind(andy, read.csv(Files_full[2]))
andy_david
head(andy_david)
tail(andy_david)
##subset of the data frame that shows us just the 25th day for Andy and David
days_25<-andy_david[which(andy_david$Day==25),]
days_25
###########  Handling multiple files using for loops
length(Files_full)
dat<-data.frame()
for(i in 1:length(Files_full))
{
  dat<-rbind(dat,read.csv(Files_full[i]))
}
str(dat)
median(dat$Weight)
median(dat$Weight,na.rm=TRUE)
median(dat_30$Weight)
#####

## Working with dplyr Grammer
setwd("C:\\Machine Learning\\datasciencecoursera")
unzip("chicago_data.zip")
library(dplyr)
chicago<-readRDS("chicago.rds")
dim(chicago)
str(chicago)
cityDetails<-select(chicago,city:date)
## Equiva,ent code in base R
i<-match("city",names(chicago))
j<-match("dptp",names(chicago))
head(chicago[,-(i:j)])
######
subset<-select(chicago,ends_with("tmean2"))
head(subset)
subset<-select(chicago,starts_with("d"))
head(subset)
chic.f<-filter(chicago,pm25tmean2>30)
summary(chic.f$pm25tmean2)
chic.f<-filter(chicago,pm25tmean2>30 & tmpd>80)
select(chic.f,date,tmpd,pm25tmean2)
chicago<-arrange(chicago,date)
head(chicago)
tail(chicago)
chicago<-arrange(chicago,desc(date))
head(chicago)
tail(chicago)
chicago<-rename(chicago,dewpoint=dptp,pm25=pm25tmean2)
chicago<-mutate(chicago,pm25detrend=pm25-mean(pm25,na.rm=TRUE))
head(transmute(chicago,pm10detrend=pm10tmean2-mean(pm10tmean2,na.rm = TRUE),o3detrend=o3tmean2-mean(o3tmean2,na.rm=TRUE)))

chicago<-mutate(chicago,year=as.POSIXlt(date)$year+1900)
years<-group_by(chicago,year)
summarise(years,pm25=mean(pm25,na.rm = TRUE),o3=max(o3tmean2,na.rm=TRUE),no2=median(no2tmean2,na.rm = TRUE))
qq<-quantile(chicago$pm25,seq(0,1,0.2),na.rm = TRUE)
#####
chicago<-mutate(chicago,pm25.quint =cut(pm25,qq))
quint<-group_by(chicago,pm25.quint)
Summarise(quint,o3=mean(o3tmean2,na.rm=TRUE),no2=mean(no2tmean2,na.rm = TRUE))
## above 3 lines can be write in a single statement
mutate(chicago,pm25.quint=cut(pm25,qq)) %>%  group_by(pm25.quint) %>% summarize(o3=mean(o3tmean2,na.rm=TRUE),no2=mean(no2tmean2,na.rm = TRUE))
mutate(chicago,month=as.POSIXlt(date)$mon+1)%>% group_by(month) %>% summarize(pm25=mean(pm25,na.rm = TRUE),o3=max(o3tmean2,na.rm = TRUE),no2=median(no2tmean2,na.rm = TRUE))
###################

##Function######
f<-function(num)
{
  for (i in seq_len(num))
  {
    cat("Hello Ankit!!!\n")
  }
}
f(3)
f(2)
f<-function(num)
{
  for (i in seq_len(num))
  {
    cat("Hello Ankit!!!\n")
  }
  chars<-nchar("Hello Ankit!!!") * num
  chars
}
x=f(5)
x
f()
object.size(plants)
