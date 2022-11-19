//
//  ResetPasswordViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class ResetPasswordViewModel: ObservableObject {
    @Published  var oldPassword=""
    @Published  var newPassword=""
    @Published  var confirmPassword=""
    
    func editpassword(password: String,newpassword: String){
        let token = UserDefaults.standard.string(forKey: "token")
        let parmetres : [String : Any] = [
            "password": password,
            "newpassword": newpassword
        ]
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(EDIT_PASSWORD,
                   method: .put,
                   parameters: parmetres,
        headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                //completed(true,user)
            case .failure(let error):
                print(error)
                //completed(false,nil)
                
            }
        }
    }
    func resetPassword(password:String,confirmPassword:String, action:(String,Bool)->Void) {
        if(password.isEmpty || confirmPassword.isEmpty){
            action("Please fill the fields above", false)
            return
        }
        if(!password.elementsEqual(confirmPassword)){
            action("The passwords are not the same", true)
            return
        }
        UserService.resetPassword(password: password)
    }
    
        
}

