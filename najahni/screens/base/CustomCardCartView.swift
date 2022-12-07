//
//  CustomCardCartView.swift
//  najahni
//
//  Created by najahni on 6/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCardCartView: View {
    var course : Course
    var body: some View {
        HStack{
            WebImage(url: URL(string: URL_BASE_APP + course.image))
                .resizable()
                .frame(width: 100,height: 100)
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .cornerRadius(8.0)
                .padding(.leading,1)
                .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 8))
                .clipped()
                .clipShape(Rectangle())
          
            VStack(alignment: .leading,spacing: 10.0) {
                Text(course.title)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading)
 

                HStack {
                    Text("\(course.price) TND")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding(4)
                        .foregroundColor( Color.white)
                }
                .background(Color("secondaryColor"))
                .cornerRadius(12)
                .padding(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -5.0)
           // Spacer()

                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct CustomCardCartView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardCartView(course: CourseFix)
    }
}
