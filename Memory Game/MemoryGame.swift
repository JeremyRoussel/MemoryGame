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
    
    private(set) var score: Int
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card)
        // if let chosenIndex = cards.firstIndex(where: { cardInArray in cardInArray.id == card.id}) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            // is there a single card face-up?
            if let potentialMatchIndex = faceUpIndex {
                // there is a match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    updateScore(by: 2)
                }
                //there is not a match
                else {
                    if cards[chosenIndex].hasBeenSeen {
                        updateScore(by: -1)
                    } else {
                        cards[chosenIndex].hasBeenSeen = true
                    }
                    if cards[potentialMatchIndex].hasBeenSeen {
                        updateScore(by: -1)
                    } else {
                        cards[potentialMatchIndex].hasBeenSeen = true
                    }
                }
                faceUpIndex = nil
            } else {
                // turn all cards face-down
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                faceUpIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func updateScore(by points: Int) {
        score += points
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2 ))
            cards.append(Card(content: content, id: pairIndex*2 + 1 ))
        }
        cards.shuffle()
        score = 0
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}
