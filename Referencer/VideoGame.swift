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

class VideoGame: Identifiable {
    let id = UUID()
    var title: String
    var boxArt: Image? //Optional, no image may be known
    var developer: String? //Optional, developer may be unknown
    var releaseDate: Date? //Optional, release date may be unknown
    var userRating: Float? //Optional, user rating may be unknown, Float out of 10
    var criticRating: Int? //Optional, critic rating may be unknown, Int out of 100
    
    init(title: String, imageName: String?, developer: String?, releaseYear: Int?, releaseMonth: Int?, releaseDay: Int?, userRating: Float?, criticRating: Int?) {
        self.title = title
        self.developer = developer
        self.userRating = userRating
        self.criticRating = criticRating
        
        var dateComponents = DateComponents()
        
        if releaseDay == nil || releaseMonth == nil || releaseYear == nil {
            self.releaseDate = nil
        }
        else {
            dateComponents.year = releaseYear
            dateComponents.month = releaseMonth
            dateComponents.day = releaseDay
            
            self.releaseDate = Calendar.current.date(from: dateComponents)
        }
        
        if let imageNameExists = imageName {
            self.boxArt = Image(imageNameExists).resizable() //Resizeable property allows multiple sizes of the same image throughout the app
        }
        else {
            self.boxArt = nil
        }
    }
}
