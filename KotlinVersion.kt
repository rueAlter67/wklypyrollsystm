import java.util.Scanner
val reader = Scanner(System.`in`)

fun compute(shift: String, timeDiff: Int): Double{
    val dailySalary: Double = 500.00
    var totalSalary = dailySalary
    if (shift == "Night Shift"){
        totalSalary = dailySalary + ((dailySalary * 1.375) * timeDiff)
    }
    return totalSalary
}
fun salary(): Double{
    var shiftInWords = "Night Shift"
    print("Time Out: ")
    val timeOut: Int = reader.nextInt()
    println("Choose Shift")
    println("[1] Day Shift")
    println("[2] Night Shift")
    val shift: Int = reader.nextInt()

    if (shift == 1){
        shiftInWords = "Day Shift"
    }
 
    val timeDiff = timeOut - 2100
    var salaryCompute = compute(shiftInWords, timeDiff)
    return salaryCompute
}
fun main(){
    
    println("Weekly Payroll System")
    println("[1] Calculate Weekly Salary")
    println("[2] Quit Application")
    val choice: Int = reader.nextInt()

    if(choice == 1){
        var Salary = salary()
        println("Salary: $Salary")
    }

}
