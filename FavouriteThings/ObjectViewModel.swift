//
//  ObjectViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

extension Object {
    func getImage() -> Void {
        guard let url = URL(string: self.imageURL ?? "notarealURL"),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
            print("Failed to load image")
            let placeholderImage = UIImage(named: "placeholderArt")
            self.imageData = placeholderImage?.pngData()
            return
        }
        self.imageData = uiImage.pngData()
    }
    var urlField: String {
        get {
            self.imageURL ?? ""
        }
        set {
            self.imageURL = newValue
        }
    }
    var titleField: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
        }
    }
    var subtitleField: String {
        get {
            self.subtitle ?? ""
        }
        set {
            self.subtitle = newValue
        }
    }
    var fieldOneField: String {
        get {
            self.fieldOne ?? ""
        }
        set {
            self.fieldOne = newValue
        }
    }
    var fieldOneLabelField: String {
        get {
            self.fieldOneLabel ?? ""
        }
        set {
            self.fieldOneLabel = newValue
        }
    }
    var fieldTwoField: String {
        get {
            self.fieldTwo ?? ""
        }
        set {
            self.fieldTwo = newValue
        }
    }
    var fieldTwoLabelField: String {
        get {
            self.fieldTwoLabel ?? ""
        }
        set {
            self.fieldTwoLabel = newValue
        }
    }
    var fieldThreeField: String {
        get {
            self.fieldThree ?? ""
        }
        set {
            self.fieldThree = newValue
        }
    }
    var fieldThreeLabelField: String {
        get {
            self.fieldThreeLabel ?? ""
        }
        set {
            self.fieldThreeLabel = newValue
        }
    }
    var notesField: String {
        get {
            self.notes ?? ""
        }
        set {
            self.notes = newValue
        }
    }
    var notesLabelField: String {
        get {
            self.notesLabel ?? ""
        }
        set {
            self.notesLabel = newValue
        }
    }
}
