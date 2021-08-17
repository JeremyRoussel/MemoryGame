//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 5/19/21.
//

import SwiftUI

@main
struct Memory_GameApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
