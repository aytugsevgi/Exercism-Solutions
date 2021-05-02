//Solution goes in Sources
import Foundation
struct Isogram {
    static func isIsogram(_ word: String) -> Bool {
        let myWord = word.alphanumeric
        let orderedSet = NSOrderedSet(array: Array(myWord.lowercased()))
        return orderedSet.count == myWord.count || myWord.isEmpty
    }
        
}

extension String {
    var alphanumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
}
