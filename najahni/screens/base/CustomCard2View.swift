//
//  CustomCard2View.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCard2View: View {
    var course : Course
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
                   WebImage(url: URL(string: URL_BASE_APP + course.image))
                       .resizable()
                       .frame(width: 200,height: 200)
                       .scaledToFit()
                       .aspectRatio(contentMode: .fill)
                       
            Text(course.title)
                .font(.system(size: 12, weight: .bold, design: .default))
                .padding(.horizontal)
                .foregroundColor(Color("TextColor"))
            HStack{
                Spacer()
                    .frame(width: 17.0)
                WebImage(url: URL(string: URL_BASE_APP + course.idowner!.image))
                .resizable()
                .clipShape(Circle())
                .frame(width: 25,height:25)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12.0)
                
                Text(course.idowner!.firstname + " " + course.idowner!.lastname)
                
                    .font(.system(size: 10, weight: .bold, design: .default))
                    .foregroundColor(Color("TextColor"))
            }
            HStack{
                Spacer().frame(width: 20)
                HStack {
                        Text((course.isPaid) ? "\(course.price) TND" : "Free")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .padding(5)
                            .foregroundColor( Color.white)
                }
                          .background(Color("secondaryColor"))
                          .cornerRadius(12)
                Spacer().frame(width: 65)
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.yellow)
                    Text("\(course.rating,specifier: "%.1f")")
                        .font(.system(size: 11, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                }
                
            }
            .padding([.bottom])
               }

        .background(Color("CardColor"))
               .clipShape(RoundedRectangle(cornerRadius: 24.0))
               .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
               
    }
}

struct CustomCard2View_Previews: PreviewProvider {
    static var previews: some View {
        CustomCard2View(course : CourseFix)
    }
}
