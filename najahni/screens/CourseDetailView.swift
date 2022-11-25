//
//  CourseDetailView.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import SwiftUI

struct CourseDetailView: View {
    @StateObject var viewModel = DetailPageViewModel()
    var body: some View {
        VStack {
            ScrollView{
                Image("Logo-Najahni")
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 200,height: 200)
                HStack {
                    Text("Title")
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    Spacer()
                }
                HStack{
                    Image("user")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50,height: 50)
                    Text("flen ben foulen")
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
                    Text("Free")
                        .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    Spacer()
                        .frame(width: 30)
                }
                Spacer()
                HStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
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
                Button(action: {}) {
                    Text("Sign in")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .frame(width: 300.0,height: 60.0)
                          .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                          .cornerRadius(25)
                }
                
                
            }
            .padding(.all)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
