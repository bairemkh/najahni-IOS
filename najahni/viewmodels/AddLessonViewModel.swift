//
//  AddLessonViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 6/12/2022.
//

import Foundation
class AddLessonViewModel : ObservableObject{
    @Published var lessonName = ""
    @Published var lessonVideo : Data = Data()
    @Published var lessonVideoText = "Import Video"
    @Published var fileName = ""
    @Published var showFileUpload = false
    @Published var sectionId = ""
    func addLesson(completed:@escaping(Bool,String,Lesson?)->Void){
        if(lessonName.isEmpty)
        {
            completed(false,"The course name is empty",nil)
            return
        }
        LessonService.addLesson(lesson: Lesson(title: lessonName, sectionid: sectionId, video: "",duration: 0), video: lessonVideo) { isCompleted, statusCode, less in
            if(statusCode == 200){
                
                completed(true,"Lesson created",less)
            }else{
                completed(false,"There is a problem",nil)
            }
        }
    }
}
