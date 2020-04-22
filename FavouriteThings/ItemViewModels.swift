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
class ItemViewModels: Codable, ObservableObject, Identifiable {
    
    var listTitle = "Favourite Things"
    var unknownLabel = "Unknown"
    
    

    @Published var models: [Model] /*{
        didSet {
            self.viewModels = []
            for i in 0..<self.models.count {
                self.viewModels.append(DetailViewModel(model: self.models[i]))
            }
        }
    }*/
    let detailViewModel = DetailViewModel()
    
    enum CodingKeys: String, CodingKey {
        case listTitle
        case unknownLabel
        case models
    }
    
    ///Adds a game to the games stored in the ViewModel.
    ///
    /// - Parameters:
    ///   -game: Game to add to the ViewModel.
    func addItem(_ item: Model) -> Void {
        models.append(item)
    }
    
    ///Adds an empty game to the games stored in the ViewModel.
    func addItem() -> Void {
        models.append(Model())
    }
    
    ///Removes a game from the ViewModel.
    ///
    /// - Parameters:
    ///   -indices: Index set of the game(s) to remove
    func removeItem(_ indices: IndexSet) {
        indices.forEach { self.models.remove(at: $0) }
        if self.models.count == 0 {
            self.addItem()
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(listTitle, forKey: .listTitle)
        try container.encode(unknownLabel, forKey: .unknownLabel)
        try container.encode(models, forKey: .models)
    }
    
    ///Initialises the ViewModel with 4 pre-loaded games for demonstration
    init() {
        self.models = []
        
        self.addItem(Model(title: "Minecraft", imageURL: "https://i.imgur.com/hDE2TIm.jpg", subtitle: "Mojang", fieldOneLabel: "Release Date:", fieldOne: "17/5/2009", fieldTwoLabel: "User Rating:", fieldTwo: "7.7", fieldThreeLabel: "Critic Rating:", fieldThree: "93"))
        self.addItem(Model(title: "Steep", imageURL: "https://i.imgur.com/Jnt4nOs.jpg", subtitle: "Ubisoft", fieldOneLabel: "Release Date:", fieldOne: "2016/12/2", fieldTwoLabel: "User Rating:", fieldTwo: "6.8", fieldThreeLabel: "Critic Rating:", fieldThree: "72"))
        self.addItem(Model(title: "Red Dead Redemption 2", imageURL: "https://i.imgur.com/buKG2h2.jpg", subtitle: "Rockstar Games", fieldOneLabel: "Release Date:", fieldOne: "26/10/2018", fieldTwoLabel: "User Rating:", fieldTwo: "8.1", fieldThreeLabel: "Critic Rating:", fieldThree: "97"))
        self.addItem(Model(title: "Fortnite", imageURL: "https://i.imgur.com/zNyYcqG.jpg", subtitle: "Epic Games", fieldOneLabel: "Release Date:", fieldOne: "25/7/2017", fieldTwoLabel: "User Rating:", fieldTwo: "3.7", fieldThreeLabel: "Critic Rating:", fieldThree: "78"))
    }
    
    required init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            listTitle = try container.decode(String.self, forKey: .listTitle)
            unknownLabel = try container.decode(String.self, forKey: .unknownLabel)
            models = try container.decode([Model].self, forKey: .models)
        }
        catch {
            print("Failed to decode")
            listTitle = "Favourite Things"
            unknownLabel = "Unknown"
            models = [Model]()
        }
        
    }
}
