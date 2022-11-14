//
//  LoginViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
import Alamofire
class LoginViewModel: ObservableObject {
    @Published  var email=""
    @Published  var password=""
    
    func login(email:String,password:String) {
        let parmetres : [String : Any] = [
            "email": email,
            "password": password
        ]
        AF.request("http://172.17.0.167:9090/user/signin", method: .post, parameters: parmetres, encoding: JSONEncoding.default)
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let json):
                    print("sucess \(json)")
                case .failure(let error):
                    print("request failed")
                    
                }
            }
        
    }
        
}
