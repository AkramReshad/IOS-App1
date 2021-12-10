//
//  NewCar.swift
//  MyKar app swiftUI
//
//   Created on 4/14/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct NewCar: View {
	@EnvironmentObject var user: UserAuth
	@EnvironmentObject var carviewmodel: CarViewModel
	@Environment(\.presentationMode) var presentationMode

	
	@State var make = ""
	@State var model = ""
	@State var License_Plate = ""
	

	
    var body: some View {
		NavigationView{
			VStack {
				Text("Add Car")
					.font(.largeTitle)
					.foregroundColor(.mykarpurple)
				VStack(alignment: .leading) {
					Text("Make:")
						.foregroundColor(.mykarpurple)
					TextField("Make", text: $make)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(20.0)
				}.padding()
				VStack(alignment: .leading) {
					Text("Model:")
						.foregroundColor(.mykarpurple)
					TextField("Model", text: $model)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(20.0)
				}.padding()
				VStack(alignment: .leading) {
					Text("License_Plate:")
						.foregroundColor(.mykarpurple)
					TextField("License_Plate", text: $License_Plate)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(20.0)
				}.padding()


				Button(action: {carviewmodel.AddCar(make: make, model: model, License_plate: License_Plate); presentationMode.wrappedValue.dismiss(); print("Cool Car")}){
					Text("Add Car")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 355, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(15.0)
				}
				Spacer()
			}.background(
				Color(red: 15/255, green: 15/255, blue: 15/255)
				.edgesIgnoringSafeArea(.all))
			.navigationBarTitle("Add Car").navigationBarHidden(true)
			.foregroundColor(.mykarpurple)
		}
    }
}

struct NewCar_Previews: PreviewProvider {
    static var previews: some View {
        NewCar()
    }
}
