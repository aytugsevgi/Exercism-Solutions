//Solution goes in Sources

struct Raindrops {
    var number: Int
    var sounds: String {
        var result = ""
        let factors = [3:"Pling",5:"Plang",7:"Plong"]
        factors.forEach { (factor, desc) in
            if number % factor == 0 {
                result += desc
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
