//
//  RideViewModel.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 4/15/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine
import FirebaseFirestore

class RideViewModel: ObservableObject {
	
	@Published var ride = Ride()
	@Published var userid: String
	
	private var db = Firestore.firestore()
	
	init (id: String?) {
		
		self.userid  = id ?? ""
		
//		private var dc =
	}
	
	func addRideData(car: Car?, shop: Shop?, main: Service?) {
		self.ride = Ride(car: car, shop: shop, service: main)

		db.collection("customers").document(userid).collection("Orders").document(self.ride.id).setData([
			"Car ID" : self.ride.car?.id ?? "N/A",
			"Make" : self.ride.car?.Make ?? "",
			"Model" : self.ride.car?.Model  ?? "",
			"License_Plate_Number" : self.ride.car?.License_Plate_Number ?? "",
			"Shop ID" : self.ride.shop?.id ?? "",
			"Shop Name": self.ride.shop?.name ?? "",

			]) { error in
				if let error = error {
					print("Error writing document: \(error)")
				} else {
					//cars.append(newcar)
					print("Ride Document successfully written!")
				}
		}
			db.collection("customers").document(userid).collection("Orders").document(self.ride.id).setData([
				"Service": self.ride.service?.name ?? "",
				"Service ID": self.ride.service?.id ?? ""
			], merge: true) { error in
					if let error = error {
						print("Error writing document: \(error)")
					} else {
						//cars.append(newcar)
						print("Service successfully written!")
					}
		
		}
	}
	
	
}
