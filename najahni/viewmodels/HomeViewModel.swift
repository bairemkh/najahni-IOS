//
//  HomeViewModel.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeViewModel : ObservableObject {
    var userViewModel = LoginViewModel()
    
    func getallcourses (completed: @escaping (Bool,[Course]?)-> Void) {

        CourseService.getallcourses { ok, list in
            completed(ok,list)
        }
    }

    func makeItem(jsonItem: JSON) -> Course {
        return Course(id: jsonItem["_id"].stringValue,
                      title: jsonItem["title"].stringValue,
                      fields: jsonItem["fields"].arrayValue.map({ json in
            return Fields(rawValue: json.stringValue)!
        }),
                      level: jsonItem["level"].stringValue,
                      description: jsonItem["description"].stringValue,
                      isPaid: jsonItem["isPaid"].boolValue,
                      image: jsonItem["image"].stringValue,
                      price: jsonItem["price"].intValue,
                      idowner: userViewModel.makeItem(jsonItem: jsonItem["idowner"]),
                      isArchived: jsonItem["isArchived"].boolValue,
                      createdAt: jsonItem["createdAt"].stringValue,
                      updatedAt: jsonItem["updatedAt"].stringValue)
    }
}
