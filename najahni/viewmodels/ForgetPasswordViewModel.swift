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
    @Published  var idUser:String = ""
    func onClickForget(email: String, onError: @escaping (String)-> Void){
        if(email.isEmpty){
            onError("Put an email")
            return
        }
        UserService.forgetPassword(email: email){ code,id in
            print(code)
            if (400 ... 499).contains(code) {
                onError("Mail not found")
                self.canPass = false
            }
            if(500 ... 599).contains(code){
                onError("Server error")
                self.canPass = false
            }
            
            if(200...299).contains(code){
                self.idUser = id
                self.canPass = true
                print("Passed")
            }
        }
        
        
    }
    
}
