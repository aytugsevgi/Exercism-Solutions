struct Allergies {
    let allergies: UInt
    
    init(_ allergies: UInt) {
        self.allergies = allergies
    }
    
    func hasAllergy(_ allergy: Allergy) -> Bool {
        return allergies & allergy.rawValue == allergy.rawValue
    }
}

enum Allergy: UInt {
    case eggs = 1
    case peanuts = 2
    case shellfish = 4
    case strawberries = 8
    case tomatoes = 16
    case chocolate = 32
    case pollen = 64
    case cats = 128
}
