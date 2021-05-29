struct House {
    private static let lines = [
        " the house that Jack built.",
        " the malt\nthat lay in",
        " the rat\nthat ate",
        " the cat\nthat killed",
        " the dog\nthat worried",
        " the cow with the crumpled horn\nthat tossed",
        " the maiden all forlorn\nthat milked",
        " the man all tattered and torn\nthat kissed",
        " the priest all shaven and shorn\nthat married",
        " the rooster that crowed in the morn\nthat woke",
        " the farmer sowing his corn\nthat kept",
        " the horse and the hound and the horn\nthat belonged to",
        ]

    static func recite() -> String {
        return lines.indices.map { verse(startingIndex: $0) }.joined(separator: "\n\n")
    }

    static func verse(startingIndex index: Int) -> String {
        return "This is" + lines[0...index].reversed().joined()
    }
}
