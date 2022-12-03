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
    @Published var name = ""
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
}
