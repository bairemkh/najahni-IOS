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
        GroupBox{
            HStack {
                if isHidden
                {
                    SecureField("password", text: $text)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
                        .cornerRadius(20)
                }
                else{
                    TextField("password", text: $text)
                        .padding(.all)
                        .padding(.leading)
                        .padding(.trailing)
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
            .padding(.trailing)

        }.groupBoxStyle(TransparentGroupBox())
            }
}

struct customTextField_Previews: PreviewProvider {
     @State static var text="password"
    static var previews: some View {
        customTextField(text: $text)
    }
}
struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 3)
            
    }
}
