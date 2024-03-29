//
//  DetailViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI
import Dispatch

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
    /// Default Field One label
    let defaultFieldOneLabel = "Field One:"
    /// Default Field Two label
    let defaultFieldTwoLabel = "Field Two:"
    /// Default Field Three label
    let defaultFieldThreeLabel = "Field Three:"
    /// Default overall location label
    let defaultLocationLabel = "Location:"
    /// Default Location Name label
    let defaultLocationNameLabel = "Location Name:"
    /// Default Latitude label
    let defaultLatitudeLabel = "Latitude:"
    /// Default Longitude Label
    let defaultLongitudeLabel = "Longitude:"
    /// Default Notes field label
    let defaultNotesLabel = "Notes"
    /// Default text for button that updates the location name based on the coordinates
    let updateLocationFromCoordinates = "Update Location From Coordinates"
    
    /// Allows the textfields for latitude and longitude to interpret the input string as a Double for saving to the model
    let doubleFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 14
        return formatter
    }()
    
    /// Gets the location coordinates from just a location name (geocoding)
    func getLocationFromName(locationName: String, model: Thing) {
        
        let geocoder = CLGeocoder()
        let position = CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude)
        let region = CLCircularRegion(center: position, radius: 2_000_000, identifier: "\(position)")
        geocoder.geocodeAddressString(locationName, in: region) { (placemarks, error) in
            guard let location = placemarks?.first?.location else {
                print("Error locating '\(locationName)': '\(error.map {"\($0)"} ?? "<unknown error>")'")
                return
            }
            let position = location.coordinate
            model.latitude = position.latitude
            model.longitude = position.longitude
        }
        return
    }
    
    /// Gets a location's name based on coordinates (reverse geo-code)
    func getLocationFromCoordinates(model: Thing) {
        
        let geocoder = CLGeocoder()
        let position = CLLocation(latitude: model.latitude, longitude: model.longitude)
        geocoder.reverseGeocodeLocation(position) { (placemarks, error) in
            guard let placemark = placemarks?.first else {
                print("Error locating \(model.latitude) / \(model.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                return
            }
            model.locationName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? self.unknownLabel
        }
    }
}
