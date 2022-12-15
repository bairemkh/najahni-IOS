//
//  MessageServices.swift
//  najahni
//
//  Created by bairem mohamed on 13/12/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
class MessageServices{
    static func makeItem(jsonItem: JSON) -> Message {
        do {
            return try Message(id: jsonItem["id"].stringValue,msgContent: jsonItem["msgContent"].stringValue,senderid:jsonItem["senderid"].stringValue ,receiverid: jsonItem["receiverid"].stringValue)
        } catch {
            print(error)
             return Message(msgContent: "", senderid: "", receiverid: "")
         }
        
    }
    
    static func getContacts (completed: @escaping (Bool,[User]?,[String:[Message]]?)-> Void) {
        if(!SessionManager.isLoggedIn()){
            return
        }
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(MESSAGE_CONTACTS,
                   method: .get,
                headers: headers)
        .validate(statusCode: 200..<300)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)["Contacts"].arrayValue
                print("1------------- \(json)")
                var users = [User]()
                var contacts = [String:[Message]]()
                do{
                try json.forEach { jsonItem in
                    var user = try UserService.makeItem(jsonItem: jsonItem["User"])
                 users.append(user)
                    print("2------------- \(jsonItem["Messages"].arrayValue)")
                    contacts.updateValue(jsonItem["Messages"].arrayValue.map({ jsonMsg in
                        return makeItem(jsonItem: jsonMsg)
                    }), forKey: user.id)
                }
                completed(true,users,contacts)
                }
                catch{
                    print(error)
                completed(false,nil,nil)
                }
            case .failure(let error):
                print(error)
                //completed(false)
                completed(false,nil,nil)
                
            }
        }
    }
}
