filename <- "survey.csv"
download.file(filename, "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
setwd("C:\\Machine Learning\\datasciencecoursera")
acs <- read.csv("data_survey_quiz2.csv", header = TRUE, sep = ",")
answer2 <- sqldf("select pwgtp1 from acs where AGEP < 50")