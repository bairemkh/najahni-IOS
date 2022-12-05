//
//  VideoPlayerCourseView.swift
//  najahni
//
//  Created by najahni on 3/12/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerCourseView: View {
    
    @State var video: String
    // 1
       var body: some View {
               VideoPlayer(player: AVPlayer(url: URL(string: URL_BASE_APP + video)!))
                   .frame(width: 400,
                          height: 300,
                          alignment: .center)
         
       }
}

struct VideoPlayerCourseView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerCourseView(video: videofix)
    }
}
