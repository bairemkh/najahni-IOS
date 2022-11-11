//
//  SignupView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct SignupView: View {
    @State var email=""
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Text("Let's Create A new Account")
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                        .multilineTextAlignment(.leading)
                        .padding(0.0)
                        .frame(width: 300.0, height: 100.0)
                    .font(.system(size: 40))
                    Spacer()
                        .frame(width: 50,height: 00)
                }
                Spacer()
                    .frame(width: 0,height: 10)
                Image("Logo-Najahni")
                    .resizable()
                    .padding(.bottom, 0.0)
                    .frame(width: 250 , height: 250)
                    .scaledToFit()
                Spacer()
                TextField("email", text: $email)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
            }
            
            
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
