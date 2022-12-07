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
                            DetailCourseLessonsView(course: course)
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
        }.onAppear{ CourseService.getallcourses() {
            success, result in
                if success {
                    self.courses = []
                    self.courses.append(contentsOf: (result?.filter({ course in
                        return SessionManager.currentUser!.courses.contains(where: { com in
                            com.elementsEqual(course.id)
                        })
                    }))!)
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
