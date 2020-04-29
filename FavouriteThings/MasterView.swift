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
    let detailViewModel = DetailViewModel()
    @State private var mode = EditMode.inactive
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ThingList.title, ascending: true)]) var thingList: FetchedResults<ThingList>
    
    var body: some View {
        NavigationView {
            VStack {
                // Using @Environment did not work for some reason, had to use this with
                // .environment below
                if mode == .active {
                    TitleView(thingList: self.thingList.first ?? ThingList.createNewList(context: context, detailViewModel: detailViewModel), detailViewModel: self.detailViewModel)
                }
                ListView(thingList: self.thingList.first ?? ThingList.createNewList(context: context, detailViewModel: detailViewModel), detailViewModel: self.detailViewModel)
                    .navigationBarTitle(mode == .active ? "" : self.thingList.first?.title ?? self.detailViewModel.enterTitleLabel)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                let thing = Thing(context: self.context)
                                thing.title = self.detailViewModel.unknownLabel
                                thing.subtitle = self.detailViewModel.unknownLabel
                                thing.fieldOneLabel = self.detailViewModel.defaultFieldOneLabel
                                thing.fieldTwoLabel = self.detailViewModel.defaultFieldTwoLabel
                                thing.fieldThreeLabel = self.detailViewModel.defaultFieldThreeLabel
                                thing.notesLabel = self.detailViewModel.defaultNotesLabel
                                thing.thingList = self.thingList.first
                                do {
                                    try self.context.save()
                                    print("Saved to CoreData")
                                }
                                catch {
                                    let cannotSaveError = error as NSError
                                    print("Failed to save to CoreData")
                                    print("\(cannotSaveError): \(cannotSaveError.userInfo)")
                                }
                            }
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
