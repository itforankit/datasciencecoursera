setwd("C:\\Machine Learning\\datasciencecoursera")
library(swirl)
swirl()
Sys.getlocale("LC_TIME")
library(lubridate)
help(package = lubridate)
this_day <- today()
year(this_day)
month(this_day)
day(this_day)
wday(this_day)
wday(this_day,label = TRUE)
this_moment<-now()
hour(this_moment)
minute(this_moment)
second(this_moment)
my_date<-ymd("1989-05-17")
class(my_date)
ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)
ymd("1920/1/2")
# dt1
#[1] "2014-08-23 17:23:02"
ymd_hms(dt1)
#> dt2
#[1] "2014-05-14" "2014-09-22" "2014-07-11"
ymd(dt2)
update(this_moment, hours = 8, minutes = 34, seconds = 55)
this_moment
this_moment <- update(this_moment, hours = 10, minutes = 16, seconds = 0)
this_moment
nyc <-now(tz="America/New_York")
depart <- nyc + days(2)
depart <- update(depart, hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)
  arrive <- with_tz(arive,tzone ="Asia/Hong_Kong" )
Sys.timezone()
arrive
last_time <- mdy("June 17, 2008", tz="Singapore")
how_long <- interval(last_time,arrive)
as.period(how_long)
stopwatch()


