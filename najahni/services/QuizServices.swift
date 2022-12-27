//
//  QuizServices.swift
//  najahni
//
//  Created by bairem mohamed on 27/12/2022.
//

import Foundation
import SwiftyJSON
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
}
