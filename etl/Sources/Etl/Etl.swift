//Solution goes in Sources

class ETL {
    static func transform(_ values: [Int: [String]]) -> [String: Int] {
        var transformed = [String: Int]()
        for (point, chars) in values {
            chars.forEach { transformed[$0.lowercased()] = point }
        }
        return transformed
    }
}
