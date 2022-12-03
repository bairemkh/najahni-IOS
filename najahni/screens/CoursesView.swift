//
//  CoursesView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct CoursesView: View {
    @State var courses : [Course] = []
    @StateObject var courseviewModel = MyCoursesViewModel()
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(courses) { course in
                        NavigationLink{
                            CourseDetailView(course: course)
                        } label: {
                            CustomCardCourseView(course: course)
                        }
                        
                    }
                }
                
            }
                .navigationTitle(
                    Text("My courses")
                )
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear{ courseviewModel.getMyCoursesList {
            success, result in
                if success {
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                    print(courses)
                }
        }
            }

    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
