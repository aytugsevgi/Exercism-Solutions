//Solution goes in Sources
import Foundation

class Constant {
    static let whatever = "Whatever."
    static let chillOut = "Whoa, chill out!"
    static let sure = "Sure."
    static let fine = "Fine. Be that way!"
}

struct Bob {
    static func hey(_ input: String) -> String {
        var str = input.trimmingCharacters(in: .whitespaces)
        guard str != "" else { return Constant.fine }
        let anyLetters = str.filter { $0.isLetter }
        guard anyLetters.isEmpty || str != str.uppercased() else { return Constant.chillOut }
        guard str.last! != "?" else { return Constant.sure }
        return Constant.whatever
        

    }
}



