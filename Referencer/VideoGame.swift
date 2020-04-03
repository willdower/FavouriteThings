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

class VideoGame: ObservableObject, Identifiable {
    let id = UUID()
    var title: String
    var boxArt: Image? //Optional, no image may be known
    var developer: String? //Optional, developer may be unknown
    var releaseDate: String? //Optional, release date may be unknown
    var userRating: Double? //Optional, user rating may be unknown, Double out of 10
    var criticRating: Int? //Optional, critic rating may be unknown, Int out of 100
    @Published var notes: String
    
    init(title: String, imageName: String?, developer: String?, releaseYear: Int?, releaseMonth: Int?, releaseDay: Int?, userRating: Double?, criticRating: Int?) {
        self.title = title
        self.developer = developer
        self.userRating = userRating
        self.criticRating = criticRating
        
        if let releaseDayExists = releaseDay, let releaseMonthExists = releaseMonth, let releaseYearExists = releaseYear {
            self.releaseDate = String(releaseDayExists) + "/" + String(releaseMonthExists) + "/" + String(releaseYearExists)
        }
        else {
            self.releaseDate = nil
        }
        
        if let imageNameExists = imageName {
            self.boxArt = Image(imageNameExists).resizable() //Resizeable property allows multiple sizes of the same image throughout the app
        }
        else {
            self.boxArt = nil
        }
        
        self.notes = ""
        
    }
}
