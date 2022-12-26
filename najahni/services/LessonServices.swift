//
//  LessonServices.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
class LessonService{
    static func makeItem(jsonItem: JSON) -> Lesson {
        return Lesson(id: jsonItem["_id"].stringValue,
                      title: jsonItem["title"].stringValue,
                      sectionid: jsonItem["sectionid"].stringValue,
                      video: jsonItem["video"].stringValue,
                      duration: jsonItem["duration"].intValue )
        
    }
    static func addLesson(lesson : Lesson, video:Data,completed:@escaping(Bool,Int,Lesson?)->Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!),.contentType("multipart/form-data")]
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(video, withName: "video",fileName: "lesson.mp4",mimeType: "video/mp4")
                multipartFormData.append(lesson.title.data(using: String.Encoding.utf8)!, withName: "title")
            },to: URL_BASE_APP+"/lesson/add-lesson/\(lesson.sectionid)",method: .post, headers: headers)
        .validate(statusCode: 200..<300)
        .responseData { response in
            switch(response.result){
                
            case .success(let data):
                print(data)
                completed(true,200,makeItem(jsonItem: JSON(data)))
            case .failure(let error):
                print(error)
                completed(false,error.responseCode ?? 500,nil)
            }
        }
    }
}
