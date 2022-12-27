//
//  CourseDetailView.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import ExpandableText
import SlidingTabView

struct CourseDetailView: View {
    @StateObject var viewModel = DetailPageViewModel()
    var course : Course
    @State var passChat = false
    @State private var selectedTabIndex = 0
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //VStack {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            ScrollView {
                GeometryReader{ geo in
                    WebImage(url:URL(string: URL_BASE_APP + course.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width ,height: geo.frame(in: .global).minY > 0 ?
                               geo.frame(in: .global).minY +
                               (UIScreen.main.bounds.height / 2.2) :
                                (UIScreen.main.bounds.height / 2.2)
                        )
                        .offset(y: -geo.frame(in: .global).minY)
                    //.clipShape(Rectangle())
                    
                    //.scaledToFit()
                        //.clipped()
                }.frame(height: (UIScreen.main.bounds.height / 2.2))
                Spacer()
                VStack{
                    HStack {
                        Text(course.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 24))
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
                    HStack{
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
                        Spacer()
                        VStack(alignment: .center, spacing: 8) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.yellow)
                            Text("\(course.rating.formatted())")
                                //.foregroundColor(Color.black)
                                .font(Font.system(size: 11, weight: .semibold, design: .rounded))
                        }
                    }
                    Divider()

                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["About", "Lessons"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                        .foregroundColor(Color("primaryColor"))
                    if(selectedTabIndex == 0){
                        HStack{
                            WebImage(url:URL(string: URL_BASE_APP + course.idowner!.image))
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 50,height: 50)
                            Text(course.idowner!.firstname + " " + course.idowner!.lastname)
                            
                            Spacer()
                            NavigationLink(destination: messageView(contactMsgs: Binding(get: {
                                return [Message(msgContent: "Hi how can help you", senderid: course.idowner!.id, receiverid: SessionManager.currentUser!.id)]
                            }, set: { v in
                                
                            }), user: course.idowner!),isActive: $passChat) {
                                Image(systemName: "ellipsis.message")
                                    .resizable()
                                    .padding(8)
                                    .frame(width: 45.0, height: 45.0)
                                    .foregroundColor(Color("primaryColor"))
                                    .aspectRatio(contentMode: .fill)
                                    .onTapGesture {
                                     passChat = true
                                    }
                            }

                            
                        }
                        HStack {
                            Text("Description")
                                .fontWeight(.medium)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        Spacer()
                        //HStack {
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
                        //}
                    }else{
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

                        }
                    }


                    
                }
                
                .padding([.top, .leading, .trailing])
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("BackgroundColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                
                
                
                //  }
                //.padding(.all)

            }
            
            
            HStack{
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack(spacing: 8.0) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            
                            
                        
                    }
                    
                }
                .background(Color.white)
                .frame(width: 25, height: 25)
                .cornerRadius(38.5)
                .padding()
                Spacer()
            }
            
            /*.navigationTitle(
             Text("Detail")
             )*/
            //.navigationBarTitleDisplayMode(.inline)
        }
        VStack {
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
    .navigationBarBackButtonHidden(true)
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
    static var course: Course = Course(id: "", title: "Title course", fields: Fields.allCases, level: Level.Beginner.rawValue, description: "", isPaid: false, image: "/img/pexels-supreet-7559057.jpg1668674151911.jpg", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "",sections: [Section(id: "2", title: "Section 1", idCourse: "", lessons: [Lesson(title: "Lesson 1", sectionid: "1", video: "",duration: 0),Lesson(title: "Lesson 2", sectionid: "1", video: "",duration: 0)])])
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
    @State var course = ""
    
    @StateObject var viewmodel = DetailPageViewModel()
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
                    Text(convertTime(value:lesson.duration))
                }
                Spacer()
                NavigationLink(destination: VideoPlayerCourseView(video: lesson.video),isActive: $goVideo) {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(Color(hue: 0.738, saturation: 0.922, brightness: 0.866, opacity: 0.3))
                        if(SessionManager.currentUser!.courses.contains(where: { ids in
                            ids.elementsEqual(course)
                        })){
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("primaryColor"))
                                .onTapGesture {
                                    goVideo = true
                                    viewmodel.progress(id: course,lessonid: lesson.id)
                                    
                                }
                        } else{
                            Image(systemName: "lock.fill")
                                .foregroundColor(Color("primaryColor"))
                                .onTapGesture {
                                    goVideo = false
                                }
                        }

                    }

                }
                            }
            .padding(.horizontal)
            .padding()
    }
}

