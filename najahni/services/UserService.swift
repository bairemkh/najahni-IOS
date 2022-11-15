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
  /* static func signup(firstname: String, lastname: String, email: String, password: String, role: Role, fields: [Fields], image: String, isVerified: Bool) -> String {
       var isSuccess = ""
       let body : [String : Any] = [
           "firstName": firstname,
           "lastName": lastname,
           "email": email,
           "password": password,
           "role": role,
           "fields": fields
       ]
       AF.request(URL_BASE_APP + "/user/signup", method: .post, parameters: body,
                  encoding: JSONEncoding.default)
           .validate(statusCode: 200..<300)
           .validate(contentType: ["application/json"])
           .responseData { response in
               switch response.result{
               case .success(let data):
                   print("testing")
                   let json = JSON(data)
                   
               case .failure(let error):
                   print(error.errorDescription!)
               }
           }
       
      return isSuccess
    }*/
}
