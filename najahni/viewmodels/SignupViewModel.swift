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
    @Published  var role = 0
    @Published  var fieldsList: [ListData] = Fields.allCases.map { feild in
        return ListData(name: feild.rawValue)
    }
    @Published var selectedFields : [ListData] = []
    func getListString() -> String {
        if(selectedFields.count == 1){
            return selectedFields[0].name
        }
        return selectedFields.count.description + " Items"
    }
    @Published var ibaction=0
    @Published  var sexeList = ["Female", "Male"]
    @Published  var sexe=0
    
    func onSignUp() -> User {
        return User(firstname: name, lastname: lastName, email: email, password: password, role: <#T##Role#>, fields: <#T##[Fields?]#>, image: <#T##String#>, isVerified: <#T##Bool#>, otp: <#T##String#>,);
    }
}
