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

struct LocationView: View {
    @ObservedObject var model: Thing
    @ObservedObject var keyboard: Keyboard
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
            Spacer()
                .frame(height: keyboard.frame.size.height + 15)
        }.animation(.default)
    }
}
