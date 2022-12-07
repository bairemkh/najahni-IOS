//
//  DetailCourseLessonsView.swift
//  najahni
//
//  Created by najahni on 7/12/2022.
//

import SwiftUI
import SlidingTabView

struct DetailCourseLessonsView: View {
    var course : Course
    @State private var selectedTabIndex = 0
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Lessons", "Reviews"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                if(selectedTabIndex == 0){
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(course.sections) { section in
                            SectionCardView(section: section)
                        
                        }
                    }
                }else{
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(course.comments) { comment in
                            CommentCardView(comment: comment)
                                .padding(.all)
                        
                        }
                    }
                }
            }
        }.navigationBarTitle(
            Text(course.title),
            displayMode: .inline
          )
    }
}

struct DetailCourseLessonsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCourseLessonsView(course: CourseFix)
    }
}
