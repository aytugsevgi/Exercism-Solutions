//Solution goes in Sources
import Foundation

struct Gigasecond {
    let description : String
    
    init? (from: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = formatter.date(from: from) else { return nil }
        let hence = Date(timeInterval: pow(10, 9), since: date)
        description = formatter.string(from: hence)
    }
}


