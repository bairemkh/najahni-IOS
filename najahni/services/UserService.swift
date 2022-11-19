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
    
    static func forgetPassword(email:String, onAction: @escaping (Int , String)-> Void){
        let body : [String : Any] = [
            "email": email,
        ]
        AF.request(URL_BASE_APP + "/user/forget-password",method: .post,parameters: body,encoding: JSONEncoding.default )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result{
            case .success(let data):
                print("Success")
                let json = JSON(data)
                print(json["_id"])
                onAction(response.response?.statusCode ?? 500, json["_id"].stringValue)
            case .failure(let error):
                print("failed")
                onAction(response.response?.statusCode ?? 500,"no id")
                print(error.errorDescription!)
            }
            
        }
    }
    
}
