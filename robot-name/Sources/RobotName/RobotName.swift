struct Robot {
    var name: String

    init() {
        name = ""
        generateName()
    }

    mutating func generateName() {
        let codePatter = "LLDDD"
        for type in codePatter {
            switch (type) {
            case "L":
                name += String("ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()!)
                break
            case "D":
                name += String(Int.random(in: 0...9))
                break
            default: break
            }
        }
    }

    mutating func resetName() {
        generateName()
    }

}
