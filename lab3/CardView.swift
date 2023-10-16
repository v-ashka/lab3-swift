//
//  CardView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import Foundation
import SwiftUI


struct CardView: View {
    @State var isFaceUp : Bool = false
    let content: String
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group{
                    base.fill(Color.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 :1)
        }
        .onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        CardView(isFaceUp: false, content: "")
    }
}
