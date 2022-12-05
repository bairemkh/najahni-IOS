//
//  SectionCardView.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import SwiftUI

struct SectionCardView: View {
    var section : Section
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                Spacer()
                Text("15 min")
            }
            .padding(.horizontal)
            
           //List{
            ScrollView(.vertical,showsIndicators: false){
                ForEach(section.lessons){ lesson in
                    NavigationLink {
                        VideoPlayerCourseView(video: lesson.video)
                    }label: {
                        HStack{
                            Text("01")
                            Spacer()
                                .frame(width: 20.0)
                            VStack(alignment: .leading){
                                Text(lesson.title)
                                Text("10min")
                            }
                        }
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
        SectionCardView(section: SectionFix)
    }
}
