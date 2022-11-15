//
//  EditProfileView.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct EditProfileView: View {
    @StateObject var viewModel = EditAccountViewModel()
    let firstname: String
    let lastname: String
    let image: String

    var body: some View {
        NavigationView(){
            VStack{
                WebImage(url: URL(string: image))
                    .resizable()
                    .clipShape(Circle())
                        .shadow(radius: 10)
                    .padding()
                    .frame(width: 150.0, height: 150.0)
                    .aspectRatio(contentMode: .fill)
                Spacer()
                    .frame(width: 0.0, height:30)
                TextField("Name", text: $viewModel.name)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                Spacer()
                    .frame(width: 0.0, height:30)
                TextField("Last name", text: $viewModel.lastName)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)

                Spacer()
                    .frame(width: 0.0, height:30)
                NavigationLink(destination:ChangePasswordView(),label: {
                    Text("Change password ?")
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                                       .multilineTextAlignment(
                                        .leading)
                                       .padding()
                                       
                })
                Button(action: {}){
                    Text("Update Profile")
                        .foregroundColor(.white)
                                   .multilineTextAlignment(
                                    .leading)
                }
                .padding(.all, 10.0)
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
            }
            .padding(.all)
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(firstname: String(), lastname: String(), image: String())
    }
}
