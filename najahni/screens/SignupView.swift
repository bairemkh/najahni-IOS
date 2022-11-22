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
    @State private var selectedItems : [ListData] = []
    @State private var canPass = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
                VStack(spacing: 20){
                    HStack {
                        Text("Let's Create A new Account")
                            .fontWeight(.black)
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                            .multilineTextAlignment(.leading)
                            .padding(0.0)
                            .frame(width: 300.0, height: 100.0)
                        .font(.system(size: 40))
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
                    
                    TextField("Email", text: $signUpVM.email)
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
                    NavigationLink(destination:  CustomPicker2View(items: signUpVM.fieldsList,selected: $signUpVM.selectedFields)){
                        HStack {
                            Text("Select")
                                .foregroundColor(Color("primaryColor"))
                            Spacer()
                                .frame(width: 50,height: 0)
                            Text(signUpVM.getListString())
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    NavigationLink(destination: LoginView(),isActive: $signUpVM.isSignedUp) {
                        Button(action: {signUpVM.signup(firstname: signUpVM.name, lastname: signUpVM.lastName, email: signUpVM.email, password: signUpVM.password, verifPass: signUpVM.verifPassword, role: Role(rawValue: signUpVM.roleList[signUpVM.role])!, fields: signUpVM.selectedFields.map({ listData in
                            return Fields(rawValue: listData.name)!
                        }), image: "", isVerified: false){ error in
                            print( error )
                            signUpVM.errorMsg = error
                            signUpVM.isSignedUp = false
                            signUpVM.isError = true
                        }
                            if signUpVM.isSignedUp{
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } ){
                            Text("Create")
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 300.0,height: 60.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(25)
                        .alert(isPresented: $signUpVM.isError) {
                            Alert(title: Text(signUpVM.errorMsg),dismissButton: .default(Text("Okay")) )
                    }
                    }
                    Text("Already have an account ?")
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    //CustomPicker2View(items: signUpVM.fieldsList, selected: signUpVM.selectedFields)
                }
                .padding([.top, .leading, .trailing])
            
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

