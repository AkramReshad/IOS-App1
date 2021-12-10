//
//  DealershipViewModel.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 4/15/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine

import FirebaseFirestore

class ShopViewModel: ObservableObject {
	
	@Published var shops = [Shop]()
	private var db = Firestore.firestore()
	
	func FetchShopData () {
		db.collection("Automotive Shops").addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else{
				print("No documents")
				return
			}
			
			self.shops = documents.map { queryDocumentSnapshot -> Shop in
				let data = queryDocumentSnapshot.data()
				let name = data["Name"] as? String ?? ""
				let partner = data["Partner"] as? Bool ?? false
				
				return Shop(name: name, partner: partner)
			}
		}
	}
	init () {
		self.FetchShopData()
	}
}

