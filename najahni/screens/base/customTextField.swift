//
//  customTextField.swift
//  najahni
//
//  Created by bairem mohamed on 25/11/2022.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text : String
    @State var isHidden = true
    @State private var icon = "eye.slash.fill"
    var body: some View {
        GroupBox {
            HStack {
                 if isHidden
                 {
                     SecureField("password", text: $text)
                         .padding(.all)
                 }
                 else{
                     TextField("password", text: $text)
                         .padding(.all)
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
        .groupBoxStyle(TransparentGroupBox())
        .shadow(radius: 3)
        
           /* HStack {
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
            }*/
        
    }
}

struct customTextField_Previews: PreviewProvider {
     @State static var text="password"
    static var previews: some View {
        CustomTextField(text: $text)
    }
}
struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(.leading)
            .padding(.trailing)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}
