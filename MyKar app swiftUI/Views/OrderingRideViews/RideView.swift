//
//  RideView.swift
//  MyKar app swiftUI
//
//   Created on 4/15/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct RideView: View {
	
	
	@EnvironmentObject var userAuth: UserAuth
	@EnvironmentObject var cons: ConditionsForRide
	@EnvironmentObject var rideviewmodel: RideViewModel

	
	
    var body: some View {
		
		
		if cons.isMaintenanceSelected != true && cons.isShopSelected != true && cons.isCarSelected != true {
			
			Select_Car()
				.environmentObject(self.cons)
				.environmentObject(CarViewModel(uid: userAuth.user.uid))
			
		} else if cons.isMaintenanceSelected != true && cons.isCarSelected == true && cons.isShopSelected != true {
			
			Select_Shop()
				.environmentObject(ShopViewModel())
				.environmentObject(self.cons)
//			Select_Car()
//				.environmentObject(self.cons)
//				.environmentObject(CarViewModel(uid: userAuth.user.uid))
		
		} else if cons.isMaintenanceSelected != true && cons.isCarSelected == true && cons.isShopSelected == true {
			
			MaintenanceSelection()
				.environmentObject(self.cons)

		} else if cons.isMaintenanceSelected == true && cons.isCarSelected == true && cons.isShopSelected == true {
			ConfirmOrderView()
				.environmentObject(self.cons)
				.environmentObject(self.rideviewmodel)
		}
    }
}



struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView()
    }
}
