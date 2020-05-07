//
//  LocationView.swift
//  FavouriteThings
//
//  Created by William Dower on 6/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

/// This struct holds the view that displays the MapView and location details to the user. It is reached by a NavigationLink in the DetailView.
struct LocationView: View {
    /// Reference to the model that this view is displaying the location for.
    @ObservedObject var model: Thing
    /// Reference to the keyboard object, which gives information about keyboard size for adjusting views
    @ObservedObject var keyboard: Keyboard
    /// This variable is the ViewModel that handles the static display logic.
    let detailViewModel: DetailViewModel
    
    var body: some View {
        VStack {
            MapView(model: model)
            Spacer()
            HStack {
                VStack {
                    TextField(detailViewModel.enterFieldLabel, text: $model.locationNameLabelField)
                        .font(.system(size: 15, weight: .heavy))
                    TextField(detailViewModel.enterFieldLabel, text: $model.latitudeLabelField)
                    .font(.system(size: 15, weight: .heavy))
                    TextField(detailViewModel.enterFieldLabel, text: $model.longitudeLabelField)
                    .font(.system(size: 15, weight: .heavy))
                }
                VStack {
                    TextField(detailViewModel.enterInfoLabel, text: $model.locationNameField, onCommit: {
                        self.detailViewModel.getLocationFromName(locationName: self.model.locationName ?? "", model: self.model)
                    })
                    TextField(detailViewModel.enterInfoLabel, text: $model.latitudeStringField, onCommit: {
                        self.detailViewModel.getLocationFromCoordinates(model: self.model)
                    })
                    TextField(detailViewModel.enterInfoLabel, text: $model.longitudeStringField, onCommit: {
                        self.detailViewModel.getLocationFromCoordinates(model: self.model)
                    })
                }
            }
            Button(action: {
                self.detailViewModel.getLocationFromCoordinates(model: self.model)
            }, label: {
                Text(self.detailViewModel.updateLocationFromCoordinates)
            })
            Spacer()
                .frame(height: keyboard.frame.size.height + 15)
        }.animation(.default)
    }
}
