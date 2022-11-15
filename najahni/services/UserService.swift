//
//  UserService.swift
//  najahni
//
//  Created by najahni on 15/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class UserService {
    
    static func forgetPassword(email:String){
        let body : [String : Any] = [
            "email": email,
        ]
        AF.request(URL_BASE_APP + "/user/forget-password",method: .post,parameters: body,encoding: JSONEncoding.default )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result{
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
        
    }
}
