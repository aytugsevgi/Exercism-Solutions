//Solution goes in Sources

struct Scrabble {
    var pattern: String?
    var score: Int { Scrabble.calculateScore(pattern) }
    
    static func score(_ pattern: String?) -> Int {
        calculateScore(pattern)
    }
    
    private static func calculateScore(_ pattern: String?) -> Int {
        
        guard var pattern = pattern else { return 0 }
        var currentScore = 0
        pattern = pattern.uppercased()
        pattern.forEach {
            guard let letter = Letter.init(rawValue: String($0)) else {
                currentScore = 0
                return
            }
            currentScore += letter.score
        }
        return currentScore
    }
    
    init(_ pattern: String?) {
        self.pattern = pattern
    }
    
    enum Letter: String {
        case A, E, I, O, U, L, N, R, S, T
        case D, G
        case B, C, M, P
        case F, H, V, W, Y
        case K
        case J, X
        case Q, Z
        
        var score: Int {
            switch self {
            case .A, .E, .I, .O, .U, .L, .N, .R, .S, .T:
                return 1
            case .D, .G:
                return 2
            case .B, .C, .M, .P:
                return 3
            case .F, .H, .V, .W, .Y:
                return 4
            case .K:
                return 5
            case .J, .X:
                return 8
            case .Q, .Z:
                return 10
            }
        }
    }
}
