import Foundation

class PhoneNumber:CustomStringConvertible {
    private(set) lazy var number: String = {
        var new = self.input.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        guard new.count == 10 else {
            if new.count == 11 && new.first == "1" {
                new.removeFirst()
                return new
            }
            return "0000000000"
        }
        return new
    }()
    
    internal lazy var description: String = {
        var number = self.number
        number.removeFirst(3)
        let part2 = number.prefix(3)
        number.removeFirst(3)
        return "(\(areaCode)) \(part2)-\(number)"
    }()
    
    private(set) lazy var areaCode: String = {
        return String(number.prefix(3))
    }()
    
    private let input: String
    init(_ input: String) {
        self.input = input
    }
}
