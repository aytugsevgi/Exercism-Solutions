//Solution goes in Sources

class Constant {
    static let secondInYearOnEarth = 31557600
    static let orbitalPeriodOnMercury = 0.2408467
    static let orbitalPeriodOnVenus = 0.61519726
    static let orbitalPeriodOnMars = 1.8808158
    static let orbitalPeriodOnJupiter = 11.862615
    static let orbitalPeriodOnSaturn = 29.447498
    static let orbitalPeriodOnUranus = 84.016846
    static let orbitalPeriodOnNeptune = 164.79132
}

struct SpaceAge {
    var seconds: Int
    var onEarth: Double {
        return Double(seconds) / Double(Constant.secondInYearOnEarth)
    }
    var onMercury: Double {
        return onEarth / Constant.orbitalPeriodOnMercury
    }
    var onVenus: Double {
        return onEarth / Constant.orbitalPeriodOnVenus
    }
    var onMars: Double {
        return onEarth / Constant.orbitalPeriodOnMars
    }
    var onJupiter: Double {
        return onEarth / Constant.orbitalPeriodOnJupiter
    }
    var onSaturn: Double {
        return onEarth / Constant.orbitalPeriodOnSaturn
    }
    var onUranus: Double {
        return onEarth / Constant.orbitalPeriodOnUranus
    }
    var onNeptune: Double {
        return onEarth / Constant.orbitalPeriodOnNeptune
    }
    
    init(_ seconds: Int) {
        self.seconds = seconds
    }
    
}
