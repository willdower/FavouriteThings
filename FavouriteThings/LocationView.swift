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
            CoordinateView(detailViewModel: detailViewModel, model: model)
            Spacer()
                .frame(height: keyboard.frame.size.height + 15)
        }.animation(.default)
    }
}
