//
//  CustomCardTrainerView.swift
//  najahni
//
//  Created by najahni on 28/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomCardTrainerView: View {
    var course : Course
    var body: some View {
        HStack{
            WebImage(url: URL(string: course.image))
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
                        .padding(.horizontal, 8.0)
                        .background(Color("secondaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(5 )
                        
                        
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, -5.0)
           // Spacer()
            
            Image(systemName:"trash.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            
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
    static var course: Course = Course(id: "", title: "", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CustomCardTrainerView(course: course)
    }
}
