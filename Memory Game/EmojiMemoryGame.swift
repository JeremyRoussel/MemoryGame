//
//  EmojiMemoryGame.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/11/21.
//

// VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
//    static private let cars: [String] = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            content: ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"],
            numPairs: 8,
            color: "red"
        ),
        Theme(
            name: "Flags",
            content: ["🇦🇫", "🇦🇩", "🇦🇴", "🇦🇿", "🇧🇸", "🇧🇧", "🇧🇷", "🇨🇦", "🇬🇵", "🇮🇪"],
            numPairs: 8,
            color: "blue"
        ),
        Theme(
            name: "Faces",
            content: ["😃", "😅", "😂", "🥲", "☺️", "🙃", "😉", "😋"],
            numPairs: 8,
            color: "green"
        ),
    ]
    
    static private func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numPairs ) { pairIndex in theme.content[pairIndex]}
    }
    
    @Published private(set) var gameModel: MemoryGame<String>
    
    private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        
        default:
            return .red
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return gameModel.cards.shuffled()
    }
    
    //MARK: - Intent()
    
    func choose(_ card: MemoryGame<String>.Card) {
        gameModel.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
