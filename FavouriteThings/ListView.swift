//
//  ListView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct holds the view that generates the list of games on the main screen of the app.
struct ListView: View {
    @ObservedObject var itemViewModels: ItemViewModels
    
    var body: some View {
        List {
            ForEach(itemViewModels.models, id: \.id) { model in //Creates a list item for each game
                //Each list item has a thumbnail, title and developer on the far right
                NavigationLink(destination: DetailView(detailViewModel: self.itemViewModels.detailViewModel, model: model)) {
                    model.image
                        .frame(width: 36, height: 54)
                        .shadow(radius: 5)
                    Spacer()
                        .frame(width: 10)
                    Text(model.title)
                    Spacer()
                    Text(model.subtitle)
                        .font(.caption)
                        .italic()
                }
            }.onDelete { indices in
                self.itemViewModels.removeItem(indices)
            }.onMove { (indices, destination) in
                self.itemViewModels.models.move(fromOffsets: indices, toOffset: destination)
            }
        }
    }
}
