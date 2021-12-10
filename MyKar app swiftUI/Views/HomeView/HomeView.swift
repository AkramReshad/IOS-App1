
import SwiftUI
import MapKit

struct HomeView: View {
	
	@EnvironmentObject var userAuth: UserAuth
	@EnvironmentObject var rideviewmodel: RideViewModel
	
	@ObservedObject var locationManager = LocationManager()
	@ObservedObject var rideCons = ConditionsForRide()
	
	@State var showSideMenu = false
	@State private var search: String = "Car repair"
	@State private var landmarks: [Landmark] = [Landmark]()
	@State var tapped: Bool = false
	
	
    var body: some View {
		ZStack{
			MapView(landmarks: landmarks)
				.onAppear{self.getNearByLandMarks()}
				.edgesIgnoringSafeArea(.all)
			VStack() {
				HStack {
					Button(action: { withAnimation{self.showSideMenu = true}
		   } )//{showSideMenu = true}
					{
					Image(systemName: "gear")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 25, height: 25)
					Spacer()
					}
				}
				 
				Image("MyKar Logo-Transparent")
					.resizable()
					.aspectRatio(contentMode: .fit)
				
				Spacer()
			}
				if rideCons.isOrderConfirmed == true {
					NavigationLink(destination: carstatusView()) {
						Text("Tracking MyKar")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 300, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(15.0)
					}
				} else if rideCons.isOrderConfirmed == false {
					
					RideSpringView(tapped: self.tapped){
						// on tap
						self.tapped.toggle()
					}.animation(.spring())
					 .offset(y: calculateOffset())
					.environmentObject(userAuth)
					.environmentObject(rideCons)
					.environmentObject(rideviewmodel)
//					NavigationLink(destination: RideView().environmentObject(userAuth).environmentObject(rideCons).environmentObject(rideviewmodel)) {
//						Text("Get Serviced")
//						.font(.headline)
//						.foregroundColor(.white)
//						.padding()
//						.frame(width: 300, height: 50)
//						.background(Color.mykarpurple)
//						.cornerRadius(15.0)
//					}
				}
			
			SideMenuView(showMenu: $showSideMenu)
		}.navigationBarBackButtonHidden(true)
		.navigationBarTitle("")
		.navigationBarHidden(true)
    }
	
	private func getNearByLandMarks() {
		
		let request = MKLocalSearch.Request()
		request.naturalLanguageQuery = self.search
		
		let search = MKLocalSearch(request: request)
		search.start { (response, error) in
			if let response = response {
				let mapItems = response.mapItems
				self.landmarks = mapItems.map{
					Landmark(placemark: $0.placemark)
				}
			}
		}
	}
	
	func calculateOffset() -> CGFloat{
		if self.landmarks.count > 0 && !self.tapped{
			return screenSize.height - screenSize.height / 6
		}
		else if self.tapped {
			print("This is screen height" , screenSize.height)
			return 0
		} else {
			return screenSize.height
		}
	}
	
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
