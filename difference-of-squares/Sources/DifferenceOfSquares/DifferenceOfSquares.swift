//Solution goes in Sources
import Foundation
class Squares {
    let number: Int
    var differenceOfSquares: Int {
        squareOfSum - sumOfSquares
    }
    var sumOfSquares: Int {
        var sum = 0
        for i in 1...number {
            sum += i*i
        }
        return sum
    }
    var squareOfSum: Int {
        var sum = 0
        for i in 1...number {
            sum += i
        }
        return sum*sum
    }
    
    init(_ number: Int) {
        self.number = number
    }
    
    
}
