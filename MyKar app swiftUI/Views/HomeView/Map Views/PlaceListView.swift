//
//  PlaceListView.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
	
	let landmarks: [Landmark]
	var onTap: () -> ()
	let screenSize = UIScreen.main.bounds
	
    var body: some View {
		VStack(alignment: .leading){
			HStack{
				EmptyView()
			}.frame(width: screenSize.width, height: 60)
			 .background(Color.mykarpurple)
			.gesture(TapGesture()
						.onEnded(self.onTap)
			)
			List{
				
				ForEach(self.landmarks, id: \.id) { landmark in
					
					VStack(alignment: .leading) {
						Text(landmark.name)
							.fontWeight(.bold)
						
						Text(landmark.title)
					}
				}
			}.animation(nil)
		} .cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
		PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
