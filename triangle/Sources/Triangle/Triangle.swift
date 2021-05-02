//Solution goes in Sources
import Foundation

struct Triangle {
    var sides: [Double]
    var kind: String {
        guard isValid() else { return TriangleKind.ErrorKind.rawValue }
        let orderedSet = NSOrderedSet(array: sides)
        switch orderedSet.count {
        case 1:
            return TriangleKind.Equilateral.rawValue
        case 2:
            return TriangleKind.Isosceles.rawValue
        case 3:
            return TriangleKind.Scalene.rawValue
        default:
            return TriangleKind.ErrorKind.rawValue
        }
    }
    
    enum TriangleKind: String {
        case Equilateral = "Equilateral"
        case Isosceles = "Isosceles"
        case Scalene = "Scalene"
        case ErrorKind = "ErrorKind"
    }
    
    init(_ side1:Double, _ side2: Double, _ side3: Double) {
        self.sides = [side1, side2, side3]
    }
    
    func isValid() -> Bool {
        guard !sides.contains(where: { $0 <= 0 }) else { return false }
        let condition1 = sides[2] < sides[0] + sides[1]
        let condition2 = sides[0] < sides[1] + sides[2]
        let condition3 = sides[1] < sides[0] + sides[2]
        return condition1 && condition2 && condition3
    }
}
