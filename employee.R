library(R6)
employee <- R6Class( #employee object
    classname = "employee",
    public = list(
        name = NULL,
        timeIn = NULL,
        timeOut = NULL,
        dayType = NULL,
        overTime = 0,
        nightShift = 0,
        initialize = function(name = NA, timeIn = NA, timeOut = NA, dayType = NA, overtime = NA, nightShift = NA){
            self$name = name
            self$timeIn = timeIn
            self$timeOut = timeOut
            self$dayType = dayType
            self$overTime = overTime
            self$nightShift = nightShift
        }
    )
)



