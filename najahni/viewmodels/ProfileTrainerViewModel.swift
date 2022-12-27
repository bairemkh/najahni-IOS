//
//  ProfileTrainerViewModel.swift
//  najahni
//
//  Created by najahni on 28/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProfileTrainerViewModel : ObservableObject {
    var homeviewModel = HomeViewModel()
    
    func getMyCourses (completed: @escaping (Bool,[Course]?)-> Void) {
        CourseService.getMyCourses { ok, list in
            completed(ok,list)
        }
    }
    
    func getMyCoursesArchived (completed: @escaping (Bool,[Course]?)-> Void) {
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(ALL_MY_COURSE_ARCHIVED,
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
