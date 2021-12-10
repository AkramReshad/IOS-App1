//
//  Select_Shop.swift
//  MyKar app swiftUI
//
//   Created on 4/14/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct Select_Shop: View {
	
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var rideConditions: ConditionsForRide
	@EnvironmentObject var shopviewmodel: ShopViewModel

	func selection(selected: Shop) {
		self.rideConditions.shopToGoTo = selected
		self.rideConditions.isShopSelected = true
		
	}
	
	
    var body: some View {
		
		ZStack {
			Color.offWhite.edgesIgnoringSafeArea(.all)
			VStack(){
				Text("Select Shop")
					.font(.largeTitle).foregroundColor(Color.mykarpurple)
					.bold()

				VStack(){ ForEach(shopviewmodel.shops) { item in
						Button(action: {
							selection(selected: item)
						}) {
							VStack(spacing: 1){
								Text(item.name ?? "")
									.foregroundColor(.white)
								if item.Partner == true {
									HStack {
										Image(systemName: "star.fill")
											.resizable()
											.aspectRatio(contentMode: .fit)
											.frame(width: 20, height: 20)
											.foregroundColor(.gray)
										Text("Trusted MyKar Partner")
											.foregroundColor(.gray)
											.font(.caption)
								}
								}
							}
						}
						.padding()
						.frame(width: 355, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(15.0)}
					Divider().foregroundColor(.mykarpurple)
					}
				Spacer()
				}
			}.navigationBarBackButtonHidden(true)
			 .navigationBarItems(
				leading:
					Button(action: {rideConditions.canceled(); presentationMode.wrappedValue.dismiss()}) {
					  Text("Cancel")
					})
    }
}

struct Select_Shop_Previews: PreviewProvider {
    static var previews: some View {
		Select_Shop()
    }
}
