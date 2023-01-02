//
//  CustomCardView.swift
//  najahni
//
//  Created by najahni on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCardView: View {
    var course : Course
    var body: some View {
        HStack{
            WebImage(url: URL(string: URL_BASE_APP + course.image))
                .resizable()
                .frame(width: 140,height: 140)
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
                
                .padding(.leading,-12)
                .clipped()
                .clipShape(Rectangle())
            Spacer()
                .frame(width: 25.0)
            
            VStack(alignment: .leading,spacing: 15.0) {
                Text(course.title)
                    .lineLimit(1)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(Color("TextColor"))

          
                    HStack {
                        Text((course.isPaid) ? "\(course.price) TND" : "Free")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .padding(5)
                            .foregroundColor( Color.white)
                        
                    }
                    .background(Color("secondaryColor"))
                    .cornerRadius(12)
                    
                        
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.yellow)
                    Text("\(course.rating,specifier: "%.1f")")
                        .font(.system(size: 11, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                    Text("|")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                    Text("12 Lessons")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -5.0)
           // Spacer()
            
            Image(systemName:"chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 10)
                .foregroundColor(Color("TextColor"))
            Spacer()
                
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("CardColor"))
        .cornerRadius(8.0)
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
        .padding([.top, .leading, .trailing])
    }
}

struct CustomCardView_Previews: PreviewProvider {
    
    static var course: Course = Course(id: "", title: "Learn kotlin", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "/img/pexels-supreet-7559057.jpg1668674151911.jpg", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CustomCardView(course: course)
    }
}
