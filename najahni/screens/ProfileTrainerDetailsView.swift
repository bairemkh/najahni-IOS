//
//  ProfileTrainerDetailsView.swift
//  najahni
//
//  Created by najahni on 9/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileTrainerDetailsView: View {
    var body: some View {
        VStack(alignment: .center){
            ScrollView(.vertical){
                Spacer()
                /*Image("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU")*/
                WebImage(url: URL(string: defaultImage))
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                    .frame(width: 120.0, height: 120.0)
                    .aspectRatio(contentMode: .fill)
                
                
                Text("firstname"  + " " + "lastname")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Spacer()
                    .frame(height: 15.0)
            }
        }
    }
}

struct ProfileTrainerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTrainerDetailsView()
    }
}
