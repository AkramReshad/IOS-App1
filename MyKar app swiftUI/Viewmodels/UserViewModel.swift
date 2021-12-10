//
//  UserViewmodel.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 4/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject {
	@Published var ID = 
	@Published var email = ""
	@Published var firstname = ""
	@Published var lastname = ""
	@Published var cars = [Car]()
	private var db = Firestore.firestore()
	
	func addUser(email: String, First: String, Last: String) {
		
	}
	func addCar( car: Car){
		
	}
	
	func fetchData() {
		
	}
}

