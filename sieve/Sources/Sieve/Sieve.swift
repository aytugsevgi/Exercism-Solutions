

struct Sieve {
    let limit: Int
    
    init(_ limit: Int) {
        self.limit = limit
    }
    
    var primes: [Int] {
        var primes: [Int] = [2]
        for number in stride(from: 3, to: limit, by: 2) {
            if isPrime(number: number) {
                primes.append(number)
            }
        }
        return primes
    }
    
    private func isPrime(number: Int) -> Bool {
        guard number >= 2 else { return false }
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
}
