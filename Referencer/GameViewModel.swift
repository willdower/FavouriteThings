//
//  GameViewModel.swift
//  Referencer
//
//  Created by William Dower on 14/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation

class GameViewModel: ObservableObject, Identifiable {
    var games: [VideoGame] {
        didSet {
            self.gameNumber = self.games.count
        }
    }
    var viewModels: [GameDetailViewModel] {
        games.map { game in GameDetailViewModel(game: game) }
    }
    var gameNumber: Int
    
    func addGame(_ game: VideoGame) -> Void {
        games.append(game)
    }
    
    func removeGame(_ indices: IndexSet) {
        indices.forEach { self.games.remove(at: $0) }
    }
    
    init() {
        self.games = []
        self.gameNumber = 0
    }
}
