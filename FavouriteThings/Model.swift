//
//  model.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct is the model of the app, containing all of the data about any particular video game.
class Model: Identifiable, Codable, ObservableObject {
    
    /// Provides a unique ID for SwiftUI views
    let id = UUID()
    /// This string holds the input video game's title
    @Published var title: String = ""
    /// The URL of the image to be loaded using loadImage()
    @Published var imageURL: String = "https://i.imgur.com/Nkqztzw.jpg"
    /// The Image featuring the box art, located wherever the imageURL property of the struct is pointed
    @Published var image: Image?
    /// This string holds the input developer of the game
    @Published var subtitle: String = ""
    /// This string holds the input release date of the game
    @Published var fieldOne: String = ""
    /// This string holds the input user rating of the game
    @Published var fieldTwo: String = ""
    /// This string holds the input critic rating of the game
    @Published var fieldThree: String = ""
    /// This string holds the input notes about the game
    @Published var notes: String = ""
    
    /// This string holds the label for field one
    @Published var fieldOneLabel: String = "Field One: "
    /// This string holds the label for field two
    @Published var fieldTwoLabel: String = "Field Two: "
    /// This string holds the label for field three
    @Published var fieldThreeLabel:String = "Field Three: "
    /// This string hold sthe label for the notes field
    @Published var notesLabel: String = "Notes: "
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL
        case subtitle
        case fieldOne
        case fieldTwo
        case fieldThree
        case notes
        case fieldOneLabel
        case fieldTwoLabel
        case fieldThreeLabel
        case notesLabel
    }
    
    /// This function loads the image at the URL in the struct's imageURL property
    ///
    /// Warning: If the URL cannot be loaded, the data is invalid or an image cannot be created from the data, the app will crash with fatalError("Image download failure")
    func loadImage() -> Void {
        guard let url = URL(string: self.imageURL),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
               fatalError("Image download failure")
        }
        
        self.image = Image(uiImage: uiImage).resizable()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(fieldOne, forKey: .fieldOne)
        try container.encode(fieldTwo, forKey: .fieldTwo)
        try container.encode(fieldThree, forKey: .fieldThree)
        try container.encode(notes, forKey: .notes)
        try container.encode(fieldOneLabel, forKey: .fieldOneLabel)
        try container.encode(fieldTwoLabel, forKey: .fieldTwoLabel)
        try container.encode(fieldThreeLabel, forKey: .fieldThreeLabel)
        try container.encode(notesLabel, forKey: .notesLabel)
    }
    
    /// Initialises game struct with all empty fields and a placeholder boxArt
    init() {
        self.loadImage()
    }
    
    /// Initialises game struct with given parameters
    init(title: String, imageURL: String, subtitle: String, fieldOneLabel: String, fieldOne: String, fieldTwoLabel: String, fieldTwo: String, fieldThreeLabel: String, fieldThree: String) {
        self.title = title
        self.imageURL = imageURL
        self.subtitle = subtitle
        self.fieldOne = fieldOne
        self.fieldTwo = fieldTwo
        self.fieldThree = fieldThree
        
        self.fieldOneLabel = fieldOneLabel
        self.fieldTwoLabel = fieldTwoLabel
        self.fieldThreeLabel = fieldThreeLabel
        
        self.loadImage()
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            subtitle = try container.decode(String.self, forKey: .subtitle)
            imageURL = try container.decode(String.self, forKey: .imageURL)
            fieldOne = try container.decode(String.self, forKey: .fieldOne)
            fieldTwo = try container.decode(String.self, forKey: .fieldTwo)
            fieldThree = try container.decode(String.self, forKey: .fieldThree)
            notes = try container.decode(String.self, forKey: .notes)

            fieldOneLabel = try container.decode(String.self, forKey: .fieldOneLabel)
            fieldTwoLabel = try container.decode(String.self, forKey: .fieldTwoLabel)
            fieldThreeLabel = try container.decode(String.self, forKey: .fieldThreeLabel)
            notesLabel = try container.decode(String.self, forKey: .notesLabel)

            self.loadImage()
        }
        catch {
            print("Failed to decode individual")
            
        }
    }
}
