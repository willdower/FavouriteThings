//
//  ObjectListViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData

extension ObjectList {
    var objectsArray: [Object] {
        (self.objects?.array as? [Object]) ?? []
    }
}
