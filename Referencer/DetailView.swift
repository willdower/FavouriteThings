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
        
        Text("Title: ")
            .bold()
        Text("\(game.title)\n")
        
        Text("Developer: ")
            .bold()
        Text("\(game.developer ?? "Unknown")\n")
        
        Text("Release Dater: ")
            .bold()
        let df = DateFormatter()
        df.dateFormat = "dd MM yyyy"
        if let releaseDateExists = game.releaseDate {
            Text("\(df.string(from: releaseDateExists))\n")
        }
        else {
            Text("Unknown\n")
        }
        
        Text("User Rating: ")
            .bold()
        if let userRatingExists = game.userRating {
            Text("\(userRatingExists)\n")
        }
        else {
            Text("Unknown\n")
        }
        
        Text("Critic Rating: ")
            .bold()
        if let criticRatingExists = game.criticRating {
            Text("\(criticRatingExists)\n")
        }
        else {
            Text("Unknown\n")
        }
        
        return Text(game.title)
    }
}
