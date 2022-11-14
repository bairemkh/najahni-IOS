//
//  EditAccountViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
class EditAccountViewModel: ObservableObject {
    @Published  var email=""
    @Published  var name=""
    @Published  var lastName=""
    func onUpdate() -> Bool {
        return true
    }
    
        
}
