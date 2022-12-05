//
//  SectionService.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
import SwiftyJSON
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
}
