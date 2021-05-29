class TwelveDaysSong {
  static let nthWords = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

  static let giftObjects = [
    "a Partridge",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]

  static func verse(_ n: Int) -> String {
    let nth = nthWords[n - 1]
    let gifts = getGifts(n)
    return "On the \(nth) day of Christmas my true love gave to me: \(gifts) in a Pear Tree."
  }

  static func verses(_ from: Int, _ to: Int) -> String {
    return (from...to).map { verse($0) }.joined(separator: "\n")
  }

  static func sing() -> String {
    return verses(1, 12)
  }

  static func getGifts(_ n: Int) -> String {
    if n == 1 {
      return giftObjects.first!
    }

    let gifts = giftObjects.prefix(upTo: n).reversed()

    return gifts.dropLast().joined(separator: ", ") + ", and " + gifts.last!
  }
}
