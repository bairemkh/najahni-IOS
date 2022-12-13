//
//  CustomButtonView.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import SwiftUI

struct CustomButtonView: View {
    var icon = "house.fill"
    var buttonText = "Delete account"
    var body: some View {
       HStack {
            Image(systemName: icon)
            Text(buttonText)
                .padding(.leading)
            Spacer()
            Image(systemName: "chevron.right")
       }
       .padding(.all)
     
        
        
        
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
