//
//  SectionCardView.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import SwiftUI

struct SectionCardView: View {
    var section : Section
    @State var duration : Int = 0
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .bold()
                    .font(.system(size: 25))
                Spacer()
                Text(convertTime(value:duration))
            }
            .padding(.horizontal)
            
           //List{
            ScrollView(.vertical,showsIndicators: false){
                ForEach(section.lessons){ lesson in
                    LessonsViewPart(lesson: lesson,indexLesson: section.lessons.firstIndex(where: { l in
                        return l.id == lesson.id
                    }) ?? -1,course: section.idCourse)
                }
            }
            //}
        }.onAppear{
            section.lessons.forEach { l in
                duration += l.duration
            }
        }
    }
}

struct SectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SectionCardView(section: Section(id: "2", title: "Section 1", idCourse: "", lessons: [Lesson(title: "Lesson 1", sectionid: "1", video: "",duration: 0),Lesson(title: "Lesson 2", sectionid: "1", video: "",duration: 0)]),duration: 0)
    }
}
