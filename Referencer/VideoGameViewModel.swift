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
    let id = UUID()
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
        
        df.dateFormat = "dd/MM/yyyy"
        
        if let releaseDateExists = game.releaseDate {
            self.releaseDateString = "\(df.string(from: releaseDateExists))"
        }
        else {
            self.releaseDateString = "Unknown"
        }
        
        if let userRatingExists = game.userRating {
            
            self.userRatingString = String(format: "%.1f", userRatingExists)
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
            self.boxArt = Image("placeholderArt")
        }
        
    }
}
