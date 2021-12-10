//
//  firebaseUserAuth.swift
//  MyKar app swiftUI
//
//  Created on 4/6/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

//import Firebase

//FirebaseApp.configure()
//let authUI = FUIAuth.defaultAuthUI()
// You need to adopt a FUIAuthDelegate protocol to receive callback
//authUI.delegate = self
import Firebase
import SwiftUI

@available(iOS 14.0, *)
struct FirebaseLoginApp: App {
	init() {
		FirebaseApp.configure()
	}
	var body: some Scene {
		WindowGroup {
			StartView()
		}
	}
}
