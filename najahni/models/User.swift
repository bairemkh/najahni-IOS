//
//  User.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation

struct User {
    var id, firstname, lastname, email: String
    var password: String
    var role:Role
    var fields: [Fields?]
    var image: String
    var isVerified: Bool
    var otp: String
    
    init(id: String, firstname: String, lastname: String, email: String, password: String, role: Role, fields: [Fields?], image: String, isVerified: Bool, otp: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.role = role
        self.fields = fields
        self.image = image
        self.isVerified = isVerified
        self.otp = otp
    }
    init(firstname: String, lastname: String, email: String, password: String, role: Role, fields: [Fields?], image: String, isVerified: Bool, otp: String){
        self.id = "0"
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.role = role
        self.fields = fields
        self.image = image
        self.isVerified = isVerified
        self.otp = otp
    }
}
