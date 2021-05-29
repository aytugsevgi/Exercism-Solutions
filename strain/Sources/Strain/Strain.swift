import Foundation

extension Array {
    func keep(_ array: @escaping (Element) -> Bool) -> [Element] {
        return self.filter{array($0)}
    }
    
    func discard(_ array: @escaping (Element) -> Bool) -> [Element] {
        return self.filter{!array($0)}
    }
}
