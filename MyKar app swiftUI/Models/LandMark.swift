//
//  LandMark.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
	let placemark: MKPlacemark
	
	var id: UUID {
		return UUID()
	}
	
	var name: String {
		self.placemark.name ?? ""
	}
	
	var title: String{
		self.placemark.title ?? ""
	}
	
	var coordinate: CLLocationCoordinate2D {
		self.placemark.coordinate
	}
	
}
