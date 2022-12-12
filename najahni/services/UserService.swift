//
//  UserService.swift
//  najahni
//
//  Created by najahni on 15/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
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
        AF.request(URL_BASE_APP + "/user/reset-password",method: .post,parameters: body,encoding: JSONEncoding.default)
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
    static func resetPassword(password:String, action :@escaping(String,Bool)->Void){
            let body : [String : Any] = [
                "password" : password
            ]
            print("Token = \(SessionManager.token)")
            let headers : HTTPHeaders = [.authorization(bearerToken: SessionManager.token!)]
            AF.request(EDIT_PROFILE,
                       method: .put,
                       parameters: body,
            headers: headers)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result{
                        
                    case .success(let data):
                        action("You shall pass",true)
                    case .failure(let error):
                        print(error.errorDescription!)
                        action("Connectivity error",true)
                    }
                }
            
        }
    static func deleteAccount(action: @escaping (String,Bool)-> Void){
        print("Token = \(SessionManager.token)")
        let headers : HTTPHeaders = [.authorization(bearerToken: SessionManager.token!)]
        AF.request(DELETE_PROFILE,
                   method: .delete,
        headers: headers)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result{
                    
                case .success(let data):
                    print(JSON(data))
                    action("User deleted",true)
                case .failure(let error):
                    print(error.errorDescription!)
                    action("Connectivity error",false)
                }
            }
    }
    static func profile (completed: @escaping (Bool,User?)-> Void) {
        if(!SessionManager.isLoggedIn()){
            return
        }
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(PROFILE_URL,
                   method: .get,
                headers: headers)
        .validate(statusCode: 200..<300)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                do{
                    let  user = try self.makeItem(jsonItem: json["data"])
                    completed(true,user)
                }
                catch{
                    UserDefaults.standard.removeObject(forKey: "token")
                }
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
        }
    }
    static func profile() async{
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        do{
            var data = try await AF.request(PROFILE_URL,method: .get, headers: headers).serializingData(emptyResponseCodes: [200]).result
            
            switch (data){
                
            case .success(let data):
                let json = JSON(data)
                let  user = try self.makeItem(jsonItem: json["data"])
                SessionManager.currentUser = user
                print(SessionManager.currentUser)
            case .failure(let err):
                print(err)
            }
        }catch{
            print(error)
            UserDefaults.standard.removeObject(forKey: "token")
            SplashView()
        }
        //print(output.data)
        //return "\(output)"
    }
    static func makeItem(jsonItem: JSON) throws -> User {
        do{
            return try User(
                _id: jsonItem["_id"].stringValue,
                firstname: jsonItem["firstname"].stringValue,
                lastname: jsonItem["lastname"].stringValue,
                email: jsonItem["email"].stringValue,
                password: jsonItem["password"].stringValue,
                role:  Role(rawValue: jsonItem["role"].stringValue)!,
                fields: jsonItem["fields"].arrayValue.map({ json in
                    return Fields(rawValue: json.stringValue)!
                }),
                image: jsonItem["image"].stringValue,
                isVerified: jsonItem["isVerified"].boolValue,
                otp: jsonItem["otp"].stringValue,
                courses: jsonItem["courses"].arrayValue.map({ json in
                    return json.stringValue
                })
            )
        
        }catch{
            throw error
        }
        
    }
    
    static func editPhoto(image: UIImage? ,completed: @escaping (Bool)-> Void) {
        if(image!.jpegData(compressionQuality: 0.5) != nil){
            let token = UserDefaults.standard.string(forKey: "token")
            let headers : HTTPHeaders = [.authorization(bearerToken: token!),.contentType("multipart/form-data")]
            
            AF.upload(multipartFormData: {multipartFormData in
                multipartFormData.append(image!.jpegData(compressionQuality: 0.5)!, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
            },
                      to: UPLOAD_IMAGE, method: .post, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    print("upload")
                    completed(true)
                case let .failure(error):
                    print(error)
                    completed(false)
                }
            }
        }
        else{
            completed(false)
        }
    }
    
    static func editprofile(user:User){
        let token = UserDefaults.standard.string(forKey: "token")
        let parmetres : [String : Any] = [
            "firstname": user.firstname,
            "lastname": user.lastname,
            "fields":user.fields.map({ field in
                return field.rawValue
            })
        ]
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(EDIT_PROFILE,
                   method: .put,
                   parameters: parmetres,
        headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
              
                //completed(true,user)
            case .failure(let error):
                print(error)
                //completed(false,nil)
                
            }
        }
    }
}

