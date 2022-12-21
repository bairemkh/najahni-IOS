//
//  ForgetPassword.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

struct ForgetPassword: View {
    @StateObject var viewModel = ForgetPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text(LocalizedStringKey("Go_back"))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                        .multilineTextAlignment(.leading)
                        .frame(width: 300.0, height: 100.0)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                        .frame(width: 280, height:0.0)
                }
                Spacer()
                HStack{
                    Text(LocalizedStringKey("Forgot_your_password_??"))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                        .multilineTextAlignment(.leading)
                        .padding(0.0)
                        .frame(width: 300.0, height: 100.0)
                        .font(.system(size: 40))
                    Spacer()
                        .frame(width: 100, height:0.0)
                }
                Image("Logo-Najahni")
                    .resizable()
                    .frame(width: 200 , height: 200)
                    .scaledToFit()
                Spacer()
                    .frame(width: 0.0, height:30)
                TextField("Email", text: $viewModel.email)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 2)
                Spacer()
                    .frame(width: 0.0, height:30)
                Text(LocalizedStringKey("Forgot_description"))
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                Spacer()
                
                NavigationLink(destination:VerificationView(id: viewModel.idUser, email: viewModel.email), isActive: $viewModel.canPass){
                    Button(action: {viewModel.onClickForget(email: viewModel.email) { errorMsg  in
                        print("\(errorMsg) \(viewModel.onError)")
                        viewModel.onError = true
                        viewModel.msgError = errorMsg
                    }}) {
                        Text(LocalizedStringKey("Send_Email"))
                            .foregroundColor(Color.white)
                            .frame(width: 300.0,height: 60.0)
                            .cornerRadius(25)
                    }
                    .frame(width: 300.0,height: 60.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
                }
                .alert(isPresented: $viewModel.onError) {
                    Alert(title: Text("Error"), message: Text(viewModel.msgError), dismissButton:.default(Text("close")))
                }
            }
            .padding(.all)
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct ForgetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPassword()
    }
}
