//
//  SectionCardView.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import SwiftUI

struct SectionCardView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Section 1 - Introduction")
                Spacer()
                Text("15 min")
            }
            .padding(.horizontal)
            
           //List{
                NavigationLink {
                    VideoPlayerCourseView(video: videofix)
                }label: {
                    HStack{
                        Text("01")
                        Spacer()
                            .frame(width: 20.0)
                        VStack(alignment: .leading){
                            Text("Title of lesson")
                            Text("10min")
                        }
                    }
                }
            //}
            .padding(.horizontal)
        }
    }
}

struct SectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SectionCardView()
    }
}
