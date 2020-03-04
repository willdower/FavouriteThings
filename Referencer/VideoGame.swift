//
//  VideoGame.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation

//Video game class to store details of each video game stored in the app

class VideoGame {
    var title: String
    var developer: String? //Optional, developer may be unknown
    var releaseDate: Date? //Optional, release date may be unknown
    var userRating: Int? //Optional, user rating may be unknown, Int out of 100
    var criticRating: Int? //Optional, criticv rating may be unknown, Int out of 100
}
