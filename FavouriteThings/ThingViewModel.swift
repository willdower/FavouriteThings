//
//  ThingViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

extension Thing {
    /// Gets the image from the web at thing's imageURL and saves it to thing.imageData as Data? with pngData().
    func getImage() -> Void {
        guard let url = URL(string: self.imageURL ?? "notarealURL"),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
            print("Failed to load image")
            self.imageData = nil
            return
        }
        self.imageData = uiImage.pngData()
    }
    /// Loads the image data from the CoreData.
    ///
    /// - Returns: Image from imageData or placeholderArt Image
    func loadImage() -> Image? {
        guard let imageDataExists = self.imageData,
        let uiImage = UIImage(data: imageDataExists) else {
            return Image("placeholderArt")
        }
        return Image(uiImage: uiImage)
    }
    /// Provides getter and setter for changing a thing's URL
    var urlField: String {
        get {
            self.imageURL ?? ""
        }
        set {
            self.imageURL = newValue
        }
    }
    /// Provides getter and setter for changing a thing's title
    var titleField: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
        }
    }
    /// Provides getter and setter for changing a thing's subtitle
    var subtitleField: String {
        get {
            self.subtitle ?? ""
        }
        set {
            self.subtitle = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldOne
    var fieldOneField: String {
        get {
            self.fieldOne ?? ""
        }
        set {
            self.fieldOne = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldOneLabel
    var fieldOneLabelField: String {
        get {
            self.fieldOneLabel ?? ""
        }
        set {
            self.fieldOneLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldTwo
    var fieldTwoField: String {
        get {
            self.fieldTwo ?? ""
        }
        set {
            self.fieldTwo = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldTwoLabel
    var fieldTwoLabelField: String {
        get {
            self.fieldTwoLabel ?? ""
        }
        set {
            self.fieldTwoLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldThree
    var fieldThreeField: String {
        get {
            self.fieldThree ?? ""
        }
        set {
            self.fieldThree = newValue
        }
    }
    /// Provides getter and setter for changing a thing's fieldThreeLabel
    var fieldThreeLabelField: String {
        get {
            self.fieldThreeLabel ?? ""
        }
        set {
            self.fieldThreeLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's notes
    var notesField: String {
        get {
            self.notes ?? ""
        }
        set {
            self.notes = newValue
        }
    }
    /// Provides getter and setter for changing a thing's notesLabel
    var notesLabelField: String {
        get {
            self.notesLabel ?? ""
        }
        set {
            self.notesLabel = newValue
        }
    }
}
