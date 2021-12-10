//
//  LoginChoice.swift
//  MyKar app swiftUI
//
//   Created on 4/8/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI


struct LoginChoiceView: View {
	
	@State var Show = true
	@EnvironmentObject var userAuth: UserAuth
	
	var body: some View{
		ZStack{
			
			VStack{
				Image("MyKar Logo-Transparent")
					.resizable()
				 .aspectRatio(contentMode: .fit)
				 .frame(width: 350, height: 300)
				Spacer()
				NavigationLink(destination: LoginView().environmentObject(self.userAuth)) {
					Text("Sign in")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 350, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(15.0)
				}
				NavigationLink(destination: LoginView()) {
					Text("Sign in with Google")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 350, height: 50)
						.background(Color.red)
						.cornerRadius(15.0)
					}
				
				NavigationLink(destination: LoginView()) {
					Text("Sign in with Apple")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 350, height: 50)
						.background(Color.blue)
						.cornerRadius(15.0)
					}
				
				HStack {
					Text("Don't have an Account?")
						.foregroundColor(.white)
					NavigationLink(destination: RegistrationView()){
						Text(" Register here")
							.foregroundColor(.blue)
							.underline()
					}
				}
			}
			//TwoSec_SplashView(show: $Show)
			
		}.background(
			Image("LoginChoiceBackgroundV2")
				
				
		)
	}
}

struct LoginChoice_Previews: PreviewProvider {
    static var previews: some View {
        LoginChoiceView()
    }
}
