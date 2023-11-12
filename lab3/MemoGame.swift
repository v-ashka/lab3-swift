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
   
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
//            var faceUpCardIndicies: [Int]()
//            for index in cards.indices {
//                if(cards[index].isFaceUp){
//                    faceUpCardIndicies.append(index)
//                }
//            }
//
//            if(faceUpCardIndicies.count == 1){
//                return faceUpCardIndicies.first
//            }else{
//                return nil
//            }
            
//            przed zmiana extenstion Array
//            let faceUpCardIndicies = cards.indices.filter {
//                index in cards[index].isFaceUp
//            }
//            return faceUpCardIndicies.count == 1 ? faceUpCardIndicies.first: nil
            
//             po zastosowaniu extension array
            
            cards.indices.filter{index in cards[index].isFaceUp}.only
        }
        
        set{
//            for index in cards.indices{
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else{
//                    cards[index].isFaceUp = false
//                }
//
//            }
            
            return cards.indices.forEach{
                cards[$0].isFaceUp = (newValue == $0)
            }
        }
    }
    
    
    mutating func choose(_ card: Card) {
//        print("Chose \(card)")
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        
                    }
//                    indexOfOneAndOnlyFaceUpCard = nil

                } else{
//                    for index in cards.indices {
//                        cards[index].isFaceUp = false
//                    }
                    
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
        
//
//        let chosenIndex = index(of: card)
//        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int{
        for index in cards.indices{
            if (cards[index].id == card.id){
                return index
            }
        }
        return 0 // FIXME: blad
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
//a
//
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id) \(isFaceUp ? "up" : "down" ) \(isMatched ? "matched" : "" )" 
        }
    }
    
 
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
