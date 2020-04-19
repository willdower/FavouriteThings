//
//  ListView.swift
//  Referencer
//
//  Created by William Dower on 3/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct holds the view that generates the list of games on the main screen of the app.
struct ListView: View {
    @Binding var gamesViewModel: GamesViewModel
    
    var body: some View {
        List {
            ForEach(gamesViewModel.viewModels.indices, id: \.self) { index in //Creates a list item for each game
                //Each list item has a thumbnail, title and developer on the far right
                NavigationLink(destination: DetailView(gameDetailViewModel: self.gamesViewModel.viewModels[index], game: Binding(get: { return self.gamesViewModel.games[index] }, set: { (newValue) in return self.gamesViewModel.games[index] = newValue }))) {
                    self.gamesViewModel.games[index].boxArt
                        .frame(width: 36, height: 54)
                        .shadow(radius: 5)
                    Spacer()
                        .frame(width: 10)
                    Text(self.gamesViewModel.viewModels[index].title)
                    Spacer()
                    Text(self.gamesViewModel.viewModels[index].developerString)
                        .font(.caption)
                        .italic()
                }
            }.onDelete { indices in
                self.gamesViewModel.removeGame(indices)
            }
        }
    }
}
