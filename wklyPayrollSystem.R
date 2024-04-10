#********************
#Last names: Villamor, Laroza, Cacatian, Baterina
#Language: R
#Paradigm(s): Object Oriented
#********************

#global variables

dailySalary <- 500

overTimeAndShift <- function(time, workshift, overtime, night){
  
    if (workshift == "Day Shift"){
      cat("\nHours Overtime (Night Shift Overtime):   ", overtime, "(",night,")")
    }else{
      cat("\nHours on Night Shift:                    ", night)
    }
}

#checks shift
shift <- function(time){
    if (time >= 700 && time < 1800){ #if time in is in between 9am to 6pm
      typeShift <- "Day Shift"
      return(typeShift)
    }
    else if(time >= 2200 || time <= 0600){ #if time in is between 10pm and 6am
      typeShift = "Night Shift"
      return(typeShift)
    }
}

nightShiftHours <- function(timeOut){
  nightShift <- 0

  if (timeOut > 2200 || timeOut <= 0600){
    if (timeOut > 2400 || timeOut <= 0600){
      nightShift <- ((2400 - 2200) + timeOut) / 100
    }else{
      nightShift <- (2400 - timeOut) / 100
    }
  }
  return(nightShift)
}

#computes how many hours and returns overtime number of hours
computeOverTime <- function(timeOut){
  over <- 0

    if (timeOut > 1800 || timeOut <= 0600){
      if (timeOut > 2200 || timeOut <= 0600){
        over <- (2200 - 1800) / 100
      }else{
        over <- (timeOut - 1800) / 100
      }
    }
    return(over)
}

#gets the day
getDay <- function(){
  invalid<- FALSE
  while(!invalid){
    day <- readline("Day: ")
    
    if(day == "Sunday" | day == "Saturday" | day == "Friday" | day  == "Thursday" | day == "Wednesday" | day == "Tuesday" | day == "Monday"){
      invalid <- TRUE
      return(day)
    }else{
      print("Error: Invalid day input")
    }
  }
}

#gets Time
getTime <- function(gate){
  invalid<- FALSE
  while(!invalid){
    if(gate==1){
      time <- as.numeric(readline("Time In: "))
    }else{
      time <- as.numeric(readline("Time Out: "))
    }
    
    if( time <= 2400 & time >= 100){
      invalid <- TRUE
      print(time)
      return(as.numeric(time))
    }else{
      print("Error: Invalid time input")
      print(time)
    }
  }
}

#computes for the salary depending on inputs
salaryCompute <- function(over, night, dayType){
   totalSalary <- dailySalary
   otPercentage <- 1.25
   otNightPercentage <- 1.375

   if (dayType == "Rest Day" || dayType == "Special Non-Working Day"){
    totalSalary <- totalSalary * 1.30
    otPercentage <- 1.69
    otNightPercentage <- 1.859
   }
   if (dayType == "Special Non-Working Day and Rest Day"){
    totalSalary <- totalSalary * 1.50
    otPercentage <- 1.95
    otNightPercentage <- 2.145
   }
   if (dayType == "Regular Holiday"){
    totalSalary <- totalSalary * 2.00
    otPercentage <- 2.60
    otNightPercentage <- 2.86
   }
   if (dayType == "Regular Holiday and Rest Day"){
    totalSalary <- totalSalary * 2.60
    otPercentage <- 3.38
    otNightPercentage <- 3.718
   }

  totalSalary <- totalSalary + (over * dailySalary / 8 * otPercentage) + (night * dailySalary / 8 * otNightPercentage)
   
   return(totalSalary)
}
  running <- TRUE
  while(running){
 
    print("Weekly Payroll System")
    print("[1] Calculate weekly salary")
    print("[2] Quit application")
    
    choice <- readline("Enter choice: ")
    
    if(choice == 1){

#gets employees time in
      print("input in military time (ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm")
      timeIn <- getTime(1)
#gets employees time out
      timeOut <- getTime(2)      
#gets what day employee came in for work (ie.monday, tuesday, wednesday,...)
      dayOfWeek <- getDay()
#gets day type *NEEDS DEBUGGING FOR INPUT VALIDATION
      if (dayOfWeek == "Saturday" || dayOfWeek == "Sunday"){
        print("- Rest Day")
        print("- Special Non-Working Day and Rest Day")
        print("- Regular Holiday and Rest Day")
      }else{
        print("- Normal Day")
        print("- Rest Day")
        print("- Special Non-Working Day")
        print("- Special Non-Working Day and Rest Day")
        print("- Regular Holiday")
        print("- Regular Holiday and Rest Day")
      }
      workDayType <- readline("Day Type: ")

    

cat("\nDaily Salary:     ", dailySalary)
cat("\nIn time:          ", timeIn)
cat("\nOut time:         ", timeOut)
cat("\nDay Type:         ", workDayType)
workShift <- shift(timeIn)
overTime <- computeOverTime(timeOut)
night <- nightShiftHours(timeOut)
overTimeAndShift(timeOut, workShift, overTime, night)
#computes salary
salary <- salaryCompute(overTime, night, workDayType)
cat("\nTotal Salary:     ", salary, "\n\n")
    
  }else{ #stops application
      running <- FALSE
    }
  
  }
  print("You've quit the application")
