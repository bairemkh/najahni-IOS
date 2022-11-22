//
//  Course.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import Foundation
struct Course  {
    let id, title: String
    let fields: [Fields]
    let level, description: String
    let isPaid: Bool
    let image: String
    let price: Int
    let idowner: User?
    let isArchived: Bool
    let createdAt, updatedAt: String
    
    init(id: String, title: String, fields: [Fields], level: String, description: String, isPaid: Bool, image: String, price: Int, /*idowner: User,*/ isArchived: Bool, createdAt: String, updatedAt: String) {
        self.id = id
        self.title = title
        self.fields = fields
        self.level = level
        self.description = description
        self.isPaid = isPaid
        self.image = image
        self.price = price
        self.idowner = nil
        self.isArchived = isArchived
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    /*enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, fields, level
        case welcomeDescription = "description"
        case isPaid, image, price, idowner, isArchived, createdAt, updatedAt
        case v = "__v"
    }*/
}