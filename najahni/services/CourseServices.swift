//
//  CourseServices.swift
//  najahni
//
//  Created by bairem mohamed on 29/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import SwiftUI
class CourseService {
    static func getallcourses (completed: @escaping (Bool,[Course]?)-> Void) {
        
        AF.request(ALL_COURSE,
                   method: .get)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                var courses :[Course]? = []
                for singleJsonItem in json["courses"]{
                    courses!.append(self.makeItem(jsonItem: singleJsonItem.1))
                }
                //print(courses)
                completed(true,courses)
            case .failure(let error):
                completed(false,nil)
                
            }
        }
    }
    
    static func getMyCourses (completed: @escaping (Bool,[Course]?)-> Void) {
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(ALL_MY_COURSE,
                   method: .get,
                   headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                var courses :[Course]? = []
                for singleJsonItem in json["courses"]{
                    courses!.append(makeItem(jsonItem: singleJsonItem.1))
                }
                //print(courses)
                completed(true,courses)
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
        }
    }
    
    static func makeItem(jsonItem: JSON) -> Course {
        do{
            
            return try Course(id: jsonItem["_id"].stringValue, title: jsonItem["title"].stringValue, fields: jsonItem["fields"].arrayValue.map({ json in
                return Fields(rawValue: json.stringValue)!
            }), level: jsonItem["level"].stringValue, description: jsonItem["description"].stringValue, isPaid: jsonItem["isPaid"].boolValue, image: jsonItem["image"].stringValue, price: jsonItem["price"].intValue, idowner: UserService.makeItem(jsonItem: jsonItem["idowner"]), isArchived: jsonItem["isArchived"].boolValue, createdAt: jsonItem["createdAt"].stringValue, updatedAt: jsonItem["updatedAt"].stringValue, sections: jsonItem["sections"].arrayValue.map({ json in
                return SectionService.makeItem(jsonItem: json)
            }),
                              comments: jsonItem["comments"].arrayValue.map({ json in
                return CommentService.makeItem(jsonItem: json)
            })
                              
            )
        }catch{
            print(error)
            return CourseFix
        }
    }
    
    static func addCourse(course : Course , image :UIImage , completed:@escaping(Bool,Int)->Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!),.contentType("multipart/form-data")]
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(image.jpegData(compressionQuality: 0.5)!, withName: "image",fileName: "course.jpg",mimeType: "image/jpg")
                multipartFormData.append(course.title.data(using: String.Encoding.utf8)!, withName: "title")
                multipartFormData.append(course.description.data(using: String.Encoding.utf8)!, withName: "description")
                multipartFormData.append(course.isArchived.description.data(using: String.Encoding.utf8)!, withName: "isArchived")
                multipartFormData.append(course.isPaid.description.data(using: String.Encoding.utf8)!, withName: "isPaid")
                multipartFormData.append(course.level.data(using: String.Encoding.utf8)!, withName: "level")
                multipartFormData.append(course.price.description.data(using: String.Encoding.utf8)!, withName: "price")
                for field in course.fields{
                    multipartFormData.append(field.rawValue.data(using: String.Encoding.utf8)!, withName: "fields")
                }
            },to: URL_BASE_APP+"/course/add-course",method: .post, headers: headers)
        .validate(statusCode: 200..<300)
        .responseData { response in
            switch(response.result){
                
            case .success(let data):
                print(data)
                completed(true,200)
            case .failure(let error):
                print(error)
                completed(false,error.responseCode!)
            }
        }
    }
    
    static func updateCourse(course : Course , completed:@escaping(Bool,Int)->Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!),.contentType("multipart/form-data")]
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(course.title.data(using: String.Encoding.utf8)!, withName: "title")
                multipartFormData.append(course.description.data(using: String.Encoding.utf8)!, withName: "description")
                multipartFormData.append(course.isArchived.description.data(using: String.Encoding.utf8)!, withName: "isArchived")
                multipartFormData.append(course.isPaid.description.data(using: String.Encoding.utf8)!, withName: "isPaid")
                multipartFormData.append(course.level.data(using: String.Encoding.utf8)!, withName: "level")
                multipartFormData.append(course.price.description.data(using: String.Encoding.utf8)!, withName: "price")
                for field in course.fields{
                    multipartFormData.append(field.rawValue.data(using: String.Encoding.utf8)!, withName: "fields")
                }
            },to: URL_BASE_APP+"/course/update-myCourse/\(course.id)",method: .put, headers: headers)
        .validate(statusCode: 200..<300)
        .responseData { response in
            switch(response.result){
                
            case .success(let data):
                print(data)
                completed(true,200)
            case .failure(let error):
                print(error)
                completed(false,error.responseCode!)
            }
        }
    }
    
    static func payementApi(amount: Int,completed: @escaping (Bool ,Int,String?
    ) -> Void) {
        let parmetres : [String : Any] = [
            "amount": amount
        ]
        AF.request(PAIEMENT_COURSE, method: .post, parameters: parmetres, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    completed(true,200,json["payUrl"].stringValue)
                case .failure(let error):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,res.error?.responseCode ?? 500,nil)
                }
                
            }
        
        
    }
    
   static func enrollNow(id: String){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(ENROLL_NOW + id,
                   method: .post,
        headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                SessionManager.currentUser?.courses.append(id)
                //completed(true,user)
            case .failure(let error):
                print(error)
                //completed(false,nil)
                
            }
        }
    }
}
