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
    func loadImage() -> Void {
        guard let url = URL(string: self.imageURL ?? "notarealURL"),
        let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) else {
            print("Failed to load image")
            let uiImage = UIImage(named: "placeholderArt")
            self.image = uiImage
            return
        }
        self.image = uiImage
    }
}
