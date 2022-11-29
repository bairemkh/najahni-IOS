//
//  CourseDetailView.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    @StateObject var viewModel = DetailPageViewModel()
    var course : Course
    var body: some View {
        VStack {
            ScrollView{
                WebImage(url:URL(string: course.image))
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 200,height: 200)
                HStack {
                    Text(course.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    Spacer()
                }
                HStack{
                    WebImage(url:URL(string: course.idowner!.image))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50,height: 50)
                    Text(course.idowner!.firstname + " " + course.idowner!.lastname)
                    Spacer()
                }
                Spacer()
                    .frame(width: 0,height: 30)
                HStack {
                    Text("Description")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 23))
                    Spacer()
                    Text(" Free")
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    Spacer()
                        .frame(width: 30)
                }
                Spacer()
                HStack {
                    Text(course.description)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 15))
                    Spacer()
                }
                /*Spacer()
                    .frame(height: 50)*/
                HStack {
                    Text("Lessons")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 23))
                    Spacer()
                }
                VStack(spacing: 15) {
                    ContainerRelativeShape()
                        .frame(height: 50)
                    ContainerRelativeShape()
                        .frame(height: 50)
                }
                Button(action: {}) {
                    Text("Enroll now")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .frame(width: 300.0,height: 60.0)
                          .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                          .cornerRadius(25)
                }
                
                
            }
            .padding(.all)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var course: Course = Course(id: "", title: "", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CourseDetailView(course: course)
    }
}
