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
    func addLesson(completed:@escaping(Bool,String)->Void){
        if(lessonName.isEmpty)
        {
            completed(false,"The course name is empty")
            return
        }
        LessonService.addLesson(lesson: Lesson(title: lessonName, sectionid: sectionId, video: ""), video: lessonVideo) { isCompleted, statusCode in
            if(statusCode == 200){
                completed(true,"Lesson created")
            }else{
                completed(false,"There is a problem")
            }
        }
    }
}
