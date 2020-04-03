//
//  GameDetailViewModel.swift
//  Referencer
//
//  Created by William Dower on 10/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct is the viewModel that handles all of the display logic.
struct GameDetailViewModel: Identifiable {
    
    /// String displayed next to show release date field
    let releaseDateLabel = "Release Date: "
    /// String displayed next to show user rating field
    let userRatingLabel = "User Rating: "
    /// String displayed next to show critic rating field
    let criticRatingLabel = "Critic Rating: "
    /// String displayed next to show notes field
    let notesLabel = "Notes: "
    /// String displayed next to show URL field
    let urlLabel = "URL: "
    /// String displayed next to show load button
    let loadLabel = "Load"
    
    /// String displayed when notes field is empty
    let enterNotesLabel = "Enter notes..."
    /// String displayed when date field is empty
    let enterDateLabel = "Enter date..."
    /// String displayed when something is unknown
    let unknownLabel = "Unknown"
    /// String displayed when rating field is empty
    let enterRatingLabel = "Enter rating..."
    /// String displayed when title field is empty
    let enterTitleLabel = "Enter title..."
    /// String displayed when developer field is empty
    let enterDeveloperLabel = "Enter developer name..."
    /// String displayed when URL field is empty
    let enterURLLabel = "Enter new image URL..."
    
    /// Formatter used to get doubles from an input string.
    let doubleFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    
    /// Provides a unique ID for SwiftUI views
    let id = UUID()
    /// Holds the game that created the detailViewModel
    var game: VideoGame
    /// Holds the title of the game that created the detailViewModel
    var title: String = ""
    /// Holds the image URL of the game that created the detailViewModel
    var imageURL: String = ""
    /// Holds the developer of the game that created the detailViewModel
    var developerString: String = ""
    /// Holds the release date of the game that created the detailViewModel
    var releaseDate: String = ""
    /// Holds the user rating of the game that created the detailViewModel
    var userRating: Double?
    /// Holds the critic rating of the game that created the detailViewModel
    var criticRating: Int?
    /// Holds the notes field of the game that created the detailViewModel
    var notes: String
    
    /// Populates the properties of the detailViewModel with the data from the VideoGame
    ///
    /// - Parameters:
    ///   -game: The VideoGame struct that the data will be retrieved from
    init(game: VideoGame) {
        
        self.game = game
        
        self.title = game.title
        
        self.developerString = game.developer
        
        self.releaseDate = game.releaseDate
        
        self.userRating = game.userRating
        
        self.criticRating = game.criticRating
        
        self.imageURL = game.imageURL
        
        self.notes = ""
        
    }
}
