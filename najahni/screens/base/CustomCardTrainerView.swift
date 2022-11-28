//
//  CustomCardTrainerView.swift
//  najahni
//
//  Created by najahni on 28/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCardTrainerView: View {
    var body: some View {
        HStack{
            WebImage(url: URL(string: "https://static.skillshare.com/uploads/video/thumbnails/834794770ff679500bdc8863cabbb983/original"))
                .resizable()
                .frame(width: 120,height: 140)
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .cornerRadius(8.0)
                .padding(.leading,1)
                .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 8))
                .clipped()
                .clipShape(Rectangle())
          
            VStack(alignment: .leading,spacing: 15.0) {
                Text("course.title")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading)
                HStack{
                    
                    Text("42")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(Color("primaryColor"))
                        .padding(.leading)
                    Text("TND")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor(Color("primaryColor"))
                }
                HStack {
                    Text("1h42")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .overlay (
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.green,lineWidth: 1)
                        )
                        .padding(.leading)
                        
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -5.0)
           // Spacer()
            
            Image(systemName:"chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 10)
            
            Spacer()
                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
        .padding([.top, .leading, .trailing])
    }
}

struct CustomCardTrainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardTrainerView()
    }
}
