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
    var body: some View {
        NavigationView {
            if #available(iOS 16.0, *) {
                List{
                    ForEach(wishlist) { course in
                        WishListCard(course: course)
                    }.onDelete { io in
                        showAlert = true
                        if(onDelete){
                            wishlist.remove(atOffsets: io)
                            UserDefaults.standard.removeObject(forKey: WISHLIST)
                            UserDefaults.standard.set(wishlist.map({ c in
                                return c.id
                            }), forKey: WISHLIST)
                        }
                    }
                }.scrollContentBackground(.hidden)
            } else {
            }
            
        }
        .alert(isPresented: $showAlert) {
                
            Alert(title: Text("Confirm"), primaryButton: .destructive(Text("Delete")), secondaryButton: .cancel (Text("Cancel")))
        }
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
func delete(at offsets:IndexSet){
    
}
