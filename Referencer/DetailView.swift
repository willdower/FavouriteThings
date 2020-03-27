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
    @ObservedObject var gameDetailViewModel: GameDetailViewModel
    
    //Biggest element is the image, with a title heading, developer subtitle, and the release date, user rating and critic rating all centered at the bottom
    var body: some View {
        return HStack {
            Spacer()
            VStack(alignment: .center) {
                gameDetailViewModel.boxArt
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    //.frame(width: 360, height: 540)
                VStack(alignment: .center) {
                    Text(gameDetailViewModel.title)
                        .font(.largeTitle)
                    
                    Text(gameDetailViewModel.developerString)
                        .font(.caption)
                    Spacer()
                        .frame(height: CGFloat(15))
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
                        Text(gameDetailViewModel.releaseDateString)
                        Text(gameDetailViewModel.userRatingString)
                        Text(gameDetailViewModel.criticRatingString)
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Notes:")
                        .bold()
                        .multilineTextAlignment(.leading)
                    TextField("Enter notes...", text: $gameDetailViewModel.notes)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameDetailViewModel: GameDetailViewModel(game: VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93)))
    }
}
