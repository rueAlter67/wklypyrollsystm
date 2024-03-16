library(dplyr)
library(stringr)
library(tidyverse)
library(lubridate)
  
special_dates <- read_csv('dates.csv')

computeOverTime <- function(timeIn, timeOut){
    if (timeIn < timeOut){
        
    }
    else{
      if (timeOut > 2100){
          return (timeOut - 2100)
      }
    }
  }
salaryCompute <- function(timeIn, timeOut, dayOfWeek, workDayType){
    dailySalary <- 500
    overTime <- computeOverTime(timeIn, timeOut)
    if (timeIn > 2100){
        # nightshift
        
    }
    else{
        # dayshift
        if (workDayType == "Regular"){
            if (overTime > 0){
                
            }
            else{
              return dailySalary
            }
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
      timeIn <- readLine("Time In (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): ")
      timeOut <- readLine("Time Out (input in military time [ie. 1000 for 10am, 2300, for 11pm, 1430 for 2:30pm]): ")
      dayOfWeek <- readLine("Day: ")
      if(dayOfWeek == "Saturday" || dayOfWeek == "Sunday"){
        workDayType <- "Rest Day"
        }
      else{
        workDayType <- readLine("Type of Day: ")
        }
      salary <- salaryCompute(timeIn, timeOut, dayOfWeek, workDayType)
    }else{
      running <- FALSE
    }
  }
  
  print("You've quit the application")
