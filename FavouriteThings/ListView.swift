//
//  ListView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct holds the view that generates the list of objects on the main screen of the app. Each row has a leading thumbnail image, title and a trailing italic subtitle.
struct ListView: View {
    /// This variable holds the reference to the object that holds all of the model objects and the DetailViewModel
    @ObservedObject var objectList: ObjectList
    @Environment(\.managedObjectContext) var context
    let detailViewModel: DetailViewModel
    
    var body: some View {
        List {
            ForEach(objectList.objectsArray, id: \.id) { model in //Creates a list item for each game
                //Each list item has a thumbnail, title and developer on the far right
                NavigationLink(destination: DetailView(detailViewModel: detailViewModel, model: model)) {
                    RowView(model: model)
                }
            }.onDelete { indices in
                self.itemViewModels.removeItem(indices)
            }.onMove { (indices, destination) in
                self.itemViewModels.models.move(fromOffsets: indices, toOffset: destination)
            }
        }
    }
}
