//
//  TitleView.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// Handle's displaying the editable title when editMode is true
struct TitleView: View {
    
    /// Holds the reference to the thingList whose title is being edited
    @ObservedObject var thingList: ThingList
    /// Holds the viewModel that handles the static display logic
    let detailViewModel: DetailViewModel
    
    var body: some View {
        return HStack {
            Text(detailViewModel.titleEditPrepend)
            TextField(detailViewModel.enterTitleLabel, text: $thingList.titleField)
                .font(Font.system(.largeTitle).bold())
        }
    }
}
