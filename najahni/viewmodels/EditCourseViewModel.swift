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
    @Published var price = ""
    @Published var selection = 0
    @Published var list = Level.allCases.map({ lvl in
        return ListData(name: lvl.rawValue)
    })
    @Published var fields = Fields.allCases.map { field in
        return ListData(name: field.rawValue)
    }
    @Published var selectedList:[ListData] = []
    func addCourse(action:@escaping(String,Bool)->Void){
        
    }
}
