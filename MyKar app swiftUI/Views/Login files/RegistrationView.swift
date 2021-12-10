
import SwiftUI

struct RegistrationView: View {
	let cornerradius: CGFloat = 5
	var PasswordMatch = true


	@State var email = ""
	@State var password = ""
	@State var ConfirmPassword = ""
	@State var FirstName = ""
	@State var LastName = ""
	@State var PhoneNumber = ""
	@State var TermsConditions = false
	
	@State var isNavigationBarHidden: Bool = true
	@EnvironmentObject var userAuth: UserAuth
    var body: some View {
		NavigationView{
			ZStack{
				BackgroundGeometryView()
				
			
			VStack {
				Text("Sign Up")
					.font(.largeTitle)
					.foregroundColor(.mykarpurple)
				
				VStack(alignment: .leading) {
					Text("Email:")
						.foregroundColor(.mykarpurple)
					TextField("Email", text: $email)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
						.shadow(radius: 10, x: 7, y:7)
				} .padding([.leading, .trailing, .top])
				HStack(alignment: .center) {
					VStack(alignment: .leading){
					Text("First Name")
						.foregroundColor(.mykarpurple)
					TextField("First Name", text: $FirstName)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
					}
					VStack(alignment: .leading){
					Text("Last Name:")
						.foregroundColor(.mykarpurple)
					TextField("Last Name", text: $LastName)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
					}
				}.padding([.leading, .trailing, .top])
				
				if ( password != ConfirmPassword ) {
					Text("Passwords do not match")
				}
				VStack(alignment: .leading) {
					Text("Password:")
						.foregroundColor(.mykarpurple)
					SecureField("Password:", text: $password)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
				}.padding([.leading, .trailing, .top])
				VStack(alignment: .leading) {
					Text("Confirm Password:")
						.foregroundColor(.mykarpurple)
					SecureField("Password:", text: $ConfirmPassword)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
				}.padding([.leading, .trailing, .top])
				
				VStack(alignment: .leading){
					Text("Phone Number")
						.foregroundColor(.mykarpurple)
					TextField("Phone Number", text: $PhoneNumber)
						.padding()
						.background(Color(red: 240/255, green: 240/255, blue: 240/255))
						.cornerRadius(cornerradius)
				}.padding()
				HStack(){
					CheckBox(checked: $TermsConditions)
					Text("Please agree to our")
						.font(.subheadline)
					Text("Terms and conditions")
						.font(.subheadline)
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				}
				Button(action: {userAuth.SignUp(email: email, password: password, FirstName: FirstName, LastName: LastName, PhoneN: PhoneNumber)}) {
					Text("Create Account")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(width: 355, height: 50)
						.background(Color.mykarpurple)
						.cornerRadius(cornerradius)
				}.padding()
				Spacer()
			}
			}
		.navigationBarHidden(isNavigationBarHidden)
		.onAppear {
			self.isNavigationBarHidden = true
			}
		
		}
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
