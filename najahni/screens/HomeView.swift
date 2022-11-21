//
//  HomeView.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("welcome")
                    Text("welcome")
                }
                Image(systemName: "bell")
                    .foregroundColor(Color("primaryColor"))
                    .frame(width: 80.0, height: 80.0)
                    .aspectRatio(contentMode: .fill)
                WebImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU"))
                    .resizable()
                    .clipShape(Circle())
                        .shadow(radius: 10)
                    .padding()
                    .frame(width: 80.0, height: 80.0)
                    .aspectRatio(contentMode: .fill)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
