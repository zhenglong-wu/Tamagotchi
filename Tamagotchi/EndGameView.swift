//
//  EndGame.swift
//  Tamagotchi
//
//  Created by Zhenglong Wu on 03/02/2021.
//

import SwiftUI

struct EndGameView: View {
    var body: some View {
        Text("Tamagotchi has died...")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            .offset(y:-25)
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
