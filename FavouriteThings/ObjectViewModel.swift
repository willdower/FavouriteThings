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
    func loadImage() -> UIImage {
        guard let url = URL(string: self.imageURL ?? "notarealURL"),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
            print("Failed to load image")
            let placeholderImage = UIImage(named: "placeholderArt")
            self.image = placeholderImage
            return placeholderImage!
            // Force unwrap as placeholderArt will always exist - its in the assets folder
        }
        self.image = uiImage
        return uiImage
    }
}
