//
//  CartView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import LocalAuthentication
struct CartView: View {
    @State var cartlist : [Course] = []
    @State private var showWebView = false
    @StateObject var cartViewModel = CartViewModel()
  
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

            .navigationTitle(Text(LocalizedStringKey("My_cart")))
            

            VStack {
                Divider()
                HStack{
                    Text("Total")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer()
                    Text("\(cartViewModel.price)")
                        .padding(.trailing)
                }
                Button(action: {
                    //showWebView.toggle()
                    //$cartViewModel.price = calculateTotal()
                    cartViewModel.addPayement{ oki,url in
                        print(oki)
                       
                        authenticate()
                    }
                    
                   
                }) {
                    Text(LocalizedStringKey("Check_out"))
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .frame(width: 300.0,height: 60.0)
                          .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                          .cornerRadius(25)
                          
                    
                }
               
            }
            .fullScreenCover(isPresented: $showWebView){
                Text("cancel")
                    .onTapGesture {
                        showWebView.toggle()
                    }
                WebView(url: URL(string: cartViewModel.urlString)!,showWebView: $showWebView)
                      }
            
        }
            .onAppear(){
                
                CourseService.getallcourses { isGood, listOfCourses in
                    if(isGood){
                        //cartlist = []
                        cartlist = listOfCourses?.filter({ course in
                            cartViewModel.list.contains { item in
                                course.id.elementsEqual(item)
                            }
                        }) ?? [Course(id: "", title: "", fields: [], level: "", description: "", isPaid: true, image: "", price: 0, idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")]
                    }
                    cartViewModel.price = 0
                    cartlist.forEach{(item) in
                        cartViewModel.price += item.price
                    }
                }
                
            }
  
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    showWebView = true
                } else {
                        showWebView = false
                }
            }
        } else {
            // no biometrics
        }
    }
}



struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
        
    }
}
