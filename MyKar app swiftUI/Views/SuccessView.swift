//
//  SuccessView.swift
//  MyKar app swiftUI
//
//   Created on 1/31/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
		HStack{
			Spacer()
			VStack{
				Spacer()
				Text("Success!")        .transition(AnyTransition.slide)
					.animation(.default)
					.font(.largeTitle)	.foregroundColor(Color.mykarpurple)
				Spacer()
				
				
			
			}
			Spacer()
		}.background(Color.black .edgesIgnoringSafeArea(.all))
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
