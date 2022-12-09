//
//  EditSectionsView.swift
//  najahni
//
//  Created by bairem mohamed on 6/12/2022.
//

import SwiftUI

struct EditSectionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewmodel = SectionViewModel()
    @State var courseId:String
    @Binding var sections:[Section]
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        NavigationView{
            ZStack{
                
                List{
                    ForEach(sections) { section in
                        EditSectionsViewPart(section: section){
                            withAnimation {
                                viewmodel.selectedSection = section
                                viewmodel.showPopup = true
                            }
                        }
                    }
                    .onDelete(perform: { ind in
                        viewmodel.showingAlert = true
                        viewmodel.indexDelete = ind
                    })
                    .animation(.easeInOut(duration: 0.5))
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .alert(isPresented:$viewmodel.showingAlert) {
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
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                
                VStack {
                    HStack{
                        Spacer()
                            .frame(width: 30)
                        Image(systemName: "arrowshape.backward.fill")
                        Text("Course")
                            .bold()
                        Spacer()
                    }
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
                // popup
                addLesson(sectionId: viewmodel.selectedSection.id, isPresented: $viewmodel.showPopup)
                VStack{
                    Spacer()
                    HStack {
                        if(viewmodel.showField)
                        {
                            TextField("Section name", text: $viewmodel.nameNewSection)
                                .padding(.all)
                                .autocorrectionDisabled()
                                .background(Color(.white))
                                .foregroundColor(Color("primaryColor"))
                                .cornerRadius(10)
                        }
                        else
                        {
                            EmptyView()
                        }
                        Spacer()
                        Button(action: {withAnimation {
                            if(viewmodel.showField && !viewmodel.nameNewSection.isEmpty){
                                viewmodel.addSection { isOk in
                                    if isOk
                                    {
                                        sections.append(Section(title: viewmodel.nameNewSection, idCourse: courseId))
                                        viewmodel.nameNewSection = ""
                                    }
                                }
                            }
                            viewmodel.showField.toggle()
                        }
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .background(Color("primaryColor"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }

                }
                
            }
            .onAppear{
                viewmodel.idcourse = courseId
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct EditSectionsView_Previews: PreviewProvider {
    @State static var sections = [Section(id: "1", title: "Section 1", idCourse: "hello",lessons: [Lesson(id: "1", title: "Kotlin", sectionid: "gfgfg", video: "")]),Section(id: "2", title: "Section 2", idCourse: "hello"),Section(id: "3", title: "Section 3", idCourse: "hello",lessons: [Lesson(id: "3", title: "Java", sectionid: "gfgfg", video: ""),Lesson(id: "57", title: "Swift", sectionid: "gfgfg", video: "")])]
    static var previews: some View {
        EditSectionsView(courseId: "", sections: $sections)
        /*EditSectionsViewPart(section: Section(id: "1", title: "Section 1", idCourse: "hello",lessons: [Lesson(id: "", title: "Kotlin", sectionid: "gfgfg", video: "")]), onAdd: {})*/
        //addLesson()
        /*EditLessonsViewPart(lesson: Lesson(title: "Kotlin part 1", sectionid: "", video: ""))*/
        //addSection(CourseId: "")
        
    }
}
struct EditSectionsViewPart: View {
    @State var isTapped = false
    @State var section:Section
    @State var onAdd:()->Void
    
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        HStack{
            
                VStack{
                    HStack {
                        Text(section.title)
                            .bold()
                            .foregroundColor(Color("primaryColor"))
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color("primaryColor"))
                            .onTapGesture {
                            onAdd()
                            }
                    }
                    
                    ForEach(section.lessons) { lesson in
                        EditLessonsViewPart(lesson: lesson,indexLesson: section.lessons.firstIndex(where: { l in
                            return l.id == lesson.id
                        }) ?? -1)
                    }
                }
                Spacer()
                    
            
        }
            
        .animation(.easeInOut(duration: 0.5))
        
        
    }
        
    }


struct EditLessonsViewPart: View {
    @State var isTapped = false
    @State var lesson:Lesson
    @State var indexLesson = 1
    var body: some View {
            HStack{
                ZStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(Color(hue: 0.738, saturation: 0.922, brightness: 0.866, opacity: 0.3))
                    Text((indexLesson+1).description)
                        .foregroundColor(Color("primaryColor"))
                }
                VStack {
                    Text(lesson.title)
                        .font(.system(size: 20))
                    .bold()
                    Text("2h30")
                }
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(Color(hue: 0.738, saturation: 0.922, brightness: 0.866, opacity: 0.3))
                    Image(systemName: "minus")
                        .foregroundColor(Color("primaryColor"))
                }
            }
            .padding(.horizontal)
            .padding()
    }
}
struct addLesson: View {
    @Environment(\.presentationMode) var presentationMode
    var sectionId:String
    @StateObject var viewmodel = AddLessonViewModel()
    @Binding var isPresented:Bool
    var body: some View {
        VStack{
            if(isPresented){
                Group{
                    HStack {
                        Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                isPresented = false
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    Text("Add a lesson")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    HStack {
                        Text("Add a lesson by typing his name and importing its video")
                            .foregroundColor(.white)
                        .font(.system(size: 20))
                        Spacer()
                    }
                    TextField("Name", text: $viewmodel.lessonName)
                        .padding(.all)
                        .background(Color(.white))
                        .foregroundColor(Color("primaryColor"))
                        .cornerRadius(10)
                    Button(action: {
                        viewmodel.showFileUpload = true
                    }) {
                        Text(viewmodel.lessonVideoText)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        Image(systemName: "arrow.down.to.line")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 25)
                            .fileImporter(isPresented: $viewmodel.showFileUpload, allowedContentTypes: [.video,.mpeg4Movie]) { result in
                                do {
                                    var file = try result.get()
                                    //try Data(contentsOf: self.previewURL!)
                                    viewmodel.lessonVideo = try Data(contentsOf:file)
                                    try viewmodel.lessonVideoText = result.get().lastPathComponent
                               }
                                catch  {
                                    print(error)
                                }
                                }
                    }
                    Button(action: {
                        viewmodel.addLesson { canPass, msgErr in
                            //alert
                            print(canPass)
                                self.presentationMode.wrappedValue.dismiss()
                            
                        }
                    }) {
                        Text("Save")
                        .foregroundColor(Color("primaryColor"))
                        .multilineTextAlignment(.center)
                        .frame(width: 200.0,height: 60.0)
                        .background(Color(.white))
                        .cornerRadius(25)
                    }
                        
                }
                .padding(.all)
                .onAppear{
                    viewmodel.sectionId = sectionId
                }
            }
            else{
                EmptyView()
            }
            
        }
        .background(Color("primaryColor"))
        .cornerRadius(20)
        .padding(.all)
    }
}
struct addSection: View {
    @Environment(\.presentationMode) var presentationMode
    var CourseId:String
    @StateObject var viewmodel = AddLessonViewModel()
   // @Binding var isPresented:Bool
    var body: some View {
        VStack{
           // if(isPresented){
                Group{
                    HStack {
                        Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                //isPresented = false
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    Text("Add a Section")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    TextField("Name*", text: $viewmodel.lessonName)
                        .padding(.all)
                        .autocorrectionDisabled()
                        .background(Color(.white))
                        .foregroundColor(Color("primaryColor"))
                        .cornerRadius(10)
                    
                    Button(action: {
                        viewmodel.addLesson { canPass, msgErr in
                            //alert
                            print(canPass)
                                self.presentationMode.wrappedValue.dismiss()
                            
                        }
                    }) {
                        Text("Save")
                        .foregroundColor(Color("primaryColor"))
                        .multilineTextAlignment(.center)
                        .frame(width: 200.0,height: 60.0)
                        .background(Color(.white))
                        .cornerRadius(25)
                    }
                        
                }
                .padding(.all)
                .onAppear{
                    viewmodel.sectionId = CourseId
                }
            /*}
            else{
                EmptyView()
            }*/
            
        }
        .background(Color("primaryColor"))
        .cornerRadius(20)
        .padding(.all)
    }
}

