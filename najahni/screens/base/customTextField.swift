//
//  customTextField.swift
//  najahni
//
//  Created by bairem mohamed on 25/11/2022.
//

import SwiftUI

struct customTextField: View {
    @Binding var text : String
    @State var isHidden = true
    @State private var icon = "eye.slash.fill"
    var body: some View {
        HStack {
            if isHidden
            {
                SecureField("password", text: $text)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
            }
            else{
                TextField("password", text: $text)
                    .padding(.all)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
            }
            Image(systemName:icon).onTapGesture {
                isHidden = !isHidden
                if isHidden{
                    icon = "eye.slash.fill"
                }else{
                    icon = "eye.fill"
                }
            }
        }
    }
}

struct customTextField_Previews: PreviewProvider {
     @State static var text="password"
    static var previews: some View {
        customTextField(text: $text)
    }
}
