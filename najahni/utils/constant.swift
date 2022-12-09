//
//  File.swift
//  najahni
//
//  Created by bairem mohamed on 14/11/2022.
//

import Foundation


let URL_BASE_APP = "http://172.17.3.56:9090"
//let URL_BASE_APP = "http://localhost:9090"
let LOGIN_URL = URL_BASE_APP + "/user/signin"
let PROFILE_URL = URL_BASE_APP + "/user/profile"
let EDIT_PROFILE = URL_BASE_APP + "/user/editprofile"
let DELETE_PROFILE = URL_BASE_APP + "/user/delete-account"
let EDIT_PASSWORD = URL_BASE_APP + "/user/change-password"
let UPLOAD_IMAGE = URL_BASE_APP + "/user/change-photo"
let GOOGLE_SIGNIN = URL_BASE_APP + "/user/google-signin"
let ALL_COURSE = URL_BASE_APP + "/course/getall"
let ALL_MY_COURSE = URL_BASE_APP + "/course/mycourses"
let ALL_MY_COURSE_ARCHIVED = URL_BASE_APP + "/course/mycourses-archived"
let MY_COURSES_LIST = URL_BASE_APP + "/course/mycourseslist"
let ENROLL_NOW = URL_BASE_APP + "/course/enrollnow/"

let WISHLIST = "wishlist"
let CART = "cart"

var UserFix = User(firstname: "User", lastname: "Test", email: "user.test@test.com", password: "", role: Role.Trainer, fields: Fields.allCases, image: "https://cdn-icons-png.flaticon.com/512/147/147144.png", isVerified: false, otp: "")
var CourseFix = Course(id: "", title: "Title course", fields: Fields.allCases, level: "", description: "", isPaid: false, image: "", price: 0,idowner: UserFix, isArchived: false, createdAt: "", updatedAt: "")

var videofix = URL_BASE_APP + "/vid/VIDEO_1669506604612.mp4"
var SectionFix = Section(id: "", title: "", idCourse: "")
var CommentFix = Comment(id: "", content: "", courseid: "", userid: UserFix, createdAt: "", updatedAt: "")

var defaultImage = "data:image/jpeg;base64,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"
