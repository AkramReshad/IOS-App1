//
//  File.swift
//  MyKar app swiftUI
//
//  Created on 4/14/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine
import FirebaseFirestore

class CarViewModel: ObservableObject {
	
	init(uid: String) {
		self.userid = uid
		FetchCarData()
	}
	
	@Published var userid: String
	@Published var cars = [Car]()
	private var db = Firestore.firestore()
//
	let didChange = PassthroughSubject<CarViewModel,Never>()
//
	let willChange = PassthroughSubject<CarViewModel,Never>()
	
	func AddCar(make: String?,model: String?,License_plate: String?) {
		let newcar = Car(make: make, model: model, License_Plate: License_plate)
		db.collection("customers").document(userid).collection("cars").document(newcar.id).setData([
						"Make" : make ?? "",
						"Model" : model ?? "",
			"License_Plate_Number" : License_plate ?? ""
					  ]) { error in
			if let error = error {
					print("Error writing document: \(error)")
				} else {
					//cars.append(newcar)
					print("Car Document successfully written!")
				}
		
		}
	}
	
//	func GetCarID( currentcar) {
//
//	}
	
	func FetchCarData () {
		db.collection("customers").document(userid).collection("cars").addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else{
				print("No documents")
				return
			}
		

			self.cars = documents.map { queryDocumentSnapshot -> Car in
				let data = queryDocumentSnapshot.data()
				let make = data["Make"] as? String ?? ""
				let model = data["Model"] as? String ?? ""
				let License_Plate = data["License_Plate_Number"] as? String ?? ""
				let id  = queryDocumentSnapshot.documentID
				var current_car = Car(make: make, model: model, License_Plate: License_Plate)
				current_car.id = id
				return current_car
			}
		}
		
	}
}
