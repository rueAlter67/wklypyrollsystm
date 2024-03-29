/*
go build CSADPRG_MCO.go
go run CSADPRG_MCO.go
CSADPRG_MCO
*/

package main

import (
	"fmt"
)

func calcPay(timeIn int, dayType int, timeOut int) {
	dailyRate := 500.00
	var dailySalary float64

	if dayType == 1 {
		fmt.Println("Salary for the day: ", dailyRate)
	} else if dayType == 2 {
		dailySalary = ((dailyRate / 8) * 1.10) * 8
		fmt.Println("Salary for the day: ", dailySalary)
	}

	//no implementation of overtime pay
}

func PayInputs() {
	var timeIn, dayType, timeOut int

	fmt.Println("Input time in: (24 hr format)")
	fmt.Scanf("%d\n", &timeIn)

	fmt.Println("Select what type of day:")
	fmt.Println("[1] Regular day shift")
	fmt.Println("[2] Regular night shift")
	fmt.Scanf("%d\n", &dayType)

	fmt.Println("Input time out: (24 hr format)")
	fmt.Scanf("%d\n", &timeOut)

	calcPay(timeIn, dayType, timeOut)
}

func main() {
	var option int

	fmt.Println("Weekly Payroll System")
	fmt.Println("[1] Calculate weekly salary")
	fmt.Println("[2] Quit application")
	fmt.Scanf("%d\n", &option)

	if option == 1 {
		fmt.Println("Calculating salary...")
		PayInputs()
	} else if option == 2 {
		fmt.Println("Quitting application")
	} else {
		fmt.Println("Invalid option")
	}

}
