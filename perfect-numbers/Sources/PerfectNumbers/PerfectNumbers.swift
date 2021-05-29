import Foundation

struct NumberClassifier {
    let number: Int
    
    
    var classification: Classification {
        let sum = self.sumPositiveDivisors()
        var n: Classification = .abundant
        switch sum {
        case let b where sum == number:
            n = .perfect
        case let b where sum > number:
            n = .abundant
        case let b where sum < number:
            n = .deficient
        default: break
        }
        return n
    }
    private func sumPositiveDivisors() -> Int {
        let range = 1...abs(number / 2)
        let array = Array(range).filter { number % $0 == 0 }
        return array.reduce(0, +)
    }
    enum Classification {
        case abundant
        case deficient
        case perfect
    }
}
