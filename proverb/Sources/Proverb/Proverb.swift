extension Array where Element == String {
    func recite() -> String {
        guard !self.isEmpty else { return "" }
        let body = zip(self, self.dropFirst())
            .map { return "For want of a \($0.0) the \($0.1) was lost." }
            .joined(separator: "\n")
        let coda = "And all for the want of a \(self.first!)."
        
        return body.isEmpty ? coda : "\(body)\n\(coda)"
    }
}
