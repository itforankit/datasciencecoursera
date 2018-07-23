if(outcome == "heart attack") {
  
  hospState <- hospState[order(
    
    hospState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
    
    hospState$Hospital.Name, na.last = NA), ]
  
  if(num == "best") {
    
    rank <- hospState[1, 2]
    
  } else if(num == "worst") {
    
    rank <- hospState[nrow(hospState), 2]
    
  } else if(is.numeric(num)) {
    
    if(num > nrow(hospState)) {
      
      rank <- NA
      
    } else {
      
      rank <- hospState[num, 2]
      
    }
    
  } else {
    
    stop("invalid num")
    
  }
  
} else if(outcome == "heart failure") {
  
  hospState <- hospState[order(
    
    hospState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
    
    hospState$Hospital.Name, na.last = NA), ]
  
  if(num == "best") {
    
    rank <- hospState[1, 2]
    
  } else if(num == "worst") {
    
    rank <- hospState[nrow(hospState), 2]
    
  } else if(is.numeric(num)) {
    
    if(num > nrow(hospState)) {
      
      rank <- NA
      
    } else {
      
      rank <- hospState[num, 2]
      
    }
    
  } else {
    
    stop("invalid num")
    
  }
  
} else if(outcome == "pneumonia") {
  
  hospState <- hospState[order(
    
    hospState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,
    
    hospState$Hospital.Name, na.last = NA), ]
  
  if(num == "best") {
    
    rank <- hospState[1, 2]
    
  } else if(num == "worst") {
    
    rank <- hospState[nrow(hospState), 2]
    
  } else if(is.numeric(num)) {
    
    if(num > nrow(hospState)) {
      
      rank <- NA
      
    } else {
      
      rank <- hospState[num, 2]
      
    }
    
  } else {
    
    stop("invalid num")
    
  }
  
}

df <- rbind(df, data.frame(hospital = rank, state = state))