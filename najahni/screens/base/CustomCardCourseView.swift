//
//  CustomCardCourseView.swift
//  najahni
//
//  Created by najahni on 3/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCardCourseView: View {
    var course : Course
    var progress : Float
    var body: some View {
        HStack{
            WebImage(url: URL(string: URL_BASE_APP + course.image))
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
                Text(course.title)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(Color("TextColor"))
                    .padding(.leading)
                Spacer()
                    .frame(height:0)

              /*  HStack {
                    Text("1h42")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .foregroundColor( Color("secondaryColor"))
                }
                .padding(.leading)*/
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -5.0)
           // Spacer()
            
            ProgressBarView(progress: progress)
            
            Spacer()
                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("CardColor"))
        .cornerRadius(12)
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
        .padding([.top, .leading, .trailing])
    }
}

struct CustomCardCourseView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardCourseView(course: CourseFix,progress: 0)
    }
}
