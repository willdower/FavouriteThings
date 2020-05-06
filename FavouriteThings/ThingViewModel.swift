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
import CoreLocation

extension Thing {
    /// Gets the image from the web at thing's imageURL and saves it to a file named uuid-image.txt
    func getImage() -> Void {
        guard let uuid = self.id else {
            print("Object does not have uuid")
            return
        }
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentFolderURL = urls[0]
        let fileURL = documentFolderURL.appendingPathComponent("\(uuid)-image.txt")
        
        guard let url = URL(string: self.imageURL ?? "notarealURL"),
        let imageData = try? Data(contentsOf: url) else {
            print("No image at url or url missing")
            self.successfulURL = false
            return
        }
        self.successfulURL = true
        do {
            try imageData.write(to: fileURL)
        }
        catch {
            print("Failed to write image data to file")
            return
        }
    }
    /// Loads the image data from the file system.
    ///
    /// - Returns: Image from imageData or placeholderArt Image
    func loadImage() -> Image {
        guard let uuid = self.id else {
            print("Object does not have id")
            return Image("placeholderArt")
        }
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentFolderURL = urls[0]
        let fileURL = documentFolderURL.appendingPathComponent("\(uuid)-image.txt")
        
        guard let imageData = try? Data(contentsOf: fileURL),
            let uiImage = UIImage(data: imageData) else {
            return Image("placeholderArt")
        }
        
        return Image(uiImage: uiImage)
        
    }
    /// Provides getter and setter for changing a thing's latitude label
    var latitudeLabelField: String {
        get {
            self.latitudeLabel ?? ""
        }
        set {
            self.latitudeLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's longitude label
    var longitudeLabelField: String {
        get {
            self.longitudeLabel ?? ""
        }
        set {
            self.longitudeLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's location label
    var locationLabelField: String {
        get {
            self.locationLabel ?? ""
        }
        set {
            self.locationLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's location name label
    var locationNameLabelField: String {
        get {
            self.locationNameLabel ?? ""
        }
        set {
            self.locationNameLabel = newValue
        }
    }
    /// Provides getter and setter for changing a thing's latitude
    var latitudeStringField: String {
        get {
            self.latitudeString ?? ""
        }
        set {
            self.latitudeString = newValue
        }
    }
    /// Provides getter and setter for changing a thing's longitude
    var longitudeStringField: String {
        get {
            self.longitudeString ?? ""
        }
        set {
            self.longitudeString = newValue
        }
    }
    /// Provides getter and setter for changing a thing's location name
    var locationNameField: String {
        get {
            self.locationName ?? ""
        }
        set {
            self.locationName = newValue
        }
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
