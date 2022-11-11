//
//  ProfileView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.fill")
                .frame(width: 120.0, height: 120.0)
                .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.red, lineWidth: 5))
            Text("username")
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
