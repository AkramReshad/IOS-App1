//
//  Dealership.swift
//  MyKar app swiftUI
//
//  Created on 3/29/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine
import SwiftUI


struct Shop: Identifiable {
	
	var id = UUID().uuidString
	var name: String? = ""
	var Partner: Bool? = false
	
	init(name: String?, partner: Bool?){
		self.name = name
		self.Partner = partner
		
	}
	
}
//	var description: String
//
//	private var imageName: String
//
//	var image: Image {
//		Image(imageName)
//	}
//	private var coordinates: Coordinates
//

//	struct Coordinates: Hashable, Codable {
//		var latitude: Double
//		var longitude: Double
//	}

