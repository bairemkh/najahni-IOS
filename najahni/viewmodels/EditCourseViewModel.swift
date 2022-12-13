//
//  EditCourseViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 5/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class EditCourseViewModel : ObservableObject{
    @Published var course:Course = CourseFix
    @Published var canPass = false
    @Published var errorMsg = ""
    @Published var showAlert = false
    @Published var price = ""
    @Published var selection = 0
    @Published var list = Level.allCases.map({ lvl in
        return ListData(name: lvl.rawValue)
    })
    @Published var fields = Fields.allCases.map { field in
        return ListData(name: field.rawValue)
    }
    @Published var selectedList:[ListData] = []
    func updateCourse(action:@escaping(String,Bool)->Void){
        course.price = Int(price) ?? 0
        course.fields = selectedList.map({ ld in
            return Fields(rawValue: ld.name)!
        })
        course.level = list[selection].name
        CourseService.updateCourse(course: course) { isOk, statusCode in
            if(isOk){
                action("Course Modified",true)
            }else{
                action("There is an error, the course isn't modified",false)
            }
        }
    }
}
