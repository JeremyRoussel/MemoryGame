//
//  ContentView.swift
//  Memory Game
//
//  Created by Jeremy Roussel on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    
    var cars: [String] = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
    
    var flags: [String] = ["🇦🇫", "🇦🇩", "🇦🇴", "🇦🇿", "🇧🇸", "🇧🇧", "🇧🇷", "🇨🇦", "🇬🇵", "🇮🇪"]
    
    var faces: [String] = ["😃", "😅", "😂", "🥲", "☺️", "🙃", "😉", "😋"]
    
    @State var emojis: Array<String> = ["🚗", "🚜", "🚝", "🛩", "🛸", "🚁", "🚢", "🛶", "🚙", "🚌", "🛴", "🚲", "🚃"]
    // type can be inferred, or use [String] instead
    @State var emojiCount: Int = 13
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                carButton
                flagButton
                faceButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
    
    var add: some View {
        Button(action: {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    var minus: some View {
        Button(action: {
            if (emojiCount > 1) {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var carButton: some View {
        Button(action: {
            emojis = cars
            reset()
        }, label: {
            VStack {
                Image(systemName: "car.circle")
                Text("Transportation")
                    .font(.subheadline)
            }
        })
        .padding(.horizontal)
    }
    
    var flagButton: some View {
        Button(action: {
            emojis = flags
            reset()
        }, label: {
            VStack {
                Image(systemName: "flag.circle")
                Text("Flags")
                    .font(.subheadline)
            }
        })
        .padding(.horizontal)
    }
    
    var faceButton: some View {
        Button(action: {
            emojis = faces
            reset()
        }, label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("Emojis")
                    .font(.subheadline)
            }
        })
        .padding(.horizontal)
    }
    
    func reset() {
        emojiCount = emojis.count
        emojis = emojis.shuffled()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
