rankhospital <-function(state,outcome,num= "best")
{
  ##Reading of outcome data
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings = "Not Available")
  
  # converting column in to numeric value
  data[,11]<-as.numeric(data[,11])
  data[,17]<-as.numeric(data[,17])
  data[,23]<-as.numeric(data[,23])

  
  ##checking the state and outcome, whether these are exist inthe outcomedata
  
  if(!(state %in% data[,7])) {
    
    stop("invalid state")
    
  }
  if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    
    stop("invalid outcome")
    
  }
  ##return a data frame with the hospital names and the (abbreviated) state name
  hospitals <- split(data, data$State)[[state]]
  
  ##Return Hospital name in that state with given rank, 30-day death rate due to Heart Attack
  if(outcome == "heart attack") 
  {
    hospitals <- hospitals[order(hospitals$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                                   hospitals$Hospital.Name, na.last = NA), ]
    if(num == "best") 
      {
        return(hospitals[1, 2])
      } else if(num == "worst") 
        {
          return(hospitals[nrow(hospitals), 2])
        } 
          else if(is.numeric(num)) 
          {
            if(num > nrow(hospitals)) 
              {
                return(NA)
              } 
            else { return(hospitals[num, 2])
                  }
          } else { stop("invalid num")
                 }
  ##Return Hospital name in that state with given rank, 30-day death rate due to Heart Failure 
  } else if(outcome == "heart failure") 
  {    
    hospitals <- hospitals[order(hospitals$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
            hospitals$Hospital.Name, na.last = NA), ]
    
    if(num == "best") {
      return(hospitals[1, 2])
        } else if(num == "worst") {
            return(hospitals[nrow(hospitals), 2])
      } else if(is.numeric(num)) {
      
      if(num > nrow(hospitals)) { return(NA)
          } else {
                return(hospitals[num, 2])
          }
      } else { stop("invalid num")
              }
    ##Return Hospital name in that state with given rank, 30-day death rate due to Pneumonia
    } else if(outcome == "pneumonia") {
    hospitals <- hospitals[order(hospitals$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,
          hospitals$Hospital.Name, na.last = NA), ]
    
    if(num == "best") {
            return(hospitals[1, 2])
          } else if(num == "worst") {
            return(hospitals[nrow(hospitals), 2])
          } else if(is.numeric(num)) {
            if(num > nrow(hospitals)) {
        return(NA)
            } else {
              return(hospitals[num, 2])
        }
      } else {
      stop("invalid num")
    }
  }
}
