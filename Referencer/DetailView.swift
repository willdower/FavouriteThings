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
    let gameViewModel: VideoGameViewModel
    
    var body: some View {
        return HStack {
            Spacer()
            VStack(alignment: .center) {
                gameViewModel.boxArt
                    .shadow(radius: 10)
                    .frame(width: 360, height: 540)
                VStack(alignment: .center) {
                    Text(gameViewModel.title)
                        .font(.largeTitle)
                    
                    Text(gameViewModel.developerString)
                        .font(.caption)
                    Spacer()
                        .frame(height: 15)
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
                        Text(gameViewModel.releaseDateString)
                        Text(gameViewModel.userRatingString)
                        Text(gameViewModel.criticRatingString)
                    }
                }
        }
        Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameViewModel: VideoGameViewModel(game: VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93)))
    }
}
