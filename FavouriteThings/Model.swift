//
//  model.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct is the model of the app, containing all of the data about any object.
class Model: Identifiable, Codable, ObservableObject {
    
    /// Provides a unique ID for SwiftUI views
    let id = UUID()
    /// This string holds the object's title.
    @Published var title: String = ""
    /// The URL of the image to be loaded using loadImage().
    @Published var imageURL: String = "https://i.imgur.com/Nkqztzw.jpg"
    /// The image loaded from the URL, located wherever the imageURL property of the struct is pointed.
    @Published var image: Image?
    /// This string holds the subtitle of the object.
    @Published var subtitle: String = ""
    /// This string holds the first info field of the object.
    @Published var fieldOne: String = ""
    /// This string holds the second info field of the object.
    @Published var fieldTwo: String = ""
    /// This string holds the third info field of the object.
    @Published var fieldThree: String = ""
    /// This string holds the notes field of the object.
    @Published var notes: String = ""
    
    /// This string holds the label for field one
    @Published var fieldOneLabel: String = "Field One: "
    /// This string holds the label for field two
    @Published var fieldTwoLabel: String = "Field Two: "
    /// This string holds the label for field three
    @Published var fieldThreeLabel:String = "Field Three: "
    /// This string hold sthe label for the notes field
    @Published var notesLabel: String = "Notes: "
    
    /// This enum provides the CodingKeys for encoding and decoding the model data into JSON, necessary for persistent data storage.
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
    
    /// This function encodes the model into a JSON format for use in saving the model persistently.
    ///
    /// - Parameters:
    ///     - encoder: The encoder that is used to encode the data.
    func encode(to encoder: Encoder) throws {
        do {
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
        catch {
            print("Failed to save at the model level")
        }
    }
    
    /// Initialises object with all empty fields and a placeholder image
    init() {
        self.loadImage()
    }
    
    /// Initialises object class with given parameters
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
    
    /// This function decodes the model from a JSON format to use persistently saved data.
    ///
    /// - Parameters:
    ///     - decoder: The decoder that is used to decode the data.
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
            print("Failed to decode at the model level")
            
        }
    }
}
