//
//  HostingTabBarView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI

struct HostingTabBarView: View {
    private enum Tab: Hashable {
        case home
        case courses
        case cart
        case profile
    }
    
    @State private var selectedTab: Tab = .home
    let role = UserDefaults.standard.string(forKey: "role")
    var body: some View {
        NavigationView(){
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .tabItem {
                                Text("Home")
                                Image(systemName: "house.fill")
                    }
                CoursesView()
                    .tag(1)
                    .tabItem {
                                Text("My courses")
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
                                Text("wish")
                                Image(systemName: "heart.fill")
                            }
                if (role == "Student"){
                    ProfileView()
                        .tag(4)
                        .tabItem {
                                Text("Profile")
                                Image(systemName: "person.fill")
                                }
                } else {
                    ProfileTrainerView()
                        .tag(4)
                        .tabItem {
                                Text("Profile")
                                Image(systemName: "person.fill")
                                }
                }
                    

            }.accentColor(Color(red: 0.356, green: 0.315, blue: 0.848))
        }
        .navigationBarHidden(true)
        
    }
}

struct HostingTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBarView()
    }
}
