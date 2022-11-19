//
//  VerificationView.swift
//  najahni
//
//  Created by hamabairem on 8/11/2022.
//

import SwiftUI

struct VerificationView: View {
    @StateObject private var digitManager = TextBindingManager(limit: 1);
    @State var id: String
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                Text("Type the code To get your Password")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                    .multilineTextAlignment(.leading)
                    .padding(0.0)
                    .frame(width: 303.0, height: 100.0)
                    .font(.system(size: 30))
                    Spacer()
                }
                Spacer()
                Image("Logo-Najahni")
                    .resizable()
                    .frame(width: 200 , height: 200)
                    .scaledToFit()
                Spacer()
                HStack(spacing: 20){
                    TextField("0",text:$digitManager.digit1)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3,x: 1,y: 2)
                        .keyboardType(.numberPad)
                    TextField("0",text:$digitManager.digit2)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3,x: 1,y: 2)
                        .keyboardType(.numberPad)
                    TextField("0",text:$digitManager.digit3)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3,x: 1,y: 2)
                        .keyboardType(.numberPad)
                    TextField("0",text:$digitManager.digit4)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3,x: 1,y: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.all)
                HStack{
                    Text("Resend another verification code")
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                                   .multilineTextAlignment(.leading)
                                   .padding()
                                   .onTapGesture {
                                   }
                    Spacer()
                    
                }
                Spacer()
                Button(action: {
                   print("reset")
                    print(digitManager.getDigits())
                    print(id)
                }) {
                    Text("Verify Account")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct VerificationView_Previews: PreviewProvider {
    static var sampleData = "500"
    static var previews: some View {
        VerificationView(id: sampleData)
    }
}
