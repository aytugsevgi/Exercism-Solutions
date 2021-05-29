struct Acronym{
    static func abbreviate(_ name: String) -> String{
        var uppercased: Bool = false
        var acro: String = ""
        var last: Character = "a"
        for c in name{
            switch(c){
            case "-", " ":
                uppercased = true
            case _ where c.isUppercase && last.isLowercase && !uppercased && c.isLetter:
               acro.append(c)
            case _ where uppercased:
               acro.append(c)
                uppercased = false
            case _:
                break
            }
            last = c
        }
        return acro.uppercased()
    }
}
