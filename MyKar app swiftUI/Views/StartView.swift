//
//  ContentView.swift
//  MyKar app swiftUI
//
//   Created on 1/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI
import FirebaseAuth



// ColorManager.swift created by Brady Murphy
extension Color {
    static let mykarpurple = Color("MyKarPurple")
	static let offWhite = Color("offWhite")
    // ... add the rest of your colors here
}



struct StartView: View {

	@EnvironmentObject var userAuth: UserAuth


    var body: some View {
		
//		HomeView().environmentObject(self.userAuth).environmentObject(RideViewModel(id: self.userAuth.user.uid))
		NavigationView{
				if !userAuth.isLoggedin {
					LoginChoiceView().environmentObject(self.userAuth)
				}else {
					HomeView().environmentObject(self.userAuth).environmentObject(RideViewModel(id: self.userAuth.user.uid))

				}
			}
		}
	}

	

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		StartView()
    }
}

struct TwoSec_SplashView: View {
	
	@Binding var show: Bool
	var body: some View {
		SplashScreenView()
			.opacity(show ? 1 : 0)
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					withAnimation() {
						self.show = false
					}
				}
			}
	}
}
