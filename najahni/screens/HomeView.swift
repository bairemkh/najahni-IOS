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
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        Text("\(SessionManager.currentUser?.role.rawValue ?? "Role")")
                        Text("\(SessionManager.currentUser?.firstname ?? "User")")
                    }
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .padding(8)
                        .frame(width: 45.0, height: 45.0)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
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
                        TextField("Search any course ...", text: $text)
                        
                    }.padding(10)
                    
                        .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                    
                        .cornerRadius(10)
                    
                    
                }
                CustomSelectionView(list: $selectionArray,itemSelected: selectedFilter){ sel in
                    if sel == 0 {
                        viewModel.getallcourses { success, result in
                            if success {
                                self.courses = []
                                self.courses.append(contentsOf: result!)
                            }
                        }
                    }else
                    {
                        var filtredCourses = courses.filter { course in
                            return course.fields.contains(Fields(rawValue: selectionArray[sel].name) ?? Fields.Arts)
                        }
                        self.courses = filtredCourses
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
                        ForEach(courses) { course in
                            NavigationLink{
                                CourseDetailView(course: course)
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
