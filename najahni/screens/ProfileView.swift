//
//  ProfileView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct ProfileView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var image : String = ""
    @State private var onLogOut = false
    
    @State var images : UIImage = UIImage.init(named:"") ?? UIImage()
    @State private var showSheet = false
    @Environment(\.presentationMode) var presentationMode

    var username = UserDefaults.standard.string(forKey: "token")
    var body: some View {
        //NavigationView(){
            VStack(alignment: .center){
                ScrollView(.vertical){
                    Spacer()
                    /*Image("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU")*/
                    WebImage(url: URL(string: image))
                        .resizable()
                        .clipShape(Circle())
                            .shadow(radius: 10)
                        .padding()
                        .frame(width: 120.0, height: 120.0)
                        .aspectRatio(contentMode: .fill)
                    
                        
                    Text(firstname  + " " + lastname)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Spacer()
                        .frame(height: 15.0)
                    Text("Change photo")
                            .font(.headline)
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                                print("click to pick")
                                showSheet = true
                            }
                            .padding(.horizontal, 20)
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
                    Divider()
                    NavigationLink{
                        EditProfileView(firstname: firstname, lastname: lastname, image: image)
                            .padding(0.0)
                    } label: {
                        CustomButtonView(icon: "pencil.fill",buttonText: "Edit profile")
                    }
                    NavigationLink{
                       SettingsView()
                    } label: {
                        CustomButtonView(icon: "person.fill",buttonText: "Setting")
                    }
                    NavigationLink(destination: LoginView(), isActive: $onLogOut){
                        CustomButtonView(icon: "trash.fill",buttonText: "Delete account").onTapGesture {
                            UserService.deleteAccount { msg, logout in
                                print(msg)
                                SessionManager.logOut()
                                onLogOut = !logout
                            }
                        }
                    }
                    NavigationLink(destination: LoginView(), isActive: $onLogOut){
                        CustomButtonView(icon: "rectangle.portrait.and.arrow.forward",buttonText: "Logout")
                            .onTapGesture {
                                print(UserDefaults.standard.object(forKey: "token")!)
                                UserDefaults.standard.removeObject(forKey: "token");                     UserDefaults.standard.removeObject(forKey: "role")
                                
                                onLogOut = true
                                print(UserDefaults.standard.object(forKey: "token"))
                            }
                    }
                    
                           
                    //Spacer()
                   /* NavigationLink(destination:EditProfileView(firstname: firstname, lastname: lastname, image: image),label:{
                        CustomButtonView(icon: "highlighter",buttonText: "Edit profile")
                    } )
                   
                        
                    
                    
                    Button(action:{
                        print("wish")
                        //viewModel.profile()
                    },
                           label:{
                        CustomButtonView(icon: "heart.fill",buttonText: "My wishlist")
                    })
                    
                    NavigationLink(destination: LoginView(), isActive: $onLogOut){
                        CustomButtonView(icon: "trash.fill",buttonText: "Delete account").onTapGesture {
                            UserService.deleteAccount { msg, logout in
                                print(msg)
                                SessionManager.logOut()
                                onLogOut = !logout
                            }
                        }
                    }
                    
                    NavigationLink(destination: LoginView(), isActive: $onLogOut){
                        CustomButtonView(icon: "rectangle.portrait.and.arrow.forward",buttonText: "Logout")
                            .onTapGesture {
                                print(UserDefaults.standard.object(forKey: "token")!)
                                UserDefaults.standard.removeObject(forKey: "token");                     UserDefaults.standard.removeObject(forKey: "role")
                                
                                onLogOut = true
                                print(UserDefaults.standard.object(forKey: "token"))
                            }
                    }*/
                    
                   //Spacer()
                }
                .padding(.horizontal)
                
                
                
            }
            .navigationTitle(
                Text("Profile")
            )
            .navigationBarTitleDisplayMode(.inline)
            //.padding(.all)
        //}
        .onAppear{
         print("profile view")
            viewModel.profile(completed: {
                (success,result) in
                if success {
                    let user = result
                    print(user!.firstname)
                    firstname = user!.firstname
                    lastname = user!.lastname
                    image = user!.image
                }else {
                    print("not logged in")
                    
                }
            })
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
