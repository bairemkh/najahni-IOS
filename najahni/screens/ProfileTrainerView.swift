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
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var image : String = ""
    @State var courses : [Course] = []
    @State private var onLogOut = false
    @State private var selectedTabIndex = 0
    var body: some View {
        //NavigationView(){
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    WebImage(url: URL(string:image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU"))
                        .resizable()
                        .clipShape(Circle())
                            .shadow(radius: 10)
                        .padding()
                        .frame(width: 120.0, height: 120.0)
                        .aspectRatio(contentMode: .fill)
                    VStack{
                        Text(firstname ?? "test" + " " + lastname ?? "test")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                        
                        NavigationLink(destination:EditProfileView(firstname: firstname, lastname: lastname, image: image),label:{
                            Text("Edit profile")
                                    .font(.headline)
                                    .foregroundColor(Color("primaryColor"))
                                    .onTapGesture {
                                        print("click to pick")
                                    }
                        })
                        
                    }
                    Spacer()
                    NavigationLink(destination: LoginView(),isActive: $onLogOut){
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                                print("logout")
                                print(UserDefaults.standard.object(forKey: "token")!)
                                UserDefaults.standard.removeObject(forKey: "token");                     UserDefaults.standard.removeObject(forKey: "role")
                                
                                onLogOut = true
                                print(UserDefaults.standard.object(forKey: "token"))
                            }
                    }
                    Spacer()
                        
                }
                

                HStack{
                    CustomBoxView()
                    CustomBoxView()
                    Spacer()
                }
                .padding()
                VStack(alignment: .leading) {
                            SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Courses", "Archived"])
                    if(selectedTabIndex == 0){
                        VStack{
                            ScrollView(.vertical,showsIndicators: false) {
                                ForEach(courses) { course in
                                    NavigationLink{
                                        CourseDetailView(course: course)
                                    } label: {
                                        CustomCardTrainerView(course: course)
                                    }
                                    
                                }
                            }} .padding()
                    } else {
                        Text("Second View")
                            .padding()
                    }
                       
                            Spacer()
                        }
                            .padding(.top, 50)
                            .animation(.none)
               /* Text("My courses")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.leading)*/

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
               })*/
            let user = SessionManager.currentUser
            print(user!.firstname)
            firstname = user!.firstname
            lastname = user!.lastname
            image = user!.image
            viewModelCourseTrainer.getMyCourses{ success, result in
                if success {
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                    print(courses)
                }
                
            }
            
            
           }
        
    }
}

struct ProfileTrainerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTrainerView()
    }
}
