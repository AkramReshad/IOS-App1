//
//  MapView.swift
//  MyKar app swiftUI
//
//   Created on 3/18/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit




struct MapView: UIViewRepresentable{
	
	let landmarks: [Landmark]
	
	func makeUIView(context: Context) -> MKMapView {
		let map = MKMapView()
		map.showsUserLocation = true
		map.delegate = context.coordinator
		return map
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
		//
		updateAnnotations(from: uiView)
		
	}
	
	private func updateAnnotations(from mapView: MKMapView){
		mapView.removeAnnotations(mapView.annotations)
		let annotations = self.landmarks.map(LandmarkAnnotation.init)
		mapView.addAnnotations(annotations)
	}
	
}








// This is the old MapView in version 1
//import Combine
//import CoreLocation
//
//
//
//struct MapView: View {
//	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//
//	var body: some View {
//		if #available(iOS 14.0, *) {
//				Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
//					.edgesIgnoringSafeArea(.all)
//		} else {
//			Text("Please Update to iOS 14.0")
//		}
//	}
// }
//
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
//
