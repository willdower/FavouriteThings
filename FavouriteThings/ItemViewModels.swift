//
//  ItemViewModels.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// The class holding all of the models for objects saved in the app, as well as the detailViewModel used for display logic.
class ItemViewModels: Codable, ObservableObject, Identifiable {
    
    /// The title of the MasterView object list.
    @Published var listTitle = "Favourite Things"
    
    /// The array that holds all of the object models.
    @Published var models: [Model]
    
    /// The DetailViewModel that holds the display logic.
    let detailViewModel = DetailViewModel()
    
    /// The CodingKeys use to encode and decode the ItemViewModels object for persistent storage.
    enum CodingKeys: String, CodingKey {
        case listTitle
        case unknownLabel
        case models
    }
    
    ///Adds an object to the objects stored in the array.
    ///
    /// - Parameters:
    ///   - item: Object to add to the array.
    func addItem(_ item: Model) -> Void {
        models.append(item)
    }
    
    ///Adds an empty object to the objects stored in the array.
    func addItem() -> Void {
        models.append(Model())
    }
    
    ///Removes a game from the ItemViewModel's array.
    ///
    /// - Parameters:
    ///   - indices: Index set of the object(s) to remove
    func removeItem(_ indices: IndexSet) {
        indices.forEach { self.models.remove(at: $0) }
        if self.models.count == 0 {
            self.addItem()
        }
    }
    
    /// This function encodes the ItemViewModel into a JSON format for use in saving it persistently.
    ///
    /// - Parameters:
    ///     - encoder: The encoder that is used to encode the data.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(listTitle, forKey: .listTitle)
        try container.encode(models, forKey: .models)
    }
    
    ///Initialises the ViewModel with 4 pre-loaded objects for demonstration
    init() {
        self.models = []
        
        self.addItem(Model(title: "Minecraft", imageURL: "https://i.imgur.com/hDE2TIm.jpg", subtitle: "Mojang", fieldOneLabel: "Release Date:", fieldOne: "17/5/2009", fieldTwoLabel: "User Rating:", fieldTwo: "7.7", fieldThreeLabel: "Critic Rating:", fieldThree: "93"))
        self.addItem(Model(title: "Steep", imageURL: "https://i.imgur.com/Jnt4nOs.jpg", subtitle: "Ubisoft", fieldOneLabel: "Release Date:", fieldOne: "2016/12/2", fieldTwoLabel: "User Rating:", fieldTwo: "6.8", fieldThreeLabel: "Critic Rating:", fieldThree: "72"))
        self.addItem(Model(title: "Red Dead Redemption 2", imageURL: "https://i.imgur.com/buKG2h2.jpg", subtitle: "Rockstar Games", fieldOneLabel: "Release Date:", fieldOne: "26/10/2018", fieldTwoLabel: "User Rating:", fieldTwo: "8.1", fieldThreeLabel: "Critic Rating:", fieldThree: "97"))
        self.addItem(Model(title: "Fortnite", imageURL: "https://i.imgur.com/zNyYcqG.jpg", subtitle: "Epic Games", fieldOneLabel: "Release Date:", fieldOne: "25/7/2017", fieldTwoLabel: "User Rating:", fieldTwo: "3.7", fieldThreeLabel: "Critic Rating:", fieldThree: "78"))
    }
    
    /// This function decodes the ItemViewModel from a JSON format to use persistently saved data.
    ///
    /// - Parameters:
    ///     - decoder: The decoder that is used to decode the data.
    required init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            listTitle = try container.decode(String.self, forKey: .listTitle)
            models = try container.decode([Model].self, forKey: .models)
        }
        catch {
            print("Failed to decode")
            listTitle = "Favourite Things"
            models = [Model]()
        }
        
    }
}
