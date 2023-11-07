//
//  MyMemoGame.swift
//  lab3
//
//  Created by vashka on 07/11/2023.
//


// To jest View Model
import SwiftUI

class MyMemoGame: ObservableObject{
    private static let emojis = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    
//    private var model = MemoGame<String>(
//        numberPairsOfCard: 4){
//            index in
//            return ["A", "B", "C", "D", "E"][index]
//        }
    
    private static func createMemoGame() -> MemoGame<String> {
        return MemoGame<String>(
            numberPairsOfCard: 6){
            index in
            if emojis.indices.contains(index) {
                return emojis[index]
            }
            return "?!"
        }
        
    }
    
    // MARK: Zamiary
    
    func shuffle(){
        model.shuffle()
    }
    
    @Published private var model = MyMemoGame.createMemoGame()
    
    var cards: Array<MemoGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoGame<String>.Card){
        model.choose(card)
    }
    
}
