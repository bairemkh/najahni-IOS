//
//  CourseDetailView.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import ExpandableText

struct CourseDetailView: View {
    @StateObject var viewModel = DetailPageViewModel()
    var course : Course
    var body: some View {
        VStack {
            ScrollView{
                WebImage(url:URL(string: URL_BASE_APP + course.image))
                    .resizable()
                    .frame(width:.infinity ,height: 400)
                    .clipShape(Rectangle())
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .clipped()
                    
                HStack {
                    Text(course.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    Spacer()
                    btnIcon(isSelected: $viewModel.isLiked){ isLiked in
                        print(isLiked)
                        var wishlist = SessionManager.getWishlist()
                        if(isLiked){
                            if(!wishlist.contains(where: { c in
                                return c.elementsEqual(self.course.id)
                            })){
                                wishlist.append(self.course.id)
                                UserDefaults.standard.removeObject(forKey: WISHLIST)
                                UserDefaults.standard.set(wishlist, forKey: WISHLIST)
                            }
                        }else{
                            wishlist.remove(at: wishlist.firstIndex(where: { c in
                                return c.elementsEqual(self.course.id)
                            }) ?? -1)
                            UserDefaults.standard.set(wishlist, forKey: WISHLIST)
                        }
                    }
                }
                HStack{
                    WebImage(url:URL(string: URL_BASE_APP + course.idowner!.image))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50,height: 50)
                    Text(course.idowner!.firstname + " " + course.idowner!.lastname)
                    
                    Spacer()
                    
                }
                Spacer()
                    .frame(width: 0,height: 30)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 10) {
                        ForEach(course.fields .map({ f in
                            return ListData(name: f.rawValue)
                        })){ element in
                            Text(element.name)
                                .padding(.horizontal, 8.0)
                                .background(Color("secondaryColor"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
                Spacer()
                    .frame(width: 0,height: 30)
                HStack {
                    Text("Description")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 23))
                    Spacer()
                    if(course.isPaid){
                        Text("\(course.price) TND")
                            .foregroundColor(Color("secondaryColor"))
                            .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        
                    }else{
                        Text("Free")
                            .foregroundColor(Color("secondaryColor"))
                            .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        Spacer()
                            .frame(width: 30)
                    }
                }
                Spacer()
                HStack {
                    ExpandableText(text: course.description)
                        .font(.body)//optional
                        .foregroundColor(.primary)//optional
                        .lineLimit(3)//optional
                        .expandButton(TextSet(text: "more", font: .body, color: .blue))//optional
                        .collapseButton(TextSet(text: "less", font: .body, color: .blue))//optional
                        .expandAnimation(.easeOut)//optional
                        .padding(.horizontal, 24)//optional
                    /*Text(course.description)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 15))*/
                    Spacer()
                }
                Group{
                    Spacer()
                        .frame(height: 50)
                    HStack {
                        Text("Lessons")
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                        .font(.system(size: 23))
                        Spacer()
                        Text(course.level)
                            .bold()
                    }
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(course.sections) { section in
                            SectionCardView(section: section)
                        
                        }
                    }
                    if(course.isPaid == true){
                        Button(action: {
                            var cart = SessionManager.getCart()
                            
                                if(!cart.contains(where: { c in
                                    return c.elementsEqual(self.course.id)
                                })){
                                    cart.append(self.course.id)
                                    UserDefaults.standard.removeObject(forKey: CART)
                                    UserDefaults.standard.set(cart, forKey: CART)
                                }
                            
                        }) {
                            Text(LocalizedStringKey("Add_to_cart"))
                                  .foregroundColor(Color.white)
                                  .multilineTextAlignment(.center)
                                  .frame(width: 300.0,height: 60.0)
                                  .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                                  .cornerRadius(25)
                        }
                    }else{
                        Button(action: {

                            viewModel.enrollNow(id: course.id)
                        }) {
                            Text(LocalizedStringKey("Enroll_now"))
                                  .foregroundColor(Color.white)
                                  .multilineTextAlignment(.center)
                                  .frame(width: 300.0,height: 60.0)
                                  .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                                  .cornerRadius(25)
                        }
                    }

                }
                
                
                
            }
            .padding(.all)
        }.navigationTitle(
            Text("Detail")
          )
    .navigationBarTitleDisplayMode(.inline)
    .onAppear(){
        let wishlist = SessionManager.getWishlist()
        if(wishlist.contains(where: { c in
            return c.elementsEqual(self.course.id)
        })){
            print("-----------------------------------is liked---------------------\n \(wishlist)")
            viewModel.isLiked = true
        }
    }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var course: Course = Course(id: "", title: "Title course", fields: Fields.allCases, level: Level.Beginner.rawValue, description: "", isPaid: false, image: "/img/pexels-supreet-7559057.jpg1668674151911.jpg", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "",sections: [Section(id: "2", title: "Section 1", idCourse: "", lessons: [Lesson(title: "Lesson 1", sectionid: "1", video: ""),Lesson(title: "Lesson 2", sectionid: "1", video: "")])])
    static var previews: some View {
        CourseDetailView(course: course)
        //listLessonsView(section: Section(title: "hello", idCourse: ""), onAdd:{})
       /* LessonsViewPart(lesson: Lesson(title: "Kotlin part 1", sectionid: "", video: ""))*/
    }
}
struct btnIcon:View {
    @Binding var isSelected : Bool
    @State var iconSelected = "heart.fill"
    @State var iconDeSelected = "heart"
    @State var select : (Bool)->Void
    var body: some View{
        if(isSelected){
            Image(systemName: iconSelected)
                .foregroundColor(Color("secondaryColor"))
             .onTapGesture {
                 isSelected = false
                  select(false)
             }
        }else{
            Image(systemName: iconDeSelected)
                .foregroundColor(Color("secondaryColor")).onTapGesture {
                    isSelected = true
                     select(true)
                }
        }
    }
}
struct listLessonsView:View {
    @State var isTapped = false
    @State var section:Section
    @State var onAdd:()->Void
    
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View{
        
        
            HStack{
                if(!isTapped)
                {Text(section.title)
                        .font(.title)
                    Spacer()
                    Image(systemName: "arrowtriangle.right.fill")
                        .onTapGesture {
                            withAnimation {
                                isTapped.toggle()
                            }
                        }
                }else{
                    VStack{
                        HStack {
                            Text("Lessons:")
                                .bold()
                                .font(.title2)
                                .onTapGesture {
                                    withAnimation {
                                        isTapped.toggle()
                                    }
                                }
                        Spacer()
                        }
                        
                        ForEach(section.lessons) { lesson in
                            EditLessonsViewPart(lesson: lesson)
                        }
                    }
                    Spacer()
                        
                }
            }
            .animation(.easeInOut(duration: 0.5))
            
            
        
    }
}
struct LessonsViewPart: View {
    @State var isTapped = false
    @State var lesson:Lesson
    @State var indexLesson = 1
    @State var goVideo = false
    var body: some View {
            HStack{
                ZStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(Color(hue: 0.738, saturation: 0.922, brightness: 0.866, opacity: 0.3))
                    Text((indexLesson+1).description)
                        .foregroundColor(Color("primaryColor"))
                }
                VStack {
                    Text(lesson.title)
                        .font(.system(size: 20))
                    .bold()
                    Text("2h30")
                }
                Spacer()
                NavigationLink(destination: VideoPlayerCourseView(video: lesson.video),isActive: $goVideo) {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(Color(hue: 0.738, saturation: 0.922, brightness: 0.866, opacity: 0.3))
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                                goVideo = true
                            }
                    }

                }
                            }
            .padding(.horizontal)
            .padding()
    }
}

