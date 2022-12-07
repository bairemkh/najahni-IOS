//
//  CommentServices.swift
//  najahni
//
//  Created by najahni on 6/12/2022.
//

import Foundation
import SwiftyJSON
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
}
