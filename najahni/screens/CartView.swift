//
//  CartView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct CartView: View {
    @State var cartlist : [Course] = []
    @State private var showWebView = false
    private let urlString: String = "https://www.google.com"
    var body: some View {
        VStack{
            List{
                    ForEach(cartlist) { course in
                        CustomCardCartView(course: course)
                            .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
                    }.onDelete(perform: { ind in
                        print("deleted")
                    })
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }

            .navigationTitle(Text("My cart"))
            

            VStack {
                Divider()
                HStack{
                    Text("Total")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer()
                    Text("\(calculateTotal())")
                }
                Button(action: {
                    showWebView.toggle()
                   
                }) {
                    Text("Check out")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .frame(width: 300.0,height: 60.0)
                          .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                          .cornerRadius(25)
                }
                .sheet(isPresented: $showWebView) {
                             WebView(url: URL(string: urlString)!)
                         }
            }
        }
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
    func calculateTotal () -> Int {
        var price : Int = 0
        cartlist.forEach{(item) in
            price += item.price
        }
        return price;
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
        
    }
}
