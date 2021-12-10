//
//  Select Car.swift
//  MyKar app swiftUI
//
//  Created on 4/14/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI


struct Select_Car: View {
	var order = Ride()
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var rideConditions: ConditionsForRide
	@EnvironmentObject var carviewmodel: CarViewModel
	//var cars = [Car]()
	
		
//		[
//		Car(make: "Tesla", model: "Roadster", License_Plate: "123456"),
//		Car(make: "Ferrari", model: "488 Spider", License_Plate: "Rud3ST" ),
//		Car(make: "Honda", model: "Civic",License_Plate: "0HB0Y1")
//		]

	func selection(selected: Car) {
		self.rideConditions.carToBeFixed = selected
		self.rideConditions.isCarSelected = true
		
	}
	
	
    var body: some View {


	ZStack {
		Color("offWhite").edgesIgnoringSafeArea(.all)
		BackgroundGeometryView()
		VStack {
			Text("Select Vehicle")
				.font(.largeTitle)
				.foregroundColor(.mykarpurple)
			Text(".") //Spacer isnt working
				.font(.title).foregroundColor(Color(red: 15/255, green: 15/255, blue: 15/255))
			if carviewmodel.cars.isEmpty {
				Text("Please Add a Vehicle to Continue")
					.font(.title)
					.foregroundColor(.mykarpurple)
					.padding()
			}
			VStack {
				ForEach(carviewmodel.cars) {
						car in

									//CheckBox(title: "")
							Button(action: {selection(selected: car)}) {
								Text("\(car.Make ?? "") \(car.Model ?? "")  \(car.License_Plate_Number ?? "")" )
									.font(.headline)
									.foregroundColor(.white)
								Text(car.Model ?? "")
									.font(.subheadline)
									.foregroundColor(.white)
								Text(car.License_Plate_Number ?? "")
									.font(.subheadline)
									.foregroundColor(.white)
								}
								.padding()
								.frame(width: 355, height: 55)
								.background(Color.mykarpurple)
								.cornerRadius(15.0)

						}
							
					}

				NavigationLink(destination: NewCar().environmentObject(carviewmodel))
					{
					HStack{
						Text("Add Vehicle")
							.font(.headline)
							.foregroundColor(.white)

						Spacer()
						Text("+")
						}
						.padding()
						.frame(width: 355, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(15.0)
					}
				Spacer()
			Button(action: {rideConditions.canceled(); presentationMode.wrappedValue.dismiss()}){
				Text("cancel")
			}
				}
			//.navigationBarHidden(true)
			}.navigationBarBackButtonHidden(true)
			 .navigationBarItems(
					leading:
						Button(action: {rideConditions.canceled(); presentationMode.wrappedValue.dismiss()}) {
						Text("Cancel")
					})
		}
		
	}
struct Select_Car_Previews: PreviewProvider {
    static var previews: some View {
        
		Select_Car()
    }
}
