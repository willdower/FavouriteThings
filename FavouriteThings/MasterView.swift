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
    /// Object used to get keyboard size
    @ObservedObject var keyboard: Keyboard
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
                ListView(keyboard: keyboard, thingList: self.thingList.first ?? ThingList.createNewList(context: context, detailViewModel: detailViewModel), detailViewModel: self.detailViewModel)
                    .navigationBarTitle(mode == .active ? "" : self.thingList.first?.title ?? self.detailViewModel.enterTitleLabel)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                ThingList.createNewThing(context: self.context, detailViewModel: self.detailViewModel, thingList: self.thingList)
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
