//
//  EmojiMemoryGame.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/11/21.
//

// VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    typealias MemGame = MemoryGame<String>
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    private static var themes: Array<Theme> = [
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
    
    static private func createMemoryGame(theme: Theme) -> MemGame {
        MemGame(numberOfPairsOfCards: theme.numPairs ) { pairIndex in theme.content[pairIndex]}
    }
    
    @Published private(set) var gameModel: MemGame
    
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
    
    var cards: Array<Card> {
        return gameModel.cards
    }
    
    //MARK: - Intent()
    
    func choose(_ card: Card) {
        gameModel.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        gameModel = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
