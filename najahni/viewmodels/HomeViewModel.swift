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
    func getallcourses (completed: @escaping (Bool,[Course]?)-> Void) {

        AF.request(ALL_COURSE,
                   method: .get)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                var courses :[Course]? = []
                for singleJsonItem in json["courses"]{
                    courses!.append(self.makeItem(jsonItem: singleJsonItem.1))
                }
                print(courses)
                completed(true,courses)
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
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
                      //idowner: jsonItem["idowner"].arrayObject,
                      isArchived: jsonItem["isArchived"].boolValue,
                      createdAt: jsonItem["createdAt"].stringValue,
                      updatedAt: jsonItem["updatedAt"].stringValue)
    }
}
