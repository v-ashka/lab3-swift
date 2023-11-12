//
//  ThemeButton.swift
//  lab3
//
//  Created by vashka on 12/11/2023.
//

//import Foundation
import SwiftUI

struct ThemeButton: View {
    @ObservedObject var viewModel: MyMemoGame
    var imageName: String
    var content: String
    var ownColor: Color
    var body: some View{
        Button(action: {
            viewModel.changeApplicationTheme(color: ownColor)
        }, label: {
            VStack{
                Image(systemName: imageName).font(.title)
                Text(content)
            }
        })
    }
}
