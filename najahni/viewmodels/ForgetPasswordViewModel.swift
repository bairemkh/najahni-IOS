//
//  ForgetPasswordViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 18/11/2022.
//

import Foundation
class ForgetPasswordViewModel: ObservableObject {
    @Published  var email=""
    @Published  var onError = false
    @Published  var canPass = false
    @Published  var msgError = ""
    func onClickForget(email: String, onError:(String)-> Void){
        if(email.isEmpty){
            onError("Put an email")
            return
        }
       var code = UserService.forgetPassword(email: email)
        print(code)
        if (400 ... 499).contains(code) {
            onError("Mail not found")
            canPass = false
        }
        if(500 ... 599).contains(code){
            onError("Server error")
            canPass = false
        }
        if code == 0 {
            onError("Check your connection")
            canPass = false
        }
        if(200...299).contains(code){
            self.canPass = true
            print("Passed")
        }
    }
    
}
