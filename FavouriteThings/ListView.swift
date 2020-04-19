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
    @Binding var itemViewModels: ItemViewModels
    
    var body: some View {
        List {
            ForEach(itemViewModels.viewModels.indices, id: \.self) { index in //Creates a list item for each game
                //Each list item has a thumbnail, title and developer on the far right
                NavigationLink(destination: DetailView(detailViewModel: self.itemViewModels.viewModels[index], model: Binding(get: { return self.itemViewModels.models[index] }, set: { (newValue) in return self.itemViewModels.models[index] = newValue }))) {
                    self.itemViewModels.models[index].image
                        .frame(width: 36, height: 54)
                        .shadow(radius: 5)
                    Spacer()
                        .frame(width: 10)
                    Text(self.itemViewModels.viewModels[index].title)
                    Spacer()
                    Text(self.itemViewModels.viewModels[index].subtitle)
                        .font(.caption)
                        .italic()
                }
            }.onDelete { indices in
                self.itemViewModels.removeItem(indices)
            }
        }
    }
}
