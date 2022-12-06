//
//  CartView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct CartView: View {
    @State var cartlist : [Course] = []
    var body: some View {
        NavigationView{
            List{
                ForEach(cartlist) { course in
                    WishListCard(course: course)
                }
            }.navigationTitle(Text("My cart"))
            
        }.navigationTitle(Text("My cart"))
            .onAppear(){
                let list = SessionManager.getCart()
                CourseService.getallcourses { isGood, listOfCourses in
                    if(isGood){
                        cartlist = listOfCourses?.filter({ course in
                            list.contains { item in
                                course.id.elementsEqual(item)
                            }
                        }) ?? [Course(id: "", title: "", fields: [], level: "", description: "", isPaid: true, image: "", price: 0, idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")]
                    }
                }
            }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
