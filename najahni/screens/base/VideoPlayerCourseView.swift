//
//  VideoPlayerCourseView.swift
//  najahni
//
//  Created by najahni on 3/12/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerCourseView: View {
    var course : Course
    /*@State var player = AVPlayer(url: URL(string:URL_BASE_APP + course.image)!)*/ // 1
       var body: some View {
              /* VideoPlayer(player: player)
                   .frame(width: 400,
                          height: 300,
                          alignment: .center)*/
           Text("ff")
         
       }
}

struct VideoPlayerCourseView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerCourseView(course: CourseFix)
    }
}
