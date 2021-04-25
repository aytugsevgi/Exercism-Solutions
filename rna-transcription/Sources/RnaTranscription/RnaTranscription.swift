import Foundation

class RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}

struct Nucleotide {
    let nucleotide: String
    init(_ nucleotide: String) {
        self.nucleotide = nucleotide
    }
    func complementOfDNA() throws -> String {
        var complementOfDna = ""
        for element in nucleotide {
            switch element {
            case "C":
                complementOfDna += "G"
            case "G":
                complementOfDna +=  "C"
            case "T":
                complementOfDna +=  "A"
            case "A":
                complementOfDna +=  "U"
            default:
                throw(RnaTranscription.TranscriptionError.invalidNucleotide("\(element) is not a valid Nucleotide"))
            }
        }
        return complementOfDna
    }
}
