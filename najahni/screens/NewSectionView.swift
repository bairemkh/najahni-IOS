//
//  NewSectionView.swift
//  najahni
//
//  Created by bairem mohamed on 28/11/2022.
//

import SwiftUI

struct NewSectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewmodel = SectionViewModel()
    @State var courseId:Course
    @State var pass = false
    @State var sections = [Section]()
    @State private var indexDelete:IndexSet = IndexSet()
    var body: some View {
        NavigationView{
            ZStack{
                
                List{
                    ForEach($sections) { section in
                        EditSectionsViewPart(section: section){
                            withAnimation {
                                viewmodel.selectedSection = section.wrappedValue
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
                            title: Text(LocalizedStringKey("want_to_delete_this?")),
                            message: Text(LocalizedStringKey("want_to_delete_this?")),
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
                                // popup
                addLesson(section: $viewmodel.selectedSection, isPresented: $viewmodel.showPopup)
                VStack{
                    Spacer()
                    HStack {
                        if(viewmodel.showField)
                        {
                            TextField(LocalizedStringKey("Section_name"), text: $viewmodel.nameNewSection)
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
                                viewmodel.addSection { isOk,section  in
                                    if isOk
                                    {
                                        sections.append(Section(id: section.id, title: section.title, idCourse: section.idCourse))
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
                viewmodel.idcourse = courseId.id
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitle(
            Text("Add Sections"),
            displayMode: .inline
          )
        .navigationBarItems(trailing: NavigationLink(isActive: $pass) {
            AddQuizView(quiz: courseId.quiz)
        } label: {
            Text(LocalizedStringKey("Edit_Quiz"))
                .fontWeight(.black)
                .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                .multilineTextAlignment(.leading)
                .onTapGesture {
                    QuizServices.addQuiz(courseid: courseId.id) { go, quiz in
                        if(go){
                            courseId.quiz = quiz!
                            pass = true
                        }else{
                            pass = false
                        }
                    }
                }
        })
/*NavigationLink {
            AddQuizView(quiz: courseId.quiz)
        }label: {
            Text("Next")
        })*/
                            
    }
}

struct NewSectionView_Previews: PreviewProvider {
    @State static var sections = [Section(id: "1", title: "Section 1", idCourse: "hello",lessons: [Lesson(id: "1", title: "Kotlin", sectionid: "gfgfg", video: "",duration: 0)]),Section(id: "2", title: "Section 2", idCourse: "hello"),Section(id: "3", title: "Section 3", idCourse: "hello",lessons: [Lesson(id: "3", title: "Java", sectionid: "gfgfg", video: "",duration: 0),Lesson(id: "57", title: "Swift", sectionid: "gfgfg", video: "",duration: 0)])]
    //@State static var sections = [Section]()
    static var previews: some View {
        NewSectionView(courseId: CourseFix, sections: sections)
    }
}
