//
//  EditAccountViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
class EditAccountViewModel: ObservableObject {
    @Published  var email=""
    @Published  var name : String
    @Published  var lastName : String
    func onUpdate() -> Bool {
        return true
    }
    init(email: String = "", name: String, lastName: String) {
        self.email = email
        self.name = name
        self.lastName = lastName
    }
        
}
