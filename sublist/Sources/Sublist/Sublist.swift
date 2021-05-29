enum SublistClass {
    case equal
    case sublist
    case superlist
    case unequal
}


func checkIf(_ bigList: [Int], contains smallList: [Int]) -> Bool {
    if smallList.count == 0 {
        return true
    }
    biggerLoop: for i in 0..<(bigList.count-smallList.count+1) {
        for j in 0..<smallList.count {
            if bigList[i + j] != smallList[j] {
                continue biggerLoop
            }
        }
        return true
    }
    return false
}

func classifier(listOne: [Int], listTwo: [Int]) -> SublistClass {
    if listOne.count == listTwo.count {
        return checkIf(listOne, contains: listTwo) ?.equal : .unequal
    } else if listOne.count > listTwo.count {
        return checkIf(listOne, contains: listTwo) ?.superlist : .unequal
    } else {
        return checkIf(listTwo, contains: listOne) ?.sublist : .unequal
    }
}
