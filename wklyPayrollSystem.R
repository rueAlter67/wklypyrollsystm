
#global variables

dailySalary <- 500

#checks shift
shift <- function(time){
    if (time > 2100){ #if time is beyond 9pm
      shift = "Night Shift"
    }
    else{
       shift = "Day Shift"
    }
    return(shift)
}

#converts time to civilian format and gives back minutes
militaryToCivilianTimeMinutes <- function(time)
{
    hour = time/100
    minute <- time %% 100
    return(minute)
}

#converts time to civilian format and gives back hour
militaryToCivilianTimeHour <- function(time){
    
    hour = time/100
    if (hour >= 13 && hour <25){
      hour <- hour - 12
    }
  return(hour)
}


#computes how many hours and returns overtime number of hours
computeOverTime <- function(timeOut, shift){
    if (shift == "Day Shift"){
        if (timeOut < 2100){ #if time out is less than 9pm
           timeBeforeMid <- 2400 - 2100
           over <- (timeBeforeMid + timeOut)/100
        }
        else{
           over <- (timeOut - 2100) / 100
        }
    }
    else{
        #nightshift overtime
    }

    return(over)
}

#computes for the salary depending on inputs
salaryCompute <- function(over, shift, dayType){
   totalSalary <- dailySalary
   if (shift == "Day Shift"){
      if(over > 0){

        if(dayType == "Regular"){ #Regular WorkDay

        }
        else if(dayType == "Special"){ #Special WorkDay

        }
        else{ #Rest Day

        }
      }
   }
   else{
      if(over > 0){

        if(dayType == "Regular"){
  
        }
        else if(dayType == "Special"){

        }
        else{

        }
      }
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

#if saturday or sunday, it will automatically be set as a rest day
      if(dayOfWeek == "Saturday" || dayOfWeek == "Sunday"){
        workDayType <- "Rest"
        }else{ #if not saturday or sunday, will get if work day is regular, special, or rest
        workDayType <- readline("Type of Day: ")
      }

#time in military to civilian format
      timeInHour <- militaryToCivilianTimeHour(timeIn)
      timeInMin <- militaryToCivilianTimeMinutes(timeIn)
print("DATA:\n")
cat("\nTime In:          ", format(round(timeInHour, 0), nsmall = 0), " : ", timeInMin)

#time out military to civilian format
      timeOutHour <- militaryToCivilianTimeHour(timeOut)
      timeOutMin <- militaryToCivilianTimeMinutes(timeOut)
cat("\nTime Out:         ", format(round(timeOutHour, 0), nsmall = 0), " : ", timeOutMin)
cat("\nDay:              ", dayOfWeek)
cat("\nWork Day Type:    ", workDayType)
#finds id day shift or night shift
workShift <- shift(timeIn)
cat("\nWork Shift:       ", workShift)
#checks overtime
overTime <- computeOverTime(timeOut, workShift)
cat("\nOvertime:         ", overTime)
cat("\nDaily Salary:     ", dailySalary)
#computes salary
salary <- salaryCompute(overTime, workShift, workDayType)
cat("\nTotal Salary:     ", salary, "\n\n")
    
  }else{ #stops application
      running <- FALSE
    }
  
  }
  print("You've quit the application")
