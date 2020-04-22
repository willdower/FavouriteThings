//
//  DetailView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

///This struct holds the view that handles the showing of the details of each game. Labels in the detailViewModel are used to produce the field labels for the view.

struct DetailView: View {
    var detailViewModel: DetailViewModel
    @ObservedObject var model: Model
    
    //Biggest element is the image, with a title heading, developer subtitle, and the release date, user rating and critic rating all centered at the bottom
    var body: some View {
        return HStack {
            Spacer()
            VStack(alignment: .center) {
                self.model.image
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                    .frame(height: CGFloat(10))
                HStack {
                    Text(detailViewModel.urlLabel)
                        .bold()
                    TextField(detailViewModel.enterURLLabel, text: $model.imageURL)
                        .frame(width: 250, height: 15)
                    Button(action: {
                        self.model.loadImage()
                    }) {
                        Text(detailViewModel.loadLabel)
                    }
                }
                Spacer()
                    .frame(height: CGFloat(50))
                VStack(alignment: .center) {
                    TextField(detailViewModel.enterTitleLabel, text: $model.title)
                        .font(.largeTitle)
                        .frame(height: 20)
                    
                    TextField(detailViewModel.enterSubtitleLabel, text: $model.subtitle)
                        .font(.caption)
                        .frame(height: 10)
                    Spacer()
                        .frame(height: CGFloat(20))
                }
                HStack {
                    VStack(alignment: .trailing) {
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldOneLabel)
                            .font(.system(size: 15, weight: .heavy))
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldTwoLabel)
                            .font(.system(size: 15, weight: .heavy))
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldThreeLabel)
                            .font(.system(size: 15, weight: .heavy))
                    }
                    VStack(alignment: .leading) {
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldOne)
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldTwo)
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldThree)
                    }
                }
                Spacer()
                    .frame(height: 15)
                VStack(alignment: .leading) {
                    TextField(detailViewModel.enterFieldLabel, text: $model.notesLabel)
                        .font(.system(size: 15, weight: .heavy))
                    TextField(detailViewModel.enterInfoLabel, text: $model.notes)
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
