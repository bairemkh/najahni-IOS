//
//  WelcomeView.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Image("Logo-Najahni")
                .resizable()
                .padding(.bottom, 0.0)
                .frame(width: 150 , height: 250)
                .scaledToFit()
            
            
            Spacer()
                .frame(width: 0.0, height: 100.0)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*/Text("Sign in")
                        .foregroundColor(Color.white)/*@END_MENU_TOKEN@*/
                        
                }
                .padding(.top, 10.0)
                .frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                
            Spacer()
                .frame(width: 0.0, height: 24.0)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*/Text("Sign up")
                        .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.848))/*@END_MENU_TOKEN@*/
                }
                .frame(width: 300.0,height: 60.0)
                .padding(.top, 1.0)
                
                .border(/*@START_MENU_TOKEN@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/, width: 1)
                .cornerRadius(25)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            
            
            
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
