//
//  EditProfileView.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct EditProfileView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var user:User

    var body: some View {
        NavigationView(){
            VStack{
                TextField("Name", text: $user.firstname)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848, opacity: 0.075)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                Spacer()
                    .frame(width: 0.0, height:30)
                TextField("Last name", text: $user.lastname)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848, opacity: 0.075)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)

                Spacer()
                    .frame(width: 0.0, height:30)
                NavigationLink(destination:ChangePasswordView(),label: {
                    Text("Change password ?")
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                                       .multilineTextAlignment(
                                        .leading)
                                       .padding()
                                       
                })
                Spacer()
                Button(action: {UserService.editprofile(user: user)
                }){
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
        }.navigationTitle(Text("Edit Profile"))
            .onAppear{
                viewModel.selected = user.fields.map({ f in
                    return ListData(name: f.rawValue)
                })
            }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        EditProfileView(user: UserFix)
    }
}
