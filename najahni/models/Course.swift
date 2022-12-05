//
//  Course.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import Foundation
struct Course  : Identifiable{
    let id: String
    var title: String
    var fields: [Fields]
    var level, description: String
    var isPaid: Bool
    var image: String
    var price: Int
    var idowner: User?
    var isArchived: Bool
    //let students:[User]
    var createdAt, updatedAt: String
    
    
    
    init(id: String, title: String, fields: [Fields], level: String, description: String, isPaid: Bool, image: String, price: Int, idowner: User, isArchived: Bool, createdAt: String, updatedAt: String) {
        self.id = id
        self.title = title
        self.fields = fields
        self.level = level
        self.description = description
        self.isPaid = isPaid
        self.image = image
        self.price = price
        self.idowner = idowner
        self.isArchived = isArchived
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    init(title: String, fields: [Fields], level: String, description: String, isPaid: Bool, price: Int, isArchived: Bool) {
        self.id = "id"
        self.title = title
        self.fields = fields
        self.level = level
        self.description = description
        self.isPaid = isPaid
        self.image = "image"
        self.price = price
        self.idowner = UserFix
        self.isArchived = isArchived
        self.createdAt = "createdAt"
        self.updatedAt = "updatedAt"
    }

    /*enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, fields, level
        case welcomeDescription = "description"
        case isPaid, image, price, idowner, isArchived, createdAt, updatedAt
        case v = "__v"
    }*/
}
