//
//  EmojiMemoryGame.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/11/21.
//

// VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static private let cars: [String] = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
    
    static private func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4 ) { pairIndex in cars[pairIndex]}
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent()
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
