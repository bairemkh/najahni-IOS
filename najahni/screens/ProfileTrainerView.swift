//
//  ProfileTrainerView.swift
//  najahni
//
//  Created by najahni on 19/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileTrainerView: View {
    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: .center){
                WebImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvaBdtJ4GaN7m79jU-Y47NqT3Grvxd7qIZ9VKUZKyU1ynYKxoNdlQCixTRDnliBE62os&usqp=CAU"))
                    .resizable()
                    .clipShape(Circle())
                        .shadow(radius: 10)
                    .padding()
                    .frame(width: 120.0, height: 120.0)
                    .aspectRatio(contentMode: .fill)
                VStack{
                    Text( "Trainer trainer")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Text("Edit profile")
                            .font(.headline)
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                                print("click to pick")
                            }
                }
                Spacer()
                    
            }
            

            HStack(alignment: .top){
                CustomBoxView()
                CustomBoxView()
                Spacer()
            }
            .padding()
            Text("My courses")
                .fontWeight(.medium)
                .foregroundColor(Color.black)
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct ProfileTrainerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTrainerView()
    }
}
