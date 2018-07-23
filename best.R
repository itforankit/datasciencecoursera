best <-function(state,outcome)
{
  ##Reading of outcome data
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings = "Not Available")

  # converting column in to numeric value
  data[,11]<-as.numeric(data[,11])
  data[,17]<-as.numeric(data[,17])
  data[,23]<-as.numeric(data[,13])
  
  ##checking the state and outcome, whether these are exist inthe outcomedata
 
  if(!(state %in% data[,7])) {
    
    stop("invalid state")
    
  }
  if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    
    stop("invalid outcome")
    
  }
  ## loading hospitals in a list for the mentioned state
  hospitals <- split(data, data$State)[[state]]
  
  ##Return Hospital name in that state with lowest 30-day death rate due to Heart Attack
  if(outcome =="heart attack") 
  {
    hospitals <- hospitals[hospitals["Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]==min(hospitals[, 11], na.rm = TRUE), 2]
    hospitals <-sort(hospitals)
    return(hospitals[1])
  }
  ##Return Hospital name in that state with lowest 30-day death due to Heart Failure
  else if(outcome =="heart failure") 
  {
    hospitals <- hospitals[hospitals["Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"]==min(hospitals[, 17], na.rm = TRUE), 2]
    hospitals <-sort(hospitals)
    return(hospitals[1])
  }
  ##Return Hospital name in that state with lowest 30-day death due to Pneumonia
  else if(outcome =="pneumonia") 
  {
    hospitals <- hospitals[hospitals["Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]==min(hospitals[, 23], na.rm = TRUE), 2]
    hospitals <-sort(hospitals)
    return(hospitals[1])
  }
 
}