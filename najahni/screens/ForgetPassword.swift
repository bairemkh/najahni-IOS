//
//  ForgetPassword.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

struct ForgetPassword: View {
    @State var email = ""
    var body: some View {
        VStack{
            HStack{
                Text("Forgot your password ??")
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(0.0)
                    .frame(width: 300.0, height: 100.0)
                    .font(.system(size: 40))
                Spacer()
                    .frame(width: 100, height:0.0)
            }
            Spacer()
            Image("Logo-Najahni")
                .resizable()
                .frame(width: 300 , height: 300)
                .scaledToFit()
            Spacer()
                .frame(width: 0.0, height:30)
            TextField("Email", text: $email)
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3)
            Spacer()
                .frame(width: 0.0, height:30)
            Text("If you have your password, you have to type it in and finally you receive an email to retrieve it. First you get a 4 digit pin code and then you put it in the form")
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Send Email")
                    .foregroundColor(Color.white)
            }
            .frame(width: 300.0,height: 60.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
            .cornerRadius(25)
        }
        .padding(.all)
        
        
    }
}

struct ForgetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPassword()
    }
}
