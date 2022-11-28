//
//  File.swift
//  najahni
//
//  Created by bairem mohamed on 14/11/2022.
//

import Foundation


let URL_BASE_APP = "http://172.17.13.158:9090"
//let URL_BASE_APP = "http://localhost:9090"

let LOGIN_URL = URL_BASE_APP + "/user/signin"
let PROFILE_URL = URL_BASE_APP + "/user/profile"
let EDIT_PROFILE = URL_BASE_APP + "/user/editprofile"
let DELETE_PROFILE = URL_BASE_APP + "/user/delete-account"
let EDIT_PASSWORD = URL_BASE_APP + "/user/change-password"
let UPLOAD_IMAGE = URL_BASE_APP + "/user/change-photo"
let GOOGLE_SIGNIN = URL_BASE_APP + "/user/google-signin"

let ALL_COURSE = URL_BASE_APP + "/course/getall"



var UserFix = User(firstname: "", lastname: "", email: "", password: "", role: Role.Student, fields: Fields.allCases, image: "", isVerified: false, otp: "")
