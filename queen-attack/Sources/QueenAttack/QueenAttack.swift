

struct Queens {
    let white: [Int]
    let black: [Int]
    
    var description: String {
        var pattern = ""
        for row in 0...7 {
            for column in 0...7 {
                let coord = [row, column]
                if coord.elementsEqual(white) {
                    pattern.append("W ")
                } else if coord.elementsEqual(black) {
                    pattern.append("B ")
                } else {
                    pattern.append("_ ")
                }
            }
            pattern.removeLast()
            pattern.append("\n")
        }
        pattern.removeLast()
        return pattern
    }
    
    var canAttack: Bool {
        let cond1 = abs(white[0] - white[1]) == abs(black[0] - black[1])
        let cond2 = white[0] == black[0] || white[1] == black[1]
        return cond1 || cond2
    }
    
    init(white: [Int], black: [Int]) throws {
        guard white.count == 2, black.count == 2 else { throw(InitError.incorrectNumberOfCoordinates)}
        guard !white.contains(where: { $0 < 0 }), !black.contains(where: { $0 < 0 }) else {
            throw(InitError.invalidCoordinates)
        }
        guard !white.elementsEqual(black) else {
            throw(InitError.sameSpace)}
        self.white = white
        self.black = black
    }
    
    init() {
        white = [0, 3]
        black = [7, 3]
    }
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
}
