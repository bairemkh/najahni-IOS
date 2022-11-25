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
            WebImage(url: URL(string: course.image))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
                .frame(width: 140,height: 140)
                .padding(.leading,-12)
            
            VStack(alignment: .leading,spacing: 15.0) {
                Text(course.title)
                    .font(.system(size: 16, weight: .bold, design: .default))
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
    static var course: Course = Course(id: "", title: "", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "", price: 0, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CustomCardView(course: course)
    }
}
