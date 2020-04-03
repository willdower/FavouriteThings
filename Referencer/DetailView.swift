//
//  DetailView.swift
//  Referencer
//
//  Created by William Dower on 5/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/**Handles the showing of the details of each game. Labels in the detailViewModel are used to produce the field labels for the view.**/

struct DetailView: View {
    let gameDetailViewModel: GameDetailViewModel
    @Binding var game: VideoGame
    
    //Biggest element is the image, with a title heading, developer subtitle, and the release date, user rating and critic rating all centered at the bottom
    var body: some View {
        return HStack {
            Spacer()
            VStack(alignment: .center) {
                self.game.boxArt
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                    .frame(height: CGFloat(10))
                HStack {
                    Text("URL:")
                        .bold()
                    TextField("Enter new image URL...", text: $game.imageURL)
                        .frame(width: 250, height: 15)
                    Button(action: {
                        self.game.loadImage()
                    }) {
                        Text("Load")
                    }
                }
                Spacer()
                    .frame(height: CGFloat(50))
                VStack(alignment: .center) {
                    TextField(gameDetailViewModel.enterTitleLabel, text: $game.title)
                        .font(.largeTitle)
                        .frame(height: 20)
                    
                    TextField(gameDetailViewModel.enterDeveloperLabel, text: $game.developer)
                        .font(.caption)
                        .frame(height: 10)
                    Spacer()
                        .frame(height: CGFloat(20))
                }
                HStack {
                    VStack(alignment: .trailing) {
                        Text(gameDetailViewModel.releaseDateLabel)
                            .bold()
                        Text(gameDetailViewModel.userRatingLabel)
                            .bold()
                        Text(gameDetailViewModel.criticRatingLabel)
                            .bold()
                    }
                    VStack(alignment: .leading) {
                        TextField(gameDetailViewModel.enterDateLabel, text: $game.releaseDate)
                            .frame(height: 15)
                        TextField(gameDetailViewModel.enterRatingLabel, value: $game.userRating, formatter: gameDetailViewModel.floatFormatter)
                            .frame(height: 13)
                        TextField(gameDetailViewModel.enterRatingLabel, value: $game.criticRating, formatter: NumberFormatter())
                            .frame(height: 10)
                    }
                }
                Spacer()
                    .frame(height: 15)
                VStack(alignment: .leading) {
                    Text(gameDetailViewModel.notesLabel)
                        .bold()
                        .multilineTextAlignment(.leading)
                    TextField(gameDetailViewModel.enterNotesLabel, text: $game.notes)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                    .frame(height: 15)
            }
        }
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameDetailViewModel: GameDetailViewModel(game: VideoGame(title: "Minecraft", boxArt: Image("minecraftArt"), developer: "Mojang", releaseDate: "17/5/2009", userRating: 7.7, criticRating: 93)))
    }
}*/
