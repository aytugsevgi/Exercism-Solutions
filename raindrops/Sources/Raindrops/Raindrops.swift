//Solution goes in Sources
import Foundation

struct Raindrops {
    var number: Int
    var sounds: String {
        var result = ""
        let factors = [[3,"Pling"],[5,"Plang"],[7,"Plong"]]
        factors.forEach { factor in
            if number % (factor[0] as! Int) == 0 {
                result += factor[1] as! String
            }
        }
        if result.isEmpty {
            result = "\(number)"
        }
        return result
    }
    
    init(_ number: Int) {
        self.number = number
    }

}
