//
//  DetailViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation

/// This struct is the viewModel that handles all of the static display logic.
struct DetailViewModel {
    
    /// Name of the placeholder image from assets
    let placeholderImageName = "placeholderArt"
    /// String displayed when a value is unknown
    let unknownLabel = "Unknown"
    /// String displayed as load button
    let loadLabel = "Load"
    /// String displayed as label for the URL field
    let urlLabel = "URL: "
    /// String displayed when notes field is empty
    let enterInfoLabel = "Enter information..."
    /// String displayed when title field is empty
    let enterTitleLabel = "Enter title..."
    /// String displayed when developer field is empty
    let enterSubtitleLabel = "Enter subtitle..."
    /// String displayed when URL field is empty
    let enterURLLabel = "Enter new image URL..."
    /// String displayed when a field label is empty
    let enterFieldLabel = "Enter field label..."
    /// String displayed when list title is being edited
    let titleEditPrepend = "✏️"
}
