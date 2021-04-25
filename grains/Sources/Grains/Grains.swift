import Foundation


struct Grains {
    static var total = UInt64.max 
    static func square(_ input: Int) throws -> UInt {
        guard case 1...64 = input else { throw(GrainsError(input)) }
        let result = UInt(pow(2.0, Double(input - 1)))
        return result
    }
}

extension Grains {
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
        init(_ input: Int) {
            let message = "Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)"
            self = input <= 0 ? .inputTooLow(message) : .inputTooHigh(message)
        }
    }
}

