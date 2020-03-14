//
//  VideoGameViewModel.swift
//  Referencer
//
//  Created by William Dower on 10/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

class VideoGameViewModel: Identifiable {
    
    //View model used to bridge the gap between model and view
    //Handles the model's nil values so that the view is passed only valid non-optionals
    //Also constructs a string to display the date from the Date() object contained within the model
    
    let id = UUID() //Unique identity for using in List views
    var title: String
    var boxArt: Image
    var developerString: String
    var releaseDateString: String
    var userRatingString: String
    var criticRatingString: String
    
    init(game: VideoGame) {
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
            self.boxArt = Image("placeholderArt") //Just an empty PS4 box with a ? on it
        }
        
    }
}
