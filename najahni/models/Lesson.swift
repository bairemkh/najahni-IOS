//
//  Lesson.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
struct Lesson :Identifiable{
    let id, title: String
    let sectionid : String
    let video : String
    let duration : Int
    init(id: String, title: String, sectionid: String,video: String,duration: Int) {
        self.id = id
        self.title = title
        self.sectionid = sectionid
        self.video = video
        self.duration = duration
    }
    init(title: String, sectionid: String,video: String,duration: Int) {
        self.id = ""
        self.title = title
        self.sectionid = sectionid
        self.video = video
        self.duration = duration
    }
}
