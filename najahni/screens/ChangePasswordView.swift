//
//  ChangePasswordView.swift
//  najahni
//
//  Created by bairem mohamed on 14/11/2022.
//

import SwiftUI

struct ChangePasswordView: View {
    @StateObject var viewModel = ResetPasswordViewModel()
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    Text("Change your password")
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                        .multilineTextAlignment(.leading)
                        .padding(0.0)
                        .frame(width: 300.0, height: 100.0)
                        .font(.system(size: 40))
                    Spacer()
                        .frame(width: 100, height:0.0)
                }
                Spacer()
                    .frame(width: 0.0, height:50)
                SecureField("Password", text: $viewModel.oldPassword)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                    .frame(width: 0.0, height:30)
                SecureField(LocalizedStringKey("New_password"), text: $viewModel.newPassword)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                    .frame(width: 0.0, height:30)
                SecureField(LocalizedStringKey("Confirm_Password"), text: $viewModel.confirmPassword)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                    .frame(width: 0.0, height:30)
                Button(action: {
                    viewModel.editpassword(password: viewModel.oldPassword, newpassword: viewModel.newPassword)
                }) {
                    Text(LocalizedStringKey("Change password"))
                        .foregroundColor(Color.white)
                }
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                Spacer()
            }
            .padding(.all)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
