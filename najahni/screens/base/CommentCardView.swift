//
//  CommentCardView.swift
//  najahni
//
//  Created by najahni on 6/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentCardView: View {
    var comment : Comment
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string: URL_BASE_APP + comment.userid!.image ?? ""))
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                VStack {
                    HStack {
                        Text((comment.userid?.firstname ?? "test") + " " + (comment.userid?.lastname ?? "test"))
                            .foregroundColor(Color.blue)
                            .font(.system(size: 14, weight: .semibold, design: .default))
                        Spacer()
                    }

                    HStack {
                        Text("12 minutes ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                }
               
            }

            //Spacer()

            HStack {
                Text(comment.content)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
                
            }
            .padding([.top, .leading, .trailing])

            


        }
        .padding(.all)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.906), radius: 10)
    }
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCardView(comment: CommentFix)
    }
}
