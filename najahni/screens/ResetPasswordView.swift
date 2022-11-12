//
//  ResetPasswordView.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var email = ""
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    Text("Reset your password")
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
                SecureField("Password", text: $email)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                    .frame(width: 0.0, height:30)
                SecureField("Confirm Password", text: $email)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Change password")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
            }
            .padding(.all)
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
