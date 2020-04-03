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
    @Published var releaseDate: String {
        didSet {
            self.game.releaseDate = self.releaseDate
        }
    }
    @Published var userRating: Double? {
        didSet {
            self.game.userRating = self.userRating
        }
    }
    @Published var criticRating: Int? {
        didSet {
            self.game.criticRating = self.criticRating
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
        
        if let releaseDateExists = game.releaseDate {
            self.releaseDate = releaseDateExists
        }
        else {
            self.releaseDate = "Unknown"
        }
        
        self.userRating = game.userRating
        
        self.criticRating = game.criticRating
        
        if let imageExists = game.boxArt {
            self.boxArt = imageExists
        }
        else {
            self.boxArt = Image("placeholderArt") //Just an empty PS4 game box with a ? on it
        }
        
        self.notes = ""
        
    }
}
