//
//  MapCoordinator.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
	var control: MapView
	
	init(_ control: MapView) {
		self.control = control
	}
	
	func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]){
		
		if let annotationView = views.first{
			if let annotation = annotationView.annotation{
				if annotation is MKUserLocation{
					
					let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
					mapView.setRegion(region, animated: true)
				}
			}
		}
	}
}
