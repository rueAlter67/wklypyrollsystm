
$dailySalary = 500

def computation(dayType, shift, timein, timeout, overtimeHours)
    if (dayType == 1 && shift == "Day Shift")
        salary = $dailySalary
    elsif (dayType == 2 && shift == "Night Shift") 
        salary = ((overtimeHours * $dailySalary) / 8) * 1.375 
    end

    return salary
end

def shiftCheck(time)
    if(time >= 0900 && time < 1800) 
      shift = "Day Shift"
    elsif(time >= 2200 || time <= 0600)
       shift = "Night Shift"
    end
    return shift
end

def printOut(rate, day, overtime, timein, timeout, salary)
    puts " "
    puts "Daily Rate: #{rate}"
    puts "IN Time: #{day}"
    puts "OUT Time: #{overtime}"
    puts "Day Type: #{timein}"
    puts "Hours Overtime: #{timeout}"
    puts "Salary for the day: #{salary}"
    puts " "
end

def daytypeMenu
    puts "Weekly Payroll System"
    puts "[1] Normal Day"
    puts "[2] Rest Day"
    puts "[3] Special Non-Working Day"
    puts "[4] Special Non-Working Day and Rest Day"
    puts "[5] Regular Holiday"
    puts "[6] Regular Holiday and Rest Day"

    puts "Enter day type choice (1-6):"
    dayType = gets.chomp

    return dayType
end

stop = false

while stop == false do

    puts "Weekly Payroll System"
    puts "[1] Calculate weekly salary"
    puts "[2] Quit application"

    action = gets.chomp

    case action
        when "1"
            dayType = daytypeMenu

            puts "Enter 4 digit 24-hour Time (time IN): "
            timeIn = gets.chomp

            puts "Enter 4 digit 24-hour Time: (time OUT): "
            timeOut = gets.chomp

            shiftType = shiftCheck(timeOut)

            if(dayType <= 6 || dayType >= 1)
                 puts computation(dayType, shiftType, timeIn, timeOut, 3)  #placeholder 3 for testing
            end

            printOut($dailySalary, dayType, 0, timeIn, timeOut, 500) #placeholder values for testing
            
        when "2"
            stop = true 
        else
            puts "invalid action"
    end
end
    puts "You've quit the application"

