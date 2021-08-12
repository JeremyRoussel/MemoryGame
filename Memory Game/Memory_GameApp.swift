//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 5/19/21.
//

import SwiftUI

@main
struct Memory_GameApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
