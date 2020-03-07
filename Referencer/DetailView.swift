//
//  DetailView.swift
//  Referencer
//
//  Created by William Dower on 5/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let game: VideoGame
    
    var body: some View {
        //These are vars as future versions may allow editing on variables in app (via an edit button)
        var userRatingText: Text
        var releaseDateText: Text
        var criticRatingText: Text
        let df = DateFormatter()
        
        df.dateFormat = "dd MM yyyy"
        
        if let releaseDateExists = game.releaseDate {
            releaseDateText = Text("\(df.string(from: releaseDateExists))\n")
        }
        else {
            releaseDateText = Text("Unknown\n")
        }
        
        if let userRatingExists = game.userRating {
            userRatingText = Text("\(userRatingExists)\n")
        }
        else {
            userRatingText = Text("Unknown\n")
        }
        
        if let criticRatingExists = game.criticRating {
            criticRatingText = Text("\(criticRatingExists)\n")
        }
        else {
            criticRatingText = Text("Unknown\n")
        }
        return VStack {
            Text("Title: ")
                .bold()
            Text("\(game.title)\n")
            
            Text("Developer: ")
                .bold()
            Text("\(game.developer ?? "Unknown")\n")
            
            Text("Release Date: ")
                .bold()
            releaseDateText
            
            Text("User Rating: ")
                .bold()
            userRatingText
            
            Text("Critic Rating: ")
                .bold()
            criticRatingText
        }
    }
}
