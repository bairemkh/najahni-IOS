//
//  QuizServices.swift
//  najahni
//
//  Created by bairem mohamed on 27/12/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
class QuizServices{
    static func makeQuiz(jsonItem: JSON) -> Quiz {
        return Quiz(id: jsonItem["_id"].stringValue,
                    courseid: jsonItem["courseid"].stringValue,
                    questions: jsonItem["questions"].arrayValue.map({ element in
            return makeQuestion(jsonItem: element)
        }))
    }
    static func makeQuestion(jsonItem: JSON) -> Question {
        return Question(id: jsonItem["_id"].stringValue,
                        quizid: jsonItem["quizid"].stringValue, question: jsonItem["question"].stringValue,
                        propositions: jsonItem["props"].arrayValue.map({ element in
            return element.stringValue
        }),
                        indexResponse: jsonItem["correctIndex"].intValue)
    }
    
    static func sendCertif(courseid:String,completed:@escaping(Bool,Int)->Void){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: SessionManager.token!)]
        AF.request(URL_BASE_APP + "/enroll/certif/"+courseid, method: .post, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    completed(true,200)
                case .failure(let error):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,res.error?.responseCode ?? 500)
                }
                
            }
    }
    static func addQuiz(courseid:String,completed:@escaping(Bool,Quiz?)->Void){
        AF.request(URL_BASE_APP + "/course/addQuiz/"+courseid, method: .post, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    completed(true,QuizServices.makeQuiz(jsonItem: JSON(data)))
                case .failure(_):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,nil)
                }
                
            }
    }
    
    static func addQuestion(quizid:String,question:Question,completed:@escaping(Bool,Question?)->Void){
        let body : [String : Any] = [
            "question": question.question,
            "correctIndex": question.indexResponse,
            "props": question.propositions.map({ f in
                return f
            })
        ]
        AF.request(URL_BASE_APP + "/course/addQuestionToQuiz/"+quizid, method: .post,parameters: body, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{
                (res) in
                switch res.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    completed(true,QuizServices.makeQuestion(jsonItem: JSON(data)))
                case .failure(_):
                    print("request failed")
                    print(res.error?.responseCode)
                    completed(false,nil)
                }
                
            }
    }
}
