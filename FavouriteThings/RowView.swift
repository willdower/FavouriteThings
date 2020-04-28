//
//  RowView.swift
//  FavouriteThings
//
//  Created by William Dower on 22/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// This struct is a view that represents each object model in the ListView
struct RowView: View {
    /// This observed object holds the model that each row (one row per RowView) references
    @ObservedObject var model: Object
    let detailViewModel: DetailViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: model.image as? UIImage ?? model.loadImage())
            .frame(width: 36, height: 54)
            .shadow(radius: 5)
            Spacer()
                .frame(width: 10)
            Text(model.title ?? detailViewModel.unknownLabel)
            Spacer()
            Text(model.subtitle ?? detailViewModel.unknownLabel)
                .font(.caption)
                .italic()
        }
    }
}
