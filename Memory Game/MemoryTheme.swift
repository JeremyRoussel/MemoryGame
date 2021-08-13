//
//  MemoryTheme.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 8/13/21.
//

// MODEL

import Foundation

struct Theme {
    var name: String
    
    var content: Array<String>
    
    var numPairs: Int
    
    var color: String
    
    init(name: String, content: Array<String>, numPairs: Int, color: String) {
        self.name = name
        self.content = content
        self.numPairs = numPairs > content.count ? content.count : numPairs
        self.color = color
    }
}
