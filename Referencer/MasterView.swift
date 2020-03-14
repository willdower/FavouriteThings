//
//  ContentView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    var gamesList: GameList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gamesList.viewModels, id: \.id) { game in
                    NavigationLink(destination: DetailView(gameViewModel: game)) {
                        game.boxArt
                            .frame(width: 36, height: 54)
                            .shadow(radius: 5)
                        Spacer()
                            .frame(width: 10)
                        Text(game.title)
                        Spacer()
                        Text(game.developerString)
                            .font(.caption)
                            .italic()
                        }
                }
            }
            .navigationBarTitle(gamesList.listTitle)
        }
        
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(gamesList: GameList(games: [VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93), VideoGame(title: "Fortnite", imageName: "fortniteArt", developer: "Epic Games", releaseYear: 2017, releaseMonth: 7, releaseDay: 25, userRating: 2.9, criticRating: 81), VideoGame(title: "Steep", imageName: "steepArt", developer: "Ubisoft", releaseYear: 2016, releaseMonth: 12, releaseDay: 2, userRating: 6.8, criticRating: 72)], listTitle: "Video Games"))
    }
}
