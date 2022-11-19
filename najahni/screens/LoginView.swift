//
//  LoginView.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State  var isLogin :Bool = false
    @State  var showAlert :Bool = false
    @State  var errorMsg :String = ""
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center)
            {
                Image("Logo-Najahni")
                    .resizable()
                    .padding(.bottom, 0.0)
                    .frame(width: 150 , height: 150)
                    .scaledToFit()
                
                Text("Login")
                Spacer()
                    .frame(height: 15.0)
                TextField("email", text: $viewModel.email)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                Spacer()
                    .frame(height: 15.0)
                SecureField("password", text: $viewModel.password)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
                
                NavigationLink(destination:ForgetPassword(),label: {
                    Text("forget password ?")
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                                       .multilineTextAlignment(
                                        .leading)
                                       .padding()
                                       
                })
            
                
                Spacer()
                    .frame(width: 0.0, height: 25.0)
                NavigationLink(destination:HostingTabBarView(),isActive: $isLogin){
                    Button(action: {
                        viewModel.login(email: viewModel.email, password: viewModel.password,completed: {(success , code) in
                            print(code)
                            if success {
                                print("logged in")
                                isLogin = true
                            } else {
                                print("not logged in")
                                isLogin = false
                                showAlert = true
                                if(400 ... 499).contains(code){
                                    errorMsg = "Email or password are incorrect"
                                }
                                if(500 ... 599).contains(code){
                                    errorMsg = "Connectivity error, please check !"
                                }
                                
                            }
                            
                        })
                    }) {
                      Text("Sign in")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300.0,height: 60.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }
                    
                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text ("Error") , message: Text(errorMsg), dismissButton: .default(Text("close")))
                }
             
                HStack(spacing: -10.0){
                    Text("Don't have an account ?")
                    NavigationLink(destination:SignupView(),label: {
                        Text("create one")
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                                       .multilineTextAlignment(.leading)
                                       .padding()
                    })
                    
                }
                
                
                    
            }
            .padding(.all)
        }
        .navigationBarHidden(true)
        
        
       
             
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
