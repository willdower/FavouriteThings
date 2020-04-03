//
//  GameViewModel.swift
//  Referencer
//
//  Created by William Dower on 14/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

struct GamesViewModel {
    
    let viewModelsLabel = "Video Games"
    let unknownLabel = "Unknown"
    let unknownDouble = Double(0.0)
    let unknownInt = 0
    var games: [VideoGame] {
        didSet {
            self.viewModels = []
            for i in 0..<self.games.count {
                self.viewModels.append(GameDetailViewModel(game: self.games[i]))
            }
        }
    }
    var viewModels: [GameDetailViewModel] = []
    
    mutating func addGame(_ game: VideoGame) -> Void {
        games.append(game)
    }
    
    mutating func addGame() -> Void {
        let emptyGame = VideoGame(title: self.unknownLabel, boxArt: Image("placeholderArt").resizable(), developer: self.unknownLabel, releaseDate: self.unknownLabel, userRating: self.unknownDouble, criticRating: self.unknownInt)
        games.append(emptyGame)
    }
    
    mutating func removeGame(_ indices: IndexSet) {
        indices.forEach { self.games.remove(at: $0) }
        if self.games.count == 0 {
            self.addGame()
        }
    }
    
    init() {
        self.games = []
        
        self.addGame(VideoGame(title: "Minecraft", boxArt: Image("minecraftArt").resizable(), developer: "Mojang", releaseDate: "17/5/2009", userRating: 7.7, criticRating: 93))
        self.addGame(VideoGame(title: "Steep", boxArt: Image("steepArt").resizable(), developer: "Ubisoft", releaseDate: "2016/12/2", userRating: 6.8, criticRating: 72))
        self.addGame(VideoGame(title: "Red Dead Redemption 2", boxArt: Image("rdr2Art").resizable(), developer: "Rockstar Games", releaseDate: "26/10/2018", userRating: 8.1, criticRating: 97))
        self.addGame(VideoGame(title: "Fortnite", boxArt: Image("fortniteArt").resizable(), developer: "Epic Games", releaseDate: "25/7/2017", userRating: 3.7, criticRating: 78))
    }
}
