//
//  SignupViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import Foundation
class SignupViewModel: ObservableObject {
    @Published  var email=""
    @Published  var name=""
    @Published  var lastName=""
    @Published  var password=""
    @Published  var verifPassword=""
    @Published  var roleList=["Trainer","Student"]
    @Published  var role=0
    @Published  var fields: [Fields] = Fields.allCases
    @Published  var sexeList = ["Female", "Male"]
    @Published  var sexe=0
        
}
