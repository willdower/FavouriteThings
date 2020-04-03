//
//  VideoGame.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI
//Video game class to store details of each video game stored in the app

struct VideoGame: Identifiable {
    
    let id = UUID()
    var title: String
    var boxArt: Image? //Optional, no image may be known
    var developer: String = ""
    var releaseDate: String = ""
    var userRating: Double? //Optional, user rating may be unknown, Double out of 10
    var criticRating: Int? //Optional, critic rating may be unknown, Int out of 100
    var notes: String = ""
    
}
