29

library(dplyr)
library(stringr)
library(tidyverse)
library(lubridate)
  
special_dates <- read_csv('dates.csv')

dailySalary <- 500

#converts time to civilian format and gives back minutes
militaryToCivilianTimeMinutes <- function(time)
{
    hour <- time/100
    minute <- time - hour
    return minute
}

#converts time to civilian format and gives back hour
militaryToCivilianTimeHour <- function(time){
    hour <- time/100
    if (hour >= 13 && hour <25){
      hour <- hour - 12
    }
  return hour
}


#computes how many hours and returns overtime number of hours
computeOverTime <- function(timeIn, timeOut){
    if (timeIn < timeOut){ #nightshift
        
    }
    else{ #dayshift
      if (timeOut > 2100){
          return (timeOut - 2100)
      }
    }
  }

#computes for the salary depending on inputs
salaryCompute <- function(timeIn, timeOut, dayOfWeek, workDayType){
    totalSalary <- dailySalary
    overTime <- computeOverTime(timeIn, timeOut)
    if (timeIn > 2100){
        # nightshift
        if (workDayType == "Regular"){
            if (overTime > 0){
                
            }
            else{
              return totalSalary
            }
        }
      else if (workDayType == "Special"){

      }
      else{
          return totalSalary
      }
    }
    else{
        # dayshift
        if (workDayType == "Regular"){
            if (overTime > 0){
                
            }
            else{
              return totalSalary
            }
        }
      else if (workDayType == "Special"){

      }
      else{
          return totalSalary
      }
    }
    
  }
  running = TRUE
  while(running){
    print("Weekly Payroll System")
    print("[1] Calculate weekly salary")
    print("[2] Quit application")
    
    choice <- readline("Enter choice: ")
    if(choice==1 ){

#gets employees time in
      timeIn <- readLine("Time In (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): ")

#gets employees time out
      timeOut <- readLine("Time Out (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): ")

#gets what day employee came in for work (ie.monday, tuesday, wednesday,...)
      dayOfWeek <- readLine("Day: ")

#if saturday or sunday, it will automatically be set as a rest day
      if(dayOfWeek == "Saturday" || dayOfWeek == "Sunday"){
        workDayType <- "Rest"
        }
      else{ #if not saturday or sunday, will get if work day is regular, special, or rest
        workDayType <- readLine("Type of Day: ")
        }

#computes employees salary
      salary <- salaryCompute(timeIn, timeOut, dayOfWeek, workDayType)

#time in military to civilian format
      timeInHour <- militaryToCivilianTimeHour(timeIn)
      timeInMin <- militaryToCivilianTimeMinutes(timeIn)
print("Time In:          " + timeInHour +" : " + timeInMin\n)

#time out military to civilian format
      timeOutHour <- militaryToCivilianTimeHOur(timeOut)
      timeOutMin <- militaryToCivilianTimeMinutes(timeOut)
print("Time Out:         " + timeOutHour +" : " + timeOutMin\n)
print("Day:              " + dayOfWeek)
print("Work Day Type:    " + workDayType)
print("Work Shift:       " + workShift)
print("Daily Salary:     " + dailySalary)
print("Total Salary:     " + salary)

    }else{ #stops application
      running <- FALSE
    }
  }
  
  print("You've quit the application")
