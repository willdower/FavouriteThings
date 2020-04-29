//
//  ObjectListViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData

extension ThingList {
    var thingsArray: [Thing] {
        (self.things?.array as? [Thing]) ?? []
    }
    var titleField: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
        }
    }
}
