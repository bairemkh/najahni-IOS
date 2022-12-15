//
//  HomeView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    //@Binding var selectedIndex: Int
    @State private var currentIndex: Int = 0
    @State var selectedFilter = 0
    @State var selectionArray : [ListData] = []
    @Namespace private var ns
    @State var text = ""
    @State var courses : [Course] = []
    @State var displayedCourses : [Course] = []
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack(alignment: .leading){

                
                HStack{
                    VStack{
                        Text("\(SessionManager.currentUser?.firstname ?? "First name")")
                        Text("\(SessionManager.currentUser?.lastname ?? "Last name")")
                    }
                    Spacer()
                    Image(systemName: "bell.fill")
                        .resizable()
                        .padding(8)
                        .frame(width: 45.0, height: 45.0)
                        .foregroundColor(Color("primaryColor"))
                    
                    //.frame(width: 50.0, height: 50.0)
                        .aspectRatio(contentMode: .fill)
                    WebImage(url: URL(string:"\(URL_BASE_APP)\(SessionManager.currentUser?.image ?? "")"))
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding()
                        .frame(width: 80.0, height: 80.0)
                        .aspectRatio(contentMode:
                                .fill)
                    
                }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search any course ...", text: $text).onChange(of: text) { newValue in
                            var filtredCourses = displayedCourses.filter { course in
                                return course.title.contains(newValue)
                            }
                            if(newValue.isEmpty){
                                displayedCourses = courses
                            }else{
                                displayedCourses = filtredCourses
                            }
                        }
                        
                    }.padding(10)
                    
                        .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                    
                        .cornerRadius(10)
                    
                    
                }
                CustomSelectionView(list: $selectionArray,itemSelected: selectedFilter){ sel in
                    displayedCourses = courses
                    if sel == 0 {
                        displayedCourses = courses
                    }else
                    {
                        var filtredCourses = displayedCourses.filter { course in
                            return course.fields.contains(Fields(rawValue: selectionArray[sel].name) ?? Fields.Arts)
                        }
                        
                        print(filtredCourses)
                        self.displayedCourses = filtredCourses
                    }
                }
                Text("Recommanded")
                    .font(.title2)
                    .foregroundColor(Color("primaryColor"))
                    .fontWeight(.black)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    ForEach(courses) {item in
                        // CustomCardView(course: item)
                        
                    }
                }
                
                
                //print("s",courses.count)
                Text("Courses").font(.title2)
                    .foregroundColor(Color("primaryColor"))
                    .fontWeight(.black).padding(.all)
                VStack{
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(displayedCourses) { course in
                            NavigationLink{
                                if(SessionManager.currentUser!.courses.contains(where: { idc in
                                    return idc.elementsEqual(course.id)
                                })){
                                    DetailCourseLessonsView(course: course)
                                }else{
                                    CourseDetailView(course: course)
                                }
                                
                            } label: {
                                CustomCardView(course: course)
                            }
                            
                        }
                    }}
                Spacer()
                
            }
            .padding(.horizontal)
        }
    
        
        .onAppear{
            
            viewModel.getallcourses { success, result in
                if success {
                    self.selectionArray = Fields.allCases.map({ f in
                        return ListData(name: f.rawValue)
                    })
                    self.selectionArray.insert(ListData(name: "All"), at: 0)
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                    self.displayedCourses = courses
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
