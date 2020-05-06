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

struct MapView: UIViewRepresentable {
    @ObservedObject var model: Thing
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = model
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        // Called when the SwiftUI view the map is in is refreshed
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard !appDelegate.isUpdating else { return }
        print("mapView updating")
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
}
