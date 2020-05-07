//
//  MapView.swift
//  FavouriteThings
//
//  Created by William Dower on 6/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

/// This struct is the UIView that holds the map from MapKit and is embedded in LocationView.
struct MapView: UIViewRepresentable {
    /// Reference to the model that this view is displaying the location for.
    @ObservedObject var model: Thing
    
    /// Interacts with SwiftUI view to create the UIView on load
    ///
    /// - Note: This  function is only accessed automatically by the system.
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = model
        return mapView
    }
    
    /// Interacts with SwiftUI view to update UIView when SwiftUI view refreshes
    ///
    /// - Note: This  function is only accessed automatically by the system.
    func updateUIView(_ mapView: MKMapView, context: Context) {
        // Called when the SwiftUI view the map is in is refreshed
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard !appDelegate.isUpdating else { return }
        print("mapView updating")
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
}
