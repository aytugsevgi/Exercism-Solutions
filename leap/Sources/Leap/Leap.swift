//Solution goes in Sources
struct Year {
    var calendarYear: Int
    var isLeapYear: Bool {
        get {
            if calendarYear % 400 == 0 {
                return true
            }
            else if calendarYear % 100 != 0  && calendarYear % 4 == 0 {
                return true
            }
            return false
        }
    }
}

