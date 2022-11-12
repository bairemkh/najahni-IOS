//
//  ProfileView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Image("user")
                .padding()
                .frame(width: 120.0, height: 120.0)
                .clipShape(Circle())
                    .shadow(radius: 10)
                  
            Text("username")
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            Spacer()
            Button(action:{},
                   label:{
                CustomButtonView(icon: "highlighter",buttonText: "Edit profile")
            })
            
            Button(action:{},
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
