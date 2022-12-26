//
//  AddCourseViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 3/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class AddCourseViewModel : ObservableObject{
    @Published var file = "Import"
    @Published var price = ""
    @Published var name = ""
    @Published var course:Course?
    @Published var selection = 0
    @Published var list = Level.allCases.map({ lvl in
        return ListData(name: lvl.rawValue)
    })
    @Published var fields = Fields.allCases.map { field in
        return ListData(name: field.rawValue)
    }
    @Published var selectedList:[ListData] = []
    @Published var showFileUpload = false
    @Published var description = ""
    @Published var image : UIImage = UIImage.init(named:"empty") ?? UIImage()
    @Published var canPass = false
    @Published var errorMsg = ""
    @Published var showAlert = false
    
    /*func addCourse(action:@escaping(String,Bool)->Void){
        if(name.isEmpty || description.isEmpty){
            action("Some fields aren't filled , please check",false)
            return
        }
        CourseService.addCourse(course: Course(title: name, fields: selectedList.map({ ld in
            return Fields(rawValue: ld.name)!
        }), level: list[selection].name, description: description, isPaid: !price.isEmpty||price == "0", price: Int(price) ?? 0 , isArchived: true), image: image) { passed, statusCode,c  in
            if(passed == true){
                self.course = c
                action("Course created !",true)
            }else{
                action("There was an error",false)
            }
        }
    }*/
    func addCourse(action:@escaping(String,Bool)->Void){
        action("Let's go",true)
    }
}
