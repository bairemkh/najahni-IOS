//
//  DetailPageViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 22/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class DetailPageViewModel : ObservableObject {
    @Published var title = "Title"
    @Published var Description = ""
    @Published var free = "free"
    @Published var isLiked = false
    
    func enrollNow(id: String){
        CourseService.enrollNow(id: id)
    }
    func progress(id: String,lessonid: String){
        CourseService.progress(id: id,lessonid: lessonid)
    }
}
