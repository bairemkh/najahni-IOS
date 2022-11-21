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
                .padding(.leading,-12)
            
            VStack(alignment: .leading,spacing: 15.0) {
                Text("UX/UI course")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.black)
                HStack{
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12.0)
                        .frame(width: 25)
                    Text("username")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("1h42")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Text(".")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Text("12 Lessons")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -6.0)
           // Spacer()
            
            Image(systemName:"chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 10)
            
            Spacer()
                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(color: .gray, radius: 2)
        .padding([.top, .leading, .trailing])
    }
}

struct CustomCardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardView()
    }
}
