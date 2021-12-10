//
//  ContentView.swift
//  carstatus
//
//  Created by Mark A Mccord on 4/1/21.
//
import Foundation
import SwiftUI
import MapKit
import UserNotifications
import CoreLocation

//class taken from https://www.hackingwithswift.com/100/swiftui/78, used for getting user's location
class LocationFetcher: NSObject, CLLocationManagerDelegate {
	let manager = CLLocationManager()
	@Published var userLocation: CLLocationCoordinate2D?
	
	override init() {
		super.init()
		manager.delegate = self
		manager.requestAlwaysAuthorization()
		manager.requestWhenInUseAuthorization()
		manager.startUpdatingLocation()
	}
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
		userLocation = locations.first?.coordinate
		manager.stopUpdatingLocation()
	}
}

//Used for fitting stuff to screen size.
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

//Placeholder data. We'll need more info about the backend before we can try to take real input data
let tempCarData = "2008 Hyundai Elantra"
let tempCarAddress = "1234 Main Street"
let tempDealershipCords = CLLocationCoordinate2D(latitude: 39.5191, longitude: -119.7883)
var CarCords = CLLocationCoordinate2D(latitude: 39.5296, longitude: -119.8138)
var statusValue = 1
var newStatusFlag = false
var state = 0

var place1 = CarCords
var place2 = CarCords

//generic function to ask for notification and location permissions
func permissions() {
	UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
		if success {
			
		} else if let error = error {
			print(error.localizedDescription)
		}
	}
}

func getCarStatus(){//Placeholder function for getting car data from backend.
		place2 = tempDealershipCords
		//place1 = CarCords
		let newStatus = 2//placeholder, going to need another get function from firebase
		if newStatus != statusValue {
			statusValue = newStatus
			newStatusFlag = true
		}
		else {
			statusValue = newStatus
			newStatusFlag = false
		}
}

func getCarStatusB(){//Placeholder function for getting car data from backend.
		let newStatus = 2//placeholder, going to need another get function from firebase
		if newStatus != statusValue {
			statusValue = newStatus
			newStatusFlag = true
		}
		else {
			statusValue = newStatus
			newStatusFlag = false
		}
}

//Function that converts an int to a car status. Depending on how this is implemented in the backend, may need revision.
func statusString(s: Int)-> String {
	switch s {
	case 1:
		return "Driver is on their way for pickup."
	case 2:
		return "Your car is on its way to the dealership."
	case 3:
		return "Your car is at the dealership."
	case 4:
		return "Driver is on their way for return."
	case 5:
		return "Service complete."
	default:
		return "Your car isn't scheduled for service."
	}
}

//Struct to define the map marker
struct Location: Identifiable {
	let id = UUID()
	var name: String
	var coordinate: CLLocationCoordinate2D
}

struct TrackingView: View {

	let locationFetcher = LocationFetcher()
	@State private var statOutput: String = statusString(s: statusValue)//Status in text form
	@State private var region1 = MKCoordinateRegion(center: place1, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))//Map location with placeholder data
	
	var body: some View {

		if let location = locationFetcher.userLocation {
			print("Your location is \(location)")
			if statusValue == 1 {
				place1 = location
				}
		}
		
		return ZStack {//background and vstack
			Color.black//background color
				.edgesIgnoringSafeArea(.all)
			VStack(/*alignment: .leading*/)//map, car name, car status text, refresh button
				{
				Map1View(region: $region1)
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: screenHeight / 2)
					.onAppear(){
						if state == 1{
							getCarStatus()
							statOutput = statusString(s: statusValue)
							region1 = MKCoordinateRegion(center: place1, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
						}
					}
				Text(tempCarData)//all the text
					.padding(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
					.foregroundColor(Color.mykarpurple)
					//.font(.subheadline)
				Text(statOutput)
					.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
					.foregroundColor(Color.mykarpurple)
					.font(.largeTitle)
				Spacer()
					.frame(height: 100)
				//Text("Current Location: " + tempCarAddress)
				//    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
				//    .foregroundColor(Color("mkpurple"))
				HStack(alignment: .bottom) {
					Button{
						getCarStatus()
						statOutput = statusString(s: statusValue)
						region1 = MKCoordinateRegion(center: place2, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
						if newStatusFlag {
							let content = UNMutableNotificationContent()
							content.title = "Mykar"
							content.subtitle = statusString(s: statusValue)
							content.sound = UNNotificationSound.default
							
							let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
							
							let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
							
							UNUserNotificationCenter.current().add(request)
						}
					} label: {
						Text("Refresh")
							
							.foregroundColor(Color(.white))
							.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
							.font(.title)
							
					}.background(Color.mykarpurple)
					.cornerRadius(15.0)
				}
			}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
		.edgesIgnoringSafeArea(.all)
		}
	}
}


//New map implementation for easier use of routing, taken and adapted from https://medium.com/swlh/swiftui-tutorial-finding-a-route-and-directions-52b973530f8d
struct Map1View: UIViewRepresentable {
	@Binding var region: MKCoordinateRegion
	typealias UIViewType = MKMapView
	
	func makeCoordinator() -> MapViewCoordinator {
		return MapViewCoordinator()
	}
	
	func makeUIView(context: Context) -> MKMapView {
		let mapView = MKMapView()
		mapView.delegate = context.coordinator
		
		let p1 = MKPlacemark(coordinate: place1)
		let p2 = MKPlacemark(coordinate: place2)
		
		let request = MKDirections.Request()
		request.source = MKMapItem(placemark: p1)
		request.destination = MKMapItem(placemark: p2)
		request.transportType = .automobile
		
		let directions = MKDirections(request: request)
		directions.calculate { response, error in
			guard let route = response?.routes.first else {return}
			mapView.addAnnotations([p1, p2])
			mapView.addOverlay(route.polyline)
		}
		
		//region = MKCoordinateRegion(center: place1, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
		mapView.setRegion(region, animated: true)
		return mapView
	}
	func updateUIView(_ uiView: MKMapView, context: Context) {
		uiView.delegate = context.coordinator
		uiView.removeAnnotations(uiView.annotations)
		uiView.removeOverlays(uiView.overlays)
		
		let p1 = MKPlacemark(coordinate: place1)
		let p2 = MKPlacemark(coordinate: place2)
		
		let request = MKDirections.Request()
		request.source = MKMapItem(placemark: p1)
		request.destination = MKMapItem(placemark: p2)
		request.transportType = .automobile
		
		let directions = MKDirections(request: request)
		directions.calculate { response, error in
			guard let route = response?.routes.first else {return}
			uiView.addAnnotations([p1, p2])
			uiView.addOverlay(route.polyline)
		}
		
		//region = MKCoordinateRegion(center: place1, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
		uiView.setRegion(region, animated: true)
	}
	class MapViewCoordinator: NSObject, MKMapViewDelegate {
		func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
			let renderer = MKPolylineRenderer(overlay: overlay)
			renderer.strokeColor = .systemBlue
			renderer.lineWidth = 5
			return renderer
		}
	}
}

struct Map1View_Previews: PreviewProvider {
	static var previews: some View {
		TrackingView()
			.onAppear{permissions()}
	}
}
