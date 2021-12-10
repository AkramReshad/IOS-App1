//
//  RideConditions.swift
//  MyKar app swiftUI
//
//   Created on 4/15/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine

class ConditionsForRide: ObservableObject{
	@Published var isCarSelected: Bool = false
	@Published var isShopSelected: Bool = false
	@Published var isMaintenanceSelected: Bool = false
	@Published var isOrderConfirmed: Bool = false
	@Published var carToBeFixed: Car = Car(make: "", model: "", License_Plate: "")
	@Published var shopToGoTo: Shop = Shop(name: "", partner: false)
	@Published var typeOfMaintenanceOnCar: Service = Service(name: "")
	
	func canceled(){
		self.isCarSelected = false
		self.isShopSelected = false
		self.isMaintenanceSelected = false
		self.isOrderConfirmed = false
		self.carToBeFixed = Car(make: "", model: "", License_Plate: "")
		self.shopToGoTo = Shop(name: "", partner: false)
		self.typeOfMaintenanceOnCar = Service(name: "")
	}

}
