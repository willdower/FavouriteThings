//
//  MasterView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

/// This struct holds the GamesViewModel and the view that the listView is embedded in, with navigation added.
struct MasterView: View {
    /// This holds the GamesViewModel, which holds all of the models and DetailViewModels in arrays.
    @State var gamesViewModel = GamesViewModel()
    
    var body: some View {
        NavigationView {
            ListView(gamesViewModel: $gamesViewModel)
            .navigationBarTitle(gamesViewModel.viewModelsLabel)
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(
                    action: {
                        withAnimation { self.gamesViewModel.addGame() }
                    }
                ) {
                    Image(systemName: "plus")
                }
            )
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            DetailView(gameDetailViewModel: gamesViewModel.viewModels[0], game: $gamesViewModel.games[0])
        }
    }
}

/*struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        var gameViewModel = GamesViewModel()
        gameViewModel.addGame(VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93))
        gameViewModel.addGame(VideoGame(title: "Steep", imageName: "steepArt", developer: "Ubisoft", releaseYear: 2016, releaseMonth: 12, releaseDay: 2, userRating: 6.8, criticRating: 72))
        gameViewModel.addGame(VideoGame(title: "Red Dead Redemption 2", imageName: "rdr2Art", developer: "Rockstar Games", releaseYear: 2018, releaseMonth: 10, releaseDay: 26, userRating: 8.1, criticRating: 97))
        gameViewModel.addGame(VideoGame(title: "Fortnite", imageName: "fortniteArt", developer: "Epic Games", releaseYear: 2017, releaseMonth: 21, releaseDay: 7, userRating: 3.7, criticRating: 78))
        return MasterView(gamesViewModel: $gameViewModel)
    }
}*/
