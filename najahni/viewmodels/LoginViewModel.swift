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
    @Published  var isLogin :Bool = false
    
    
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
                    UserDefaults.standard.setValue(token, forKey: "token")
                    print(token)
                    self.isLogin = true
                    completed(true,200)
                case .failure(let error):
                    print("request failed")
                    self.isLogin = false
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
    
    func editprofile(firstname: String,lastname: String){
        let token = UserDefaults.standard.string(forKey: "token")
        let parmetres : [String : Any] = [
            "firstname": firstname,
            "lastname": lastname
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
                print(json)
                //completed(true,user)
            case .failure(let error):
                print(error)
                //completed(false,nil)
                
            }
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
