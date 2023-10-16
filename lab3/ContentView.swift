//
//  ContentView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😄", "😅", "🤒", "😱", "😡", "🤩", "👽", "👽"]
    
    @State var cardCount = 2
    var isEnabled: Bool = true
    var body: some View {
        VStack{
            ScrollView{
                cardDisplay(elems: emojis, itemsCount: cardCount, minWidthSize: 120)
            }	
                cardsCountAdjuster
            
        }.padding()
        
    }
    
    
    func cardDisplay(elems: Array<String>, itemsCount: Int, minWidthSize: CGFloat) -> some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minWidthSize ))]){
            ForEach(0..<itemsCount, id: \.self){
                index in
                CardView(content: elems[index])
            }
        }
        .foregroundColor(.blue)
        
    }
    
    var cardsCountAdjuster: some View {
        HStack{
            adjustCardNumber(by: -2, symbol: "minus.rectangle").disabled(cardCount - 2 < 2)
            Spacer()
            adjustCardNumber(by: +2, symbol: "plus.rectangle").disabled(cardCount + 2 > emojis.count)

        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            let newCount = cardCount + offset
            if(newCount >= 2 && newCount <= emojis.count){
                cardCount = newCount
                
            }
        }, label: {
            Label("", systemImage: symbol)
        }).font(.largeTitle)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
