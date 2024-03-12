  #check if input is string or numeric
  library(dplyr)
  library(stringr)
  library(tidyverse)
  
  string_num<- function(input){
    #checks if input has letters
    ans <- str_detect(input, '[[:alpha:]]')
    
    if(ans==TRUE){
      val <- 1 #string
    }else{
      val <- 2 #numeric
    }
    
    return (val)
  }
  
  
  convert_month<- function(input){
    #assuming input is a <character>
    val <- case_when(
            input ==  "january" |  input ==  "January" | input == "Jan" | input == "jan" ~ 1,
            input ==  "february" |  input ==  "February" | input == "Feb" | input == "feb" ~ 2,
            input ==  "march" |  input ==  "March" | input == "Mar" | input == "mar" ~ 3,
            input ==  "april" |  input ==  "April" | input == "Apr" | input == "apr" ~ 4,
            input ==  "may" |  input ==  "May" ~ 5,
            input ==  "june" |  input ==  "June" | input == "Jun" | input == "jun" ~ 6,
            input ==  "july" |  input ==  "July" | input == "Jul" | input == "jul" ~ 7,
            input ==  "august" |  input ==  "August" | input == "Aug" | input == "aug" ~ 8,
            input ==  "september" |  input ==  "September" | input == "Sep" | input == "sep"| input == "sept"| input == "Sept" ~ 9,
            input ==  "october" |  input ==  "October" | input == "Oct" | input == "oct" ~ 10,
            input ==  "november" |  input ==  "November" | input == "Nov" | input == "nov" ~ 11,
            input ==  "december" |  input ==  "December" | input == "Dec" | input == "dec" ~ 12,
            TRUE ~ -1
    )
  }
  
  get_month<- function(){
    
    val <- readline("Enter month: "); 
    val <- if(string_num(val) == 1){
        convert_month(val)}else{
          val}
    
    return (val)
  }
  
  get_day<- function(month){
    
    isRunning <- TRUE
    
    while(isRunning){
      val <- readline("Enter day: "); 
      val <- if(string_num(val) == 2)
              {
                num <- as.numeric(val)
                limit <- case_when(
                          month == 4 |  month == 6 | month == 9 | month == 11 ~ 30,
                          month == 1 |  month == 3 | month == 5 | month == 7 | month == 8 | month == 10 | month == 12 ~ 31,
                          month == 2 ~ 29
                        )
                if(num >0 & num <= limit)
                {
                  isRunning <- FALSE
                }else{
                  print("enter date within range")
                }
                
              }else
              {
                  print("enter numerical data")
              }
    }
    
    return (num)
  }
  
  compute_salary <- function(){
    base_salary <- 500
    
  }
  
  
  
  #start of program
  special_dates <- read_csv('dates.csv')

  running = TRUE
  while(running){
    print("Weekly Payroll System")
    print("[1] Calculate weekly salary")
    print("[2] Quit application")
    
    choice <- readline("Enter choice: ")
    base_date <- ymd("20240101")
    if(choice==1 ){
      year <- 2024
      month <- get_month()
      
      day <-  get_day(month)
      
      current_date <- ymd(paste(year,month,day))
      
      
      invisible(print(paste("The date is",current_date)))

      salary <- compute_salary()
      
    }else{
      running <- FALSE
    }
  }
  
  print("You've quit the application")
  
  