//
//  LandMarkAnnotation.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
	let title: String?
	let coordinate: CLLocationCoordinate2D
	
	init(landmark: Landmark) {
		self.title = landmark.name
		self.coordinate = landmark.coordinate
	}
}
