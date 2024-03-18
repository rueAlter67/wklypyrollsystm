
#global variables

dailySalary <- 500

overTimeAndShift <- function(time, shift){
    if (shift == "Day Shift"){
      overtime <- computeOverTime(time)
      night <- nightShiftHours(time)

      cat("\nHours Overtime (Night Shift Overtime):   ", overtime, "(",night,")")
    }else{
      night <- nightShiftHours(time)
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

nightShiftHours <- function(timeOut){
  nightShift <- 0

  if (timeOut > 2200){
    if (timeOut > 2400){
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

    if (timeOut > 1800){
      if (timeOut > 2200){
        over <- (2200 - 1800) / 100
      }else{
        over <- (timeOut - 1800) / 100
      }
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
cat("\nDaily Salary:     ", dailySalary)
cat("\nIn time:          ", format(round(timeInHour, 0), nsmall = 0), " : ", timeInMin)

#time out military to civilian format
      timeOutHour <- militaryToCivilianTimeHour(timeOut)
      timeOutMin <- militaryToCivilianTimeMinutes(timeOut)
cat("\nOut time:         ", format(round(timeOutHour, 0), nsmall = 0), " : ", timeOutMin)
cat("\nDay Type:         ", workDayType)
shift <- shift()
overTimeAndShift(timeOut, shift)
#computes salary
salary <- salaryCompute(overTime, workShift, workDayType)
cat("\nTotal Salary:     ", salary, "\n\n")
    
  }else{ #stops application
      running <- FALSE
    }
  
  }
  print("You've quit the application")
