//
//  SideMenu.swift
//  MyKar app swiftUI
//
//   Created on 4/8/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI
struct SideMenuView: View {
	
	@Binding var showMenu: Bool
	@EnvironmentObject var userauth: UserAuth
	@EnvironmentObject var cars: CarViewModel
	

	
	var body: some View{
		
		let drag = DragGesture()
			.onEnded {
				if $0.translation.width < -100 {
						withAnimation {
							self.showMenu = false
					}
				}
			}

			GeometryReader { geometry in
					if showMenu {
						MenuView(Name: userauth.user.FirstName ?? "First Name")
							.frame(width: geometry.size.width/1.5)
								.transition(.move(edge: .leading))
					}
			}.gesture(drag)
			

		}
	}


struct MenuView: View {

	let screenSize = UIScreen.main.bounds
	let leadpadding: CGFloat = 25
	@State var Name: String
	var body: some View {
		VStack(alignment: .leading, spacing: 0){
			VStack(alignment: .leading){
				HStack(alignment: .top){
					Image("no-avatar")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.clipShape(Circle())
						.padding([.top,.leading], leadpadding)
						.frame(width:screenSize.width/5)
				Text("Hey, \(Name)")
						.font(.title)
						.foregroundColor(.offWhite)
					.padding([.top,.leading], leadpadding)

				}
				Divider().background(Color.offWhite)
				HStack{
					Text("Messages")
						.font(.title2)
						.foregroundColor(.offWhite)
						.padding([.top, .leading, .bottom], leadpadding)
					Spacer()
					Text(">")
						.font(.title)
						.foregroundColor(.offWhite)
						.padding(.trailing)
				}
				Divider().background(Color.offWhite)
				Spacer()
			}.padding(.top)
			 .frame(maxWidth: .infinity, maxHeight: screenSize.height/2.4)
			 .background(Color.mykarpurple)
			 .shadow(radius: 10, x: 7, y:7)
			 .cornerRadius(10)
			 .edgesIgnoringSafeArea(.all)
			Spacer()
		}.frame(maxWidth: .infinity, maxHeight: .infinity)
		 .background(Color.offWhite)
		 .edgesIgnoringSafeArea(.all)
	}
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
		SideMenuView(showMenu: .constant(true))
    }
}
