//
//  ContentView.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    var cars: [String] = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
//
//    var flags: [String] = ["🇦🇫", "🇦🇩", "🇦🇴", "🇦🇿", "🇧🇸", "🇧🇧", "🇧🇷", "🇨🇦", "🇬🇵", "🇮🇪"]
//
//    var faces: [String] = ["😃", "😅", "😂", "🥲", "☺️", "🙃", "😉", "😋"]
//
//    @State var emojis: Array<String> = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
//    // type can be inferred, or use [String] instead
//    @State var emojiCount: Int = 13
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
        ContentView(viewModel: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
