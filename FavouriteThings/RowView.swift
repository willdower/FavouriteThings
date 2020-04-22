//
//  RowView.swift
//  FavouriteThings
//
//  Created by William Dower on 22/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

struct RowView: View {
    @ObservedObject var model: Model
    
    var body: some View {
        HStack {
            model.image
            .frame(width: 36, height: 54)
            .shadow(radius: 5)
            Spacer()
                .frame(width: 10)
            Text(model.title)
            Spacer()
            Text(model.subtitle)
                .font(.caption)
                .italic()
        }
    }
}
