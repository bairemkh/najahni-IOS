//
//  CustomCardView.swift
//  najahni
//
//  Created by najahni on 21/11/2022.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        HStack{
            Image("user")
                .resizable()
                .scaledToFit()
                //.aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
                .frame(width: 140,height: 120)
                //.padding(.all,0)
            
            VStack(alignment: .leading,spacing: 4.0) {
                Text("title")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.black)
                HStack{
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12.0)
                        .frame(width: 25)
                    Text("type")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("$" + String.init(format: "%0.2f","price"))
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding(.top, 8)
                }
            }
            .padding(.trailing)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(color: .gray, radius: 2)
        .padding(.horizontal)
    }
}

struct CustomCardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardView()
    }
}
