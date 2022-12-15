//
//  EnrollServices.swift
//  najahni
//
//  Created by najahni on 15/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import SwiftUI
class EnrollService {
    static func makeItem(jsonItem: JSON) -> Enroll {
        do {
            return try Enroll(id: jsonItem["_id"].stringValue,
                              userid: jsonItem["userid"].stringValue,
                              courseid: CourseService.makeItem(jsonItem: jsonItem["courseid"]),
                              progress: jsonItem["progress"].intValue
                         )
        } catch {
            print(error)
             return EnrollFix
         }
        
    }
}
