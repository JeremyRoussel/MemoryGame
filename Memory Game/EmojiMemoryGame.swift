//
//  EmojiMemoryGame.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/11/21.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "😃"
}

class EmojiMemoryGame {
    static private let cars: [String] = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
    
    static private func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4 ) { pairIndex in EmojiMemoryGame.cars[pairIndex]}
    }
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
