library(dplyr)
library(stringr)
library(tidyverse)
library(lubridate)
  
special_dates <- read_csv('dates.csv')

computeOverTime <- function(timeIn, timeOut){
    return over <- timeOut - timeIn
  }
salaryCompute <- function(timeIn, timeOut, dayOfWeek, workDayType){
    overTime <- computeOverTime(timeIn, timeOut)
    
  }
  running = TRUE
  while(running){
    print("Weekly Payroll System")
    print("[1] Calculate weekly salary")
    print("[2] Quit application")
    
    choice <- readline("Enter choice: ")
    if(choice==1 ){
      timeIn <- readLine("Time In: ")
      timeOut <- readLine("Time Out: ")
      dayOfWeek <- readLine("Day: ")
      if(dayOfWeek == "Saturday" || dayOfWeek == "Sunday"){
        workDayType <- "Rest Day"
        }
      else{
        workDayType <- readLine("Type of Day: ")
        }
      salaryCompute(timeIn, timeOut, dayOfWeek, workDayType)
    }else{
      running <- FALSE
    }
  }
  
  print("You've quit the application")
