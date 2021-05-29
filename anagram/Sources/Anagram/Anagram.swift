struct Anagram{
    var wordDict: [Character:Int]
    var word: String
    init(word: String){
        self.word = word.lowercased()
        self.wordDict = self.word.reduce(into: [:]) {counts, letter in
            counts[letter, default: 0] += 1
        }
    }
    func match(_ words: [String]) -> [String]{
      return  words.filter {x in
        x.lowercased() != word &&
            x.lowercased().reduce(into: [:], {counts, letter in
               counts[letter, default: 0] += 1
            }) == wordDict
        }
    }
}
