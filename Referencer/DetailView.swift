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
        
        df.dateFormat = "dd/MM/yyyy"
        
        if let releaseDateExists = game.releaseDate {
            releaseDateText = Text("\(df.string(from: releaseDateExists))")
        }
        else {
            releaseDateText = Text("Unknown")
        }
        
        if let userRatingExists = game.userRating {
            userRatingText = Text("\(userRatingExists)")
        }
        else {
            userRatingText = Text("Unknown")
        }
        
        if let criticRatingExists = game.criticRating {
            criticRatingText = Text("\(criticRatingExists)")
        }
        else {
            criticRatingText = Text("Unknown")
        }
        return HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(game.title)
                            .font(.largeTitle)
                        
                        Text(game.developer ?? "Unknown")
                            .font(.caption)
                        Spacer()
                            .frame(height: 30)
                    }
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("Release Date: ")
                                .bold()
                            
                            Text("User Rating: ")
                                .bold()
                                
                            Text("Critic Rating: ")
                                .bold()
                        }
                        VStack(alignment: .leading) {
                            releaseDateText
                            userRatingText
                            criticRatingText
                        }
                    }
            }
            Spacer()
        }
    }
}
