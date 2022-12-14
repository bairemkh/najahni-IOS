//
//  MyCoursesViewModel.swift
//  najahni
//
//  Created by najahni on 29/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class MyCoursesViewModel : ObservableObject {
    var homeviewModel = HomeViewModel()
    func getMyCoursesList (completed: @escaping (Bool,[Course]?)-> Void) {
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(MY_COURSES_LIST,
                   method: .get,
                headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                //print(json)
                var courses :[Course]? = []
                for singleJsonItem in json["courses"]{
                    courses!.append(self.homeviewModel.makeItem(jsonItem: singleJsonItem.1))
                }
                //print(courses)
                completed(true,courses)
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
        }
    }

}
