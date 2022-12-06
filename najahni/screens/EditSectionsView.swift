//
//  EditSectionsView.swift
//  najahni
//
//  Created by bairem mohamed on 6/12/2022.
//

import SwiftUI

struct EditSectionsView: View {
    @State var showingAlert = false
    @State var sections:[Section]
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        ZStack{
            List {
                ForEach(sections) { section in
                    EditSectionsViewPart(section: section)
                }
                .onDelete(perform: { ind in
                    showingAlert = true
                    indexDelete = ind
                })
                .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this?"),
                        message: Text("There is no undo"),
                        primaryButton: .destructive(Text("Delete")) {
                            print("Deleting...")
                            sections.remove(atOffsets: indexDelete)
                        },
                        secondaryButton: .cancel()
                    )
                }
                
            }
            
        }
    }
}

struct EditSectionsView_Previews: PreviewProvider {
    static var previews: some View {
        /*EditSectionsView(sections: [Section(id: "1", title: "Section 1", idCourse: "hello",lessons: [Lesson(id: "", title: "Kotlin", sectionid: "gfgfg", video: "")]),Section(id: "2", title: "Section 2", idCourse: "hello"),Section(id: "3", title: "Section 3", idCourse: "hello",lessons: [Lesson(id: "", title: "Java", sectionid: "gfgfg", video: ""),Lesson(id: "", title: "Swift", sectionid: "gfgfg", video: "")])])*/
        /*EditSectionsViewPart(section: Section(id: "1", title: "Section 1", idCourse: "hello",lessons: [Lesson(id: "", title: "Kotlin", sectionid: "gfgfg", video: "")]))*/
        addLesson()
        
    }
}
struct EditSectionsViewPart: View {
    @State var isTapped = false
    @State var section:Section
    
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        HStack{
            if(!isTapped)
            {Text(section.title)
                    .font(.title)
                Spacer()
                Image(systemName: "arrowtriangle.right.fill")
                    .onTapGesture {
                        withAnimation {
                            isTapped.toggle()
                        }
                    }
            }else{
                VStack{
                    HStack {
                        Text("  Lessons:")
                            .bold()
                            .font(.title2)
                            .onTapGesture {
                                withAnimation {
                                    isTapped.toggle()
                                }
                            }
                    Spacer()
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                    }
                    
                    ForEach(section.lessons) { lesson in
                        EditLessonsViewPart(lesson: lesson)
                    }
                    
                }
                Spacer()
                    
            }
        }
            
        .animation(.easeInOut(duration: 0.5))
        
    }
        
    }


struct EditLessonsViewPart: View {
    @State var isTapped = false
    @State var lesson:Lesson
    
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        HStack{
                Text(lesson.title)
                .font(.title3)
            Spacer()
            Text("2h30")
        }
        .padding(.horizontal)
    }
}
struct addLesson: View {
    @State var lessonName = "Import Video"
    @State var fileName = ""
    @State var showFileUpload = false
    var body: some View {
        VStack{
            Group{
                Text("Add a lesson")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                HStack {
                    Text("Add a lesson by typing his name and importing its video")
                        .foregroundColor(.white)
                    .font(.system(size: 20))
                    Spacer()
                }
                TextField("Name", text: $lessonName)
                    .padding(.all)
                    .background(Color(.white))
                    .foregroundColor(Color("primaryColor"))
                    .cornerRadius(10)
                Button(action: {
                    showFileUpload = true
                }) {
                    Text(lessonName)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    Image(systemName: "arrow.down.to.line")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 25)
                        .fileImporter(isPresented: $showFileUpload, allowedContentTypes: [.video]) { result in
                            do {
                                try lessonName = result.get().lastPathComponent
                           }
                            catch  {
                                print(error)
                            }
                            }
                }
                    
            }
            .padding(.all)
        }
        .background(Color("primaryColor"))
        .cornerRadius(20)
        .padding(.all)
    }
}

