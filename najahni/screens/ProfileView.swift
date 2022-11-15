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
    var username = UserDefaults.standard.string(forKey: "token")
    var body: some View {
        NavigationView(){
            VStack(alignment: .center){
                Spacer()
                /*Image("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU")*/
                WebImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbrvOZf5zaHg_9a8upGltfVtObFu_0QH1rcw&usqp=CAU"))
                    .resizable()
                    .clipShape(Circle())
                        .shadow(radius: 10)
                    .padding()
                    .frame(width: 150.0, height: 150.0)
                    .aspectRatio(contentMode: .fill)
                    
                      
                Text(username ?? "username")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Spacer()
                NavigationLink(destination:EditProfileView(),label:{
                    CustomButtonView(icon: "highlighter",buttonText: "Edit profile")
                } )
               
                    
                
                
                Button(action:{
                    print("wish")
                    viewModel.profile()
                },
                       label:{
                    CustomButtonView(icon: "heart.fill",buttonText: "My wishlist")
                })
                Button(action:{},
                       label:{
                    CustomButtonView(icon: "trash.fill",buttonText: "Delete account")
                })
                
                Button(action:{},
                       label:{
                    CustomButtonView(icon: "rectangle.portrait.and.arrow.forward",buttonText: "Logout")
                })
                Spacer()
                
                
                
            }
            .padding(.all)
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
