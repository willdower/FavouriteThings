//
//  DetailViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct is the viewModel that handles all of the display logic.
struct DetailViewModel: Identifiable {
    
    /// String displayed as load button
    let loadLabel = "Load"
    /// String displayed as label for the URL field
    let urlLabel = "URL: "
    
    /// String displayed when notes field is empty
    let enterInfoLabel = "Enter information..."
    /// String displayed when something is unknown
    let unknownLabel = "Unknown"
    /// String displayed when title field is empty
    let enterTitleLabel = "Enter title..."
    /// String displayed when developer field is empty
    let enterSubtitleLabel = "Enter subtitle..."
    /// String displayed when URL field is empty
    let enterURLLabel = "Enter new image URL..."
    /// String displayed when a field label is empty
    let enterFieldLabel = "Enter field label..."
    
    /// Provides a unique ID for SwiftUI views
    let id = UUID()
    /// Holds the game that created the detailViewModel
    var model: Model
    /// Holds the title of the game that created the detailViewModel
    var title: String = ""
    /// Holds the image URL of the game that created the detailViewModel
    var imageURL: String = ""
    /// Holds the developer of the game that created the detailViewModel
    var subtitle: String = ""
    /// Holds the release date of the game that created the detailViewModel
    var fieldOne: String = ""
    /// Holds the user rating of the game that created the detailViewModel
    var fieldTwo: String = ""
    /// Holds the critic rating of the game that created the detailViewModel
    var fieldThree: String = ""
    /// Holds the notes field of the game that created the detailViewModel
    var notes: String
    
    /// Holds the label of the first field
    var fieldOneLabel: String = "Field One: "
    /// Holds the label of the second field
    var fieldTwoLabel: String = "Field Two: "
    /// Holds the label of the third field
    var fieldThreeLabel: String = "Field Three: "
    /// Holds the label of the notes field
    var notesLabel: String = "Notes: "
    
    /// Populates the properties of the detailViewModel with the data from the VideoGame
    ///
    /// - Parameters:
    ///   -game: The VideoGame struct that the data will be retrieved from
    init(model: Model) {
        
        self.model = model
        
        self.title = model.title
        self.subtitle = model.subtitle
        self.fieldOne = model.fieldOne
        self.fieldTwo = model.fieldTwo
        self.fieldThree = model.fieldThree
        self.imageURL = model.imageURL
        
        self.fieldOneLabel = model.fieldOneLabel
        self.fieldTwoLabel = model.fieldTwoLabel
        self.fieldThreeLabel = model.fieldThreeLabel
        self.notesLabel = model.notesLabel
        
        self.notes = ""
        
    }
}
