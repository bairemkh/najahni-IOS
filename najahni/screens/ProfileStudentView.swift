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
    @Binding var user:User
    @State var pass = false
    var body: some View {
        VStack {
            ZStack {
                WebImage(url: URL(string: user.image))
                    .resizable()
                    .clipShape(Circle())
                    .padding()
                    .frame(width: 150.0, height: 150.0)
                .aspectRatio(contentMode: .fill)
                VStack {
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        ZStack {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color("primaryColor"))
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 25,height: 24)
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
            NavigationLink(destination: EditProfileView(firstname: "", lastname: "", image: ""),isActive: $pass) {
                CustomButtonView(icon: "pencil",buttonText: "Edit Profile")
                    .onTapGesture {
                        pass = true
                    }
            }
            NavigationLink{
                HomeView()
            } label: {
                CustomButtonView(icon: "pencil.line",buttonText: "Edit profile")
            }
                
            
        }
        
    }
}

struct ProfileStudentView_Previews: PreviewProvider {
    @State static var user = UserFix
    static var previews: some View {
        ProfileStudentView(user: $user)
    }
}
