//
//  SectionService.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
class SectionService{
    static func makeItem(jsonItem: JSON) -> Section {
        return Section(id: jsonItem["_id"].stringValue,
                      title: jsonItem["title"].stringValue,
                       idCourse: jsonItem["courseid"].stringValue,
                       lessons: jsonItem["lessons"].arrayValue.map({ json in
            return LessonService.makeItem(jsonItem: json)
        })
        )
    }
    static func addSection(section:Section,completed:@escaping(Bool)->Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let parmetres : [String : Any] = [
            "title": section.title
        ]
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(URL_BASE_APP+"/section/add-section/\(section.idCourse)",method: .post, parameters: parmetres, headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                print("Data------>\(data)")
                completed(true)
            case .failure(let error):
                print("error------>\(error)")
                completed(false)
                
            }
        }
    }
}
