//
//  SignupViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class SignupViewModel: ObservableObject {
    @Published  var email=""
    @Published  var name=""
    @Published  var lastName=""
    @Published  var password=""
    @Published  var verifPassword=""
    @Published  var roleList=["Trainer","Student"]
    @Published  var role = 0
    @Published  var fieldsList: [ListData] = Fields.allCases.map { feild in
        return ListData(name: feild.rawValue)
    }
    @Published var selectedFields : [ListData] = []
    func getListString() -> String {
        if(selectedFields.count == 1){
            return selectedFields[0].name
        }
        return selectedFields.count.description + " Items"
    }
    @Published var ibaction=0
    @Published  var sexeList = ["Female", "Male"]
    @Published  var sexe=0
    
    
    func signup(firstname: String, lastname: String, email: String, password: String, role: Role, fields: [Fields], image: String, isVerified: Bool)  {
        
        let body : [String : Any] = [
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "password": password,
            "role": role.rawValue,
            "fields": fields.map({ f in
                return f.rawValue
            })
        ]
        print(body)
        
        AF.request(URL_BASE_APP + "/user/signup", method: .post, parameters: body,
                   encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                print(response)
                switch response.result{
                case .success(let data):
                    print("testing")
                    let json = JSON(data)
                    
                case .failure(let error):
                    print(error.errorDescription!)
                }
            }
        
     }
}
