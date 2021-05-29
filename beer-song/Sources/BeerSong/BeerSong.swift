class BeerSong {
    var number: Int
    
    init(numberOfBeerBottles:Int) {
        number = numberOfBeerBottles
    }
    
    func generateVersesOfBeerSong() -> String {
        let endString = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
        
        var result = ""
        while number > 0 {
            let s = number > 1 ? "\(number) bottles" : "1 bottle"
            var left = ""
            if number - 1 > 1 {
                left = "\(number-1) bottles"
            } else if number - 1 == 1 {
                left = "1 bottle"
            } else {
                left = "no more bottles"
            }
            result += "\(s) of beer on the wall, \(s) of beer.\nTake one down and pass it around, \(left) of beer on the wall.\n\n"
            number -= 1
        }
        
        result += endString
        
        return result
    }
}
