//
//  ProfileTrainerView.swift
//  najahni
//
//  Created by najahni on 19/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SlidingTabView

struct ProfileTrainerView: View {
    @StateObject var viewModel = LoginViewModel()
    @StateObject var viewModelCourseTrainer = ProfileTrainerViewModel()
    @Binding var user : User
    @State var courses : [Course] = []
    @State var coursesArchived : [Course] = []
    @State private var onLogOut = false
    @State private var selectedTabIndex = 0
    @State private var pass = false
    var body: some View {
        //NavigationView(){
            VStack(alignment: .center){
                HStack{
                    Spacer()
                    NavigationLink(destination: ProfileStudentView(user:$user),isActive: $onLogOut){
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                                onLogOut = true
                            }
                    }
                    //Spacer()
                }
                VStack(alignment: .center){
                    WebImage(url: URL(string:URL_BASE_APP + user.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU"))
                        .resizable()
                        .clipShape(Circle())
                            .shadow(radius: 10)
                        .padding()
                        .frame(width: 120.0, height: 120.0)
                        .aspectRatio(contentMode: .fill)
                    VStack{
                        Text(user.firstname + " " + user.lastname)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text(user.email)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                   // Spacer()
                        
                }
                

                HStack{
                    CustomBoxView(nbr: courses.count,title: "Courses")
                    Divider()
                    CustomBoxView(nbr: coursesArchived.count,title: "Archived")
                    //Spacer()
                }
                .padding()
                .frame(height: 100.0)
                Divider()
                VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Courses", "Archived"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                    if(selectedTabIndex == 0){
                        //kkkk
                        ZStack {
                            VStack{
                                ScrollView(.vertical,showsIndicators: false) {
                                    ForEach(courses) { course in
                                        NavigationLink{
                                            CourseDetailTrainerView(course: course)
                                        } label: {
                                            CustomCardTrainerView(course: course)
                                        }
                                        
                                    }
                            }} .padding()
                            
                            VStack {
                                Spacer()
                                NavigationLink(destination: AddCourseView(),isActive: $pass,label: {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            pass = true
                                        }, label: {
                                            Text("+")
                                                .font(.system(.largeTitle))
                                                .frame(width: 77, height: 70)
                                                .foregroundColor(Color.white)
                                                .padding(.bottom, 7)
                                        })
                                        .background(Color("primaryColor"))
                                        .cornerRadius(38.5)
                                        .padding()
                                        .shadow(color: Color.black.opacity(0.3),
                                                radius: 3,
                                                x: 3,
                                                y: 3)
                                    }
                                })
                           }
                        }
                    } else {
                        VStack{
                            ScrollView(.vertical,showsIndicators: false) {
                                ForEach(coursesArchived) { courseArch in
                                    NavigationLink{
                                        CourseDetailTrainerView(course: courseArch)
                                    } label: {
                                        CustomCardTrainerView(course: courseArch)
                                    }
                                    
                                }
                        }} .padding()
                    }
                       
                            //Spacer()
                        }
                           // .padding()
                            .animation(.linear)
               /* Text("My courses")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.leading)*/

               // Spacer()
                //deb
                /*ZStack {
                    //Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print ("test float")
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .background(Color.blue)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                    
                }*/
                Spacer()
            }
            .padding(.horizontal)
        //}
        .onAppear{
            print("profile view")
               /*viewModel.profile(completed: {
                   (success,result) in
                   if success {
                       let user = result
                       print(user!.firstname)
                       firstname = user!.firstname
                       lastname = user!.lastname
                       image = user!.image
                   }else {
                       print("not logged in")
                       
                   }

               })
            
          viewModelCourseTrainer.getMyCourses{ success, result in

               })*/
            
            
            viewModelCourseTrainer.getMyCourses{ success, result in
                if success {
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                    print(courses)
                }
                
            }
            
            
            viewModelCourseTrainer.getMyCoursesArchived{ success, result in
                if success {
                    self.coursesArchived = []
                    self.coursesArchived.append(contentsOf: result!)
                   //print(courses)
                }
                
            }
            
            
           }
        
    }
}

struct ProfileTrainerView_Previews: PreviewProvider {
    @State static var user = UserFix
    static var previews: some View {
        ProfileTrainerView(user: $user)
    }
}
