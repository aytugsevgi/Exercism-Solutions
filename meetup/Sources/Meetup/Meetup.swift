import Foundation

func lastDayOfMonth(month:Int, inYear year:Int, #calendar:NSCalendar) -> Int {
    let date = dateForDay(1, month:month, year:year, withCalendar:calendar)!
    let range:Range = calendar.rangeOfUnit(.DayCalendarUnit, inUnit: .MonthCalendarUnit, forDate: date).toRange()!
    return range.endIndex
}

func dateForDay(day:Int, #month:Int, #year:Int, withCalendar calendar:NSCalendar) -> NSDate? {
    var components = NSDateComponents()
    components.year = year
    components.month = month
    components.day = day
    return calendar.dateFromComponents(components)
}

struct Meetup {
    let year:Int
    let month:Int
    
    func day(targetWeekday:Int, which whichOption:String) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        
        let range:Range<Int>
        
        switch whichOption {
        case "1st":
            range = 1...7
        case "2nd":
            range = 8...14
        case "3rd":
            range = 15...21
        case "4th":
            range = 22...28
        case "teenth":
            range = 13...19
        case "last":
            let lastDay = lastDayOfMonth(month, inYear:year, calendar:calendar)
            range = (lastDay - 7)...lastDay
        default:
            range = 1...7
        }
        
        return map(range) { (day:Int) -> NSDate in
            return dateForDay(day, month:self.month, year:self.year, withCalendar:calendar)!
            }
            .filter { date in
                return targetWeekday == calendar.component(.WeekdayCalendarUnit, fromDate:date)
            }.first!
    }
}
