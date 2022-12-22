//
//  Enroll.swift
//  najahni
//
//  Created by najahni on 15/12/2022.
//

import Foundation
struct Enroll : Identifiable{
    let id: String
    var userid: String
    var courseid: Course
    var progress : Float
    
    init(id: String, userid: String, courseid: Course, progress: Float) {
        self.id = id
        self.userid = userid
        self.courseid = courseid
        self.progress = progress
    }
    
}
