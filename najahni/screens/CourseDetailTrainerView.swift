//
//  CourseDetailTrainerView.swift
//  najahni
//
//  Created by najahni on 3/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SlidingTabView

struct CourseDetailTrainerView: View {
    var course : Course
    @State private var selectedTabIndex = 0
    var body: some View {
        VStack {
            ScrollView{
                WebImage(url:URL(string: URL_BASE_APP + course.image))
                    .resizable()
                    .frame(width:.infinity ,height: 400)
                    .clipShape(Rectangle())
                    
                HStack {
                    Text(course.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
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
                
                VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Lessons", "Reviews"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                    if(selectedTabIndex == 0){
                        ScrollView(.vertical){
                            VStack(spacing: 15) {
                                ContainerRelativeShape()
                                    .frame(height: 50)
                                ContainerRelativeShape()
                                    .frame(height: 50)
                                ContainerRelativeShape()
                                    .frame(height: 50)
                                ContainerRelativeShape()
                                    .frame(height: 50)
                                
                            }
                        }
                    }else{
                        ContainerRelativeShape()
                            .frame(height: 50)
                        ContainerRelativeShape()
                            .frame(height: 50)
                        ContainerRelativeShape()
                            .frame(height: 50)
                    }
                }
          

                
            }
            .padding(.all)
        }.navigationBarTitle(
            Text("Detail"),
            displayMode: .inline
          )
        .navigationBarItems(trailing: Text("Edit"))
    //.navigationBarTitleDisplayMode(.inline)
    }
}

struct CourseDetailTrainerView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailTrainerView(course: CourseFix)
    }
}
