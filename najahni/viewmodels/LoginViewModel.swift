//
//  LoginViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit


class LoginViewModel: ObservableObject {
    @Published  var email=""
    @Published  var password=""
    @Published  var selected:[ListData] = []
    
    func login(email:String,password:String, completed: @escaping (Bool , Int
) -> Void) {
        let parmetres : [String : Any] = [
            "email": email,
            "password": password
        ]
        AF.request(LOGIN_URL, method: .post, parameters: parmetres, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    let token = json["data"].stringValue
                    let role = json["role"].stringValue
                    UserDefaults.standard.setValue(token, forKey: "token")
                    UserDefaults.standard.setValue(role, forKey: "role")
                    SessionManager.initLists()
                   /* UserService.profile { _, user in
                        SessionManager.currentUser = user
                    }*/
                    Task{
                        await UserService.profile()
                    }
                    print(token)
                    print(role)
                    completed(true,200)
                case .failure(let error):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,res.error?.responseCode ?? 500)
                /*case .success(let json):
                    print("sucess \(json)")
                case .failure(let error):
                    print("request failed")*/
                    
                }
            }
        
    }
    
    func profile (completed: @escaping (Bool,User?)-> Void) {
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(PROFILE_URL,
                   method: .get,
                headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                let user = self.makeItem(jsonItem: json["data"])
                print(user)
                completed(true,user)
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
        }
    }
    
   /* func editprofile(firstname: String,lastname: String){
        let token = UserDefaults.standard.string(forKey: "token")
        let parmetres : [String : Any] = [
            "firstname": firstname,
            "lastname": lastname,
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
    }*/
    
    func editPhoto(image: UIImage? ,completed: @escaping (Bool)-> Void) {
        UserService.editPhoto(image: image) { isOk in
            completed(isOk)
        }
     }
    

    
    func makeItem(jsonItem: JSON) -> User {
        return User(
            _id: jsonItem["_id"].stringValue,
            firstname: jsonItem["firstname"].stringValue,
            lastname: jsonItem["lastname"].stringValue,
            email: jsonItem["email"].stringValue,
            password: jsonItem["password"].stringValue,
            role: Role(rawValue: jsonItem["role"].stringValue)!,
            fields: jsonItem["fields"].arrayValue.map({ json in
                return Fields(rawValue: json.stringValue)!
            }),
            image: jsonItem["image"].stringValue,
            isVerified: jsonItem["isVerified"].boolValue,
            otp: jsonItem["otp"].stringValue)
    }
    
        
}
