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
                if(isFaceUp){
                    base.fill(Color.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }else{
                    base.fill()
                }
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 :1)
        }
        .onTapGesture(perform: {
            isFaceUp.toggle()
        })
        .padding(2.5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        CardView(isFaceUp: false, content: "")
    }
}
