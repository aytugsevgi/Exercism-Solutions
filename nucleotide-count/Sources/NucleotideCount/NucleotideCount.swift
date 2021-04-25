//Solution goes in Sources
import Foundation

struct DNA {
    var strand: String
    init?(strand: String) {
        let isValid = strand.contains{ ["A","T","C","G"].contains($0) }
        guard isValid || strand.isEmpty else { return nil }
        self.strand = strand
    }
    
    func counts() -> [String: Int] {
        var countOfNucs = [String: Int]()
        countOfNucs["A"] = 0
        countOfNucs["T"] = 0
        countOfNucs["C"] = 0
        countOfNucs["G"] = 0
        strand.forEach { countOfNucs[String($0)]! += 1 }
        return countOfNucs
    }
    
    func count(_ nucleotid: Character) -> Int {
        return strand.reduce(0) { sum, char in
            char == nucleotid ? sum + 1 : sum
        }
    }
}
