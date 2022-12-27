//
//  Quiz.swift
//  najahni
//
//  Created by bairem mohamed on 27/12/2022.
//

import Foundation
struct Quiz:Identifiable {
    var id = UUID().uuidString
    var courseid: String
    var questions = [Question]()
    init(id: String, courseid: String, questions: [Question]) {
        self.id = id
        self.courseid = courseid
        self.questions = questions
    }
    init(courseid: String, questions: [Question]) {
        self.courseid = courseid
        self.questions = questions
    }
}
struct Question:Identifiable {
    var id, quizid: String
    var question:String
    var propositions:[String]
    var indexResponse:Int
    init(id: String, quizid: String,question:String, propositions: [String], indexResponse: Int) {
        self.id = id
        self.quizid = quizid
        self.propositions = propositions
        self.indexResponse = indexResponse
        self.question = question
    }
    init(quizid: String,question:String, propositions: [String], indexResponse: Int) {
        self.id = UUID().uuidString
        self.quizid = quizid
        self.propositions = propositions
        self.question = question
        self.indexResponse = indexResponse
    }
}
