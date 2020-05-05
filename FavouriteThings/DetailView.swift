//
//  DetailView.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct holds the view that handles the showing of the details of each object. Strings that only change depending on unrelated display logic (language, etc) are sourced from the detailViewModel, whereas the rest is sourced from the model. It has a title, subtitle, image, image URL, and three fields and a notes field that all have editable labels.

struct DetailView: View {
    /// Object used to get keyboard size
    @ObservedObject var keyboard: Keyboard
    /// This variable is the ViewModel that handles the static display logic.
    var detailViewModel: DetailViewModel
    /// This variable is a reference to the model object that the DetailView is displaying the details of.
    @ObservedObject var model: Thing
    
    //Biggest element is the image, with a title, subtitle, three fields and notes below
    var body: some View {
        return HStack {
            Spacer()
            VStack(alignment: .center) {
                model.loadImage()
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                    .frame(height: CGFloat(10))
                HStack {
                    Text(detailViewModel.urlLabel)
                        .bold()
                    TextField(detailViewModel.enterURLLabel, text: $model.urlField)
                        .frame(width: 250, height: 15)
                    Button(action: {
                        self.model.getImage()
                    }) {
                        Text(detailViewModel.loadLabel)
                    }
                }
                Spacer()
                    .frame(height: CGFloat(50))
                VStack(alignment: .center) {
                    TextField(detailViewModel.enterTitleLabel, text: $model.titleField)
                        .font(.largeTitle)
                        .frame(height: 20)
                    
                    TextField(detailViewModel.enterSubtitleLabel, text: $model.subtitleField)
                        .font(.caption)
                        .frame(height: 10)
                    Spacer()
                        .frame(height: CGFloat(20))
                }
                HStack {
                    VStack(alignment: .trailing) {
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldOneLabelField)
                            .font(.system(size: 15, weight: .heavy))
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldTwoLabelField)
                            .font(.system(size: 15, weight: .heavy))
                        TextField(detailViewModel.enterFieldLabel, text: $model.fieldThreeLabelField)
                            .font(.system(size: 15, weight: .heavy))
                    }
                    VStack(alignment: .leading) {
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldOneField)
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldTwoField)
                        TextField(detailViewModel.enterInfoLabel, text: $model.fieldThreeField)
                    }
                }
                Spacer()
                    .frame(height: 15)
                VStack(alignment: .leading) {
                    TextField(detailViewModel.enterFieldLabel, text: $model.notesLabelField)
                        .font(.system(size: 15, weight: .heavy))
                    TextField(detailViewModel.enterInfoLabel, text: $model.notesField)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                    .frame(height: keyboard.frame.size.height + 15)
            }.animation(.default)
        }
    }
}
