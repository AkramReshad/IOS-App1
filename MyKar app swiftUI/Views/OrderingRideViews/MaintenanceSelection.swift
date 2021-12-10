//
//  MaintenanceSelection.swift
//  MyKar app swiftUI
//


import SwiftUI

struct MaintenanceSelection: View {

	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var rideConditions: ConditionsForRide
	
	let service = [ Service( name: "Oil Change"),Service( name: "Tire Rotation"),Service( name: "Brake Check"),Service( name: "Alignment"), Service( name: "Transmission"), Service( name: "Inspection")]
	
	func selection(selected: Service) {
		self.rideConditions.typeOfMaintenanceOnCar = selected
		self.rideConditions.isMaintenanceSelected = true
		
	}
	
	
	var body: some View{
		
		ZStack {
			Color.offWhite.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack(){
				Text("Select Service")
					.font(.largeTitle).foregroundColor(Color.mykarpurple)
					.bold()

				VStack(){ ForEach(service) { item in
						Button(action: {
							selection(selected: item)
						}) {
							Text(item.name)
								.foregroundColor(.white)
								.frame(width: 355, height: 50)
								.background(Color.mykarpurple)
								.cornerRadius(15.0)}
						}
						.padding()

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


struct MaintenanceSelection_Previews: PreviewProvider {
    static var previews: some View {
        MaintenanceSelection()
    }
}
