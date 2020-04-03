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
    var title: String = ""
    var imageURL: String = "https://i.imgur.com/Nkqztzw.jpg"
    var boxArt: Image?
    var developer: String = ""
    var releaseDate: String = ""
    var userRating: Double? //Optional, user rating may be unknown, Double out of 10
    var criticRating: Int? //Optional, critic rating may be unknown, Int out of 100
    var notes: String = ""
    
    mutating func loadImage() -> Void {
        guard let url = URL(string: self.imageURL),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
               fatalError("Image download failure")
        }
        
        self.boxArt = Image(uiImage: uiImage).resizable()
    }
    
    init() {
        self.loadImage()
    }
    
    init(title: String, imageURL: String, developer: String, releaseDate: String, userRating: Double, criticRating: Int) {
        self.title = title
        self.imageURL = imageURL
        self.developer = developer
        self.releaseDate = releaseDate
        self.userRating = userRating
        self.criticRating = criticRating
        
        self.loadImage()
    }
    
}
