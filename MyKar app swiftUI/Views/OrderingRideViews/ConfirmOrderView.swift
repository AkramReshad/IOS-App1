//
//  ConfirmOrderView.swift
//  MyKar app swiftUI
//
//   Created on 4/15/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct ConfirmOrderView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var rideConditions: ConditionsForRide
	@EnvironmentObject var rideviewmodel: RideViewModel
	@State var Confirmation: Bool = true
	
    var body: some View {
		ZStack{
			Color(red: 15/255, green: 15/255, blue: 15/255).edgesIgnoringSafeArea(.all)
			if rideConditions.isOrderConfirmed == true {
				VStack{
					Text("Order Confirmed")
						.font(.largeTitle)
					Text("Car:  \(rideConditions.carToBeFixed.Make ?? "") \(rideConditions.carToBeFixed.Model ?? "")")
						.font(.title)
					Text("Shop: \(rideConditions.shopToGoTo.name ?? "") " )
						.font(.title)
					Text("Maintenance: \(rideConditions.typeOfMaintenanceOnCar.name) ")
						.font(.title)

					
				
				}
			}
		}.navigationBarBackButtonHidden(true)
		 .navigationBarItems(leading:
					Button(action: { presentationMode.wrappedValue.dismiss()}) {
					Text("Back")
					})
		.alert(isPresented: $Confirmation){
			Alert(title: Text("Confirm Order"),
				  message: Text("Do you want \(rideConditions.carToBeFixed.Make ?? "")\(rideConditions.carToBeFixed.Model ?? "") to be Serviced at \(rideConditions.shopToGoTo.name ?? "") for \(rideConditions.typeOfMaintenanceOnCar.name )"), primaryButton: .default(Text("Confirm"), action: {
				rideConditions.isOrderConfirmed = true; rideviewmodel.addRideData(car: rideConditions.carToBeFixed, shop: rideConditions.shopToGoTo, main: rideConditions.typeOfMaintenanceOnCar)
					
//					.destructive(Text("Confirm")){
//					rideConditions.isOrderConfirmed = true; rideviewmodel.addRideData(car: rideConditions.carToBeFixed, shop: rideConditions.shopToGoTo, main: rideConditions.typeOfMaintenanceOnCar)
				  }),
				  secondaryButton: .destructive(Text("Cancel")){rideConditions.canceled()}
				  
				 )
			}

		}
    }


struct ConfirmOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderView()
    }
}
