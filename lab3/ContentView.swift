//
//  ContentView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyMemoGame
//    let emojis = ["S", "A", "B", "D", "E"]
    
//    @State var cardCount = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("WTMIESZAJ"){
                viewModel.shuffle()
                print(viewModel.cards)
            }
//                cardsCountAdjuster

            
        }.padding()
        
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85 ), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){
                card in
                CardView(
                    card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }

            }
        }
        .foregroundColor(.blue)
        
    }
//
//    var cardsCountAdjuster: some View {
//        HStack{
//            cardAdder
//            Spacer()
//            cardRemover
//        }
//    }
//
//    var cardAdder: some View{
//        Button("Add card"){
//            if cardCount < emojis.count{
//                cardCount+=1
//            }
//        }
//    }
//
//    var cardRemover: some View {
//        Button("Remove card"){
//            if cardCount > 1{
//                cardCount-=1
//            }
//        }
//
//    }
//

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MyMemoGame())
    }
}
