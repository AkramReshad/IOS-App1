//
//  UserAuthentication.swift
//  MyKar app swiftUI
//
//  Created on 4/7/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine
import FirebaseAuth
import FirebaseFirestore

//ViewModel for the User and getting Log in and sign up data
class UserAuth: ObservableObject {
	
	@Published var isLoggedin = false
	@Published var user = UserModel(FirstN: "", email: "", LastN: "", PhoneN: "")
	@Published var FailedLogin = false
	
	private var db = Firestore.firestore()
	
	let didChange = PassthroughSubject<UserAuth,Never>()

	// required to conform to protocol 'ObservableObject'
	let willChange = PassthroughSubject<UserAuth,Never>()

	func login(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
		if error != nil {
			print(error?.localizedDescription ?? "")
			self.FailedLogin = true
			//FailedLogin = error?.localizedDescription ?? ""
		} else {
			print("Succesfully Logged in!")
			self.isLoggedin = true
			self.fetchUserData()
			print(self.isLoggedin)
		
		}
	}
  }
	func SignUp(email: String, password: String, FirstName: String, LastName: String, PhoneN: String) {
		Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
			if error != nil {
				print(error?.localizedDescription ?? "")
			
			} else {
				print("Succesfully Created User")
				self.user  = UserModel(FirstN: FirstName, email: email, LastN: LastName, PhoneN: PhoneN)
				self.getUserID()
				self.addUser(self.user)
				self.login(email: email, password: password)
			}
		}
	}
	func getUserID(){
		let currentuser = Auth.auth().currentUser

		if currentuser != nil {
			self.user.email = currentuser?.email
			self.user.uid = currentuser?.uid ?? ""
		}
	}
	
	func fetchUserData() {
		
		self.getUserID()
		db.collection("customers").document(self.user.uid).collection("account").document(self.user.uid).getDocument{ (document,error) in
			let data = document?.data()
			self.user.FirstName = data?["First Name"] as? String ?? ""
			self.user.LastName = data?["Last Name"] as? String ?? ""
			self.user.email = data?["email"] as? String ?? ""
			
		}
	}
	
	func addUser(_ user: UserModel) {
		db.collection("customers").document(user.uid).collection("account").document(user.uid).setData([
						"First Name" : user.FirstName ?? "",
						"Last Name" : user.LastName ?? "",
						"Email" : user.email ?? "",
						"Phone" : user.Phone_Number ?? ""
					  ]) { error in
			if let error = error {
					print("Error writing document: \(error)")
				} else {
					print("Account Document successfully written!")
				}
		}
	}
}

	// willSet {
	//       willChange.send(self)
	// }
