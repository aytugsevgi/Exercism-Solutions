import Foundation

class Hamming {
    static func compute(_ first: String, against second: String) -> Int? {
        guard first.count == second.count else { return nil }
        var differenceCount = 0
        for i in 0..<first.count {
            let strIndex = first.index(first.startIndex, offsetBy: i)
            let firstChar = first[strIndex]
            let secondChar = second[strIndex]
            if firstChar != secondChar {
                differenceCount += 1
            }
        }
        return differenceCount
    }
}

/*
 test
 */
