//
//  CourseDetailView.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    @StateObject var viewModel = DetailPageViewModel()
    var course : Course
    var body: some View {
        VStack {
            ScrollView{
                WebImage(url:URL(string: course.image))
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 200,height: 200)
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
                    WebImage(url:URL(string: course.idowner!.image))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50,height: 50)
                    Text(course.idowner!.firstname + " " + course.idowner!.lastname)
                    Spacer()
                }
                Spacer()
                    .frame(width: 0,height: 30)
                HStack {
                    Text("Description")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 23))
                    Spacer()
                    Text(" Free")
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    Spacer()
                        .frame(width: 30)
                }
                Spacer()
                HStack {
                    Text(course.description)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 15))
                    Spacer()
                }
                /*Spacer()
                    .frame(height: 50)*/
                HStack {
                    Text("Lessons")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 23))
                    Spacer()
                }
                VStack(spacing: 15) {
                    ContainerRelativeShape()
                        .frame(height: 50)
                    ContainerRelativeShape()
                        .frame(height: 50)
                }
                Button(action: {
                    print("test enroll")
                    viewModel.enrollNow(id: course.id)
                }) {
                    Text("Enroll now")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .frame(width: 300.0,height: 60.0)
                          .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                          .cornerRadius(25)
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
    static var course: Course = Course(id: "", title: "Title course", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")
    static var previews: some View {
        CourseDetailView(course: course)
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
