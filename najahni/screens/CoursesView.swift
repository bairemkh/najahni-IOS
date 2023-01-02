//
//  CoursesView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import SlidingTabView

struct CoursesView: View {
    @State var courses : [Enroll] = []
    @State var coursesCompleted : [Enroll] = []
    @State private var selectedTabIndex = 0
    @StateObject var courseviewModel = MyCoursesViewModel()
    var body: some View {
        //NavigationView {
            VStack{
                HStack{
                    Text("My Courses")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .padding(.horizontal)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding([.leading, .bottom, .trailing])
                SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Ongoing", "Completed"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                    .foregroundColor(Color("primaryColor"))
                if(selectedTabIndex == 0){
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(courses) { course in
                            
                            
                           NavigationLink{
                               DetailCourseLessonsView(course: course.courseid)
                            } label: {
                                CustomCardCourseView(course: course.courseid,progress:Float(course.progress))
                            }
                            
                        }
                    }
                }else{
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(coursesCompleted) { course in
                            
                            
                           NavigationLink{
                               DetailCourseLessonsView(course: course.courseid ,isCompleted: true)
                            } label: {
                                CustomCardCourseView(course: course.courseid,progress:Float(course.progress))
                            }
                            
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
                    self.courses = self.courses.filter { enroll in
                        return enroll.progress < 1
                    }
                }
            }
            courseviewModel.getMyCoursesCompleted {
                succes, result in
                if succes {
                    self.coursesCompleted = []
                    self.coursesCompleted.append(contentsOf: result!)
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
