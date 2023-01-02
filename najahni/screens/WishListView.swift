//
//  WishListView.swift
//  najahni
//
//  Created by najahni on 25/11/2022.
//

import SwiftUI

struct WishListView: View {
    @State var wishlist : [Course] = []
    @State var showAlert = false
    @State var onDelete = false
    @State var posDel = IndexSet()
    var body: some View {
        VStack {
            HStack{
                Text("Wishlist")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(.horizontal)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding([.leading, .bottom, .trailing])
            if #available(iOS 16.0, *) {
                List{
                    ForEach(wishlist) { course in
                        WishListCard(course: course)
                    }.onDelete { io in
                        showAlert = true
                        posDel = io
                        if(onDelete){
                            wishlist.remove(atOffsets: io)
                            print("wishist = \(wishlist)")
                            UserDefaults.standard.removeObject(forKey: WISHLIST)
                            UserDefaults.standard.set(wishlist.map({ c in
                                return c.id
                            }), forKey: WISHLIST)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                }
                //.scrollContentBackground(.hidden)
            } else {
            }
            
        }
        .background(Color("BackgroundColor"))
        .alert(isPresented: $showAlert) {
                
            Alert(title: Text("Confirm"), primaryButton: .destructive(Text("Delete")){
                onDelete = true
                wishlist.remove(atOffsets: posDel)
                print("wishist = \(wishlist)")
                UserDefaults.standard.removeObject(forKey: WISHLIST)
                UserDefaults.standard.set(wishlist.map({ c in
                    return c.id
                }), forKey: WISHLIST)
            }, secondaryButton: .cancel (Text("Cancel")){
                onDelete = false
            })
        }
        //.navigationTitle(Text("title"))
        
        .onAppear(){
            let list = SessionManager.getWishlist()
            CourseService.getallcourses { isGood, listOfCourses in
                if(isGood){
                    wishlist = listOfCourses?.filter({ course in
                        list.contains { item in
                            course.id.elementsEqual(item)
                        }
                    }) ?? [Course(id: "", title: "", fields: [], level: "", description: "", isPaid: true, image: "", price: 0, idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")]
                }
            }
        }
        
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
