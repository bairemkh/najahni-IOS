//
//  SignupView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct SignupView: View {
    @StateObject var signUpVM = SignupViewModel()
    @State private var sexType = 0
    var body: some View {
        NavigationView{
            VStack(spacing: 25){
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
                HStack {
                    TextField("Name", text: $signUpVM.name)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                    TextField("Last name", text: $signUpVM.lastName)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 3)
                }
                
                TextField("Email", text: $signUpVM.lastName)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                SecureField("Password", text: $signUpVM.password)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                SecureField("Confirm your password", text: $signUpVM.verifPassword)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                Picker("What's your gender ?", selection: $signUpVM.sexe)
                {
                    ForEach(0..<signUpVM.sexeList.count)
                        {
                             Text(self.signUpVM.sexeList[$0])
                        }
                    
                }
                .pickerStyle(.segmented)
                Picker("What's your gender ?", selection: $signUpVM.role)
                {
                    // Picker's items
                    ForEach(0..<signUpVM.roleList.count)
                        {
                            Text(self.signUpVM.roleList[$0])
                        }
                    
                }
                .pickerStyle(.segmented)
                .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
                Picker("test", selection: $signUpVM.fields)
                {
                    // Picker's items
                    ForEach(0..<signUpVM.fields.count)
                        {
                            Text(self.signUpVM.fields[$0].rawValue)
                        }
                    
                }
                .pickerStyle(.menu)
                .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Next")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                
            }
            .padding([.top, .leading, .trailing])
            
            
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
