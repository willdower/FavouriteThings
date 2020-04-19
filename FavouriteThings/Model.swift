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
struct Model: Identifiable {
    
    /// Provides a unique ID for SwiftUI views
    let id = UUID()
    /// This string holds the input video game's title
    var title: String = ""
    /// The URL of the image to be loaded using loadImage()
    var imageURL: String = "https://i.imgur.com/Nkqztzw.jpg"
    /// The Image featuring the box art, located wherever the imageURL property of the struct is pointed
    var image: Image?
    /// This string holds the input developer of the game
    var subtitle: String = ""
    /// This string holds the input release date of the game
    var fieldOne: String = ""
    /// This string holds the input user rating of the game
    var fieldTwo: String = ""
    /// This string holds the input critic rating of the game
    var fieldThree: String = ""
    /// This string holds the input notes about the game
    var notes: String = ""
    
    /// This string holds the label for field one
    var fieldOneLabel: String = "Field One: "
    /// This string holds the label for field two
    var fieldTwoLabel: String = "Field Two: "
    /// This string holds the label for field three
    var fieldThreeLabel:String = "Field Three: "
    /// This string hold sthe label for the notes field
    var notesLabel: String = "Notes: "
    
    /// This function loads the image at the URL in the struct's imageURL property
    ///
    /// Warning: If the URL cannot be loaded, the data is invalid or an image cannot be created from the data, the app will crash with fatalError("Image download failure")
    mutating func loadImage() -> Void {
        guard let url = URL(string: self.imageURL),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
               fatalError("Image download failure")
        }
        
        self.image = Image(uiImage: uiImage).resizable()
    }
    
    /// Initialises game struct with all empty fields and a placeholder boxArt
    init() {
        self.loadImage()
    }
    
    /// Initialises game struct with given parameters
    init(title: String, imageURL: String, subtitle: String, fieldOne: String, fieldTwo: String, fieldThree: String) {
        self.title = title
        self.imageURL = imageURL
        self.subtitle = subtitle
        self.fieldOne = fieldOne
        self.fieldTwo = fieldTwo
        self.fieldThree = fieldThree
        
        self.loadImage()
    }
    
}
