//
//  ContentView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    var gameViewModel: VideoGameViewModel
    var body: some View {
        DetailView(gameViewModel: gameViewModel)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(gameViewModel: VideoGameViewModel(game: VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93)))
    }
}
