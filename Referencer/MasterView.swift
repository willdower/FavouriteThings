//
//  ContentView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

import SwiftUI

struct MasterView: View {
    var gamesList: GameList
    var body: some View {
        List {
            ForEach(gamesList.games, id: \.title) { game in
            NavigationLink(destination: DetailView(gameViewModel: VideoGameViewModel(game: game))) {
                Text("Test")
                }
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(gamesList: GameList(games: [VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93), VideoGame(title: "Fortnite", imageName: "fortniteArt", developer: "Epic Games", releaseYear: 2017, releaseMonth: 7, releaseDay: 25, userRating: 2.9, criticRating: 81), VideoGame(title: "Steep", imageName: "steepArt", developer: "Ubisoft", releaseYear: 2016, releaseMonth: 12, releaseDay: 2, userRating: 6.8, criticRating: 72)], listTitle: "Video Games"))
    }
}
