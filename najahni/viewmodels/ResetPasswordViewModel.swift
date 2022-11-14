//
//  ResetPasswordViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
class ResetPasswordViewModel: ObservableObject {
    @Published  var oldPassword=""
    @Published  var newPassword=""
    @Published  var confirmPassword=""
    
    func onChangePassword(password:String,confirmation:String)->Bool{
        if password.elementsEqual(confirmation){
            return true
        }
        else{
            return false
        }
    }
        
}

