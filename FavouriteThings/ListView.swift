//
//  ListView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

/// This struct holds the view that generates the list of objects on the main screen of the app. Each row has a leading thumbnail image, title and a trailing italic subtitle.
struct ListView: View {
    /// Object used to get keyboard size
    @ObservedObject var keyboard: Keyboard
    /// This variable holds the reference to the list
    @ObservedObject var thingList: ThingList
    /// The context used for CoreData persistence.
    @Environment(\.managedObjectContext) var context
    /// This is the viewModel that contains all of the static display logic.
    let detailViewModel: DetailViewModel
    
    var body: some View {
        List {
            ForEach(thingList.thingsArray, id: \.self) { model in //Creates a list item for each game
                //Each list item has a thumbnail, title and developer on the far right
                NavigationLink(destination: DetailView(keyboard: self.keyboard, detailViewModel: self.detailViewModel, model: model)) {
                    RowView(model: model, detailViewModel: self.detailViewModel)
                }
            }.onDelete { indices in
                indices.forEach { self.thingList.removeFromThings(at: $0) }
            }.onMove { (indices, destination) in
                self.thingList.moveThings(indices: indices, destination: destination)
            }
        }
    }
}
