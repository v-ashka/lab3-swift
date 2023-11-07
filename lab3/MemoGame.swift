//
//  MemoGame.swift
//  lab3
//
//  Created by vashka on 07/11/2023.
//


// Model
import Foundation

struct MemoGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
         cards = []
        // dodaj kart parami numberPairsOfCard = 2
        for pairIndex in 0..<max(2, numberPairsOfCard){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    
    func choose(_ card: Card) {

        print("Chose \(card)")
        card.isFaceUp.toggle()
    }
    
    mutating func shuffle(){
        cards.shuffle() 
    }
    
    struct Card: Equatable, Identifiable,
                 CustomDebugStringConvertible{
//        static func == (lhs: MemoGame<CardContent>.Card, rhs: MemoGame<CardContent>.Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//                lhs.isMatched == rhs.isMatched &&
//                lhs.content == rhs.content
//        }
//
//
        
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id) \(isFaceUp ? "up" : "down" ) \(isMatched ? "matched" : "" )" 
        }
    }
}
