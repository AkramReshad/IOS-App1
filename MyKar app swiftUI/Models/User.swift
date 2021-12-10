//
//  User.swift
//  MyKar app swiftUI
//
//  Created on 4/6/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

class UserModel: Identifiable, Codable {
	var uid = UUID().uuidString
	var FirstName: String?
	var LastName: String?
	var email: String?
	var Phone_Number: String?


//	enum CodingKeys: String, CodingKey {
//		typealias RawValue = <#type#>
//
//
//	}
	init(FirstN: String?, email: String?, LastN: String?, PhoneN: String?) {
		self.email = email
		self.FirstName = FirstN
		self.LastName = LastN
		self.Phone_Number = PhoneN

	}

}
