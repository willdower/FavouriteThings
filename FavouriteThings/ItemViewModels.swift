//
//  ItemViewModels.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// The struct holding all of the games and corresponding detailViewModels used by the app.
struct ItemViewModels {
    
    let listTitle = "Video Games"
    let unknownLabel = "Unknown"
    let unknownDouble = Double(0.0)
    let unknownInt = 0
    var models: [Model] {
        didSet {
            self.viewModels = []
            for i in 0..<self.models.count {
                self.viewModels.append(DetailViewModel(model: self.models[i]))
            }
        }
    }
    var viewModels: [DetailViewModel] = []
    
    ///Adds a game to the games stored in the ViewModel.
    ///
    /// - Parameters:
    ///   -game: Game to add to the ViewModel.
    mutating func addItem(_ item: Model) -> Void {
        models.append(item)
    }
    
    ///Adds an empty game to the games stored in the ViewModel.
    mutating func addItem() -> Void {
        models.append(Model())
    }
    
    ///Removes a game from the ViewModel.
    ///
    /// - Parameters:
    ///   -indices: Index set of the game(s) to remove
    mutating func removeItem(_ indices: IndexSet) {
        indices.forEach { self.models.remove(at: $0) }
        if self.models.count == 0 {
            self.addItem()
        }
    }
    
    ///Initialises the ViewModel with 4 pre-loaded games for demonstration
    init() {
        self.models = []
        
        self.addItem(Model(title: "Minecraft", imageURL: "https://i.imgur.com/hDE2TIm.jpg", subtitle: "Mojang", fieldOne: "17/5/2009", fieldTwo: "7.7", fieldThree: "93"))
        self.addItem(Model(title: "Steep", imageURL: "https://i.imgur.com/Jnt4nOs.jpg", subtitle: "Ubisoft", fieldOne: "2016/12/2", fieldTwo: "6.8", fieldThree: "72"))
        self.addItem(Model(title: "Red Dead Redemption 2", imageURL: "https://i.imgur.com/buKG2h2.jpg", subtitle: "Rockstar Games", fieldOne: "26/10/2018", fieldTwo: "8.1", fieldThree: "97"))
        self.addItem(Model(title: "Fortnite", imageURL: "https://i.imgur.com/zNyYcqG.jpg", subtitle: "Epic Games", fieldOne: "25/7/2017", fieldTwo: "3.7", fieldThree: "78"))
    }
}
