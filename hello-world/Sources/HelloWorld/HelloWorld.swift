
class HelloWorld {
    static func hello(_ name: String? = nil) -> String {
        guard let name = name else {
            return "Hello, World!"
        }
        return "Hello, \(name)!"
    }
}

