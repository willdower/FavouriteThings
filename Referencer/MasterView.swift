//
//  MasterView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    var gameViewModel: GameViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gameViewModel.viewModels, id: \.id) { game in //Creates a list item for each game
                    //Each list item has a thumbnail, title and developer on the far right
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
            .navigationBarTitle("Video Games")
        }
        
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        let gameViewModel = GameViewModel()
        gameViewModel.addGame(VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93))
        gameViewModel.addGame(VideoGame(title: "Steep", imageName: "steepArt", developer: "Ubisoft", releaseYear: 2016, releaseMonth: 12, releaseDay: 2, userRating: 6.8, criticRating: 72))
        gameViewModel.addGame(VideoGame(title: "Red Dead Redemption 2", imageName: "rdr2Art", developer: "Rockstar Games", releaseYear: 2018, releaseMonth: 10, releaseDay: 26, userRating: 8.1, criticRating: 97))
        gameViewModel.addGame(VideoGame(title: "Fortnite", imageName: "fortniteArt", developer: "Epic Games", releaseYear: 2017, releaseMonth: 21, releaseDay: 7, userRating: 3.7, criticRating: 78))
        return MasterView(gameViewModel: gameViewModel)
    }
}
