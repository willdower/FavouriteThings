//
//  MasterView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

/// This struct holds the MasterView, which has a ListView embedded within a NavigationView.
struct MasterView: View {
    /// This observed object is a reference to the object that holds all of the models and the detailViewModel
    @ObservedObject var viewModels: ItemViewModels
    @State private var mode = EditMode.inactive
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ObjectList.title, ascending: true)]) var objectList: FetchedResults<ObjectList>
    
    var body: some View {
        NavigationView {
            VStack {
                // Using @Environment did not work for some reason, had to use this with
                // .environment below
                if mode == .active {
                    HStack {
                        Text(viewModels.detailViewModel.titleEditPrepend)
                        TextField(viewModels.detailViewModel.enterTitleLabel, text: $viewModels.listTitle)
                            .font(Font.system(.largeTitle).bold())
                    }
                }
                ListView(itemViewModels: viewModels)
                .navigationBarTitle(mode == .active ? "" : viewModels.listTitle)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.viewModels.addItem() }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .environment(\.editMode, $mode)
            }
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
