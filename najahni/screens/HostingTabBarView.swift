//
//  HostingTabBarView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

import SwiftUI

struct HostingTabBarView: View {
    private enum Tab: Hashable {
        case home
        case courses
        case cart
        case wish
        case profile
    }
    
    @State private var selectedTab: Tab = .home
    @State private var role : String = ""
    @State private var user:User = UserFix
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {

            
                    TabView {
                        HomeView()
                            .tag(0)
                            .tabItem {
                                Text("Home")
                                Image(systemName: "house.fill")
                            }
                        CoursesView()
                            .tag(1)
                            .tabItem {
                                Text(LocalizedStringKey("My_courses"))
                                Image(systemName: "list.clipboard.fill")
                            }
                        CartView()
                            .tag(2)
                            .tabItem {
                                Text("Cart")
                                Image(systemName: "cart.fill")
                            }
                        
                        
                        WishListView()
                            .tag(3)
                            .tabItem {
                                Text("Wishlist")
                                Image(systemName: "heart.fill")
                            }
                        if (role == "Student"){
                            
                            
                            //ProfileView()
                            ProfileStudentView(user: $user)
                                .tag(4)
                                .tabItem {
                                    Text("Profile")
                                    Image(systemName: "person.fill")
                                    
                                }
                        } else if (role == "Trainer"){
                        //} else{
                                    ProfileTrainerView(user: $user)
                                        .tag(4)
                                        .tabItem {
                                            Text("Profile")
                                            Image(systemName: "person.fill")
                                        }
                                }
                            
                            
                        }.accentColor(Color(red: 0.356, green: 0.315, blue: 0.848))
                    
            
        
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            .onAppear{
                user = SessionManager.currentUser!
                role = SessionManager.currentUser!.role.rawValue
            }
            .onDisappear()
            .background(Color("BackgroundColor"))
            .navigationBarBackButtonHidden()
            
            //.onDisappear()
            
    }
    }

struct HostingTabBarView_Previews: PreviewProvider {
    @State static var user = UserFix
    static var previews: some View {
        HostingTabBarView()
    }
}
