//
//  TitleView.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleView: View {
    
    @ObservedObject var thingList: ThingList
    let detailViewModel: DetailViewModel
    
    var body: some View {
        return HStack {
            Text(detailViewModel.titleEditPrepend)
            TextField(detailViewModel.enterTitleLabel, text: $thingList.titleField)
                .font(Font.system(.largeTitle).bold())
        }
    }
}
