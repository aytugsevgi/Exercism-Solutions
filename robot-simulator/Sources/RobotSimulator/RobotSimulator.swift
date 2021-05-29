//Solution goes in Sources

struct SimulatedRobot {
    enum RobotBearing {
        case north, south, east, west
        func afterInstruction(_ i: RobotInstruction) -> RobotBearing {
            switch (self, i) {
            case (.north, .turnLeft): return  .west
            case (.north, .turnRight): return .east
            case (.south, .turnLeft): return  .east
            case (.south, .turnRight): return .west
            case (.east, .turnLeft): return   .north
            case (.east, .turnRight): return  .south
            case (.west, .turnLeft): return   .south
            case (.west, .turnRight): return  .north
            default: return self
            }
        }
    }
    
    enum RobotInstruction: Character {
        case turnLeft  = "L"
        case turnRight = "R"
        case advance   = "A"
    }
    
    private(set) var bearing: RobotBearing = .north
    private var x = 0
    private var y = 0
    
    var coordinates: [Int] { return [x, y] }
    
    mutating func orient(_ b: RobotBearing) {
        bearing = b
    }
    
    mutating func turnRight() {
        bearing = bearing.afterInstruction(.turnRight)
    }
    
    mutating func turnLeft() {
        bearing = bearing.afterInstruction(.turnLeft)
    }
    
    mutating func at(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func advance() {
        switch bearing {
        case .north: y += 1
        case .south: y -= 1
        case .east:  x += 1
        case .west:  x -= 1
        }
    }
    
    func instructions(_ inst: String) -> [RobotInstruction] {
        return inst.characters.flatMap { RobotInstruction(rawValue: $0) }
    }
    
    mutating func place(x: Int, y: Int, direction: RobotBearing) {
        at(x: x, y: y)
        orient(direction)
    }
    
    mutating func evaluate(_ inst: String) {
        instructions(inst).forEach { perform($0) }
    }
    
    private mutating func perform(_ action: RobotInstruction) {
        switch action {
        case .turnRight: turnRight()
        case .turnLeft:  turnLeft()
        case .advance:   advance()
        }
    }
}
