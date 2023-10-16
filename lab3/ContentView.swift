//
//  ContentView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["S", "A", "B", "D", "E"]
    
    @State var cardCount = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
                cardsCountAdjuster
            
        }.padding()
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120 ))]){
            ForEach(0..<cardCount, id: \.self){
                index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
    
    var cardsCountAdjuster: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    var cardAdder: some View{
        Button("Add card"){
            if cardCount < emojis.count{
                cardCount+=1
            }
        }
    }
    
    var cardRemover: some View {
        Button("Remove card"){
            if cardCount > 1{
                cardCount-=1
            }
        }

    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
