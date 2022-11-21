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
    
    static func verifyOtp(userId : String ,otp : String , action: @escaping(String,Bool)-> Void){
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
                    let json = JSON(data)
                    let token = json["data"].stringValue ?? "token"
                    print(token)
                    UserDefaults.standard.setValue(token, forKey: "token")
                    action("next please",true)
                case .failure(let error):
                    print(error.errorDescription!)
                    if error.responseCode == 403{
                        action("Wrong password",false)
                    }else{
                        action("Check your connection please",false)
                    }
                }
            }
    }
    static func resetPassword(password:String){
        let body : [String : Any] = [
            "password" : password
        ]
        let token = UserDefaults.standard.string(forKey: "token")
        print(token)
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(EDIT_PROFILE,
                   method: .put,
                   parameters: body,
        headers: headers)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result{
                    
                case .success(let data):
                    print(JSON(data))
                case .failure(let error):
                    print(error.errorDescription!)
                    print(error)
                }
            }
        
    }
}
