//
//  LessonServices.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
import SwiftyJSON
class LessonService{
    static func makeItem(jsonItem: JSON) -> Lesson {
        return Lesson(id: jsonItem["_id"].stringValue,
                      title: jsonItem["title"].stringValue,
                      sectionid: jsonItem["sectionid"].stringValue,
                      video: jsonItem["video"].stringValue)
        
    }
}
