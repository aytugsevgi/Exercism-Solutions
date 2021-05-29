struct CollatzConjecture {
    enum NumError: Error { case notPositive }

    static func steps(_ inNum: Int) throws -> UInt64 {
        if inNum <= 0 { throw NumError.notPositive }
        var num = inNum
        var count: UInt64 = 0
        while num != 1 {
            (num % 2 == 0) ? (num /= 2) : (num = 3 * num + 1)
            count += 1
        }
        return count
    }
}
