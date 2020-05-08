//
//  CoordinateView.swift
//  FavouriteThings
//
//  Created by William Dower on 7/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI

struct CoordinateView: View {
    var detailViewModel: DetailViewModel
    @ObservedObject var model: Thing
    
    var body: some View {
        VStack {
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
                    TextField(detailViewModel.enterInfoLabel, value: $model.latitudeField, formatter: self.detailViewModel.doubleFormatter, onCommit: {
                        self.detailViewModel.getLocationFromCoordinates(model: self.model)
                    })
                    TextField(detailViewModel.enterInfoLabel, value: $model.longitudeField, formatter: self.detailViewModel.doubleFormatter, onCommit: {
                        self.detailViewModel.getLocationFromCoordinates(model: self.model)
                    })
                }
            }
            Button(action: {
                self.detailViewModel.getLocationFromCoordinates(model: self.model)
            }, label: {
                Text(self.detailViewModel.updateLocationFromCoordinates)
            })
        }
    }
}
