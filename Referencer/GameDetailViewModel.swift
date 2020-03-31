//
//  GameDetailViewModel.swift
//  Referencer
//
//  Created by William Dower on 10/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

class GameDetailViewModel: ObservableObject, Identifiable {
    
    /**View model used to bridge the gap between model and view
    Handles the model's nil values so that the view is passed only valid non-optionals
    Also constructs a string to display the date from the Date() object contained within the model**/
    
    //Labels for the view
    let releaseDateLabel = "Release Date: "
    let userRatingLabel = "User Rating: "
    let criticRatingLabel = "Critic Rating: "
    let notesLabel = "Notes: "
    
    let invalidInputLabel = "Invalid input"
    let enterNotesLabel = "Enter notes..."
    
    let id = UUID() //Unique identity for using in List views
    var game: VideoGame
    @Published var title: String {
        didSet {
            self.game.title = self.title
        }
    }
    @Published var boxArt: Image
    @Published var developerString: String {
        didSet {
            self.game.developer = self.developerString
        }
    }
    @Published var releaseDateString: String
    @Published var userRatingString: String {
        didSet {
            if let newUserRating = Float(userRatingString) {
                self.game.userRating = newUserRating
            }
            else {
                self.userRatingString = "Invalid input"
            }
        }
    }
    @Published var criticRatingString: String {
        didSet {
            if let newCriticRating = Int(criticRatingString) {
                self.game.criticRating = newCriticRating
            }
            else {
                self.criticRatingString = "Invalid input"
            }
        }
    }
    
    @Published var notes: String { //View updates this, as it is the middleman
        didSet {
            self.game.notes = self.notes; //When this is set, update the model
        }
    }
    
    init(game: VideoGame) {
        self.game = game
        
        self.title = game.title
        
        if let developerExists = game.developer {
            self.developerString = developerExists
        }
        else {
            self.developerString = "Unknown"
        }
        
        let df = DateFormatter()
        
        df.dateFormat = "dd/MM/yyyy" //This can be modified per region if necessary
        
        if let releaseDateExists = game.releaseDate {
            self.releaseDateString = "\(df.string(from: releaseDateExists))" //Uses date format to create string with date
        }
        else {
            self.releaseDateString = "Unknown"
        }
        
        if let userRatingExists = game.userRating {
            
            self.userRatingString = String(format: "%.1f", userRatingExists) //Cut rating Float value to 1 decimal place
        }
        else {
            self.userRatingString = "Unknown"
        }
        
        if let criticRatingExists = game.criticRating {
            self.criticRatingString = "\(criticRatingExists)"
        }
        else {
            self.criticRatingString = "Unknown"
        }
        
        if let imageExists = game.boxArt {
            self.boxArt = imageExists
        }
        else {
            self.boxArt = Image("placeholderArt") //Just an empty PS4 game box with a ? on it
        }
        
        self.notes = ""
        
    }
}
