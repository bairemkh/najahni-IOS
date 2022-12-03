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
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(8.0)
                .frame(width: 140,height: 140)
                .padding(.leading,-12)
                .clipped()
                .clipShape(Rectangle())
            
            VStack(alignment: .leading,spacing: 15.0) {
                Text(course.title)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.black)
                HStack{
                    WebImage(url: URL(string: URL_BASE_APP + course.idowner!.image))
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12.0)
                        .frame(width: 22)
                    Text(course.idowner!.firstname)
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
        .cornerRadius(8.0)
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
        .padding([.top, .leading, .trailing])
    }
}

struct CustomCardView_Previews: PreviewProvider {
    
    static var course: Course = Course(id: "", title: "Learn kotlin", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "https://repository-images.githubusercontent.com/3432266/7e79bf80-7aa6-11eb-9cbd-d7bda7eaf1aa", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CustomCardView(course: course)
    }
}
