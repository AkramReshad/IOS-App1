//
//  Car.swift
//  MyKar app swiftUI
//
//   Created on 3/29/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//


import SwiftUI

struct Car: Identifiable {

	var id: String = UUID().uuidString
	
//	var Owner: String
	var Make: String?
	var Model: String?
//	var description: String
	var License_Plate_Number: String?
//	var insurance_number: String
//	private var imageName: String
//	var image: Image {
//		Image(imageName)
//	}
	
	init( make: String?, model: String?, License_Plate: String?){
		self.Make = make
		self.Model = model
		self.License_Plate_Number = License_Plate
		
	}

}
