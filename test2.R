employee <- setClass("employee", slots = list(workedDays = "numeric", workedHours = "numeric", toBePaid = "numeric")) #employee class/object
source("functions.R") #import functions

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
    
  }else{
    running <- FALSE
  }
}

print("You've quit the application")

