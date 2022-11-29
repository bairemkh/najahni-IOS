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
        /*HStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 50,height: 50)
                .foregroundColor(Color("forgroundColor"))
                .overlay(Image(systemName: icon)
                    .foregroundColor(Color("primaryColor")))
            
            Spacer()
            Text(buttonText)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            Spacer()
                
        }
            .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(8.0)
                .shadow(color: .gray, radius: 3)*/
        

        HStack {
            Image(systemName: icon)
                .foregroundColor(Color("primaryColor"))
            Text(buttonText)
                .padding(.leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(.systemGray3))
        }
    
        .padding(.all, 12.0)
        //.padding()
     
        Divider()
        
        
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
