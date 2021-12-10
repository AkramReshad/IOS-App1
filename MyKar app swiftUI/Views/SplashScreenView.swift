//
//  SplashScreenView.swift
//  MyKar app swiftUI
//
//   Created on 3/18/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct SplashScreenView: View {
	let mykarpurple = Color("MyKarPurple")
	
    var body: some View {
		
		HStack {
			Spacer()
			VStack {
				Spacer()
					Image("MyKar Logo-Transparent")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 350, height: 250)
						   //.clipShape(Circle())
						   //.overlay(Circle().stroke(Color.white, lineWidth: 4))
						.shadow(radius: 10)
						.padding(.bottom, 50)
				Spacer()

			}
			Spacer()
		}.background(Color.black)
		.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
