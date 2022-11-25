//
//  HomeView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State var Categories: [ListData] = Fields.allCases.map { f in
        return ListData(name: f.rawValue)
    }
    //@Binding var selectedIndex: Int
    @State private var currentIndex: Int = 0
    @Namespace private var ns
    @State var text = ""
    @State var courses : [Course] = []
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        Text("Welcome")
                        Text("Med oues")
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
                    WebImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU"))
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
                
                
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    ScrollViewReader { scrollView in
                        
                        HStack {
                            
                            ForEach(Categories, id: \.self) { item in
                                Text(item.name)
                                    .padding(8.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24)
                                            .stroke(lineWidth: 2))
                            }
                        }
                        .padding(.leading, 10)
                        // .padding(.trailing, 20)
                    }
                }
                
                Text("Recommanded").font(.title2)
                
                    ScrollView(.horizontal,showsIndicators: false) {
                        ForEach(courses) {item in
                           // CustomCardView(course: item)
                            
                            }
                    }
                    
                
                //print("s",courses.count)
                Text("Courses").font(.title2).padding(.all)
                VStack{
                    ScrollView(.horizontal,showsIndicators: false) {
                        ForEach(courses) { course in
                            CustomCardView(course: course)
                        }
                    }}
                /*List(courses) { item in
                    Text(item.title)
                           //CustomCardView(course: item)
                       }*/
               /* List{
                    ForEach(courses,id: \.title) { course in
                        Text(course.title)
                    }
                }*/
                /*List {
                    Text("Hello")
                    Text("gtyty")
                    Text("Helefeflo")
                    Text("ikik")
                }*/
                /*ScrollView(showsIndicators: false) {
                    ForEach(0..<20) {_ in
                        CustomCardView()
                    }
                }*/
                Spacer()
                
            }
            .padding(.horizontal)
        }
        .onAppear{
            viewModel.getallcourses { success, result in
                if success {
                    self.courses = []
                    self.courses.append(contentsOf: result!)
                    print(courses)
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
