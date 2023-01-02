//
//  CommentServices.swift
//  najahni
//
//  Created by najahni on 6/12/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
class CommentService{
    static func makeItem(jsonItem: JSON) -> Comment {
        do {
            return try Comment(id: jsonItem["_id"].stringValue,
                                       content:jsonItem["content"].stringValue,
                                       courseid: jsonItem["courseid"].stringValue,
                                        userid: UserService.makeItem(jsonItem: jsonItem["userId"]),
                                        createdAt: jsonItem["createdAt"].stringValue,
                                        updatedAt: jsonItem["updatedAt"].stringValue
                         )
        } catch {
            print(error)
             return CommentFix
         }
        
    }
    
    static func addComment(course: Course,content:String,completed:@escaping(Bool,Int) -> Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: SessionManager.token!)]
        let parmetres : [String : Any] = [
            "content": content,
        ]
        AF.request(ADD_COMMENTS + course.id, method: .post, parameters: parmetres, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    completed(true,200)
                case .failure(let error):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,res.error?.responseCode ?? 500)
                }
                
            }
    }
    
}
