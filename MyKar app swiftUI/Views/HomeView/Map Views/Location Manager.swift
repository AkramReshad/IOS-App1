//
//  Location Mangaer.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
	
	private let locationManager = CLLocationManager()
	@Published var location: CLLocation? = nil
	
	override init() {
		
		super.init()
		self.locationManager.delegate = self
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
		self.locationManager.distanceFilter = kCLDistanceFilterNone
		self.locationManager.requestWhenInUseAuthorization()
		self.locationManager.startUpdatingLocation()
		
		
	}
}

extension LocationManager: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
		print(status)
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
		guard let location = locations.last else {
			return
		}
		
		self.location = location
	}
}
