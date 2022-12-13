//
//  Comment.swift
//  najahni
//
//  Created by najahni on 6/12/2022.
//

import Foundation
struct Comment :Identifiable{
    let id, content: String
    let courseid : String
    let userid : User?
    let createdAt, updatedAt: String
    init(id: String, content: String, courseid: String,userid: User,createdAt: String, updatedAt: String) {
        self.id = id
        self.content = content
        self.courseid = courseid
        self.userid = userid
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
