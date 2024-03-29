val reader = Scanner(System.`in`)

fun compute(shift: String, timeDiff: Int){
    val dailySalary = 500
    if (shift == "Night Shift"){
        var totalSalary = dailySalary + ((dailySalary * 1.375) * timeDiff)
    }
    else{
        var totalSalary = dailySalary
    }
    return totalSalary
}
fun salary(){
    var shiftInWords
    print("Time In: ")
    val timeIn = reader.nextInt()
    print("Time Out: ")
    val timeOut = reader.nextInt()
    println("Choose Shift")
    println("[1] Day Shift")
    println("[2] Night Shift")
    val shift = reader.nextInt()

    switch(shift){
        case 1: shiftInWords = "Day Shift"
        break;
        case 2: shiftInWords = "Night Shift"
    }
    val timeDiff = timeOut - 2100
    var salaryCompute = compute(shiftInWords, timeDiff)
    return salaryCompute
}
fun main(){
    
    println("Weekly Payroll System")
    println("[1] Calculate Weekly Salary")
    println("[2] Quit Application")
    val choice = reader.nextInt()

    if(choice == 1){
        var Salary = salary()
        println("Salary: $Salary")
    }

}
