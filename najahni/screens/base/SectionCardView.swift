//
//  SectionCardView.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import SwiftUI

struct SectionCardView: View {
    var section : Section
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                Spacer()
                Text("15 min")
            }
            .padding(.horizontal)
            
           //List{
            ScrollView(.vertical,showsIndicators: false){
                ForEach(section.lessons){ lesson in
                    LessonsViewPart(lesson: lesson,indexLesson: section.lessons.firstIndex(where: { l in
                        return l.id == lesson.id
                    }) ?? -1)
                }
            }
            //}
            .padding(.horizontal)
        }
    }
}

struct SectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SectionCardView(section: Section(id: "2", title: "Section 1", idCourse: "", lessons: [Lesson(title: "Lesson 1", sectionid: "1", video: ""),Lesson(title: "Lesson 2", sectionid: "1", video: "")]))
    }
}
