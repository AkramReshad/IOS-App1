//
//  LoginView.swift
//  MyKar app swiftUI
//
//   Created on 3/18/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import Combine
import SwiftUI
import FirebaseAuth

struct LoginView: View {

	@State var email = ""
	@State var password = ""
	@EnvironmentObject var userAuth: UserAuth
	let screenSize = UIScreen.main.bounds
	
	var body: some View {
		//Used for fitting stuff to screen size.

		
		ZStack {
			BackgroundGeometryView()
			VStack() {
				
				Image("MyKar Logo-Transparent")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: screenSize.width , height: screenSize.height * 0.3)



				Text("Welcome Back")
					.font(.largeTitle)
					.foregroundColor(Color.black)
				//	.padding([.top, .bottom], 40)
				
				
				VStack(alignment: .center, spacing: CGFloat(15)) {
					if(userAuth.FailedLogin == true){
						Text("Email or Password is not Valid")
							.font(.subheadline)
							.foregroundColor(.black)
						}
					TextField("Email", text: $email)
						.padding()
						.background(Color.mykarpurple)
						.foregroundColor(Color.white)
						.accentColor(Color.white)
						.cornerRadius(10.0)
						.shadow(radius: 10, x: 7, y:7)
					
					SecureField("Password", text: $password)
						.padding()
						.background(Color.mykarpurple)
						.foregroundColor(Color.white)
						.cornerRadius(10.0)
						.shadow(radius: 10, x: 7, y:7)
					
				}.padding([.leading, .trailing], 27.5)
				//Spacer()
				
				HStack {
					NavigationLink( destination: SuccessView()){
						Text("Forgot Password?")
						.underline()
						.padding(.leading, 30)
					Spacer()
					}
				}

				Button(action: {userAuth.login(email: email, password: password)}) {
						Text("Sign in")
							.font(.headline)
							.foregroundColor(.white)
							.padding()
							.frame(width: 150, height: 50)
							.background(Color.mykarpurple)
							.cornerRadius(30)
				}.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 7,y: 7)
				
				Spacer()
				
			}
		}
	}
	
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
