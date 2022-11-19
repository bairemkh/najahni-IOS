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
    
    static func verifyOtp(userId : String ,otp : String , action: @escaping(String)-> Void){
        let body : [String : Any] = [
            "id" : userId,
            "otp" : otp
        ]
        AF.request(URL_BASE_APP + "/user/reset-password",method: .post,parameters: body,encoding: JSONEncoding.default )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result{                    
                case .success(let data):
                    print(JSON(data)["data"].stringValue)
                    UserDefaults.standard.setValue(JSON(data)["data"].stringValue, forKey: "token")
                case .failure(let error):
                    print(error.errorDescription!)
                    if error.responseCode == 403{
                        action("Wrong password")
                    }else{
                        action("Check your connection please")
                    }
                }
            }
    }
    
}
