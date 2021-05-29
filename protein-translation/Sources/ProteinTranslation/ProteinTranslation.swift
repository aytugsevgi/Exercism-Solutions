struct ProteinTranslation {
    static private let proteinsOfCodons = [
        "AUG": "Methionine",
        "UUU": "Phenylalanine",
        "UUC": "Phenylalanine",
        "UUA": "Leucine",
        "UUG": "Leucine",
        "UCU": "Serine",
        "UCC": "Serine",
        "UCA": "Serine",
        "UCG": "Serine",
        "UAU": "Tyrosine",
        "UAC": "Tyrosine",
        "UGU": "Cysteine",
        "UGC": "Cysteine",
        "UGG": "Tryptophan",
        "UAA": "STOP",
        "UAG": "STOP",
        "UGA": "STOP"
    ]
    
    static func translationOfCodon(_ codon: String) throws -> String {
        guard let protein = proteinsOfCodons[codon] else {
            throw ProteinTranslationError.invalidCodon
        }
        return protein
    }
    
    static func translationOfRNA(_ rna: String) throws -> [String] {
        var proteins = [String]()
        var startLocation = 0
        while startLocation + 2 < rna.count {
            let startIndex = rna.index(rna.startIndex, offsetBy: startLocation)
            let codon = rna[startIndex...rna.index(startIndex, offsetBy: 2)]
            let protein = try translationOfCodon(String(codon))
            if protein == "STOP" {
                break
            }
            proteins.append(protein)
            startLocation += 3
        }
        return proteins
    }
}

enum ProteinTranslationError : Error {
    case invalidCodon
}
