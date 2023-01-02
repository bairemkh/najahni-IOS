//
//  ReviewViewModel.swift
//  najahni
//
//  Created by najahni on 27/12/2022.
//

import Foundation
class ReviewViewModel: ObservableObject {
    @Published var course : Course = CourseFix
    @Published var ratingTrainer = 0
    @Published var ratingComp = 0
    @Published var ratingContent = 0
    @Published var content : String = ""
    func addReview(completed:@escaping(Bool,Int)->Void){
        CourseService.addReview(course: course,ratingComp: ratingComp, ratingTrainer: ratingTrainer, ratingContent: ratingContent, completed: { isOk, status in
            completed(isOk,status)
        })
    }
    
    func addComment(completed:@escaping(Bool,Int) -> Void) {
        CommentService.addComment(course: course, content: content) { isOk, status in
            completed(isOk,status)
        }
    }
}
