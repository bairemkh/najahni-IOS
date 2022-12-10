//
//  ProfileStudentView.swift
//  najahni
//
//  Created by bairem mohamed on 9/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileStudentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var onLogOut = false
    @Binding var user:User
    @State var pass = false
    var body: some View {
        //NavigationView{
            VStack {
                ZStack {
                    WebImage(url: URL(string:"\(URL_BASE_APP)\(SessionManager.currentUser?.image ?? "")"))
                        .resizable()
                        .clipShape(Circle())
                        .padding()
                        .frame(width: 150.0, height: 150.0)
                    .aspectRatio(contentMode: .fill)
                    VStack {
                        Spacer()
                            .frame(height: 90)
                        HStack {
                            Spacer()
                                .frame(width: 50)
                            ZStack {
                                Circle()
                                    .frame(width: 35)
                                    .foregroundColor(Color("primaryColor"))
                                Image(systemName: "arrow.down.to.line")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                Spacer()
                    .frame(height: 20)
                Text("\(user.firstname) \(user.lastname)")
                Spacer()
                    .frame(height: 20)
                Text("Email: \(user.email)")
                Divider()
                NavigationLink(destination: EditProfileView(firstname: user.firstname, lastname: user.lastname, image: user.image),isActive: $pass) {
                    CustomButtonView(icon: "pencil",buttonText: "Edit Profile")
                        .onTapGesture {
                            pass = true
                        }
                }
                NavigationLink{
                   SettingsView()
                } label: {
                    CustomButtonView(icon: "gearshape.2.fill",buttonText: "Setting")
                }
                NavigationLink{
                   PrivacyPolicyView()
                } label: {
                    CustomButtonView(icon: "shield.lefthalf.filled",buttonText: "Privacy Policy")
                }
                NavigationLink(destination: LoginView(), isActive: $onLogOut){
                    CustomButtonView(icon: "rectangle.portrait.and.arrow.forward",buttonText: "Logout")
                        .onTapGesture {
                            print(UserDefaults.standard.object(forKey: "token")!)
                            UserDefaults.standard.removeObject(forKey: "token");                     UserDefaults.standard.removeObject(forKey: "role")
                            
                            onLogOut = true
                            print(UserDefaults.standard.object(forKey: "token"))
                        }
                        .foregroundColor(.red)
                }
                
                
            }
        //}
        
    }
}

struct ProfileStudentView_Previews: PreviewProvider {
    @State static var user = UserFix
    static var previews: some View {
        ProfileStudentView(user: $user)
    }
}
