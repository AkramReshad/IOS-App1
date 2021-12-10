//
//  RideSpringView.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct RideSpringView: View {
	
	var tapped: Bool
	var onTap: () -> ()
	let screenSize = UIScreen.main.bounds

	
	var body: some View {
		VStack(alignment: .center, spacing:0){
			ZStack(){
				Text("")
					.frame(width: tapped ? screenSize.width : screenSize.width / 1.1, height: 60)
					.background(tapped ? Color.offWhite : Color.mykarpurple)
					.cornerRadius(tapped ? 0: 20)
					.gesture(TapGesture()
					.onEnded(self.onTap)
					)
				if tapped == false {
					Text("Get Serviced")
						.background(Color.mykarpurple)


				
				} else if tapped == true {

					RoundedRectangle(cornerRadius: 10 )
						.background(Color(red: 220/255, green: 220/255, blue: 220/255))
						.frame(width: 45, height: 5)
						.gesture(TapGesture()
									.onEnded(self.onTap)
						)
				}
			}
			RideView().opacity(tapped ? 1 : 0)//.animation(nil)
		}
		
	}
}

struct RideSpringView_Previews: PreviewProvider {
    static var previews: some View {
		RideSpringView( tapped: false, onTap: {})
    }
}
