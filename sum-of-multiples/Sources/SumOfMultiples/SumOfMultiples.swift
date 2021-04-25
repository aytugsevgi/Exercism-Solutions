struct SumOfMultiples {
    static func toLimit(_ upperLimit: Int, inMultiples: [Int]) -> Int {
        var myInMultiples = inMultiples
        myInMultiples.removeAll { $0 == 0 }
        var sum = 0
        var lowerLimit = 1
        if let min = myInMultiples.min() {
            lowerLimit = min
        }
        if upperLimit <= lowerLimit {
            return 0
        }
        for number in lowerLimit..<upperLimit {
            for inMultiple in myInMultiples {
                if inMultiple == 0 || number < inMultiple {
                    break
                }
                if number % inMultiple == 0 {
                    sum += number
                    break
                }
            }
        }
        return sum
    }
}
