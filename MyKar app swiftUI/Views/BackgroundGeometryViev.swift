//
//  BackgroundGeometryViev.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/6/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI


struct BackgroundGeometryView: View {
	
	let screenSize = UIScreen.main.bounds
	//let screenWidth = screenSize.width
	//let screenHeight = screenSize.height
    var body: some View {
		VStack {
			Spacer()
			Image("Background Geometry")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: screenSize.width)
		}.ignoresSafeArea()
			
			}
}

struct BackgroundGeometryViev_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGeometryView()
    }
}
