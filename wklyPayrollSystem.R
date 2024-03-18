
#global variables

dailySalary <- 500

overTimeAndShift <- function(time, shift, overtime, night){
    if (shift == "Day Shift"){


      cat("\nHours Overtime (Night Shift Overtime):   ", overtime, "(",night,")")
    }else{
      cat("\nHours on Night Shift:                    ", night)
    }
}

#checks shift
shift <- function(time){
    if (time >= 0900 && time < 1800){ #if time in is in between 9am to 6pm
      shift = "Day Shift"
    }
    else if(time >= 2200 || time <= 0600){ #if time in is between 10pm and 6am
       shift = "Night Shift"
    }
    return(shift)
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

#computes for the salary depending on inputs
salaryCompute <- function(over, night, dayType){
   totalSalary <- dailySalary

   if (dayType == "Rest Day"){
    totalSalary <- totalSalary * 1.30
   }
   if (dayType == "Special Non-Working Day and Rest Day"){
    totalSalary <- totalSalary * 1.50
   }

   
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
      timeIn <- as.numeric(readline("Time In (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): "))

#gets employees time out
      timeOut <- as.numeric(readline("Time Out (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): "))

#gets what day employee came in for work (ie.monday, tuesday, wednesday,...)
      dayOfWeek <- readline("Day: ")

#gets day type
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

    }

cat("\nDaily Salary:     ", dailySalary)
cat("\nIn time:          ", timeIn)
cat("\nOut time:         ", timeOut)
cat("\nDay Type:         ", workDayType)
workShift <- shift(timeIn)
overTime <- computeOverTime(time)
night <- nightShiftHours(time)
overTimeAndShift(timeOut, workShift, overTime, night)
#computes salary
salary <- salaryCompute(overTime, night, workDayType)
#cat("\nTotal Salary:     ", salary, "\n\n")
    
  }else{ #stops application
      running <- FALSE
    }
  
  }
  print("You've quit the application")
