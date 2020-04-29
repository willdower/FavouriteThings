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
                NavigationLink(destination: DetailView(detailViewModel: self.detailViewModel, model: model)) {
                    RowView(model: model, detailViewModel: self.detailViewModel)
                }
            }.onDelete { indices in
                indices.forEach { self.thingList.removeFromThings(at: $0) }
            }.onMove { (indices, destination) in
                /* Weird issue where an item could be moved up the order fine but moving down would take it down one too many
                // Fixed by subtracting 1 from destination position if item is moving down
                // Solution is a little bit hacky but it works
                // Can't tell if the problem is from the use of incorrect functions on my part or if it is related to the
                // combined use of SwiftUI's onMove with non-SwiftUI NSMutableOrderedSet's moveObjects function */
                let itemToMove = indices.first
                if (itemToMove ?? 0 < destination) {
                    let exchange: NSMutableOrderedSet = self.thingList.things?.mutableCopy() as! NSMutableOrderedSet
                    exchange.moveObjects(at: indices, to: destination-1)
                    self.thingList.things = exchange
                }
                else {
                    let exchange: NSMutableOrderedSet = self.thingList.things?.mutableCopy() as! NSMutableOrderedSet
                    exchange.moveObjects(at: indices, to: destination)
                    self.thingList.things = exchange
                }
            }
        }
    }
}
