//Solution goes in Sources

class Clock: Equatable {
    var hours: Int
    var minutes: Int
    var description: String {
        var totalMinutes = 0
        totalMinutes += hours * 60
        totalMinutes += minutes
        var minutes = totalMinutes % 60
        var hours = (totalMinutes / 60) % 24
        hours = hours < 0 ? 24+hours : hours
        if totalMinutes < 0 {
            hours = abs(hours) - 1
            minutes = 60 + minutes
            if minutes >= 60 {
                hours += 1
            }
            minutes %= 60
        }
        hours = hours < 0 ? 24+hours : hours
        var clock = hours < 10 ? "0\(hours):" : "\(hours):"
        clock.append(minutes < 10 ? "0\(minutes)" : "\(minutes)")
        return clock
    }
    
    init(hours: Int = 0, minutes: Int = 0) {
        self.hours = hours
        self.minutes = minutes
    }
    
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.description == rhs.description
    }
    
     func add(minutes: Int) -> String {
        self.minutes += minutes
        return self.description
    }
    
    func subtract(minutes: Int) -> String {
        self.minutes -= minutes
        return self.description
    }
}
