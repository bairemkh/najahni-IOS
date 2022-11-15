//
//  LoginViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginViewModel: ObservableObject {
    @Published  var email=""
    @Published  var password=""
    
    func login(email:String,password:String, completed: @escaping (Bool) -> Void) {
        let parmetres : [String : Any] = [
            "email": email,
            "password": password
        ]
        AF.request(LOGIN_URL, method: .post, parameters: parmetres, encoding: JSONEncoding.default)
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    let token = json["data"].stringValue
                    UserDefaults.standard.setValue(token, forKey: "token")
                    print(token)
                    completed(true)
                case .failure(let error):
                    print("request failed")
                    completed(false)
                /*case .success(let json):
                    print("sucess \(json)")
                case .failure(let error):
                    print("request failed")*/
                    
                }
            }
        
    }
        
}
