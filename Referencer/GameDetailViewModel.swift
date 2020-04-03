//
//  GameDetailViewModel.swift
//  Referencer
//
//  Created by William Dower on 10/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

struct GameDetailViewModel: Identifiable {
    
    /**View model used to bridge the gap between model and view
    Handles the model's nil values so that the view is passed only valid non-optionals
    Also constructs a string to display the date from the Date() object contained within the model**/
    
    //Labels for the view
    let releaseDateLabel = "Release Date: "
    let userRatingLabel = "User Rating: "
    let criticRatingLabel = "Critic Rating: "
    let notesLabel = "Notes: "
    
    let enterNotesLabel = "Enter notes..."
    let enterDateLabel = "Enter date..."
    let unknownLabel = "Unknown"
    let enterRatingLabel = "Enter rating..."
    let enterTitleLabel = "Enter title..."
    let enterDeveloperLabel = "Enter developer name..."
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df
    }()
    
    let floatFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    
    let id = UUID() //Unique identity for using in List views
    var game: VideoGame
    var title: String = ""
    var imageURL: String = ""
    var developerString: String = ""
    var releaseDate: String = ""
    var userRating: Double?
    var criticRating: Int?
    var notes: String
    
    init(game: VideoGame) {
        
        self.game = game
        
        self.title = game.title
        
        self.developerString = game.developer
        
        self.releaseDate = game.releaseDate
        
        /*if let releaseDateExists = game.releaseDate {
            self.releaseDate = releaseDateExists
        }
        else {
            self.releaseDate = "Unknown"
        }*/
        
        self.userRating = game.userRating
        
        self.criticRating = game.criticRating
        
        self.imageURL = game.imageURL
        
        self.notes = ""
        
    }
}
