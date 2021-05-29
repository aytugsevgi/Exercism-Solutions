import Foundation

struct WordCount {
    var words: String
    
    init(words: String) {
        self.words = words
    }

    func count() -> [String : Int] {
        var counter: [String : Int] = [:]
        
        for word in words.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).filter({$0 != ""}) {
            counter[word] = (counter[word] == nil ? 1 : counter[word]! + 1)
        }
        return counter
    }
}
