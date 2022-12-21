//
//  CoursesView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct CoursesView: View {
    @State var courses : [Enroll] = []
    @StateObject var courseviewModel = MyCoursesViewModel()
    var body: some View {
        //NavigationView {
            VStack{
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(courses) { course in
                        
                        
                       NavigationLink{
                           DetailCourseLessonsView(course: course.courseid)
                        } label: {
                            CustomCardCourseView(course: course.courseid,progress:Float(course.progress))
                        }
                        
                    }
                }
                
            }
               
        //}
        .onAppear{/* CourseService.getallcourses() {
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
        }*/
            courseviewModel.getMyCoursesList {
                succes, result in
                if succes {
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                }
            }
            }
        .navigationTitle(
            Text(LocalizedStringKey("My_courses"))
        )
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
