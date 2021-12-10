//
//  Ride.swift
//  MyKar app swiftUI
//
//   Created on 4/7/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import SwiftUI

struct Ride: Identifiable {
	
	var id = UUID().uuidString
	var car: Car?
	var shop: Shop?
	var service: Service?
	
	//var initial_Location: String?
	
}
