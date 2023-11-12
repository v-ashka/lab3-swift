//
//  CardView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import Foundation
import SwiftUI


struct CardView: View {
    var card: MemoGame<String>.Card
    
//    @State var isFaceUp : Bool = false
//    let content: String
    
    init(_ card: MemoGame<String>.Card){
        self.card = card
    }
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group{
                    base.fill(Color.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 :1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//        .onTapGesture(perform: {
//            isFaceUp.toggle()
//       })
        .padding(2.5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        CardView(MemoGame<String>.Card.init(content: "", id: ""))
    }
}
