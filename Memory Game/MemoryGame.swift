//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/11/21.
//

// MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var faceUpIndex: Int?
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card)
        // if let chosenIndex = cards.firstIndex(where: { cardInArray in cardInArray.id == card.id}) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = faceUpIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                faceUpIndex = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                faceUpIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
//    func index(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2 ))
            cards.append(Card(content: content, id: pairIndex*2 + 1 ))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
