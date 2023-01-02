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
    @State private var showSheet = false
    @StateObject var viewModel = LoginViewModel()
    @State var images : UIImage = UIImage.init(named:"") ?? UIImage()
    var body: some View {
        //NavigationView{
            VStack {
                HStack{
                    Text("Profile")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .padding(.horizontal)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding([.leading, .bottom, .trailing])
                ScrollView {
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
                                }.onTapGesture{
                                    print("pick")
                                    showSheet = true
                                    
                                }
                                .sheet(isPresented: $showSheet,onDismiss: {
                                    viewModel.editPhoto(image: images){
                                        
                                            (success) in
                                            if success {
                                                print("jawha nice")
                                            }else {
                                                print("not logged in")
                                                
                                            }
                                        
                                    }
                                }) {
                                    // Pick an image from the photo library:
                                    ImagePicker(sourceType: .photoLibrary, selectedImage: $images)}
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    Text("\(user.firstname) \(user.lastname)")
                        .font(.system(size: 14, weight: .bold, design: .default))
                    Spacer()
                        .frame(height: 20)
                    Text("Email: \(user.email)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                    Divider()
                    Group{
                        NavigationLink(destination: EditProfileView(firstname: user.firstname, lastname: user.lastname, image: user.image),isActive: $pass) {
                            CustomButtonView(icon: "pencil",buttonText: "Edit_profile")
                                .onTapGesture {
                                    pass = true
                                }
                        }.foregroundColor(Color("primaryColor"))
                        NavigationLink{
                           SettingsView()
                        } label: {
                            CustomButtonView(icon: "gearshape.2.fill",buttonText: "Settings")
                        }.foregroundColor(Color("primaryColor"))
                        NavigationLink{
                           PrivacyPolicyView()
                        } label: {
                            CustomButtonView(icon: "shield.lefthalf.filled",buttonText: "Privacy Policy")
                        }.foregroundColor(Color("primaryColor"))
                        if SessionManager.currentUser?.role == Role.Student {
                            NavigationLink{
                               VerifyTrainerView()
                            } label: {
                                CustomButtonView(icon: "briefcase.fill",buttonText: "To_Trainer").foregroundColor(Color("secondaryColor"))
                        }.foregroundColor(Color("primaryColor"))
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
