class BinarySearch {
    let list: [Int]
    
    init(_ numbers: [Int]) throws {
        list = numbers
        try checkSort(list)
    }
    
    var middle: Int {
        return list.count / 2
    }
    
    func searchFor(_ number: Int) -> Int? {
        var high = list.count
        var low = 0
        var middle = 0
        
        while low <= high {
            middle = low + (high - low) / 2
            
            if list[middle] > number {
                high = middle - 1
            } else if list[middle] < number {
                low = middle + 1
            } else {
                return middle
            }
        }
        
        return nil
    }
    
    private func checkSort(_ numbers: [Int]) throws {
        for index in 1..<numbers.count {
            if numbers[index - 1] > numbers[index] {
                throw BinarySearchError.unsorted
            }
        }
    }
}

enum BinarySearchError: Error {
    case unsorted
}
